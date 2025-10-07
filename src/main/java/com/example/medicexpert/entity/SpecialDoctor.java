package com.example.medicexpert.entity;

import com.example.medicexpert.StaphRole;

public non-sealed class SpecialDoctor extends Staph {

    @Override
    public void setRole(){
        this.role = StaphRole.special_doctor;
    }
}
