<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
  <%	
    int product_id = Integer.parseInt(request.getParameter("product_id"));
  	int amount = Integer.parseInt(request.getParameter("amount"));	  
    String date = request.getParameter("purchase_date");
    
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
		Statement stmt = conn.createStatement();
		String query = "select price from product where product_id = " + product_id;
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		int price = rs.getInt(1);
		rs.close();
		
		String insert_query = "INSERT INTO SALE (SALE_ID, PRODUCT_ID, PURCHASE_DATE, SALE_PRICE, AMOUNT) VALUES(SEQ_SALE.NEXTVAL,%d,'%s',%d,%d)";
		System.out.println(String.format(insert_query, product_id, date,price * amount, amount));
		stmt.executeQuery(String.format(insert_query, product_id, date,price * amount, amount));
		
		conn.commit();
		
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}

	response.sendRedirect("../index.jsp?section=sale_lookup");
	%>