package com.hasan.bookClub.repositories;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hasan.bookClub.models.Book;
@Repository
public interface BookRepository {
	List<Book>findAll();
}
