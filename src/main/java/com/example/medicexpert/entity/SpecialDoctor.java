package com.example.medicexpert.entity;

import com.example.medicexpert.enums.AvailabilityStatus;
import com.example.medicexpert.enums.StaphRole;
import jakarta.persistence.*;

import java.util.List;

@Entity
@DiscriminatorValue("SPECIAL_DOCTOR")
public class SpecialDoctor extends Staph {

    @Column(name = "specialty")
    private String specialty;

    @Column(name = "consultation_rate")
    private Double consultationRate;

    @Enumerated(EnumType.STRING)
    @Column(name = "availability_status")
    private AvailabilityStatus availabilityStatus = AvailabilityStatus.DISPONIBLE;

    @OneToMany(mappedBy = "specialDoctor", cascade = CascadeType.ALL)
    private List<ExpertiseRequest> expertiseRequests;

    @OneToMany(mappedBy = "specialDoctor", cascade = CascadeType.ALL)
    private List<TimeSlot> timeSlots;


    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public Double getConsultationRate() {
        return consultationRate;
    }

    public void setConsultationRate(Double consultationRate) {
        this.consultationRate = consultationRate;
    }

    public AvailabilityStatus getAvailabilityStatus() {
        return availabilityStatus;
    }

    public void setAvailabilityStatus(AvailabilityStatus availabilityStatus) {
        this.availabilityStatus = availabilityStatus;
    }

    public List<ExpertiseRequest> getExpertiseRequests() {
        return expertiseRequests;
    }

    public void setExpertiseRequests(List<ExpertiseRequest> expertiseRequests) {
        this.expertiseRequests = expertiseRequests;
    }

    public List<TimeSlot> getTimeSlots() {
        return timeSlots;
    }

    public void setTimeSlots(List<TimeSlot> timeSlots) {
        this.timeSlots = timeSlots;
    }

    public SpecialDoctor(){
        setRole();
    }
    public SpecialDoctor(String firstName, String lastName,String email, String phone, String password){
        super(firstName,lastName,email,phone,password);
        setRole();
    }
    @Override
    public void setRole(){
        this.role = StaphRole.special_doctor;
    }
}
