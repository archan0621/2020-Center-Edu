<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<section>
	<h2>매출전표등록</h2>
	<form action="action/insert_sale.jsp"name="action_form">
	<table border=1>
		<tr>
			<td>매출전표번호</td>
			<td><input type="text" name="sale_no"></td>
		</tr>
		<tr>
			<td>지점코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input type="text" name="date"></td>
		</tr>
		<tr>
			<td>피자코드</td>
			<td>
				<select name="pcode">
					<option value="0">피자 선택</option>
				<%
					try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn = DriverManager.getConnection
						("jdbc:oracle:thin:@//localhost/xe", "system", "oracle");
			
					String query = "SELECT PIZZA.PCODE, PIZZA.PNAME FROM tbl_pizza_01 PIZZA ";
				
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					 while(rs.next()){
						%><option value="<%= rs.getString(1) %>"><% out.println("["+rs.getString(1)+"]" + rs.getString(2)); %></option><% 
					 }
					stmt.close();
					conn.close();
			
					}catch (Exception e) {
						e.printStackTrace();
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr colspan=2>
			<td>
				<input type="button" onclick="submit_form()" value="전표등록"></input>
				<input type="button" onclick="reset_form()" value="다시쓰기"></input>
			</td>
		</tr>
	</table>
	</form>
</section>

<script>
	function submit_form(){
		if(document.action_form.sale_no.value == ""){
			alert("매출전표번호가 입력되지 않았습니다.");
			return;
		}
		if(document.action_form.scode.value == ""){
			alert("지점코드가 입력되지 않았습니다.");
			return;
		}
		if(document.action_form.date.value == ""){
			alert("판매일자가 입력되지 않았습니다.");
			return;
		}
		if(document.action_form.pcode.selectedIndex === 0){
			alert("피자코드가 입력되지 않았습니다.");
			return;
		}
		if(document.action_form.amount.value == ""){
			alert("판매수량이 입력되지 않았습니다.");
			return;
		}
		alert("매출전표를 등록합니다!");
		document.action_form.submit();
	}
	function reset_form(){
		alert("정보를 지우고 처음부터 다시 입력 합니다!");
		document.action_form.reset();
	}
</script>