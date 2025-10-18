package com.example.medicexpert.dao;

import com.example.medicexpert.entity.Consultation;
import com.example.medicexpert.entity.Staph;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

public class ConsultationDao {
    private EntityManagerFactory entityManagerFactory;

    public ConsultationDao(EntityManagerFactory entityManagerFactory){
        this.entityManagerFactory = entityManagerFactory;
    }

    public Consultation save(Consultation consultation){
        EntityManager entityManager = null;

            try{
                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                entityManager.persist(consultation);
                entityManager.getTransaction().commit();
                return consultation;

            }catch (Exception e){
                e.printStackTrace();
                if(entityManager != null && entityManager.getTransaction().isActive()){
                    entityManager.getTransaction().rollback();
                }
                return null;
            }finally {
                if(entityManager != null){
                    entityManager.close();
                }
            }

    }

    public Consultation update(Consultation consultation){
        EntityManager entityManager = null;

        if(consultation != null){
            try{
                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                entityManager.merge(consultation);
                entityManager.getTransaction().commit();
                return consultation;

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
        return null;
    }

    public Consultation findById(String id){
        EntityManager entityManager = null;

        if(id != null){
            try{
                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                Consultation consultation = entityManager.find(Consultation.class,id);
                entityManager.getTransaction().commit();

                return consultation;

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

        return null;
    }
}
