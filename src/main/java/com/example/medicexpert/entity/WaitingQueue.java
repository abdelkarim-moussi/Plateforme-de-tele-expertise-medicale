package com.example.medicexpert.entity;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
public class WaitingQueue {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private LocalDate createdAt;

    @OneToMany(mappedBy = "waitingQueue",cascade = CascadeType.MERGE,fetch = FetchType.EAGER)
    private List<Patient> patients;

    public WaitingQueue(){}

    public WaitingQueue(List<Patient> patients,LocalDate createdAt){
        this.patients = patients;
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getArrivalDate() {
        return createdAt;
    }

    public void setArrivalDate(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public List<Patient> getPatients() {
        return patients;
    }

    public void setPatients(List<Patient> patients) {
        this.patients = patients;
    }

    public void addPatientToQueue(Patient patient){
        patient.setWaitingQueue(this);
        if(patient.getArrivalTime() == null){
            patient.setArrivalTime(LocalTime.now());
        }
        this.patients.add(patient);
    }

    public void removePatientFromQueue(Patient patient){
        if(patient.getWaitingQueue() != null){
            patients.remove(patient);
            patient.setWaitingQueue(null);
        }
    }

}
