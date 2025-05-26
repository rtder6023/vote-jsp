<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = Util.getConnection();
Statement stmt = conn.createStatement();
String sql = " SELECT M.M_NO AS 후보번호, 					   " +
			 " M.M_NAME AS 성명,  						   " +
			 " COUNT(V.M_NO) AS 총투표건수 					   " +
			 " FROM   TBL_MEMBER_202005 M 				   " +
			 " JOIN   TBL_VOTE_202005 V ON V.M_NO = M.M_NO " +
			 " GROUP BY M.M_NO, M.M_NAME 				   " +
			 " ORDER BY 총투표건수 DESC 					   " ;
ResultSet rs = stmt.executeQuery(sql);
%>
<body>
<h3>후보자등수</h3>
<table border=1>
	<tr>
		<td>후보번호</td><td>성명</td><td>총투표건수</td>
	</tr>
	<% while(rs.next()) { %>
	<tr>
		<td><%= rs.getString("후보번호") %></td>
		<td><%= rs.getString("성명") %></td>
		<td><%= rs.getString("총투표건수") %></td>
	<% } %>
</table>
</body>
</html>