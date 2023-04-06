<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Calendar" %>
<%
String yy=request.getParameter("year");
String mm=request.getParameter("month");

Calendar cal=Calendar.getInstance();

int y=cal.get(Calendar.YEAR);
int m=cal.get(Calendar.MONTH);

if(yy != null && mm != null && !yy.equals("") && !mm.equals("")){
	y=Integer.parseInt(yy);
	m=Integer.parseInt(mm)-1;
}
cal.set(y,m,1);
int dayOfweek=cal.get(Calendar.DAY_OF_WEEK);
int lastday=cal.getActualMaximum(Calendar.DATE);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/marrymate/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<style>
table{
	border-collapse:collapse;
}
th, td{
	border: 1px solid #cccccc;
	width: 50px;
	height: 25px;
	text-align: center;
}
caption{
	font-size: 15px;
}
</style>
<body>
	<%@include file="../../header.jsp"%>

	<br>
	<div>
	<section>
		<article>
		<table>
		<caption><%=y %>년<%=m+1 %>월</caption>
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
			<tr>
			<%
			int count=0;
			for(int s=1;s<dayOfweek;s++){
				out.print("<td></td>");
				count++;
			}
			for(int d=1;d<lastday;d++){
				count++;
				String color="#555555";
				if(count==7){
					color="blue";
				}else if(count==1){
					color="red";
				}
			%>
				<td style="color: <%=color%>"><%=d %></td>
			<%
				if(count==7){
					out.print("</tr><tr>");
					count=0;
				}	
			}
			while(count<7){
				out.print("<td></td>");
				count++;
			}
			 %>
			</tr>
	</table>
	
		</article>
	</section>
	</div>

		<div class="selectdate">
			<form>
				<input type="text" name="year" size="8">년
				<input type="text" name="month" size="8">월
				<input type="submit" value="달력보기">
			</form>
	</div>
	
	<%@include file="../../footer.jsp"%>
</body>
</html>