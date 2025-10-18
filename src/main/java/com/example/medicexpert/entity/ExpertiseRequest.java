package com.example.medicexpert.entity;

import com.example.medicexpert.enums.ExpertisePriority;
import com.example.medicexpert.enums.ExpertiseStatus;
import com.example.medicexpert.enums.ExpertiseType;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class ExpertiseRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "patient_id", nullable = false)
    private Patient patient;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "consultation_id", nullable = false)
    private Consultation consultation;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "general_doctor_id", nullable = false)
    private GeneralDoctor generalDoctor;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "specialist_id", nullable = false)
    private SpecialDoctor specialDoctor;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String message; // Question/message from general doctor

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ExpertiseStatus status = ExpertiseStatus.EN_ATTENTE;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ExpertisePriority priority = ExpertisePriority.NORMALE;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ExpertiseType type; // SYNCHRONE or ASYNCHRONE

    @Column(columnDefinition = "TEXT")
    private String specialistResponse; // Specialist's advice/response

    @Column(nullable = false)
    private LocalDateTime requestDate = LocalDateTime.now();

    private LocalDateTime responseDate;

    @Column(name = "appointment_slot_id")
    private Long appointmentSlotId; // For SYNCHRONE type

    // Constructors
    public ExpertiseRequest() {}

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Consultation getConsultation() {
        return consultation;
    }

    public void setConsultation(Consultation consultation) {
        this.consultation = consultation;
    }

    public GeneralDoctor getGeneralDoctor() {
        return generalDoctor;
    }

    public void setGeneralDoctor(GeneralDoctor generalDoctor) {
        this.generalDoctor = generalDoctor;
    }

    public SpecialDoctor getSpecialDoctor() {
        return specialDoctor;
    }

    public void setSpecialDoctor(SpecialDoctor specialDoctor) {
        this.specialDoctor = specialDoctor;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ExpertiseStatus getStatus() {
        return status;
    }

    public void setStatus(ExpertiseStatus status) {
        this.status = status;
    }

    public ExpertisePriority getPriority() {
        return priority;
    }

    public void setPriority(ExpertisePriority priority) {
        this.priority = priority;
    }

    public ExpertiseType getType() {
        return type;
    }

    public void setType(ExpertiseType type) {
        this.type = type;
    }

    public String getSpecialistResponse() {
        return specialistResponse;
    }

    public void setSpecialistResponse(String specialistResponse) {
        this.specialistResponse = specialistResponse;
    }

    public LocalDateTime getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(LocalDateTime requestDate) {
        this.requestDate = requestDate;
    }

    public LocalDateTime getResponseDate() {
        return responseDate;
    }

    public void setResponseDate(LocalDateTime responseDate) {
        this.responseDate = responseDate;
    }

    public Long getAppointmentSlotId() {
        return appointmentSlotId;
    }

    public void setAppointmentSlotId(Long appointmentSlotId) {
        this.appointmentSlotId = appointmentSlotId;
    }
}



