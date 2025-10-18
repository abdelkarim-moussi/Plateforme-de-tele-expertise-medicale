package com.example.medicexpert.entity;

import com.example.medicexpert.enums.StaphRole;
import jakarta.persistence.CascadeType;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;

import java.util.List;

@Entity
@DiscriminatorValue("GENERAL_DOCTOR")
public class GeneralDoctor extends Staph {

    @OneToMany(mappedBy = "generalDoctor", cascade = CascadeType.ALL)
    private List<Consultation> consultations;

    @OneToMany(mappedBy = "generalDoctor", cascade = CascadeType.ALL)
    private List<ExpertiseRequest> expertiseRequests;

    public GeneralDoctor() {setRole();}

    public GeneralDoctor(String firstName,String lastName, String email, String phone,String password){
        super(firstName,lastName,email,phone,password);
        setRole();
    }

    @Override
    public void setRole(){
        this.role = StaphRole.general_doctor;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    public List<ExpertiseRequest> getExpertiseRequests() {
        return expertiseRequests;
    }

    public void setExpertiseRequests(List<ExpertiseRequest> expertiseRequests) {
        this.expertiseRequests = expertiseRequests;
    }
}
