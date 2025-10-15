import com.example.medicexpert.dao.StaphDao;
import com.example.medicexpert.entity.GeneralDoctor;
import com.example.medicexpert.entity.Nurse;
import com.example.medicexpert.entity.SpecialDoctor;
import com.example.medicexpert.entity.Staph;
import com.example.medicexpert.service.StaphAuthenticationService;
import com.example.medicexpert.util.exception.RegistrationException;
import jakarta.persistence.EntityManagerFactory;
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

// Étape 4 : Tester un scénario d’inscription réussie
// Étape 5 : Tester un scénario d’échec — email déjà existant
// Étape 6 : Tester un mot de passe trop court
// Étape 7 : Tester l’authentification réussie
// Étape 8 : Tester un cas d’échec — utilisateur introuvable

@ExtendWith(MockitoExtension.class)
public class AuthenticationServiceTest {

    @Mock
    StaphDao staphDaoMock = mock(StaphDao.class);

    @InjectMocks
    private StaphAuthenticationService staphAuthService;


//    @BeforeEach
//    void setUp(){
//        MockitoAnnotations.initMocks(this);
//    }


//    @Test
//    void testRegister() throws RegistrationException {
//
//        when(staphDaoMock.existByEmail("example1@gmail.com")).thenReturn(true);
//
//        assertThrows(RegistrationException.class,() -> staphAuthService.register("firstname","lastname",
//                "example1@gmail.com","0789654321","12345678","special_doctor"));
//
//    }


    @Test
    void TestAuthentication() throws RegistrationException{

        String email = "exampl@gmail.com";
        String password = "12345678";
        String hashedPass = staphAuthService.passwordHash(password);

        Staph mockStaph = new SpecialDoctor("firstname","lastname","example1@gmail.com","0789654321",hashedPass);
        mockStaph.setId("54744c8e3c6");

//        when(staphDaoMock.existByEmail(email)).thenReturn(true);
        when(staphDaoMock.findByEmail(email)).thenReturn(mockStaph);

        assertTrue(staphAuthService.authenticate(email,password));

//        assertThrows(RegistrationException.class,() -> staphAuthService.authenticate(email,password));
//        verify(staphDaoMock,times(1)).findByEmail(email);
    }

}
