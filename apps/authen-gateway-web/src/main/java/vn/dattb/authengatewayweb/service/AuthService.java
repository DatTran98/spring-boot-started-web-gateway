package vn.dattb.authengatewayweb.service;

import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class AuthService {
    Logger logger = org.slf4j.LoggerFactory.getLogger(AuthService.class);

    @Value("${spring.security.oauth2.client.provider.keycloak.token-uri}")
    private String tokenEndpoint;

    @Value("${spring.security.oauth2.client.registration.keycloak.client-id}")
    private String clientId;

    @Value("${spring.security.oauth2.client.registration.keycloak.client-secret}")
    private String clientSecret;

    @Value("${spring.security.oauth2.client.registration.keycloak.redirect-uri}")
    private String redirectUri;
    private final OkHttpClient httpClient = new OkHttpClient();

    public String getAccessToken(String code) {
        logger.info("Get access token with code: {}", code);

        RequestBody formBody = new FormBody.Builder()
                .add("grant_type", "authorization_code")
                .add("client_id", clientId)
                .add("client_secret", clientSecret)
                .add("authorization_code", code)
                .add("code_verifier", code)
                .add("redirect_uri", redirectUri)
                .build();
        //set x-www-form-urlencoded

        Request request = new Request.Builder()
                .url(tokenEndpoint)
                .post(formBody)
                .build();

        try (Response response = httpClient.newCall(request).execute()) {
            return response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("Error when get access token: {}", e.getMessage());
        }
        return null;
    }

}
