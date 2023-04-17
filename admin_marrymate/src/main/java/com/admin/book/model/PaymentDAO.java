package com.admin.book.model;

import java.util.List;

public interface PaymentDAO {
	
	public List<Integer> amount_s();
	
	public List<Integer> amount_b();
	
	public List<PaymentDTO> amount_all(int cp, int listSize);
	
	public List<RefundDTO> amount_all_b(int cp, int listSize);
	
	public int getTotalCnt_all();
	
	public int getTotalCnt_all_b();

}
