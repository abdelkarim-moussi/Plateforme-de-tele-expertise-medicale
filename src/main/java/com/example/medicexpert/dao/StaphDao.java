package com.example.medicexpert.dao;

import com.example.medicexpert.entity.Staph;
import jakarta.persistence.*;

public class StaphDao {

    private EntityManagerFactory entityManagerFactory;

    public StaphDao(EntityManagerFactory entityManagerFactory){
        this.entityManagerFactory = entityManagerFactory;
    }


    public void save(Staph staph){
        EntityManager entityManager = null;

        if(staph != null){
            try{
                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                entityManager.persist(staph);
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


    public boolean existByEmail(String email) throws NoResultException {

        EntityManager entityManager = null;
        try{
            entityManager = entityManagerFactory.createEntityManager();
               Long count = entityManager.createQuery("SELECT COUNT(s) FROM Staph s WHERE s.email = :email",Long.class)
                    .setParameter("email",email)
                    .getSingleResult();
           return count > 0;

        }finally {
            if(entityManager != null){
                entityManager.close();
            }
        }
    }

    public Staph findByEmail(String email){
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            return entityManager.createQuery("SELECT s FROM Staph s WHERE s.email = :email", Staph.class)
                    .setParameter("email", email)
                    .getSingleResult();
        }finally {
            if(entityManager != null){
                entityManager.close();
            }
        }
    }

}
