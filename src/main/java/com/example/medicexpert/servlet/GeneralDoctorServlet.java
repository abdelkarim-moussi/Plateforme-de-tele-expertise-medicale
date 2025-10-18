package com.example.medicexpert.servlet;

import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class GeneralDoctorServlet extends HttpServlet {
    private PatientService patientService;

    @Override
    public void init() throws ServletException{
        this.patientService = (PatientService) getServletContext().getAttribute("patientService");
        if(this.patientService == null){
            throw new ServletException("an error occurred while trying to initialise the patientService");
        }
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException {
        List<Patient> patients = patientService.getActualQueuePatients();
        request.setAttribute("patients",patients);
        request.getRequestDispatcher("generalDoctor/dashboard.jsp").forward(request,response);
    }

}
