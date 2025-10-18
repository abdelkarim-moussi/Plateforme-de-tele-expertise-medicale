package com.example.medicexpert.servlet;

import com.example.medicexpert.service.StaphAuthenticationService;
import com.example.medicexpert.util.exception.RegistrationException;
import com.example.medicexpert.validation.Validation;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class StaphRegisterServlet extends HttpServlet {

    private StaphAuthenticationService staphAuthenticationService;

    @Override
    public void init() throws ServletException{
        staphAuthenticationService = (StaphAuthenticationService) getServletContext().getAttribute("staphAuthService");

        if(staphAuthenticationService == null){
            throw new ServletException("StaphAuthentication Service not initialized");
        }
    }

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException,IOException{

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Map<String,String> errors = new HashMap<>();

        if(firstName == null || firstName.trim().isEmpty()){
            errors.put("firstname","firstname is required");
        }else if(!Validation.isValidName(firstName.trim())) {
            errors.put("firstName","first name is invalid");
        }

        if(lastName == null || lastName.trim().isEmpty()){
            errors.put("lastName","lastname is required");
        } else if(!Validation.isValidName(lastName.trim())) {
            errors.put("lastName","last name is invalid");
        }

        if(email == null || email.trim().isEmpty()){
            errors.put("email","email is required");
        }else if(!Validation.isValidEmail(email.trim())) {
            errors.put("email","invalid email format");
        }

        if(phone == null || phone.trim().isEmpty()){
            errors.put("phone","phone number is required");
        }else if(!Validation.isValidPhone(phone)) {
            errors.put("phone","invalid phone number");
        }

        if(password == null ||password.trim().isEmpty()){
            errors.put("password","password is required");
        }else if(!Validation.isValidPassword(password.trim())){
            errors.put("password","invalid password");
        }

        if(role == null || role.trim().isEmpty() ){
            errors.put("role","role is required");
        }else if(!Validation.isValidRole(role.trim())){
            errors.put("role","invalid role");
        }

        if(errors.isEmpty()){

            try {
                staphAuthenticationService.register(firstName,lastName,email,phone,password,role);
            } catch (RegistrationException e) {
                e.getMessage();
                errors.put("staphRegister","there was an error while trying to register this user, try again");
                request.setAttribute("errors",errors);
                request.getRequestDispatcher("/authentication/signup.jsp").forward(request,response);
                return;
            }
            request.setAttribute("success","user created successfully");
            request.getRequestDispatcher("/authentication/signup.jsp").forward(request,response);

        } else {
              request.setAttribute("errors",errors);
              request.getRequestDispatcher("/authentication/signup.jsp").forward(request,response);
        }


    }

    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException ,IOException{
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/authentication/signup.jsp");
        requestDispatcher.forward(request,response);
    }


}
