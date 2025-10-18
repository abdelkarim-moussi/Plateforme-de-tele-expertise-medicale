package com.example.medicexpert.entity;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class VitalSigns {

    @Id
    private String id;
    private float height;
    private float weight;
    private short respiratoryRate;
    private float bodyTemperature;
    private short heartRate;
    private float bloodPressure;

    @OneToOne(mappedBy = "vitalSigns")
    private Patient patient;

    public VitalSigns(){};

    public VitalSigns(float height,float weight , short respiratoryRate,
                      float bodyTemperature, short heartRate, float bloodPressure){
        this.id = generateId();
        this.height = height;
        this.weight = weight;
        this.respiratoryRate = respiratoryRate;
        this.bodyTemperature = bodyTemperature;
        this.heartRate = heartRate;
        this.bloodPressure = bloodPressure;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public short getRespiratoryRate() {
        return respiratoryRate;
    }

    public void setRespiratoryRate(short respiratoryRate) {
        this.respiratoryRate = respiratoryRate;
    }

    public float getBodyTemperature() {
        return bodyTemperature;
    }

    public void setBodyTemperature(float bodyTemperature) {
        this.bodyTemperature = bodyTemperature;
    }

    public short getHeartRate() {
        return heartRate;
    }

    public void setHeartRate(short heartRate) {
        this.heartRate = heartRate;
    }

    public float getBloodPressure() {
        return bloodPressure;
    }

    public void setBloodPressure(float bloodPressure) {
        this.bloodPressure = bloodPressure;
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
