package com.codingdojo.BookClub.controllers;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.BookClub.models.Book;
import com.codingdojo.BookClub.services.BookService;
import com.codingdojo.BookClub.services.UserService;

@Controller
public class BookController {
	 // Service to be referenced
	  @Autowired
	  private UserService userServ;
	  @Autowired
	  private BookService bookServ;
	  
	 //to show the Books page if the user has logged in only
	 @GetMapping("/books")
	 public String welcome(HttpSession session, Model model) {
		 //verifying session is entered or push back to login registration page
		 if (session.getAttribute("userSessionId") == null) {
				return "redirect:/";
				}
		 Long userId = (Long) (session.getAttribute("userSessionId"));
		 model.addAttribute("user", userServ.findUser(userId));
		 model.addAttribute("books", bookServ.allBooks());
		
	     return "welcome.jsp";
	 }
	 //show the form to create a book
	 @GetMapping("/books/new")
	 public String addBook(@ModelAttribute ("book") Book book, Model model, HttpSession session) {
		//verifying session is entered or push back to login registration page
		 if (session.getAttribute("userSessionId") == null) {
				return "redirect:/";
				}
		 return "newBook.jsp";
	 }
	 //add book 
	 @PostMapping("/books/new")
	 public String createBook(@Valid @ModelAttribute("book")Book book, BindingResult result, Model model){
		 if(result.hasErrors()) {
				return "newBook.jsp";
			} else {
				bookServ.createUpdateBook(book);
				return "redirect:/books";
			}
	}
	 //Show one book
	 @GetMapping("/books/{id}")
	 public String oneBook(HttpSession session, Model model, @PathVariable("id") Long id) {
		 //verifying session is entered or push back to login registration page
		 if (session.getAttribute("userSessionId") == null) {
				return "redirect:/";
				}
		 Long userId = (Long) (session.getAttribute("userSessionId"));
		 model.addAttribute("user", userServ.findUser(userId));
		 model.addAttribute("book", bookServ.findBook(id));
		 System.out.println(session.getAttribute("userSessionId"));
	     return "oneBook.jsp";
	 }
	 //view edit page to edit book
	 @GetMapping("/books/update/{id}")
	 public String edit(HttpSession session, @PathVariable("id") Long id, Model model) {
		 //verifying session is entered or push back to login registration page
		 if (session.getAttribute("userSessionId") == null) {
				return "redirect:/";
				}
		Book book = bookServ.findBook(id);
        model.addAttribute("book", book);
        return "editBook.jsp";
	    }
	 //Post request to update a book
	 @PostMapping("/books/update/{id}")
	 public String updateBook(@Valid @ModelAttribute("book")Book book, BindingResult result, Model model){
		 if(result.hasErrors()) {
				return "newBook.jsp";
			} else {
				bookServ.createUpdateBook(book);
				return "redirect:/books";
			}
	 }
	 //deletion of a book
	 @RequestMapping(value="/books/delete/{id}", method=RequestMethod.DELETE)
	    public String destroy(@PathVariable("id") Long id) {
				bookServ.deleteBook(id);
	            return "redirect:/books";
	        }
}
