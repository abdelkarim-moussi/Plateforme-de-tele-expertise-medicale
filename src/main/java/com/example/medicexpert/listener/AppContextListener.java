package com.example.medicexpert.listener;

import com.example.medicexpert.dao.ConsultationDao;
import com.example.medicexpert.dao.PatientDao;
import com.example.medicexpert.dao.StaphDao;
import com.example.medicexpert.dao.WaitingQueueDao;
import com.example.medicexpert.service.ConsultationService;
import com.example.medicexpert.service.PatientService;
import com.example.medicexpert.service.StaphAuthenticationService;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        try{

            EntityManagerFactory entityMFactory = Persistence.createEntityManagerFactory("medicexpert");
            StaphDao staphDao = new StaphDao(entityMFactory);
            PatientDao patientDao = new PatientDao(entityMFactory);
            WaitingQueueDao waitingQueueDao = new WaitingQueueDao(entityMFactory);
            ConsultationDao consultationDao = new ConsultationDao(entityMFactory);

            StaphAuthenticationService staphAuthenticationService = new StaphAuthenticationService(staphDao);
            PatientService patientService = new PatientService(patientDao,waitingQueueDao);
            ConsultationService consultationService = new ConsultationService(patientDao,consultationDao);

            sce.getServletContext().setAttribute("entityManagerFactory",entityMFactory);
            sce.getServletContext().setAttribute("staphAuthService",staphAuthenticationService);
            sce.getServletContext().setAttribute("patientService",patientService);
            sce.getServletContext().setAttribute("consultationService",consultationService);

        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("There is an error initializing App Listener "+e);
        }
    }
}
