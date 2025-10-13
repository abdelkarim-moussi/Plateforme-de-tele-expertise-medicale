package com.example.medicexpert.service;

import com.example.medicexpert.dao.PatientDao;
import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.util.exception.PatientRegistrationException;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;

public class PatientService {

    private PatientDao patientDao;
    public PatientService(PatientDao patientDao){
        this.patientDao = patientDao;
    }

    public void registerPatient(String firstName,String lastName,
                                String email, String phone,LocalDate dateOfBirth,
                                String socialSecurityNumber, String address, String CNI) throws PatientRegistrationException{

        if(firstName == null || lastName == null || email == null || dateOfBirth == null || address == null){
            throw new PatientRegistrationException("one or more of required fields is not set");
        }

        if(patientDao.existByCNI(CNI)){
            EntityManager entityManager = null;

            Patient patient = new Patient();
            patient.setFirstName(firstName);
            patient.setLastName(lastName);
            patient.setEmail(email);
            patient.setDateOfBirth(dateOfBirth);
            patient.setAddress(address);

            if(patient != null){
                try{
                    entityManager = entityManagerFactory.createEntityManager();
                    entityManager.getTransaction().begin();
                    entityManager.persist(patient);
                    entityManager.getTransaction().commit();

                }catch (Exception e){
                    e.printStackTrace();
                    if(entityManager != null && entityManager.getTransaction().isActive()){
                        entityManager.getTransaction().rollback();
                    }
                }finally {
                    if(entityManager != null){
                        entityManager.close();
                    }
                }


            }
        }

    }
}
