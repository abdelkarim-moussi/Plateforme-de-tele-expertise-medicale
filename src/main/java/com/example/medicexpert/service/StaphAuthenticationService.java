package com.example.medicexpert.service;

import com.example.medicexpert.dao.StaphDao;
import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nurse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;
import com.example.medicexpert.util.exception.RegistrationException;
import com.password4j.BcryptFunction;
import com.password4j.Hash;
import com.password4j.Password;
import com.password4j.types.Bcrypt;

public class StaphAuthenticationService {

    private StaphDao staphDao;

    public StaphAuthenticationService(StaphDao staphDao){
        this.staphDao = staphDao;
    }


    public boolean register(String firstName, String lastName, String email, String phone, String password, String role) throws RegistrationException{

        if(firstName == null || lastName == null || email == null || phone == null || password == null || role == null){
            throw new RegistrationException("all fields are required");
        }

        if(staphDao.existByEmail(email)){
            throw new RegistrationException("email already exist - "+email);
        }

        if(password.length() < 8){
            throw new RegistrationException("password must be at least 8 characters - "+password);
        }

        String hashedPassword = passwordHash(password);

        Staph staph = switch(role){
            case "general_doctor" -> new GeneralDoctor(firstName,lastName,email,phone,hashedPassword);
            case "special_doctor" -> new SpecialDoctor(firstName,lastName,email,phone,hashedPassword);
            case "nurse" -> new Nurse(firstName,lastName,email,phone,hashedPassword);
            default -> throw new IllegalStateException("unexpected value "+role);
        };

        staphDao.save(staph);
        return true;

    }

    public Staph authenticate(String email, String password) throws RegistrationException {

        if(email == null || password == null) return null;

        Staph staph = staphDao.findByEmail(email);

        if(staph == null){
            throw new RegistrationException("the staph email doesn't exist - "+email);
        }

        if(!verify(password,staph.getPassword())){
            return null;
        }

        return staph;

    }

    public String passwordHash(String password){
        BcryptFunction bcrypt = BcryptFunction.getInstance(Bcrypt.B,12);

        Hash hash = Password.hash(password)
                .addPepper("shared-secret")
                .with(bcrypt);

        return hash.getResult();
    }

    private boolean verify(String password , String hashedPassword){
        BcryptFunction bcrypt = BcryptFunction.getInstance(Bcrypt.B,12);

        boolean verify = Password.check(password,hashedPassword)
                .addPepper("shared-secret")
                .with(bcrypt);

        return verify;
    }


}
