package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import rewards.internal.aspects.RepositoryPerformanceMonitor;
import rewards.internal.monitor.jamon.JamonMonitorFactory;

@Configuration
@EnableAspectJAutoProxy

//	TODO-03: Activate annotation driven JMX. 

//	TODO-04: Specify -Dcom.sun.management.jmxremote as a JVM argument.
//  See detailed lab notes if you don't know how to do this.

//  TODO-05: Deploy the project to the web server and start it.

//	TODO-06: View the statistics using JConsole.
//  Ask your trainer if you aren't sure about using JConsole.
//  
//  IMPORTANT NOTE: If JConsole is unable to connect to your application,
//  refer to the Tip in the detailed notes about using JVM -D flags (the
//  section titled "View the monitor statistics using JConsole").  You
//  should now be able to connect using the "Remote" option.

public class AspectsConfig {

	@Bean
	public JamonMonitorFactory monitorFactory() {
		return new JamonMonitorFactory();
	}
	
	@Bean
	public RepositoryPerformanceMonitor repositoryPerformanceMonitor() {
		return new RepositoryPerformanceMonitor(monitorFactory());
	}
	

}
