package com.example.medicexpert.entity;

import jakarta.persistence.*;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
public class WaitingQueue {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private LocalDate arrivalDate;
    private LocalTime arrivalTime;

    @OneToMany(cascade = CascadeType.MERGE,fetch = FetchType.LAZY)
    @JoinColumn(name = "waitingQueueId")
    private List<Patient> patients;

    public WaitingQueue(){}
    public WaitingQueue(List<Patient> patients,LocalDate arrivalDate,LocalTime arrivalTime){
        this.patients = patients;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getArrivalDateTime() {
        return arrivalDate;
    }

    public void setArrivalDateTime(LocalDate arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public LocalDate getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(LocalDate arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public LocalTime getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(LocalTime arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public List<Patient> getPatients() {
        return patients;
    }

    public void setPatients(List<Patient> patients) {
        this.patients = patients;
    }

}
