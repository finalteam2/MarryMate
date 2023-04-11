package com.marry.mypage.model;

import java.util.*;
import com.marry.member.model.MemberDTO;
import com.marry.company.model.*;
import com.marry.bbs.model.*;


public interface MypageDAO {

	
	public int myInfoUpdate(MemberDTO dto);
	public int companyInfoUpdate(CompanyDTO dto);
	public int hallInfoUpdate(HallDTO dto);
	public int foodInfoUpdate(FoodDTO dto);
	public MemberDTO myInfoSelect(MemberDTO dto);
	public CompanyDTO comInfoSelect(CompanyDTO dto);
	public List<HallDTO> hallInfoSelect(int cidx);
	public List<FoodDTO> foodInfoSelect(int cidx);
	public List<BbsDTO> subjectSelect(int midx);
	public List<ReplyDTO> replySelect(int midx);
	public int imgChange(MemberDTO dto);
	public List<Com_ImgDTO> comimgSelect(int cidx);
	public List<Book_TimeDTO> booktimeSelect(int cidx);
	public int deleteImg(int iidx);
	public int deleteBk(int bktime_idx);
}
