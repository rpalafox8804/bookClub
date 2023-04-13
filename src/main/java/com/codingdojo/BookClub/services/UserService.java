package com.codingdojo.BookClub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.BookClub.models.LoginUser;
import com.codingdojo.BookClub.models.User;
import com.codingdojo.BookClub.repositories.UserRepository;
    
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;
    
    // Register method to enter information to the DB
    public User register(User newUser, BindingResult result) {     
        	
	    	//username is letters only
	    	if (!newUser.getUserName().matches("[a-zA-Z]+")) {
	    		result.rejectValue("userName", "Username" , "Username can only contain letters!");
	    	}
            
            // Reject if email is taken (present in database)
    		if (userRepo.findByEmail(newUser.getEmail()).isPresent()) {
    			result.rejectValue("email", "Email", "Email is already in use. Please choose another email");
    		}
            // if password doesn't match confirmation
            if(!newUser.getPassword().equals(newUser.getConfirm())) {
            	result.rejectValue("confirm", "Password" , "Passwords do not match!");
            }
            // Return null if result has errors
            if(result.hasErrors()) {
            	return null;
            }
            // Hash and set password, save user to database
            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
       //save user if all validations pass     
      return userRepo.save(newUser);
    }
    //login method to verify credentials and catch errors in the entry
    public User login(LoginUser newLoginObject, BindingResult result) {
            
    	// Find user in the DB by email
		if (!userRepo.findByEmail(newLoginObject.getEmail()).isPresent()) {
			// Reject if NOT present and  apply to both so they do not know which one is wrong
			result.rejectValue("email", "Credentials", "Invalid Credentials, please try again");
		    result.rejectValue("password", "Credentials", "Invalid Credentials, please try again");

			return null;
		}
        Optional<User> loginUser = userRepo.findByEmail(newLoginObject.getEmail());
        User user = loginUser.get();
        // Reject if BCrypt password match fails
		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
		    result.rejectValue("password", "Credentials", "Invalid Credentials, please try again");
		    result.rejectValue("email", "Credentials", "Invalid Credentials, please try again");
		    return null;
		}
        // Return null if result has errors
		 if(result.hasErrors()) {
         	return null;
         }
        // Otherwise, return the user object
		 
        return user;
    }
    //find user by id to use when the user is in session
    public User findUser(Long id) {
        Optional<User> optionalUser = userRepo.findById(id);
        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }
}

