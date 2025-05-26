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
String sql = " SELECT V_NAME AS 성명,  																				 " +
			 " '19' || SUBSTR(V_JUMIN,1,2)|| 																		 " +
			 " '년' || SUBSTR(V_JUMIN,3,2)|| 																		 " +
			 " '월' || SUBSTR(V_JUMIN,5,2)|| 																		 " +
			 " '일생' AS 생년월일, 																						 " +
			 " '만 ' || (TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER('19' || SUBSTR(V_JUMIN,1,2))) || '세' AS 나이, " +
			 " (CASE SUBSTR(V_JUMIN, 7, 1) 																			 " +
			 "		WHEN '1' THEN '남' 																				 " +
			 "		WHEN '2' THEN '여' 																				 " +
			 "		END) AS 성별, 																					 " +
			 "	M_NO AS 후보번호, 																						 " +
			 "	SUBSTR(V_TIME,1,2) || ':' || SUBSTR(V_TIME,3) AS 투표시간, 											 " +
			 "	(CASE V_CONFIRM 																					 " +
			 "		WHEN 'N' THEN '미확인' 																			 " +
			 "		WHEN 'Y' THEN '확인' 																				 " +
			 "		END) AS 유권자확인 																					 " +
			 "	FROM TBL_VOTE_202005																				 ";
ResultSet rs = stmt.executeQuery(sql);
%>
<body>
<h3>투표검수조회</h3>
<table border=1>
	<tr>
		<td>성명</td><td>생년월일</td><td>나이</td><td>성별</td><td>후보번호</td><td>투표시간</td><td>유권자확인</td>
	</tr>
	<% while(rs.next()) { %>
	<tr>
		<td><%= rs.getString("성명") %></td>
		<td><%= rs.getString("생년월일") %></td>
		<td><%= rs.getString("나이") %></td>
		<td><%= rs.getString("성별") %></td>
		<td><%= rs.getString("후보번호") %></td>
		<td><%= rs.getString("투표시간") %></td>
		<td><%= rs.getString("유권자확인") %></td>
	<% } %>
</table>
</body>
</html>