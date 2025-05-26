<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = Util.getConnection();
Statement stmt = conn.createStatement();

String V_JUMIN = request.getParameter("V_JUMIN");
String V_NAME = request.getParameter("V_NAME");
String M_NO = request.getParameter("M_NO");
String V_TIME = request.getParameter("V_TIME");
String V_AREA = request.getParameter("V_AREA");
String V_CONFIRM = request.getParameter("V_CONFIRM");

String sql = " INSERT INTO TBL_VOTE_202005 VALUES ( " +
			 " 										'" + V_JUMIN + "', " +
			 " 										'" + V_NAME + "', " +
			 " 										'" + M_NO + "', " +
			 " 										'" + V_TIME + "', " +
			 " 										'" + V_AREA + "', " +
			 " 										'" + V_CONFIRM + "') ";
ResultSet rs = stmt.executeQuery(sql);
response.sendRedirect("main.jsp");

%>