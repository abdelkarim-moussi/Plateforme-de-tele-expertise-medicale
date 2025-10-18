package com.example.medicexpert.entity;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class MedicalData {

    @Id
    private String id;
    private String antecedents;
    private String allergies;
    private String ongoingTreatment ;

    @OneToOne(mappedBy = "medicalData")
    private Patient patient;

    public MedicalData(){}

    public MedicalData(String antecedents,String allergies,String ongoingTreatment){
        this.id = generateId();
        this.antecedents = antecedents;
        this.allergies = allergies;
        this.ongoingTreatment = ongoingTreatment;
    }
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAntecedents() {
        return antecedents;
    }

    public void setAntecedents(String antecedents) {
        this.antecedents = antecedents;
    }

    public String getAllergies() {
        return allergies;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    public String getOngoingTreatment() {
        return ongoingTreatment;
    }

    public void setOngoingTreatment(String ongoingTreatment) {
        this.ongoingTreatment = ongoingTreatment;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    private String generateId(){
        return UUID.randomUUID().toString().replace("-","").substring(0,12);
    }
}
