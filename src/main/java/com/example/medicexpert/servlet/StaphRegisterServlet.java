package com.example.medicexpert.servlet;

import com.example.medicexpert.service.StaphAuthenticationService;
import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nurse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;
import com.example.medicexpert.util.exception.RegistrationException;
import com.example.medicexpert.validation.Validation;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/signup")
public class StaphRegisterServlet extends HttpServlet {

    StaphAuthenticationService staphAuthenticationService = new StaphAuthenticationService();

    public StaphRegisterServlet() {
        super();
    }

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException,IOException{

        String firstName = "";
        String lastName = "";
        String email = "";
        String phone = "";
        String password = "";

        String role = "";
        Map<String,String> errors = new HashMap<>();

        if(Validation.isValidName(request.getParameter("first_name"))){
            firstName = request.getParameter("first_name");
        }else errors.put("firstName","first name is invalid");

        if(Validation.isValidName(request.getParameter("last_name"))){
            lastName = request.getParameter("last_name");
        } else errors.put("lastName","last name is invalid");

        if(Validation.isValidEmail(request.getParameter("email"))){
            email = request.getParameter("email");
        }else errors.put("email","invalid email format");

        if(Validation.isValidPhone(request.getParameter("phone"))){
            phone = request.getParameter("phone");
        }else errors.put("phone","invalid phone number");

        if(Validation.isValidPassword(request.getParameter("password"))){
            password = request.getParameter("password");
        }else errors.put("password","invalid password");

        if(role != null && role.trim().isEmpty() ){
            role = request.getParameter("role");
        }

        if(errors.isEmpty()){

            try {
                staphAuthenticationService.register(firstName,lastName,email,phone,password,role);
            } catch (RegistrationException e) {
                e.getMessage();
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("/authentication/welcome.jsp");
            dispatcher.forward(request,response);

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
