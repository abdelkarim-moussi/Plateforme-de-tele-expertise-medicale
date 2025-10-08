package com.example.medicexpert.servlet;

import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nerse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AuthenticationServlet extends HttpServlet {

    public AuthenticationServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException,IOException{

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        Staph staph = switch(role){
            case "general_doctor" -> new GeneralDoctor(firstName,lastName,email,phone);
            case "special_doctor" -> new SpecialDoctor(firstName,lastName,email,phone);
            case "nerse" -> new Nerse(firstName,lastName,email,phone);
            default -> throw new IllegalStateException("unexpected value "+role);
        };



    }
}
