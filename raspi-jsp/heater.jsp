<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.io.*" %>
	<%@ page import="java.net.*" %>

<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
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
                <a class="menu" title="히터" href="heater.jsp">조명</a>
            </li> 
        </ul> 
     </nav>
     <%
	     Socket socket = null;            //Server와 통신하기 위한 Socket
	     BufferedReader in = null;        //Server로부터 데이터를 읽어들이기 위한 입력스트림
	     BufferedReader in2 = null;        //키보드로부터 읽어들이기 위한 입력스트림
	     PrintWriter serverout = null;            //서버로 내보내기 위한 출력 스트림
	     InetAddress ia = null;
	     String toggle = "0";
	     String device = "2";
	     String signal = device + ","+ toggle;
	     try {
	         ia = InetAddress.getByName("125.177.204.50:11057");    //서버로 접속
	         socket = new Socket(ia, 7777);
	         in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
	         in2 = new BufferedReader(new InputStreamReader(System.in));
	         serverout = new PrintWriter(new BufferedWriter(new OutputStreamWriter(socket.getOutputStream())));
	         
	         System.out.println(socket.toString());
	     }catch(IOException e) {}
	     
	     try {
	    	 %>
	    	 	<table>
				<thead>히터</thead>
					<tr>
						<td>현재 상태<br>
			  			<input type="submit" value="on" id="heatBtn" onClick="<%toggle="0";%>">
			  			<input type="submit" value="off" id="heatBtn" onClick="<%toggle="1";%>">
			  			</td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
	     
	     <%  signal = device + ","+ toggle;
	     	 serverout.write(signal);
	         serverout.flush();
	         socket.close();
	         
	     }catch(IOException e) {}
	     
     %>

</body>
</html>