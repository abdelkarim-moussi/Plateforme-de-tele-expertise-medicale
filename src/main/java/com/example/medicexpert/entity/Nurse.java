package com.example.medicexpert.entity;

import com.example.medicexpert.enums.StaphRole;
import jakarta.persistence.Entity;

@Entity
public class Nurse extends Staph {

    public Nurse(){
        setRole();
    }
    public Nurse(String firstName, String lastName,String email, String phone, String password){
        super(firstName,lastName,email,phone,password);
        setRole();
    }

    @Override
    public void setRole(){
        this.role = StaphRole.nurse;
    }
}
