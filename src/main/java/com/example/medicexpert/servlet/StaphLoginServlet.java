package com.example.medicexpert.servlet;

import com.example.medicexpert.service.StaphAuthenticationService;
import com.example.medicexpert.validation.Validation;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class StaphLoginServlet extends HttpServlet {

    @Inject
    StaphAuthenticationService staphAuthenticationService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Map<String,String> errors = new HashMap<>();

        if(email == null || email.trim().isEmpty()){
            errors.put("email","email is required");
        }else if(!Validation.isValidEmail(request.getParameter("email"))){
            errors.put("email","invalide email format");
        }

        if(password == null || password.trim().isEmpty()){
            errors.put("password","password is required");
        }else if(!Validation.isValidPassword(request.getParameter("password"))){
            errors.put("password","password must be at least 8 characters");
        }

        if(!errors.isEmpty()){
            request.setAttribute("errors",errors);
            request.setAttribute("email",email);
            request.getRequestDispatcher("/authentication/login.jsp").forward(request,response);
            return;
        }

        try{

            staphAuthenticationService.authenticate(request ,response ,email.trim() ,password);
        } catch (Exception e) {
            e.printStackTrace();
            errors.put("login","an error was occurred please try again");
            request.setAttribute("errors",errors);
            request.getRequestDispatcher("/authentication/login.jsp").forward(request,response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException , IOException {
        request.getRequestDispatcher("/authentication/login.jsp").forward(request,response);
    }
}
