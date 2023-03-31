package com.admin.book.model;

import java.util.List;

public interface BookDAO {
	
	public List<BookDTO> bookList(String kind);

}
