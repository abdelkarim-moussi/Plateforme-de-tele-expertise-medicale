package com.example.medicexpert.servlet;

import com.example.medicexpert.entity.Speciality;
import com.example.medicexpert.service.ConsultationService;
import com.example.medicexpert.service.PatientService;
import com.example.medicexpert.service.SpecialityService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class RequestExpertiseServlet extends HttpServlet {
    private SpecialityService specialityService;
    @Override
    public void init() throws ServletException {
        specialityService = (SpecialityService) getServletContext().getAttribute("specialityService");
        if (specialityService == null) {
            throw new ServletException("couldn't initialize the patient service");
        }
    }

//    @Override
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException {
//
//        List<Speciality> specialities =specialityService.getAllSpecialities();
//
//        request.setAttribute("specialities",specialities);
//
//        request.("/consultation/request-specialist.jsp").forward(request,response);
//
//    }
}
