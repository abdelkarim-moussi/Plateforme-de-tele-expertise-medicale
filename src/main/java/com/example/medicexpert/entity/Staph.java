package com.example.medicexpert.entity;

import com.example.medicexpert.StaphRole;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.util.UUID;

@Entity
public abstract sealed class Staph permits GeneralDoctor, SpecialDoctor, Nerse {
    @Id
    protected String id;
    protected String firstName;
    protected String lastName;
    protected String email;
    protected String phone;
    protected StaphRole role;

    public Staph() {
        setId();
    }

    public Staph(String firstName,String lastName, String email, String phone){
        setId();
        setRole();
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }


    public void setId() {
        this.id = UUID.randomUUID().toString().substring(0,10).replace("-","");
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public abstract void setRole();

    public StaphRole getRole(){
        return this.role;
    }


    @Override
    public String toString() {
        return "Staph{" +
                "\nid='" + id + '\'' +
                "\nfirstName='" + firstName + '\'' +
                "\nlastName='" + lastName + '\'' +
                "\nemail='" + email + '\'' +
                "\nphone='" + phone + '\'' +
                '}';
    }
}
