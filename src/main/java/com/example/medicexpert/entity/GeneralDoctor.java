package com.example.medicexpert.entity;

import com.example.medicexpert.StaphRole;

public non-sealed class GeneralDoctor extends Staph {

    @Override

    public void setRole(){
        this.role = StaphRole.general_doctor;
    }
}
