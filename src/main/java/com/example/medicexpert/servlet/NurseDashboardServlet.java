package com.example.medicexpert.servlet;

import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.service.PatientService;
import com.example.medicexpert.util.exception.PatientRegistrationException;
import com.example.medicexpert.validation.Validation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class NurseDashboardServlet extends HttpServlet {

    private PatientService patientService;

    @Override
    public void init() throws ServletException {
        this.patientService = (PatientService) getServletContext().getAttribute("patientService");
        if(this.patientService == null){
            throw new ServletException("an error occurred while trying instantiate the patient service");
        }
    }

    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<Patient> patients = patientService.getActualQueuePatients();
        request.setAttribute("patients",patients);
        request.getRequestDispatcher("/nurse/dashboard.jsp").forward(request,response);
    }


}
