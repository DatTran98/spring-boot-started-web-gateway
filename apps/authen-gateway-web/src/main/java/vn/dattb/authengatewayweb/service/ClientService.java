package vn.dattb.authengatewayweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.dattb.authengatewayweb.config.ClientSecretsConfig;

@Service
public class ClientService{
    private final ClientSecretsConfig clientSecretsConfig;

    @Autowired
    public ClientService(ClientSecretsConfig clientSecretsConfig) {
        this.clientSecretsConfig = clientSecretsConfig;
    }

    public String retrieveClientSecret(String clientId) {
        return clientSecretsConfig.getSecretByClientId(clientId);
    }
}
