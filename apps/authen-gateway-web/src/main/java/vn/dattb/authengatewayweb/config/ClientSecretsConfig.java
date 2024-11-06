package vn.dattb.authengatewayweb.config;

import jakarta.annotation.PostConstruct;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

import java.util.Map;

@Data
@ConfigurationProperties(prefix = "mail")
@ConfigurationPropertiesScan
public class ClientSecretsConfig {
    private static final Logger logger = LoggerFactory.getLogger(ClientSecretsConfig.class);

    @PostConstruct
    public void init() {
        logger.info("Additional Headers: " + additionalHeaders);
    }
   private Map<String, String> additionalHeaders ;  // Initialize the map

    public String getSecretByClientId(String clientId) {
        return additionalHeaders.get(clientId);
    }
}