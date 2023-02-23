package com.hasan.bookClub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.hasan.bookClub.models.Book;
import com.hasan.bookClub.models.User;
import com.hasan.bookClub.services.BookService;
import com.hasan.bookClub.services.UserService;

@Controller
public class BookController {
	@Autowired
    private UserService userServ;
	@Autowired
	private BookService bookServ;

    @GetMapping("/home")
    public String dashboard(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	User user = userServ.findById((Long) session.getAttribute("userId"));
    	List<Book> books = bookServ.getAllBooks();
    	model.addAttribute("user", user);
    	model.addAttribute("books", books);
    	return "showAll.jsp";
    }
    @GetMapping("/books/new")
    public String addBook( @ModelAttribute("book") Book book,
    		Model model, 
    		HttpSession session) {
    	
    	User user = userServ.findById((Long) session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	return "add.jsp";
    }
    @PostMapping("/postBook")
    public String postBook(@Valid @ModelAttribute("book") Book book, 
    		BindingResult result, 
    		Model model) {
    	
    	if(result.hasErrors()) {
    		return "add.jsp";
    	}
    	bookServ.saveBook(book);
    	return "redirect:/home";
    }
    
    @GetMapping("/books/{id}")
    public String display(@PathVariable("id")Long id, Model model) {
    	Book book = bookServ.fetchOneBook(id);
    	model.addAttribute("book", book);
    	return "showOne.jsp";
    }
    
    @GetMapping("/books/{id}/edit")
    public String showEdit(@PathVariable("id")Long id, Model model) {
    	Book book = bookServ.fetchOneBook(id);
    	model.addAttribute("book", book);
    	return "edit.jsp";
    }
    
    @PutMapping("/edit/{id}")
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("book") Book book,BindingResult result,Model model) {
    	if(result.hasErrors()) {
    		model.addAttribute("book", book);
    		return "edit.jsp";
    	}
    	bookServ.saveBook(book);
    	return "redirect:/home";
    }
    
    @DeleteMapping("/books/{id}/delete")
    public String delete(@PathVariable("id")Long id){
          bookServ.deleteBook(id);
          return "redirect:/home";
      }
}
