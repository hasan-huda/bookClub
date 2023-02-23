package com.hasan.bookClub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hasan.bookClub.models.Book;
import com.hasan.bookClub.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	BookRepository bookRepository;
	
	public Book saveBook(Book b) {
		return bookRepository.save(b);
	}
	public List<Book> getAllBooks(){
		return bookRepository.findAll();
	}
	public Book fetchOneBook(Long id) {
		Optional <Book> optionalBook = bookRepository.findById(id);
		if(optionalBook.isEmpty()) return null;
		return optionalBook.get();
	}
	public void deleteBook(Long id) {
		this.bookRepository.deleteById(id);
	}
}
