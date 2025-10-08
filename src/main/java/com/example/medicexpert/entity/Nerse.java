package com.example.medicexpert.entity;

import com.example.medicexpert.enums.StaphRole;
import jakarta.persistence.Entity;

@Entity
public class Nerse extends Staph {

    public Nerse(){
        setRole();
    }
    public Nerse(String firstName, String lastName,String email, String phone){
        super(firstName,lastName,email,phone);
        setRole();

    }

    @Override
    public void setRole(){
        this.role = StaphRole.nerse;
    }
}
