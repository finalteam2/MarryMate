package com.admin.point.model;

import java.util.List;

public interface PointDAO {
	
	public List<PointListDTO> pointMinusList();
	
	public List<PointListDTO> pointPlusList();

}
