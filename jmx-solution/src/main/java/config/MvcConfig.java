/**
 * 
 */
package config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 *
 */
@EnableWebMvc
@Configuration
public class MvcConfig extends WebMvcConfigurerAdapter {

	/**
	*	Map URL /resources/* to serve static resources from classpath:/static/*
	*	This allows us to store and distribute css, images, etc. in JAR file.
	*	This is the equivalent of <mvc:resources/>
	*/
	 @Override
	 public void addResourceHandlers(ResourceHandlerRegistry registry) {
	   registry.addResourceHandler("/**")
	           .addResourceLocations("classpath:/static/");
	 }
	
}
