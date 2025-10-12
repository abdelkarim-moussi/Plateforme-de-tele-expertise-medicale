package com.example.medicexpert.dao;

import com.example.medicexpert.entity.Staph;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceContext;

public class StaphDao {

    @PersistenceContext
    EntityManager entityManager;

    public void save(Staph staph){

        if(staph != null){
            entityManager.persist(staph);
        }
    }

    public boolean existByEmail(String email){

        Staph staph = entityManager.createQuery("SELECT s FROM Staph s WHERE s.email = :email",Staph.class)
                .setParameter("email",email)
                .getSingleResult();
        if(staph != null) return true;

        return false;
    }

}
