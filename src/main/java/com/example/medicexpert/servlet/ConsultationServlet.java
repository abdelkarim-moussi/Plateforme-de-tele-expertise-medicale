package com.example.medicexpert.servlet;

import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.service.ConsultationService;
import com.example.medicexpert.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GeneralConsultationServlet extends HttpServlet {

    private PatientService patientService;
    private ConsultationService consultationService;

    @Override
    public void init() throws ServletException{
        patientService = (PatientService) getServletContext().getAttribute("patientService");
        consultationService = (ConsultationService) getServletContext().getAttribute("consultationService");

        if(patientService == null){
            throw new ServletException("couldn't initialize the patient service");
        }
        if(consultationService == null){
            throw new ServletException("couldn't initialize the consultation service");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String patientId = request.getParameter("patientId");
        String clinicalExamResult = request.getParameter("clinicalExamResult");
        String symptomAnalyse = request.getParameter("symptomAnalyse");
        String observations = request.getParameter("observations");

        Map<String,String> errors = new HashMap<>();

        if(patientId == null || patientId.trim().isEmpty() ){
            errors.put("patientId","Id de patient et null ou vide");
        }

        boolean res = consultationService.createConsultation(patientId,clinicalExamResult,symptomAnalyse,observations);

        if(res){
            request.setAttribute("consultationSuccess","consultation créer avec succés");
        }else {
            request.setAttribute("error","un problem et devenue lors de création de consultation");
        }

        request.getRequestDispatcher("generalDoctor/generalConsultation.jsp").forward(request,response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Patient patient = patientService.getSinglePatientData(request.getParameter("patientId"));

        if(patient == null){
            request.setAttribute("error","couldn't retrieve patient data");
        }else {
            request.setAttribute("patient",patient);
        }

        request.getRequestDispatcher("generalDoctor/generalConsultation.jsp").forward(request,response);

    }
}
