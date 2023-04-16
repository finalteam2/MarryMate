package com.admin.book.model;

import java.util.List;

public interface PaymentDAO {
	
	public List<Integer> amount_s();
	
	public List<Integer> amount_b();
	
	public List<PaymentDTO> amount_all();
	
	public List<RefundDTO> amount_all_b();

}
