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
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>Insert title here</title>
</head>
<body>
	<nav id="topMenu"> 
    	<ul> 
        	<li>
            	<a class="menu" title="홈" href="home.jsp">홈</a>
            </li>
            <li>
                <a class="menu" title="사진" href="images.jsp">사진</a>
            </li> 
            <li>
                <a class="menu" title="온도" href="therm.jsp">온도</a>
            </li> 
            <li>
                <a class="menu" title="조명" href="lights.jsp">조명</a>
            </li> 
            <li>
                <a class="menu" title="조명" href="lights.jsp">히터</a>
            </li> 
        </ul> 
     </nav>
     <div>
		    <table id="imgTable">
				<thead>사진</thead>
					<tr id="imgControl">
						<td>
							<form action="Socket.jsp" method="POST">
								<input type="radio" name="control" value="img">
								<input type="hidden" name="device" value="light">
			  					<input type="submit" value="사진 촬영">
							</form>

			  			</td>
					</tr>
					<tr id="imgControl">
						<td>
							<form action="CamSocket.jsp" method="POST">
								<input type="text" name="camInter">(분) 간격 사진 촬영 설정
			  					<input type="submit" value="간격 설정">
			  			</form>
						</td>
					</tr>
				</table>
	</div>
</body>
</html>