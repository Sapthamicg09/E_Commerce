package com.Sapthami.SpringBoot.E_Commerce.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Sapthami.SpringBoot.E_Commerce.dto.LoginRequest;
import com.Sapthami.SpringBoot.E_Commerce.entity.User;
import com.Sapthami.SpringBoot.E_Commerce.service.AuthService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

@RestController
@CrossOrigin(origins = "http://localhost:5173", allowCredentials = "true")
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest, HttpServletResponse response) {
        try {
            // Log the login attempt for debugging
            System.out.println("Attempting to login user: " + loginRequest.getUsername());

            User user = authService.authenticate(loginRequest.getUsername(), loginRequest.getPassword());
            String token = authService.generateToken(user);

            // Set the token as HttpOnly cookie
            Cookie cookie = new Cookie("authToken", token);
            cookie.setHttpOnly(true);
            cookie.setSecure(false); // Set to true if using HTTPS
            cookie.setPath("/");
            cookie.setMaxAge(3600); // 1 hour
            cookie.setDomain("localhost");
            response.addCookie(cookie);

            // Add token in the header as well
            response.addHeader("Set-Cookie",
                    String.format("authToken=%s; HttpOnly; Path=/; Max-Age=3600; SameSite=None", token));

            // Prepare and send the success response
            Map<String, Object> responseBody = new HashMap<>();
            responseBody.put("message", "Login successful");
            responseBody.put("role", user.getRole().name());
            responseBody.put("username", user.getUsername());

            return ResponseEntity.ok(responseBody);
        } catch (RuntimeException e) {
            // Log error and send failure response
            System.out.println("Error during login: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("error", e.getMessage()));
        }
    }

//    @PostMapping("/logout")
//    public ResponseEntity<Map<String, String>> logout(HttpServletResponse response) {
//        try {
//            authService.logout(response);
//
//            Map<String, String> responseBody = new HashMap<>();
//            responseBody.put("message", "Logout successful");
//            return ResponseEntity.ok(responseBody);
//        } catch (RuntimeException e) {
//            Map<String, String> errorResponse = new HashMap<>();
//            errorResponse.put("message", "Logout failed");
//            return ResponseEntity.status(500).body(errorResponse);
//        }
//    }
}
