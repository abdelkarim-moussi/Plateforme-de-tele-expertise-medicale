package com.example.medicexpert.entity;

import com.example.medicexpert.enums.StaphRole;
import jakarta.persistence.*;

import java.util.UUID;

@Entity
@Table(name = "staph")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "staff_type", discriminatorType = DiscriminatorType.STRING)
public abstract class Staph {
    @Id
    protected String id;
    protected String firstName;
    protected String lastName;
    @Column(unique = true)
    protected String email;
    protected String phone;
    @Enumerated(EnumType.STRING)
    protected StaphRole role;

    @Column(nullable = false)
    protected String password;

    public Staph() {
    }

    public Staph(String firstName,String lastName, String email, String phone, String password){
        this.id = generateId();
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.password = password;
        setRole();
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private String generateId(){
        return UUID.randomUUID().toString().substring(0,12).replace("-","");
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
