package com.example.medicexpert.servlet;

import com.example.medicexpert.dao.AuthenticationDao;
import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nerse;
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

@WebServlet("/signup")
public class AuthenticationServlet extends HttpServlet {

    AuthenticationDao authenticationDao = new AuthenticationDao();

    public AuthenticationServlet() {
        super();
    }

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException,IOException{

        String firstName = UserValidation.nameValidator(request.getParameter("first_name"));
        String lastName = UserValidation.nameValidator(request.getParameter("last_name"));
        String email = UserValidation.emailValidator(request.getParameter("email"));
        String phone = UserValidation.numberValidator(request.getParameter("phone"));
        String role = request.getParameter("role");

        Staph staph = switch(role){
            case "general_doctor" -> new GeneralDoctor(firstName,lastName,email,phone);
            case "special_doctor" -> new SpecialDoctor(firstName,lastName,email,phone);
            case "nerse" -> new Nerse(firstName,lastName,email,phone);
            default -> throw new IllegalStateException("unexpected value "+role);
        };

        authenticationDao.register(staph);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/authentication/welcome.jsp");
        dispatcher.forward(request,response);

    }

    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException ,IOException{

        response.getWriter().append("Served at: ").append(request.getContextPath());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/authentication/signup.jsp");
        requestDispatcher.forward(request,response);
    }


}
