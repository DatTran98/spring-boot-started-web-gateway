package vn.dattb.authengatewayweb.controller;

import org.slf4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.dattb.authengatewayweb.config.ClientSecretsConfig;
import vn.dattb.authengatewayweb.service.AuthService;
import vn.dattb.authengatewayweb.service.ClientService;

@Controller
public class LoginController {

    private final AuthService authService;
    private final ClientService clientService;

    public LoginController(AuthService authService, ClientService clientService) {
        this.authService = authService;
        this.clientService = clientService;
    }

    @GetMapping("/v1/login")
    public String login() {
        Logger logger = org.slf4j.LoggerFactory.getLogger(LoginController.class);
//        logger.info("Client secrets: " + clientService.retrieveClientSecret("abc"));
        return "redirect:/oauth2/authorization/keycloak"; // Redirect to Keycloak
    }

    //logout
    @GetMapping("/v1/logout")
    public String logout() {
        return "redirect:/logout";
    }

    @GetMapping("/v1/token")
    public ResponseEntity<String> getAccessToken(@RequestParam("code") String code) {
        return ResponseEntity.ok(authService.getAccessToken(code));
    }
}
