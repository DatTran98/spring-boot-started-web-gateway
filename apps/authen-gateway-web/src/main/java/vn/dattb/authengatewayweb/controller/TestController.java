package vn.dattb.authengatewayweb.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/ping")
    public String test() {
        return "Test from Gateway";
    }

    @GetMapping("/ping-to-core")
    public String testToCore() {
        return "Test from Gateway to Core Service";
    }

    @PostMapping("/push")
    public ResponseEntity<String> push() {
        return ResponseEntity.ok("Hello World!");
    }
}
