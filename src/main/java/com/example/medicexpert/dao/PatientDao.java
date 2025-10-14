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

    public void update(Patient patient, MedicalData medicalData, VitalSigns vitalSigns){
        EntityManager entityManager = null;

        if(patient != null){
                String updatePatientQuery = "UPDATE Patient p SET firstName = :firstName, lastName =:lastname, email =:email," +
                                            "address = :address, dateOfBirth =:dateOfBirth, phone= :phone, " +
                                            "socialSecurityNumber =:socialSecurityNumber,CNI = :CNI WHERE p.id =:id";

                String updateMDataQuery = "UPDATE MedicalData m SET allergies =:alergies, antecedents =:antecedents," +
                                           "ongoingTreatment =:ongoingTreatment WHERE m.id =:id";
                String updateVSignsQuery = "UPDATE VitalSigns v SET height =:height , weight =:weight, respiratoryRate =:respiratoryRate," +
                                           "heartRate =:heartRate, bloodPressure =:bloodPressure,bodyTemperature =:bodyTemperature WHERE v.id=:id";
            try{

                entityManager = entityManagerFactory.createEntityManager();

                entityManager.getTransaction().begin();
                entityManager.createQuery(updatePatientQuery)
                        .setParameter("firstName",patient.getFirstName())
                        .setParameter("lastname",patient.getLastName())
                        .setParameter("email",patient.getEmail())
                        .setParameter("address",patient.getAddress())
                        .setParameter("dateOfBirth",patient.getDateOfBirth())
                        .setParameter("phone",patient.getPhone())
                        .setParameter("socialSecurityNumber",patient.getSocialSecurityNumber())
                        .setParameter("CNI",patient.getCNI())
                        .setParameter("id",patient.getId())
                        .executeUpdate();
                //update medical data
                entityManager.createQuery(updateMDataQuery)
                        .setParameter("alergies",medicalData.getAllergies())
                        .setParameter("antecedents",medicalData.getAntecedents())
                        .setParameter("ongoingTreatment",medicalData.getOngoingTreatment())
                        .setParameter("id",medicalData.getId())
                        .executeUpdate();
                //update vital signs
                entityManager.createQuery(updateVSignsQuery)
                        .setParameter("height",vitalSigns.getHeight())
                        .setParameter("weight",vitalSigns.getWeight())
                        .setParameter("respiratoryRate",vitalSigns.getRespiratoryRate())
                        .setParameter("heartRate",vitalSigns.getHeartRate())
                        .setParameter("bloodPressure",vitalSigns.getBloodPressure())
                        .setParameter("bodyTemperature",vitalSigns.getBodyTemperature())
                        .setParameter("id",vitalSigns.getId())
                        .executeUpdate();

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
}
