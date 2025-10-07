package com.example.medicexpert.entity;

import com.example.medicexpert.StaphRole;

public non-sealed class Nerse extends Staph {

    @Override
    public void setRole(){
        this.role = StaphRole.nerse;
    }
}
