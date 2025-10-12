package com.example.medicexpert.service;

import com.example.medicexpert.dao.StaphDao;
import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nurse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;
import com.example.medicexpert.util.exception.RegistrationException;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.security.enterprise.identitystore.Pbkdf2PasswordHash;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

import java.io.IOException;

@ApplicationScoped
public class StaphAuthenticationService {

    @Inject
    private StaphDao staphDao;

    @Inject
    private Pbkdf2PasswordHash passwordHash;

    @Transactional
    public void register(String firstName, String lastName, String email, String phone, String password, String role) throws RegistrationException{

        if(firstName == null || lastName == null || email == null || phone == null || password == null || role == null){
            throw new RegistrationException("all fields are required");
        }

        if(staphDao.existByEmail(email)){
            throw new RegistrationException("email already exist");
        }

        if(password.length() < 8){
            throw new RegistrationException("password must be at least 8 characters");
        }

        String hashedPassword = passwordHash.generate(password.toCharArray());

        Staph staph = switch(role){
            case "general_doctor" -> new GeneralDoctor(firstName,lastName,email,phone,hashedPassword);
            case "special_doctor" -> new SpecialDoctor(firstName,lastName,email,phone,hashedPassword);
            case "nurse" -> new Nurse(firstName,lastName,email,phone,hashedPassword);
            default -> throw new IllegalStateException("unexpected value "+role);
        };

        staphDao.save(staph);

    }


    @Transactional
    public boolean authenticate(HttpServletRequest request, HttpServletResponse response, String email, String password) throws RegistrationException {

        if(email == null || password == null) return false;

        Staph staph = staphDao.findByEmail(email);

        if(staph == null){
            return false;
        }

        Boolean valid = passwordHash.verify(password.toCharArray(),staph.getPassword());

        if(valid){
            HttpSession session = request.getSession();
            session.setAttribute("user",staph);
        }

        return valid;
    }

}
