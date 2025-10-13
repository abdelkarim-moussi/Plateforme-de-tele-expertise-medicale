package com.example.medicexpert.entity;

import jakarta.persistence.*;

@Entity
public class Patient {

    @Id
    @GeneratedValue
    private String id;
}
