package com.example.medicexpert.service;

import com.example.medicexpert.dao.ConsultationDao;
import com.example.medicexpert.dao.PatientDao;
import com.example.medicexpert.dao.WaitingQueueDao;
import com.example.medicexpert.entity.Consultation;
import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.enums.ConsultationStatus;

import java.util.ArrayList;
import java.util.List;

public class ConsultationService {
    private PatientDao patientDao;
    private ConsultationDao consultationDao;

    public ConsultationService(PatientDao patientDao,ConsultationDao consultationDao){
        this.patientDao = patientDao;
        this.consultationDao = consultationDao;
    }

    public Consultation createConsultation(String patientId, String clinicalExamResult, String symptomAnalyse, String observations) {

        Patient patient = patientDao.findById(patientId);

        if (patient == null) return null;

        Consultation consultation = new Consultation(clinicalExamResult, symptomAnalyse, observations,"","","");

        consultation.setStatus(ConsultationStatus.in_progress);
        consultation.setPatient(patient);

        if (patient.getConsultations() == null) {
            patient.setConsultations(new ArrayList<>());
        }
        patient.getConsultations().add(consultation);

        if (patient.getWaitingQueue() != null) {
            patient.getWaitingQueue().removePatientFromQueue(patient);
        }

        consultationDao.save(consultation);
        patientDao.update(patient);

        return consultation;
    }


    public Consultation updateConsultation(String patientId,String consultationId, String clinicalExamResult,
                                      String symptomAnalyse, String observations,String diagnosis,
    String treatment , String medications) {

        Patient patient = patientDao.findById(patientId);

        if (patient == null) return null;

        Consultation consultation = consultationDao.findById(consultationId);

        if(consultation == null){
            consultation = new Consultation(clinicalExamResult,symptomAnalyse,observations,diagnosis,treatment,medications);
            consultation.setPatient(patient);
        }else {
            consultation.setClinicalExamResult(clinicalExamResult);
            consultation.setSymptomAnalyse(symptomAnalyse);
            consultation.setObservations(observations);
            consultation.setDiagnostic(diagnosis);
            consultation.setPrescribedTreatment(treatment);
            consultation.setMedications(medications);
            consultation.setStatus(ConsultationStatus.done);
        }

        if (patient.getConsultations() == null) {
            patient.setConsultations(new ArrayList<>());
        }

        patient.getConsultations().add(consultation);

        if (patient.getWaitingQueue() != null) {
            patient.getWaitingQueue().removePatientFromQueue(patient);
        }

        consultation = consultationDao.update(consultation);
        patientDao.update(patient);

        return consultation;
    }
}
