//import com.example.medicexpert.dao.StaphDao;
//import com.example.medicexpert.service.StaphAuthenticationService;
//import com.example.medicexpert.util.exception.RegistrationException;
//import jakarta.persistence.EntityManagerFactory;
//import org.junit.jupiter.api.Test;
//
//import static org.junit.jupiter.api.Assertions.assertTrue;
//import static org.mockito.Mockito.mock;
//
//public class AuthenticationServiceTest {
//    EntityManagerFactory emMock =mock(EntityManagerFactory.class);
//    StaphDao staphDaoMock = new StaphDao(emMock);
//    private StaphAuthenticationService staphAuthService = new StaphAuthenticationService(staphDaoMock);
//
//
//    @Test
//    void testRegister() throws RegistrationException {
//
//        assertTrue(staphAuthService.register("firstname","lastname",
//                "example1@gmail.com","0789654321","12345678","special_doctor"));
//
//    }
//
//
//    @Test
//    void TestAuthentication() throws RegistrationException{
//
//        assertTrue(staphAuthService.authenticate("example1@gmail.com", "example1@gmail.com"));
//
//    }
//
//}
