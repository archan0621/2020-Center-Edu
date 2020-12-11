<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
		int sale_no = Integer.parseInt(request.getParameter("sale_no"));
		String scode = request.getParameter("scode");
		String date = request.getParameter("date");
		String pcode = request.getParameter("pcode");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection
					("jdbc:oracle:thin:@//localhost/xe", "system", "oracle");
			
			String query = "INSERT INTO tbl_salelist_02(SALENO, SCODE, SALEDATE, PCODE, AMOUNT) VALUES( %d, '%s', '%s', '%s', %d)";
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(String.format(query, sale_no, scode, date, pcode, amount ));
			conn.commit();
			stmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("../index.jsp?section=index");
%>