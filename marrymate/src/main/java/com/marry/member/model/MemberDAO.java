package com.marry.member.model;

import com.marry.point.model.PointDTO;

public interface MemberDAO {
	
	public int memberJoin(MemberDTO dto);
	
	public MemberDTO memberLogin(String id, String pwd);
	
	public int nickCheck(String nick);
	
	public int idCheck(String id);
	
	public int gnameCheck(String gname);
	
	public int getMidx(String id);
	
	public int getPoint(String id);
	
	public int gnameInsertPoint(int midx);
	
	public int memberInsertPoint(int midx, int point);
	
	public int updatePoint(String gname);
	
}
