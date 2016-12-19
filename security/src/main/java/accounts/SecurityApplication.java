/**
 * 
 */
package accounts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import config.MvcConfig;
import config.RootConfig;
import config.SecurityConfig;


/**
 * <p>
 * TODO-01: Launch this Spring Boot application by doing right-click -> Run As -> Spring Boot App
 * Access the home page at http://localhost:8080/.
 * <p>
 * Click on the "View Account List" link, you should reach the list of accounts.
 * If the application is not working, please ask your instructor for help
 */

// TODO-02: Let Spring Boot enable Spring Security for you.
// This is done by removing "exclude=SecurityAutoConfiguration.class" below!
@EnableAutoConfiguration(exclude=SecurityAutoConfiguration.class)
@Configuration
@ComponentScan
//TODO-03: Import the SecurityConfig class
//Save all work and restart the server.  You should be able to access the homepage,
//but you should see a 404 when clicking on "View account list".-->
@Import({MvcConfig.class,RootConfig.class})
public class SecurityApplication {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.setProperty("spring.profiles.active", "jpa");
		SpringApplication.run(SecurityApplication.class, args);
	}

}
