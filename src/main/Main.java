import com.example.medicexpert.dao.StaphDao;
import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nurse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;

import jakarta.persistence.*;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

public class Main {


    public static void main(String[] args) {

    Staph generalDoctor = new GeneralDoctor("ali", "barkiki", "mohamed@email.com", "06589543278","abcd1234");
    Staph specialDoctor = new SpecialDoctor("me", "me", "me@email.com", "06589543278","abcd1234");
    Staph nurse = new Nurse("halima","3man","halima@email.com","07716186381","abcd1234");

//        staphDao.save(specialDoctor);

//        System.out.println(Validation.isValidRole("special_doctor"));

//        System.out.println(Validation.isValidName("abdazhaza"));
    }


}
