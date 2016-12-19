package rewards;

import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.rule.OutputCapture;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import rewards.internal.account.AccountRepository;

@ContextConfiguration(classes = { SystemTestConfig.class })
@RunWith(SpringJUnit4ClassRunner.class)
public class LoggingAspectTests {

	// Convenient class from Spring Boot that captures console output
	@Rule
	public OutputCapture capture = new OutputCapture();

	@Autowired
	AccountRepository repository;

	@Test
	public void testLogger() {
		repository.findByCreditCard("1234123412341234");

		if (TestConstants.CHECK_CONSOLE_OUTPUT) {
			// AOP VERIFICATION
			// LoggingAspect should have output an INFO message to console

			String consoleOutput = capture.toString();
			assertTrue(consoleOutput.startsWith("INFO"));
			assertTrue(consoleOutput.contains("rewards.internal.aspects.LoggingAspect"));
		}
	}
}
