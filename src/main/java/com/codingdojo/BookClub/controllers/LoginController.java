package com.codingdojo.BookClub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.BookClub.models.LoginUser;
import com.codingdojo.BookClub.models.User;
import com.codingdojo.BookClub.services.UserService;

@Controller
public class LoginController {
	 
	 // Service to be referenced
	  @Autowired
	  private UserService userServ;
	 
	  //mapping to the index page to register or login
	 @GetMapping("/")
	 public String index(Model model) {
	 
	     // Empty User and LoginUser objects to the JSP
	     // to capture the form input
	     model.addAttribute("newUser", new User());
	     model.addAttribute("newLogin", new LoginUser());
	     return "loginRegistration.jsp";
	 }

	 //create new user
	 @PostMapping("/user/new")
	 public String register(@Valid @ModelAttribute("newUser") User newUser, 
	         BindingResult result, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
	     
	     // additional validations for new user
		 userServ.register(newUser, result);
		 //catch any errors from validation

	     if(result.hasErrors()) {
	         // Be sure to send in the empty LoginUser before 
	         // re-rendering the page.
	         model.addAttribute("newLogin", new LoginUser());
	         return "loginRegistration.jsp";
	     }
	     
	     // No errors show success! 
	     redirectAttributes.addFlashAttribute("success", "Successfully created your account!");
	     
	     return "redirect:/";
	 }
	 //login user
	 @PostMapping("/user/login")
	 public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	         BindingResult result, Model model, HttpSession session) {
	     
		 //catch any errors with login
		 User user = userServ.login(newLogin, result);
		 //catch any errors from validation
	     if(result.hasErrors()) {
	         model.addAttribute("newUser", new User());
	         return "loginRegistration.jsp";
	     }
	     
	     // No errors! 
	     // TO-DO Later: Store their ID from the DB in session, 
	     session.setAttribute("userSessionId", user.getId());
	     // in other words, log them in.
	 
	     return "redirect:/books";
	 }
	 //clear session when logging out
	 @PostMapping("/logout")
	 public String logout(HttpSession session) {
		 session.invalidate();
		 return "redirect:/";
	 }
	 
}
