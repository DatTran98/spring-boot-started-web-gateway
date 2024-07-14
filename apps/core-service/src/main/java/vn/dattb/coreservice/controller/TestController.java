package vn.dattb.coreservice.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/test")
public class TestController {

    @GetMapping("/ping")
    public String test() {
        return "Test from Core Service";
    }

    @PostMapping("/push")
    public ResponseEntity<String> push() {
        return ResponseEntity.ok("Hello World from Core Service!");
    }
}
