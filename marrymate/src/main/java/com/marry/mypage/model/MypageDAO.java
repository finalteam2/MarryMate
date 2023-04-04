package com.marry.mypage.model;

import com.marry.member.model.MemberDTO;
import com.marry.company.model.*;


public interface MypageDAO {

	
	public int myInfoUpdate(MemberDTO dto);
	public MemberDTO myInfoSelect(MemberDTO dto);
	public CompanyDTO comInfoSelect(CompanyDTO dto);
	public HallDTO hallInfoSelect(HallDTO dto);
	public FoodDTO foodInfoSelect(FoodDTO dto);
}
