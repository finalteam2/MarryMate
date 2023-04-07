package com.admin.admin_cs.model;

import java.util.List;

public interface Admin_csDAO {
	
	public List<M_a_csListDTO> m_a_cs_List();
	
	public List<C_a_csListDTO> c_a_cs_List();
	
	public void sendContent_m(int midx,String content);
	
	public List<M_a_csDTO> loadContent_m(int midx);
	
	public void read_m(int midx);
	
	public void sendContent_c(int cidx,String content);
	
	public List<C_a_csDTO> loadContent_c(int cidx);
	
	public void read_c(int cidx);

}
