<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta charset="UTF-8">
<title>어항관리 시스템</title>
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
    <div id="contents">
		<table>
			<tr>
				<td id="td1">
					<!--<jsp:include page="/events.jsp" flush="false"></jsp:include>-->
					<%
						String device = null; 
					%>
				</td>
				<td id="td1" >
					<%
						String  temp = null;
					%>
					<jsp:include page="/nowtemp.jsp" flush="false"></jsp:include>
				</td>
				<td id="td1" >
					<!--<jsp:include page="/light.jsp" flush="false"></jsp:include>-->
				</td>
				<td id="td1" >
					<!--<jsp:include page="/emptypage.jsp" flush="false"></jsp:include>-->
				</td>
			</tr>
			<tr>
				<td id="td2" colspan="2">
					<img id="photoImage" align="center" src="/showimage.jsp">
				</td>
				<td id="td1" >
					<!--<jsp:include page="/heater.jsp" flush="false"></jsp:include>-->
				</td>
				<td id="td1" >
					<!--<jsp:include page="/emptypage.jsp" flush="false"></jsp:include>-->
				</td>
		</tr>
	</table>
	</div>
</body>
</html>