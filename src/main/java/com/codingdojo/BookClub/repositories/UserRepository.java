package com.codingdojo.BookClub.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.BookClub.models.User;


public interface UserRepository extends CrudRepository<User, Long> {
	//adding ability to find by email and obtain the user
    Optional<User> findByEmail(String email);
    
  
}
