package util;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

public class EnvFileReader {
	
	public static String getValue(String envFile, String keyName) {
		ConfigurableApplicationContext ctx =
				new GenericXmlApplicationContext();
		ConfigurableEnvironment env = ctx.getEnvironment();
		MutablePropertySources propertySources =
				env.getPropertySources();
		
		String envStr ="";
		
		try {
			String envPath = "classpath:"+ envFile;
			propertySources.addLast(
					new ResourcePropertySource(envPath));
			
			envStr = env.getProperty(keyName);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return envStr;
	}
	
}
