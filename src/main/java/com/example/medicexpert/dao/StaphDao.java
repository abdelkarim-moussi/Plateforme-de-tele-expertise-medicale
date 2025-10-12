package com.example.medicexpert.dao;

import com.example.medicexpert.entity.Staph;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;


@ApplicationScoped
@Transactional
public class StaphDao {

    @PersistenceContext(unitName = "medicexpertPU")
    private EntityManager entityManager;

    public void save(Staph staph){

        if(staph != null){
            System.out.println(staph);
            entityManager.persist(staph);
        }
    }

    public Boolean existByEmail(String email) throws NoResultException {

           Long count = entityManager.createQuery("SELECT COUNT(s) FROM Staph s WHERE s.email = :email",Long.class)
                .setParameter("email",email)
                .getSingleResult();

           return count > 0;
    }

    public Staph findByEmail(String email){

        return entityManager.createQuery("SELECT s FROM Staph s WHERE s.email = :email",Staph.class)
                .setParameter("email",email)
                .getSingleResult();
    }

}
