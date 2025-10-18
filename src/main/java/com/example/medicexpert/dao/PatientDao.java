package com.example.medicexpert.dao;

import com.example.medicexpert.entity.MedicalData;
import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.entity.VitalSigns;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.util.ArrayList;
import java.util.List;

public class PatientDao {

    private EntityManagerFactory entityManagerFactory;
    public PatientDao(EntityManagerFactory entityManagerFactory){
        this.entityManagerFactory = entityManagerFactory;
    }

    public void save(Patient patient){
        EntityManager entityManager = null;

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

    public List<Patient> findAllByQueueId(Long id){
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            List<Patient> dbPatients = null;
            dbPatients = entityManager.createQuery("SELECT p FROM Patient p WHERE p.waitingQueue.id =:id",Patient.class)
                    .setParameter("id",id)
                    .getResultList();

            entityManager.getTransaction().commit();

            return dbPatients;

        }finally {
            if (entityManager != null){
                entityManager.close();
            }
        }
    }

    public void update(Patient patient){
        EntityManager entityManager = null;

        if(patient != null){

            try{

                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                entityManager.merge(patient);
                entityManager.getTransaction().commit();
            }
            catch (Exception e){
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

    public Patient findByCNI(String CNI){
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            return entityManager.createQuery("SELECT p FROM Patient p WHERE p.CNI = :CNI",Patient.class)
                    .setParameter("CNI",CNI)
                    .getSingleResult();

        }finally {
            if(entityManager != null){
                entityManager.close();
            }
        }

    }

    public boolean existByCNI(String CNI){
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            long count = entityManager.createQuery("SELECT COUNT(p) FROM Patient p WHERE p.CNI = :CNI",long.class)
                    .setParameter("CNI",CNI)
                    .getSingleResult();
            return count > 0;

        }finally {
            if(entityManager != null){
                entityManager.close();
            }
        }

    }

    public MedicalData findMedicalDataByPatient(Patient patient){
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            return entityManager.createQuery("SELECT m FROM MedicalData m WHERE m.patient = :patient",MedicalData.class)
                    .setParameter("patient",patient)
                    .getSingleResult();

        }finally {
            if(entityManager != null){
                entityManager.close();
            }
        }
    }

    public VitalSigns findVitalSignsByPatient(Patient patient){
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            return entityManager.createQuery("SELECT v FROM VitalSigns v WHERE v.patient = :patient",VitalSigns.class)
                    .setParameter("patient",patient)
                    .getSingleResult();

        }finally {
            if(entityManager != null){
                entityManager.close();
            }
        }
    }

    public Patient findById(String id){

        EntityManager entityManager = null;

        try{
            entityManager = entityManagerFactory.createEntityManager();

            entityManager.getTransaction().begin();
            Patient patient = entityManager.createQuery(
                    "SELECT p FROM Patient p " +
                       "LEFT JOIN FETCH p.medicalData "+
                       "LEFT JOIN FETCH p.vitalSigns " +
                       "LEFT JOIN FETCH p.consultations " +
                       "LEFT JOIN FETCH p.waitingQueue " +
                       "WHERE p.id =: id"
            ,Patient.class).setParameter("id",id)
                    .getSingleResult();
            entityManager.getTransaction().commit();

            return patient;

        }finally {
            if (entityManager != null){
                entityManager.close();
            }
        }
    }
}
