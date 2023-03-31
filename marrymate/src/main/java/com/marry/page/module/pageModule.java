package com.marry.page.module;

public class pageModule {
	public static String makePage(
		String pagename, 
		int totalCnt, 
		int listSize, 
		int pageSize, 
		int cp) {
	
		StringBuffer sb = new StringBuffer();

		int totalPage = totalCnt / listSize + 1;
		if (totalCnt % listSize == 0){totalPage--;}
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0){userGroup--;}
		
		if(userGroup!= 0){
			sb.append("<li class='page-item'><a class='page-link' aria-label='Previous' onclick='");
			sb.append(pagename);
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append("("+temp+")");
			sb.append("'><span aria-hidden='true'>&laquo;</span></a></li>");
		}
		
		for (int i = userGroup*pageSize + 1; i <= userGroup*pageSize + pageSize ; i++){
			sb.append("<li class='page-item'><a class='page-link' onclick='");
			sb.append(pagename);
			sb.append("("+i+")");
			sb.append("'>");
			sb.append(i);
			sb.append("</a></li>");
			if(i == totalPage){
				break;
			}
		}
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("<li class='page-item'><a class='page-link' aria-label='Next' onclick='");
			sb.append(pagename);
			int temp = (userGroup+1)*pageSize+1;
			sb.append("("+temp+")");
			sb.append("'><span aria-hidden='true'>&raquo;</span></a></li>");
		}
		return sb.toString();
	}
}
