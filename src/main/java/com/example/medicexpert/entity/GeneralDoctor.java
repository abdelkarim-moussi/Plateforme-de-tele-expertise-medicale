package com.example.medicexpert.entity;

import com.example.medicexpert.enums.StaphRole;
import jakarta.persistence.Entity;

@Entity
public class GeneralDoctor extends Staph {

    public GeneralDoctor() {setRole();}

    public GeneralDoctor(String firstName,String lastName, String email, String phone){
        super(firstName,lastName,email,phone);
        setRole();
    }

    @Override
    public void setRole(){
        this.role = StaphRole.general_doctor;
    }
}
