package com.hasan.bookClub.services;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.hasan.bookClub.models.LoginUser;
import com.hasan.bookClub.models.User;
import com.hasan.bookClub.repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;
    
    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
        // TO-DO: Additional validations!
    	Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
    	if(optionalUser.isPresent()) {
    		result.rejectValue("email", "emailExists","A user with this email is already registered");
    	}
    	if (!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm","passwordMismatch","Passwords must match");
    	}
    	if(result.hasErrors()) {
    		return null;
    	} else {
    		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepo.save(newUser);
    	}
    }
    public User login(LoginUser newLoginObject, BindingResult result) {
        // TO-DO: Additional validations!
    	Optional<User> optionalUser = userRepo.findByEmail(newLoginObject.getEmail());
    	if(optionalUser.isEmpty()) {
    		result.rejectValue("email", "notFound","A user with this email could not be found");
    	} else {
    		User user = optionalUser.get();
        	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
        	    result.rejectValue("password", "Matches", "Invalid Password!");
        	}
    	}
    	
        if(result.hasErrors()) {
        	return null;
        }
        else {
        	User user = optionalUser.get();
        	return user;
        }
    }
    public User findById(Long id) {
    	Optional<User> optionalUser = userRepo.findById(id);
		if (optionalUser.isEmpty()) return null;
		else return optionalUser.get();
    }
}