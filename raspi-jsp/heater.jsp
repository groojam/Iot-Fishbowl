<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.io.*" %>
	<%@ page import="java.net.*" %>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
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
				
				//signal = device.concat(",").concat(toggle);
	    	 %>
	    	 	<table id="heatTable">
				<thead>히터</thead>
					<tr id="heatControl">
						<td>
							<form action="Socket.jsp" method="POST">
								<input type="radio" name="control" value="on">히터 ON
								<input type="radio" name="control" value="off">히터 OFF
								<input type="hidden" name="device" value="heater" >
			  					<input type="submit" value="히터  on/off">
							</form>

			  			</td>
					</tr>
					<tr id="heatControl">
						<td>
							<form action="HeatSocket.jsp" method="POST">
								<input type="text" name="heatTemper">작동 온도 설정
			  					<input type="submit" value="온도 설정">
			  			</form>
						</td>
					</tr>
				</table>
     </div>


</body>
</html>