package com.example.medicexpert.entity;

import com.example.medicexpert.enums.ConsultationStatus;
import jakarta.persistence.*;

import java.util.List;
import java.util.UUID;

@Entity
public class Consultation {

    @Id
    private String id;
    @Enumerated(EnumType.STRING)
    private ConsultationStatus status;
    private String clinicalExamResult;
    private String symptomAnalyse;
    private String observations;
    private String diagnostic;
    private String prescribedTreatment;
    private String medications;
    private String analysis;
    private String therapeuticStrategy;
    private String optimalSupport;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "general_doctor_id")
    private GeneralDoctor generalDoctor;

    @OneToMany(mappedBy = "consultation", cascade = CascadeType.ALL)
    private List<ExpertiseRequest> expertiseRequests;


    public Consultation(){}
    public Consultation(String clinicalExamResult,String symptomAnalyse,String observations,
                        String diagnostic, String prescribedTreatment, String medications){
        this.id = generateId();
        this.clinicalExamResult = clinicalExamResult;
        this.symptomAnalyse = symptomAnalyse;
        this.observations = observations;
        this.diagnostic = diagnostic;
        this.prescribedTreatment = prescribedTreatment;
        this.medications = medications;

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ConsultationStatus getStatus() {
        return status;
    }

    public void setStatus(ConsultationStatus status) {
        this.status = status;
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

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public String getMedications() {
        return medications;
    }

    public void setMedications(String medications) {
        this.medications = medications;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String generateId(){
        return UUID.randomUUID().toString().replace("-","").substring(0,9);
    }

    public List<ExpertiseRequest> getExpertiseRequests() {
        return expertiseRequests;
    }

    public void setExpertiseRequests(List<ExpertiseRequest> expertiseRequests) {
        this.expertiseRequests = expertiseRequests;
    }

    public GeneralDoctor getGeneralDoctor() {
        return generalDoctor;
    }

    public void setGeneralDoctor(GeneralDoctor generalDoctor) {
        this.generalDoctor = generalDoctor;
    }
}
