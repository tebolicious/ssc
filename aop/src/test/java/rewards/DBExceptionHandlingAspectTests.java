package rewards;

import static org.hamcrest.Matchers.containsString;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.rule.OutputCapture;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import rewards.internal.account.AccountRepository;
import rewards.internal.aspects.DBExceptionHandlingAspect;
import rewards.internal.exception.RewardDataAccessException;

@ContextConfiguration(classes = { DbExceptionTestConfig.class })
@RunWith(SpringJUnit4ClassRunner.class)
public class DBExceptionHandlingAspectTests {

	// Convenient class from Spring Boot that captures console output
	@Rule
	public OutputCapture capture = new OutputCapture();

	@Autowired
	AccountRepository repository;

	@Test
	public void testReportException() {
		try {
			repository.findByCreditCard("1234123412341234");
			fail("RewardDataAccessException expected");
		} catch (Exception e) {
			System.out.println("Exception occured...... " + e);
			assertTrue(e instanceof RewardDataAccessException);
		}

		// TODO-12: (Optional) Validate our AOP is working.
		//
		// An error message should now be logged to the console as a warning
		//
		// Save all your work and run this test - it should pass with a warning
		// message on the console AND the console output assertion (below)
		// should succeed.

		if (TestConstants.CHECK_CONSOLE_OUTPUT) {
			assertThat(capture.toString(), containsString(DBExceptionHandlingAspect.EMAIL_FAILURE_MSG));
		}
	}
}
