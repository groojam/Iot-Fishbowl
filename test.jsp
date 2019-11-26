<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어항관리</title>
</head>
<body>
<table border="1">
    <thead>
        <tr>
            <th>시간</th>
            <th>섭씨</th>
            <th>화씨</th>
        </tr>
    </thead>
    <tbody>
    <%
        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
         
        try{
            String jdbcDriver = "jdbc:mysql://127.0.0.1:3306/raspi_db?serverTimezone=Asia/Seoul";
            String dbUser = "pi";
            String dbPwd = "pikey999";
             
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
             
            pstmt = conn.prepareStatement("select * from tmp");
             
            rs = pstmt.executeQuery();
             
            while(rs.next()){
    %>
        <tr>
            <td><%= rs.getString("time") %></td>
            <td><%= rs.getString("temp_f") %></td>
            <td><%= rs.getString("temp_f") %></td>
        </tr>
    <%
            }
        }catch(SQLException se){
            se.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    %>
</tbody>
</table>
</body>
</html>
