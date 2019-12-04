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

	Statement stmt = null;

	ResultSet rs = null;

 	String id = request.getParameter("parameter");

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");

		con = DriverManager.getConnection("jdbc:mysql://18.222.181.183:3306/raspi_db?serverTimezone=Asia/Seoul","pi","pikey999");

		stmt = con.createStatement();

		rs = stmt.executeQuery("select image from images where title order by 1 desc limit 1");
 

		//out.clear();

		//out=pageContext.pushBody();

 

		if (rs.next()) {

			image = rs.getBlob(1);

			imgData = image.getBytes(1,(int)image.length());

		} else {

			out.println("Display Blob Example");

			out.println("image not found for given id>");

		return;

		}

		response.setContentType("image/jpg");

		OutputStream o = response.getOutputStream();

		o.write(imgData);

		o.flush();

		o.close();

		} catch (Exception e) {

			out.println("Unable To Display image");

			out.println("Image Display Error=" + e.getMessage());

			return;

 		} finally {

 			try {

 				rs.close();

 				stmt.close();
 				con.close();

 			} catch (SQLException e) {

 				e.printStackTrace();

 			}

 		}

%>

<img src="<%=imgData %>" width="1024" />

</body>
</html>