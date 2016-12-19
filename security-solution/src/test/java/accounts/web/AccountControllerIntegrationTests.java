package accounts.web;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import accounts.internal.JpaAccountManager;

/**
 * A JUnit test case testing the AccountController. Inherits and runs all the
 * tests in {@link AbstractAccountControllerTests} using the rewards in-memory
 * test-database and a {@link JpaAccountManager} - since "jpa" is the active
 * profile.
 */
@Transactional
@ComponentScan("accounts.web")
@ActiveProfiles("jpa")
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestConfig.class)
public class AccountControllerIntegrationTests extends
		AbstractAccountControllerTests {

	@Autowired
	DataSource dataSource;

	private static int numAccountsInDb = -1;

	@Before
	public void setUp() {
		// The number of test accounts in the database
		// - a static variable so we only do this one.
		if (numAccountsInDb == -1)
			numAccountsInDb = new JdbcTemplate(dataSource)
					.queryForObject("SELECT count(*) FROM T_Account", Integer.class); 
	}

	@Override
	protected int getNumAccountsExpected() {
		return numAccountsInDb;
	}

}
