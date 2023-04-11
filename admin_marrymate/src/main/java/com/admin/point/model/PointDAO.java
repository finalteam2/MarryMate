package com.admin.point.model;

import java.util.List;

public interface PointDAO {
	
	public List<PointListDTO> pointMinusList(int cp, int listSize);
	
	public List<PointListDTO> pointPlusList(int cp, int listSize);
	
	public int getTotalCnt_m();
	
	public int getTotalCnt_p();
	
	public List<PointListDTO> listSelect_midx(int cp, int listSize, String mp, int midx);
	
	public List<PointListDTO> listSelect_name(int cp, int listSize, String mp, String selectText);
	
	public List<PointListDTO> listSelect_cname(int cp, int listSize, String selectText);
	
	public int getTotalCnt_midx(int midx, String mp);
	
	public int getTotalCnt_name(String selectText, String mp);
	
	public int getTotalCnt_cname(String selectText);
	
	public void pointPlus(int midx, int p_cal);

}
