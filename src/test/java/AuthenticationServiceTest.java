import com.example.medicexpert.dao.StaphDao;
import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nurse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;
import com.example.medicexpert.service.StaphAuthenticationService;
import com.example.medicexpert.util.exception.RegistrationException;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManagerFactory;
import org.checkerframework.checker.lock.qual.LockingFree;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.extension.Extensions;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;


// Etape 1- Preparer le Projet et Ajouter Les dépendances
// Étape 2 : Identifier ce qu’on veut tester
// Étape 3 : Créer la classe de test
    //@ExtendWith(MockitoExtension.class)
    //@Mock
    //@InjectMocks
    //BeforeEach

// Étape 4 : Tester un scénario d’inscription réussie
// Étape 5 : Tester un scénario d’échec — email déjà existant
// Étape 6 : Tester un mot de passe trop court
// Étape 7 : Tester l’authentification réussie
// Étape 8 : Tester un cas d’échec — utilisateur introuvable

@ExtendWith(MockitoExtension.class)
public class AuthenticationServiceTest {

    @Mock
    StaphDao mockStaphDao = mock(StaphDao.class);

    @InjectMocks
    StaphAuthenticationService staphAuthenticationService;


//    @Mock

    @Test
    void staphRegisterShouldSaveSuccessfully() throws RegistrationException{


        when(mockStaphDao.existByEmail("example1@gmail.com")).thenReturn(false);

        assertTrue(staphAuthenticationService.register("mohamed","abde",
                "example1@gmail.com","0789654321","12345678","special_doctor"));


        verify(mockStaphDao,times(1)).save(any());

    }

    @Test
    void staphRegisterShouldThrowException() throws RegistrationException{


        when(mockStaphDao.existByEmail("example1@gmail.com")).thenReturn(true);

        assertThrows(RegistrationException.class,() -> staphAuthenticationService.register("mohamed","abde",
                "example1@gmail.com","0789654321","12345678","special_doctor"));


    }@Test



    void staphRegisterShouldThrowExceptionIfPassword() throws RegistrationException{

        when(mockStaphDao.existByEmail("example1@gmail.com")).thenReturn(false);

        assertThrows(RegistrationException.class,() -> staphAuthenticationService.register("mohamed","abde",
                "example1@gmail.com","0789654321","123456","special_doctor"));

    }

    @Test
    void staphLoginSuccess() throws RegistrationException{

        String hashedPass = staphAuthenticationService.passwordHash("12345678");

        Staph staph = new SpecialDoctor();
        staph.setEmail("example1@gmail.com");
        staph.setPassword(hashedPass);

//        when(mockStaphDao.existByEmail("example1@gmail.com")).thenReturn(true);

        when(mockStaphDao.findByEmail("example1@gmail.com")).thenReturn(null);

        assertThrows(RegistrationException.class,() -> staphAuthenticationService.authenticate("example1@gmail.com",hashedPass));
    }

}
