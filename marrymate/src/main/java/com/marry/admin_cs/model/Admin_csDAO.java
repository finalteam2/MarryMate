package com.marry.admin_cs.model;

import java.util.List;

public interface Admin_csDAO {
	
	public List<Admin_csDTO> questions();
	
	public Admin_csDTO answer(int acsidx);
	
	public void sendContent_m(int midx,String content);
	
	public List<M_a_csDTO> loadContent_m(int midx);
	
	public void sendContent_c(int cidx,String content);
	
	public List<C_a_csDTO> loadContent_c(int cidx);

}
