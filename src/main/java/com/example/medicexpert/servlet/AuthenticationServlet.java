package com.example.medicexpert.servlet;

import com.example.medicexpert.dao.AuthenticationDao;
import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nurse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;
import com.example.medicexpert.validation.UserValidation;
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
public class AuthenticationServlet extends HttpServlet {

    AuthenticationDao authenticationDao = new AuthenticationDao();

    public AuthenticationServlet() {
        super();
    }

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException,IOException{

        String firstName = "";
        String lastName = "";
        String email = "";
        String phone = "";
        String role = request.getParameter("role");

        Map<String,String> errors = new HashMap<>();

        if(UserValidation.isValidName(request.getParameter("first_name"))){
            firstName = request.getParameter("first_name");
        }else errors.put("firstName","first name is invalid");

        if(UserValidation.isValidName(request.getParameter("last_name"))){
            lastName = request.getParameter("last_name");
        } else errors.put("lastName","last name is invalid");

        if(UserValidation.isValidEmail(request.getParameter("email"))){
            email = request.getParameter("email");
        }else errors.put("email","invalid email format");

        if(UserValidation.isValidPhone(request.getParameter("phone"))){
            phone = request.getParameter("phone");
        }else errors.put("phone","invalid phone number");


        if(errors.isEmpty()){
            Staph staph = switch(role){
                case "general_doctor" -> new GeneralDoctor(firstName,lastName,email,phone);
                case "special_doctor" -> new SpecialDoctor(firstName,lastName,email,phone);
                case "nurse" -> new Nurse(firstName,lastName,email,phone);
                default -> throw new IllegalStateException("unexpected value "+role);
            };
            authenticationDao.register(staph);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/authentication/welcome.jsp");
            dispatcher.forward(request,response);

        } else {
              request.setAttribute("errors",errors);
              request.getRequestDispatcher("/authentication/signup.jsp").forward(request,response);
        }


    }

    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException ,IOException{

        response.getWriter().append("Served at: ").append(request.getContextPath());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/authentication/signup.jsp");
        requestDispatcher.forward(request,response);
    }


}
