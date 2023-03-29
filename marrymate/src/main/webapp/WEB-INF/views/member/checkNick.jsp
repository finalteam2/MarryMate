<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
  String nick = request.getParameter("nick");
  String message = "";
  Connection conn = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "1234");
    ps = conn.prepareStatement("select * from member where nick=?");
    ps.setString(1, nick);
    rs = ps.executeQuery();
    if (rs.next()) {
      message = "<span style='color: red;'>이미 사용 중인 닉네임입니다.</span>";
    } else {
      message = "<span style='color: blue;'>사용 가능한 닉네임입니다.</span>";
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (ps != null) try { ps.close(); } catch (SQLException e) {}
    if (conn != null) try { conn.close(); } catch (SQLException e) {}
  }
  out.print(message);
%>