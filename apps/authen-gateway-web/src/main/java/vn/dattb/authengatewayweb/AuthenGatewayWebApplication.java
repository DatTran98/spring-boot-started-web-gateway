package vn.dattb.authengatewayweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import vn.dattb.authengatewayweb.config.ClientSecretsConfig;

@SpringBootApplication
@EnableConfigurationProperties(ClientSecretsConfig.class)
public class AuthenGatewayWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(AuthenGatewayWebApplication.class, args);
	}

}
