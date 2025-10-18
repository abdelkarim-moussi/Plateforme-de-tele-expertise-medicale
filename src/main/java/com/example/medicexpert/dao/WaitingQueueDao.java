package com.example.medicexpert.dao;

import com.example.medicexpert.entity.WaitingQueue;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;

import java.time.LocalDate;

public class WaitingQueueDao {
    private EntityManagerFactory entityManagerFactory;

    public WaitingQueueDao(EntityManagerFactory entityManagerFactory){
        this.entityManagerFactory = entityManagerFactory;
    }

    public void save(WaitingQueue waitingQueue){
        if(waitingQueue != null){
            EntityManager entityManager = null;
            try {
                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                entityManager.merge(waitingQueue);
                entityManager.getTransaction().commit();
            }finally {
                if(entityManager != null){
                    entityManager.close();
                }
            }
        }
    }

    public void update(WaitingQueue waitingQueue){
        if(waitingQueue != null){
            EntityManager entityManager = null;
            try {
                entityManager = entityManagerFactory.createEntityManager();
                entityManager.getTransaction().begin();
                entityManager.merge(waitingQueue);
                entityManager.getTransaction().commit();
            }finally {
                if(entityManager != null){
                    entityManager.close();
                }
            }
        }
    }

    public WaitingQueue findByDate(LocalDate createdAt){
        EntityManager entityManager = null;

        try{
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            return entityManager.createQuery("SELECT q FROM WaitingQueue q WHERE q.createdAt =:createdAt",WaitingQueue.class)
                    .setParameter("createdAt",createdAt)
                    .getSingleResult();
        }catch (NoResultException e){
            e.printStackTrace();
            return null;
        }
        finally {
            if(entityManager != null){
                entityManager.close();
            }
        }
    }
}
