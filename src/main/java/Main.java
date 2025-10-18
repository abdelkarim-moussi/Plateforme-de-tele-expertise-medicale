import com.example.medicexpert.dao.SpecialityDao;
import com.example.medicexpert.dao.StaphDao;
import com.example.medicexpert.entity.*;

import jakarta.persistence.*;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

public class Main {

    private static EntityManagerFactory em = Persistence.createEntityManagerFactory("medicexpert");

    public static void main(String[] args) {

//    Staph generalDoctor = new GeneralDoctor("ali", "barkiki", "mohamed@email.com", "06589543278","abcd1234");
//    Staph specialDoctor = new SpecialDoctor("me", "me", "me@email.com", "06589543278","abcd1234");
//    Staph nurse = new Nurse("halima","3man","halima@email.com","07716186381","abcd1234");

        Speciality speciality = new Speciality();
        speciality.setName("Orthopédie");
        speciality.setDescription("Traumatismes et pathologies des os, articulations et muscles");


        SpecialityDao specialityDao = new SpecialityDao(em);
        specialityDao.save(speciality);
//        staphDao.save(specialDoctor);

//        System.out.println(Validation.isValidRole("special_doctor"));

//        System.out.println(Validation.isValidName("abdazhaza"));
    }


}
