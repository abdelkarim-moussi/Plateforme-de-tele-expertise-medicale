package com.example.medicexpert.servlet;

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
import java.util.HashMap;
import java.util.Map;

public class NurseDashboardServlet extends HttpServlet {

    private PatientService patientService;

    @Override
    public void init() throws ServletException {
        this.patientService = (PatientService) getServletContext().getAttribute("patientService");
        if(patientService == null){
            throw new ServletException("an error occurred while trying instantiate the patient service");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String securityNumber = request.getParameter("securityNumber");
        String address = request.getParameter("address");
        String CNI = request.getParameter("CNI");

        if(this.validateFields(firstName,lastName,email,phone,
                dateOfBirth,securityNumber,address,CNI)){
            try{
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                LocalDate date = LocalDate.parse(dateOfBirth,formatter);
                System.out.println(date);
                patientService.registerPatient(firstName,lastName,email,phone, LocalDate.parse(dateOfBirth,formatter), securityNumber, address, CNI);

            }catch (PatientRegistrationException e){
                e.printStackTrace();
            }

        }


    }

    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/nurse/dashboard.jsp").forward(request,response);
    }

    private boolean validateFields(String firstName,String lastName,
                                   String email,String phone,String dateOfBirth,
                                   String securityNumber, String address, String CNI){

        Map<String,String> errors = new HashMap<>();

        if(firstName == null || firstName.trim().isEmpty()){
            errors.put("firstname","firstname is required");
        }else if(!Validation.isValidName(firstName)){
            errors.put("firstname","firstname is invalid");
        }

        if(lastName == null || lastName.trim().isEmpty()){
            errors.put("lastname","lastname is required");
        }else if(!Validation.isValidName(lastName)){
            errors.put("lastname","lastname is invalid");
        }

        if(email == null || email.trim().isEmpty()){
            errors.put("email","email is required");
        }else if(!Validation.isValidEmail(email)){
            errors.put("email","invalid email format (ex : example12@gmail.com)");
        }

        if(phone == null || phone.trim().isEmpty()){
            errors.put("phone","phone number is required");
        }else if(!Validation.isValidPhone(phone)){
            errors.put("phone","invalid phone number format (ex : 0657895432)");
        }

        if(!Validation.isValidSecurityNumber(securityNumber)){
            errors.put("securityNumber","invalid security number format (ex : S-12345678)");
        }

        if(CNI.trim().isEmpty()){
            errors.put("CNI","nationality number is required (CNI)");
        } else if (!Validation.isValidCNI(CNI)) {
            errors.put("CNI","invalid CNI number format (ex: A123 or AX132425)");
        }

        return errors.isEmpty();

    }

}
