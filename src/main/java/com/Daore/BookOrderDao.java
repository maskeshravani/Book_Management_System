package com.Daore;

import java.util.List;
import com.entity.Book_Order;

public interface BookOrderDao {
    boolean saveOrder(List<Book_Order> b);
    List<Book_Order> getBook(String email);
    public List<Book_Order> getAllorder();
}
