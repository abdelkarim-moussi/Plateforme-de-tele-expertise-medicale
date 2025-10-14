package com.example.medicexpert.service;

import com.example.medicexpert.dao.PatientDao;
import com.example.medicexpert.entity.MedicalData;
import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.entity.VitalSigns;
import com.example.medicexpert.util.exception.PatientRegistrationException;

import java.time.LocalDate;
import java.util.Map;

public class PatientService {

    private PatientDao patientDao;
    public PatientService(PatientDao patientDao){
        this.patientDao = patientDao;
    }

    public void registerPatient(String firstName, String lastName,
                                String email, String phone, LocalDate dateOfBirth,
                                String socialSecurityNumber, String address, String CNI,
                                Map<String,Object> medicalData,
                                Map<String,Object> vitalSigns) throws PatientRegistrationException{

        if(firstName == null || lastName == null || email == null || dateOfBirth == null || address == null){
            throw new PatientRegistrationException("one or more of required fields is not set");
        }
        Patient patient;
        MedicalData mData;
        VitalSigns vSigns;
        if(patientDao.existByCNI(CNI)){

            patient = patientDao.findByCNI(CNI);
            mData = patientDao.findMedicalDataByPatient(patient);
            vSigns = patientDao.findVitalSignsByPatient(patient);

            this.setPatientData(patient,firstName,lastName,email,phone,dateOfBirth,address,socialSecurityNumber);
            this.setMedicalData(mData,patient,medicalData);
            this.setVitalSigns(vSigns,patient,vitalSigns);

            patientDao.update(patient,mData,vSigns);

        }else {
            patient = new Patient(firstName, lastName, email, phone, dateOfBirth, socialSecurityNumber, address, CNI);
            mData = new MedicalData(medicalData.get("antecedents").toString(),medicalData.get("allergies").toString(),medicalData.get("ongoingTreatment").toString());
            vSigns = new VitalSigns(Float.parseFloat(vitalSigns.get("height").toString()), Float.parseFloat(vitalSigns.get("weight").toString()),
                    Short.parseShort(vitalSigns.get("respiratoryRate").toString()), Float.parseFloat(vitalSigns.get("bodyTemperature").toString()),
                    Short.parseShort(vitalSigns.get("heartRate").toString()), Float.parseFloat(vitalSigns.get("bloodPressure").toString())
            );

            patient.setMedicalData(mData);
            patient.setVitalSigns(vSigns);

            patientDao.save(patient);
        }

    }

    private void setPatientData(Patient patient ,String firstName, String lastName,String email,
                                   String phone, LocalDate dateOfBirth, String address, String socialSecurityNumber){
        patient.setFirstName(firstName);
        patient.setLastName(lastName);
        patient.setEmail(email);
        patient.setDateOfBirth(dateOfBirth);
        patient.setAddress(address);

        if(phone != null ){
            patient.setPhone(phone);
        }
        if(socialSecurityNumber != null){
            patient.setSocialSecurityNumber(socialSecurityNumber);
        }
    }

    private void setMedicalData(MedicalData medicalData, Patient patient, Map<String,Object> data){
        medicalData.setAntecedents(data.get("antecedents").toString());
        medicalData.setAllergies(data.get("allergies").toString());
        medicalData.setOngoingTreatment(data.get("ongoingTreatment").toString());
        medicalData.setPatient(patient);
    }

    private void setVitalSigns(VitalSigns vitalSigns, Patient patient, Map<String,Object> data){
        vitalSigns.setHeight(Float.parseFloat(data.get("height").toString()));
        vitalSigns.setWeight(Float.parseFloat(data.get("weight").toString()));
        vitalSigns.setRespiratoryRate(Short.parseShort(data.get("respiratoryRate").toString()));
        vitalSigns.setBodyTemperature(Float.parseFloat(data.get("bodyTemperature").toString()));
        vitalSigns.setHeartRate(Short.parseShort(data.get("heartRate").toString()));
        vitalSigns.setBloodPressure(Float.parseFloat(data.get("bloodPressure").toString()));
        vitalSigns.setPatient(patient);
    }
}
