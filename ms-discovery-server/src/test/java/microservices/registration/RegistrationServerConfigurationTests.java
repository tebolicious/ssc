package microservices.registration;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Test to check if the configuration for the {@link RegistrationServer} is
 * correct.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = RegistrationServer.class)
@WebAppConfiguration
public class RegistrationServerConfigurationTests {

	@Test
	public void contextLoads() {
		// Nothing to do - just want to force the configuration to load
	}

}
