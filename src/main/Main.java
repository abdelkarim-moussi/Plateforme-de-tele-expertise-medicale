import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nurse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;

import jakarta.persistence.*;

public class Main {

    public static void main(String[] args) {

    Staph generalDoctor = new GeneralDoctor("ali", "barkiki", "mohamed@email.com", "06589543278");
    Staph specialDoctor = new SpecialDoctor("me", "me", "me@email.com", "06589543278");
    Staph nurse = new Nurse("halima","3man","halima@email.com","07716186381");

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager entityManager = entityManagerFactory.createEntityManager();

    try{

        entityManager.getTransaction().begin();
        entityManager.persist(specialDoctor);
        entityManager.getTransaction().commit();

    }catch (Exception e){
        entityManager.getTransaction().rollback();
        e.printStackTrace();
    }finally{
        entityManager.close();
        entityManagerFactory.close();
    }

}
}
