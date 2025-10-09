package com.example.medicexpert.dao;

import com.example.medicexpert.entity.Staph;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class AuthenticationDao {

    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");

    public void register(Staph staph){

        if(staph != null){

    EntityManager entityManager = entityManagerFactory.createEntityManager();

            try{

                entityManager.getTransaction().begin();
                entityManager.persist(staph);
                entityManager.getTransaction().commit();

            }catch (Exception e){
                e.printStackTrace();
                if(entityManager != null && entityManager.getTransaction().isActive()){
                    entityManager.getTransaction().rollback();
                }
            }finally{
                if(entityManager != null && entityManager.isOpen()){
                entityManager.close();

                }
            }

        }
    }
}
