package com.marry.mypage.model;

import java.util.*;
import com.marry.member.model.MemberDTO;
import com.marry.company.model.*;


public interface MypageDAO {

	
	public int myInfoUpdate(MemberDTO dto);
	public int companyInfoUpdate(CompanyDTO dto);
	public MemberDTO myInfoSelect(MemberDTO dto);
	public CompanyDTO comInfoSelect(CompanyDTO dto);
	public List<HallDTO> hallInfoSelect(int cidx);
	public List<FoodDTO> foodInfoSelect(int cidx);
}
