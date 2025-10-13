package com.example.medicexpert.dao;

import com.example.medicexpert.entity.MedicalData;
import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.entity.VitalSigns;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

public class PatientDao {

    private EntityManagerFactory entityManagerFactory;
    public PatientDao(EntityManagerFactory entityManagerFactory){
        this.entityManagerFactory = entityManagerFactory;
    }

    public void save(Patient patient, MedicalData medicalData, VitalSigns vitalSigns){
        EntityManager entityManager = null;

        if(patient != null){
            try{
                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                entityManager.persist(patient);
                entityManager.persist(medicalData);
                entityManager.persist(vitalSigns);
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
