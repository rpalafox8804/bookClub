package com.codingdojo.BookClub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.BookClub.models.Book;
import com.codingdojo.BookClub.repositories.BookRepository;



@Service
public class BookService {
	@Autowired
	BookRepository bookRepo;
	
	//find all books
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	//create and update Books
    public Book createUpdateBook(Book newBook) {
        return bookRepo.save(newBook);
    }
    
    //find one book
    public Book findBook(Long id) {
        Optional<Book> optionalBook = bookRepo.findById(id);
        if(optionalBook.isPresent()) {
            return optionalBook.get();
        } else {
            return null;
        }
    }
       
    //delete book
    public void deleteBook(Long id) {
    	bookRepo.deleteById(id);
    }
}
