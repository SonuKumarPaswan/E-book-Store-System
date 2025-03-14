package com.sp.Ebook_App.dao;

import java.util.List;

import com.sp.Ebook_App.entity.BookDetails;

public interface BookDao {
	
	public boolean addBooks(BookDetails bdetails);

	public List<BookDetails> getAllBooks();

	public BookDetails editBook(int id);

	public boolean updateEditBook(BookDetails book);

	public boolean deleteBook(int id);

	public List<BookDetails> getNewBooks();

	public List<BookDetails> getRecentBooks();

	public List<BookDetails> getOldBooks();

	public List<BookDetails> getAllNewBooks();

	public List<BookDetails> getAllRecentBooks();

	public List<BookDetails> getAllOldBooks();
	
	public List<BookDetails> getOldAllBook(String category,String userEmail );
	
	public boolean deleteOldSellBook(int id,String userEmail );
	
	public List<BookDetails> getBookBySearch(String ch);

}
