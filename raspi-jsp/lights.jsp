<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
	<%@ page import="java.net.*" %>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta charset="UTF-8">
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
                <a class="menu" title="히터" href="heater.jsp">히터</a>
            </li> 
        </ul> 
     </nav>
     <div>

			<%
				String toggle = null;
				String device = null;
				String signal = null;
			    String lightOntime = null;
			    String lightOfftime = null;
				
				//signal = device.concat(",").concat(toggle);
	    	 %>
	    	 	<table id="lghtTable">
				<thead>조명</thead>
					<tr id="lghtControl">
						<td>
							<form action="Socket.jsp" method="POST">
								<input type="radio" name="control" value="on">조명 ON
								<input type="radio" name="control" value="off">조명 OFF
								<input type="hidden" name="device" value="light">
			  					<input type="submit" value="조명 on/off">
							</form>

			  			</td>
					</tr>
					<!--  <tr>
			  			<td>
			  				<form action="LightSocket.jsp" method="POST">
			  					<input type="time" name="lightOntime" value="09"> 조명 켜는 시간
			  					<input type="time" name="lightOfftime" value="18"> 조명 끄는 시간
			  					<input type="submit" value="시간 선택" id="">
			  				</form>

			  			</td>
			  		</tr>-->
				</table>
			<form action="lights.jsp" method="POST">
				<input type="hidden" name="control" value="<%=signal%>" >
				<input type="hidden" name="time" value="<%=lightOntime%>" >    
				<input type="hidden" name="time" value="<%=lightOfftime%>" >        
     		</form>
     </div>

     
		
</body>
</html>