package com.example.medicexpert.entity;

import com.example.medicexpert.enums.StaphRole;
import jakarta.persistence.Entity;

@Entity
public class GeneralDoctor extends Staph {

    public GeneralDoctor() {

    }

    public GeneralDoctor(String firstName,String lastName, String email, String phone){
        super(firstName,lastName,email,phone);

    }

    @Override
    public void setRole(){
        this.role = StaphRole.general_doctor;
    }
}
