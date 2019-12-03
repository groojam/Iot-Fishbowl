<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>

	<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 	Blob image = null;

	Connection con = null;

	byte[ ] imgData = null ;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

 	String id = request.getParameter("parameter");

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");

		con = DriverManager.getConnection("jdbc:mysql://18.216.172.165:3306/raspi_db?serverTimezone=Asia/Seoul","pi","pikey999");

		pstmt = con.prepareStatement("select * from events order by time limit 5");

		rs = pstmt.executeQuery();
		while(rs.next()){
%>

	<table>
		<tr>
			<td>장치 작동 기록</td>
		</tr>
		<tr>
			<td><%= rs.getString("time")+ " / "%>
     			<%= rs.getString("name") + " "%>
     			<%= rs.getString("isrun") %>
     		</td>
		</tr>
	</table>

    <%
            }
        }catch(SQLException se){
            se.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
        }
    %>
</body>
</html>