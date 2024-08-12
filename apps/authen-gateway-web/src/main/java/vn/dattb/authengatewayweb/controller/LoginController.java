package vn.dattb.authengatewayweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/v1/login")
    public String login() {
        return "redirect:/oauth2/authorization/keycloak"; // Redirect to Keycloak
    }

    //logout
    @GetMapping("/v1/logout")
    public String logout() {
        return "redirect:/logout";
    }
}
