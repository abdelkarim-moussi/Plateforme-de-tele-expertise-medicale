package com.example.medicexpert.entity;

import com.example.medicexpert.enums.StaphRole;
import jakarta.persistence.Entity;

@Entity
public class GeneralDoctor extends Staph {

    public GeneralDoctor() {setRole();}

    public GeneralDoctor(String firstName,String lastName, String email, String phone,String password){
        super(firstName,lastName,email,phone,password);
        setRole();
    }

    @Override
    public void setRole(){
        this.role = StaphRole.general_doctor;
    }
}
