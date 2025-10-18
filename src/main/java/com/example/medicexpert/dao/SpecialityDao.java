package com.example.medicexpert.dao;

import com.example.medicexpert.entity.Patient;
import com.example.medicexpert.entity.Speciality;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.util.List;

public class SpecialityDao {
    private EntityManagerFactory entityManagerFactory;
    public SpecialityDao(EntityManagerFactory entityManagerFactory){
        this.entityManagerFactory = entityManagerFactory;
    }

    public void save(Speciality speciality){
        EntityManager entityManager = null;

        if(speciality != null){
            try{
                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                entityManager.persist(speciality);
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

    public List<Speciality> findAll(){
        EntityManager entityManager = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            List<Speciality> dbSpecialities = null;
            dbSpecialities = entityManager.createQuery("SELECT s FROM Speciality s",Speciality.class)
                    .getResultList();

            entityManager.getTransaction().commit();

            return dbSpecialities;

        }finally {
            if (entityManager != null){
                entityManager.close();
            }
        }

    }
}
