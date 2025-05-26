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
<script>
	function check() {
		var V_JUMIN = document.frm.V_JUMIN.value;
		if(V_JUMIN == ''){
			alert('주민번호가 입력되지 않았습니다.');
			frm.V_JUMIN.focus();
			return false;
		}
		var V_NAME = document.frm.V_NAME.value;
		if(V_NAME == ''){
			alert('성명이 입력되지 않았습니다.');
			frm.V_NAME.focus();
			return false;
		}
		var M_NO = document.frm.M_NO.value;
		if(M_NO == ''){
			alert('후보번호가 선택되지 않았습니다.');
			frm.M_NO.focus();
			return false;
		}
		var V_TIME = document.frm.V_TIME.value;
		if(V_TIME == ''){
			alert('투표시간이 입력되지 않았습니다.');
			frm.V_TIME.focus();
			return false;
		}
		var V_AREA = document.frm.V_AREA.value;
		if(V_AREA == ''){
			alert('투표장소가 입력되지 않았습니다.');
			frm.V_AREA.focus();
			return false;
		}
		var V_CONFIRM = document.frm.V_CONFIRM.value;
		if(V_CONFIRM == ''){
			alert('유권자확인이 입력되지 않았습니다.');
			frm.V_CONFIRM.focus();
			return false;
		}
		alert('투표하기 정보가 정상적으로 등록 되었습니다!');
		return true;
	}
</script>
</head>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = Util.getConnection();
Statement stmt = conn.createStatement();
%>
<body>
<h2>투표하기</h2>
<form name="frm" action="action.jsp">
	<table border=1>
		<tr>
			<td>주민번호</td>
			<td width="450px" align="left"><input style="width:200px" name='V_JUMIN' id='V_JUMIN' value=''> 예 : 8906153154726</td>
		</tr>
		<tr>
			<td>성명</td>
			<td align="left"><input style="width:130px" name='V_NAME' id='V_NAME' value=''></td>
		</tr>
		<tr>
			<td>투표번호</td>
			<td align="left">
				<select name="M_NO" id="M_NO"  style="width:130px">
				<option value=''>선택</option>
				<%
				String sql = " SELECT M_NO " + 
							 " FROM TBL_MEMBER_202005 ";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
				%>
				<option value="<%= rs.getString("M_NO")%>"><%= rs.getString("M_NO")%></option>
				<% } %>
				</select>
			</td>
		</tr>
		<tr>
			<td>투표시간</td>
			<td align="left"><input style="width:130px" name='V_TIME' id='V_TIME' value=''></td>
		</tr>
		<tr>
			<td>투표장소</td>
			<td align="left"><input style="width:130px" name='V_AREA' id='V_AREA' value=''></td>
		</tr>
		<tr>
			<td>유권자확인</td>
			<td align="left">
				<input type="radio" name='V_CONFIRM' id='V_CONFIRM' value='Y'>확인
				<input type="radio" name='V_CONFIRM' id='V_CONFIRM' value='N'>미확인</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="투표하기">
				<input type="button" value="다시하기" onclick="window.location.reload()">
			</td>
		</tr>
	</table>
</form>
<script>
	document.forms["frm"].onsubmit = check;
</script>
</body>
</html>