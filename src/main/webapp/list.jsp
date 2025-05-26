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
String sql = " SELECT M.M_NO AS 후보번호, 													  " +
			 "		  M.M_NAME AS 성명,  													  " +
			 " P.P_NAME AS 소속정당, 														  " +
			 " (CASE P_SCHOOL 															  " +
			 "	WHEN '1' THEN '고졸' 														  " +
			 "	WHEN '2' THEN '학사' 														  " +
			 "	WHEN '3' THEN '석사' 														  " +
			 "	WHEN '4' THEN '박사'														  " +
			 " END) AS 학력, 																  " +
			 " SUBSTR(M_JUMIN, 1, 6) || '-' || SUBSTR(M_JUMIN, 7) AS 주민번호, 			  " +
 			 " M.M_CITY AS 지역구, 														  " +
			 " TRIM(P.P_TEL1) || '-' || TRIM(P.P_TEL2) || '-' || TRIM(P.P_TEL3) AS 대표전화  " +
			 " FROM  TBL_MEMBER_202005 M 												  " +
			 " JOIN  TBL_PARTY_202005 P ON P.P_CODE = M.P_CODE 							  " ;
ResultSet rs = stmt.executeQuery(sql);
%>
<body>
<table border=1>
	<tr>
		<td>후보번호</td><td>성명</td><td>소속정당</td><td>학력</td><td>주민번호</td><td>지역구</td><td>대표전화</td>
	</tr>
	<% while(rs.next()) { %>
	<tr>
		<td><%= rs.getString("후보번호") %></td>
		<td><%= rs.getString("성명") %></td>
		<td><%= rs.getString("소속정당") %></td>
		<td><%= rs.getString("학력") %></td>
		<td><%= rs.getString("주민번호") %></td>
		<td><%= rs.getString("지역구") %></td>
		<td><%= rs.getString("대표전화") %></td>
	<% } %>
</table>
</body>
</html>