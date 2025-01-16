package com.Sapthami.SpringBoot.E_Commerce.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.Sapthami.SpringBoot.E_Commerce.entity.User;
import com.Sapthami.SpringBoot.E_Commerce.respository.UserRepository;
import com.Sapthami.SpringBoot.E_Commerce.service.AuthService;

@WebFilter(urlPatterns = "/api/*") // Apply the filter to all /api/* endpoints
public class AuthenticationFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(AuthenticationFilter.class);
    private final AuthService authService;
    private final UserRepository userRepository;

    public AuthenticationFilter(AuthService authService, UserRepository userRepository) {
        logger.info("AuthenticationFilter initialized");
        this.authService = authService;
        this.userRepository = userRepository;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String requestURI = httpRequest.getRequestURI();
        logger.info("Request URI: {}", requestURI);

        if ("/api/users/register".equals(requestURI) || "/api/auth/login".equals(requestURI)) {
            logger.info("Request allowed without authentication: {}", requestURI);
            chain.doFilter(request, response);
            return;
        }

        if ("OPTIONS".equalsIgnoreCase(httpRequest.getMethod())) {
            httpResponse.setHeader("Access-Control-Allow-Origin", "http://localhost:5173");
            httpResponse.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
            httpResponse.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
            httpResponse.setHeader("Access-Control-Allow-Credentials", "true");
            httpResponse.setStatus(HttpServletResponse.SC_OK);
            return;
        }

        String token = getAuthTokenFromCookies(httpRequest);
        logger.info("Extracted Token: {}", token);

        if (token == null || !authService.validateToken(token)) {
            logger.error("Token validation failed or token is missing.");
            sendUnauthorizedResponse(httpResponse, "Unauthorized: Invalid or missing token");
            return;
        }

        String username = authService.extractUsername(token);
        logger.info("Extracted Username: {}", username);

        Optional<User> userOptional = userRepository.findByUsername(username);
        if (userOptional.isEmpty()) {
            logger.error("User not found in database for username: {}", username);
            sendUnauthorizedResponse(httpResponse, "Unauthorized: User not found");
            return;
        }

        User authenticatedUser = userOptional.get();
        logger.info("Authenticated User: {}, Role: {}", authenticatedUser.getUsername(), authenticatedUser.getRole());

        httpRequest.setAttribute("authenticatedUser", authenticatedUser);
        chain.doFilter(request, response);
    }

    private String getAuthTokenFromCookies(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            return Arrays.stream(cookies)
                    .filter(cookie -> "authToken".equals(cookie.getName()))
                    .map(Cookie::getValue)
                    .findFirst()
                    .orElse(null);
        }
        return null;
    }

    private void sendUnauthorizedResponse(HttpServletResponse response, String message) throws IOException {
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.getWriter().write("{\"error\": \"" + message + "\"}");
    }
}
