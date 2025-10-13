package com.example.medicexpert.servlet;

import com.example.medicexpert.service.StaphAuthenticationService;
import com.example.medicexpert.validation.Validation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class StaphLoginServlet extends HttpServlet {

    private StaphAuthenticationService staphAuthenticationService;

    @Override
    public void init() throws ServletException{
        staphAuthenticationService = (StaphAuthenticationService) getServletContext().getAttribute("staphAuthService");

        if(staphAuthenticationService == null){
            throw new ServletException("StaphAuthentication Service not initialized");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Map<String,String> errors = new HashMap<>();

        if(email == null || email.trim().isEmpty()){
            errors.put("email","email is required");
        }else if(!Validation.isValidEmail(email)){
            errors.put("email","invalide email format");
        }

        if(password == null || password.trim().isEmpty()){
            errors.put("password","password is required");
        }else if(!Validation.isValidPassword(password)){
            errors.put("password","password must be at least 8 characters");
        }

        if(!errors.isEmpty()){
            request.setAttribute("errors",errors);
            request.setAttribute("email",email);
            request.getRequestDispatcher("/authentication/login.jsp").forward(request,response);
            return;
        }

        try{
            boolean authenticate = staphAuthenticationService.authenticate(request ,response ,email.trim() ,password);
            System.out.println(authenticate);
            if(authenticate){
                request.getRequestDispatcher("/authentication/welcome.jsp").forward(request,response);
            }

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
