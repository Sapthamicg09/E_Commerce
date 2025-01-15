package com.Sapthami.SpringBoot.E_Commerce.respository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Sapthami.SpringBoot.E_Commerce.entity.JWTToken;


public interface JWTTokenRepository extends JpaRepository<JWTToken, Integer> {

    // Find a token by its value
    Optional<JWTToken> findByToken(String token);

    // You don't need to define delete, as it's inherited from JpaRepository
}
