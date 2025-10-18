package com.example.medicexpert.servlet;

import com.example.medicexpert.entity.Consultation;
import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.service.ConsultationService;
import com.example.medicexpert.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ConsultationServlet extends HttpServlet {

    private PatientService patientService;
    private ConsultationService consultationService;

    @Override
    public void init() throws ServletException {
        patientService = (PatientService) getServletContext().getAttribute("patientService");
        consultationService = (ConsultationService) getServletContext().getAttribute("consultationService");

        if (patientService == null) {
            throw new ServletException("couldn't initialize the patient service");
        }
        if (consultationService == null) {
            throw new ServletException("couldn't initialize the consultation service");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String patientId = request.getParameter("patientId");
        String consultationId = request.getParameter("consultationId");
        String clinicalExamResult = request.getParameter("clinicalExam");
        String symptomAnalyse = request.getParameter("symptoms");
        String observations = request.getParameter("observations");
        String diagnosis = request.getParameter("diagnosis");
        String treatment = request.getParameter("treatment");
        String medications = request.getParameter("medications");

        Map<String,String> errors = new HashMap<>();

        if(patientId == null || patientId.trim().isEmpty() ){
            errors.put("patientId","Id de patient et null ou vide");
        }

        Consultation consultation = consultationService.updateConsultation(patientId,consultationId,clinicalExamResult,symptomAnalyse,observations,diagnosis,treatment,medications);

        if(consultation != null){
            request.setAttribute("consultationSuccess","consultation créer avec succés");
            request.setAttribute("consultation",consultation);
        }else {
            request.setAttribute("error","un problem et devenue lors de création de consultation");
        }

        request.getRequestDispatcher("consultation/consultationDetails.jsp").forward(request,response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Patient patient = patientService.getSinglePatientData(request.getParameter("patientId"));

        if(patient == null){
            request.setAttribute("error","couldn't retrieve patient data");
        }else {
            request.setAttribute("patient",patient);
            Consultation consultation = consultationService.createConsultation(patient.getId(),"","","");
            request.setAttribute("consultation",consultation);
        }

        request.getRequestDispatcher("consultation/consultationDetails.jsp").forward(request,response);

    }
}
