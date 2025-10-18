package com.example.medicexpert.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.util.UUID;

@Entity
public class Consultation {

    @Id
    private String id;
    private String clinicalExamResult;
    private String symptomAnalyse;
    private String diagnostic;
    private String prescribedTreatment;
    private String analysis;
    private String therapeuticStrategy;
    private String optimalSupport;

    public Consultation(){}
    public Consultation(String clinicalExamResult,String symptomAnalyse){
        this.id = generateId();
        this.clinicalExamResult = clinicalExamResult;
        this.symptomAnalyse = symptomAnalyse;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClinicalExamResult() {
        return clinicalExamResult;
    }

    public void setClinicalExamResult(String clinicalExamResult) {
        this.clinicalExamResult = clinicalExamResult;
    }

    public String getSymptomAnalyse() {
        return symptomAnalyse;
    }

    public void setSymptomAnalyse(String symptomAnalyse) {
        this.symptomAnalyse = symptomAnalyse;
    }

    public String getDiagnostic() {
        return diagnostic;
    }

    public void setDiagnostic(String diagnostic) {
        this.diagnostic = diagnostic;
    }

    public String getPrescribedTreatment() {
        return prescribedTreatment;
    }

    public void setPrescribedTreatment(String prescribedTreatment) {
        this.prescribedTreatment = prescribedTreatment;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getTherapeuticStrategy() {
        return therapeuticStrategy;
    }

    public void setTherapeuticStrategy(String therapeuticStrategy) {
        this.therapeuticStrategy = therapeuticStrategy;
    }

    public String getOptimalSupport() {
        return optimalSupport;
    }

    public void setOptimalSupport(String optimalSupport) {
        this.optimalSupport = optimalSupport;
    }

    public String generateId(){
        return UUID.randomUUID().toString().replace("-","").substring(0,9);
    }
}
