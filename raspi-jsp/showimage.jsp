<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>

	<%@ page import="java.io.*"%>
	<%@page import="java.awt.image.BufferedImage"%>
	<%@page import="javax.imageio.ImageIO"%>
	<%@page import="java.util.Enumeration"%>

    
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
	
			con = DriverManager.getConnection("jdbc:mysql://18.216.172.165:3306/raspi_db?serverTimezone=Asia/Seoul","pi","pikey999");
	
			stmt = con.createStatement();
	
			rs = stmt.executeQuery("select image from images order by title desc limit 1");
	 
	
			out.clear();
	
			out=pageContext.pushBody();
	
	 
	
			if (rs.next()) {
	
				image = rs.getBlob(1);
	
				imgData = image.getBytes(1,(int)image.length());
	
			} else {
	
				out.println("Display Blob Example");
	
				out.println("image not found for given id>");
	
			return;
	
			}

// 		   try{

// 			      while(rs.next()){

// 			       InputStream in = rs.getBinaryStream("image");
// 			       // BufferedImage를 생성하면 ImageIO를 통해 브라우저에 출력하기가 쉽다.
// 			       BufferedImage bimg = ImageIO.read(in);
// 			       in.close();
			 
			       
// 			       ByteArrayOutputStream baos = new ByteArrayOutputStream();
// 			    ImageIO.write( bimg, "jpg", baos );
// 			    baos.flush();
// 			    byte[] imageInByteArray = baos.toByteArray();
// 			    baos.close();
// 			    String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
			    
// 			          out.println("<tr>");
// 			          out.println("<td>"+rs.getString("image")+"</td>");
// 			          out.print("<td>");
// 			          out.print("<img src='data:x-image/jpg;base64,"+ b64+"' alt='Visruth.jpg not found' />");
// 			          out.print("</td>");
// 			          out.println("</tr>");
// 			      }

// 			//실제 사용시는 당연히 finally로 io가 발생된 부분은 닫아 줘야됨
// 			     }catch(Exception e){
// 			            e.printStackTrace();
// 			     }

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

<img src="<%=imgData %>"/>

</body>
</html>