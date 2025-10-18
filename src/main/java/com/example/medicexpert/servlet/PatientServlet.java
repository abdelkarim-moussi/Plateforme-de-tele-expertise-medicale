package com.example.medicexpert.servlet;

import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.service.ConsultationService;
import com.example.medicexpert.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class PatientServlet extends HttpServlet {

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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Patient patient = patientService.getSinglePatientData(request.getParameter("patientId"));

        if(patient == null){
            request.setAttribute("error","couldn't retrieve patient data");
            request.getRequestDispatcher("generalDoctor/dashboard.jsp").forward(request,response);
        }else {
            request.setAttribute("patient",patient);
            request.getRequestDispatcher("patient/patientDetails.jsp").forward(request,response);
        }


    }
}
