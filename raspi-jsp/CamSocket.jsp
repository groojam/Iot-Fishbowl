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
     <%
	     Socket socket = null;            //Server와 통신하기 위한 Socket
	     BufferedReader in = null;        //Server로부터 데이터를 읽어들이기 위한 입력스트림
	     BufferedReader in2 = null;        //키보드로부터 읽어들이기 위한 입력스트림
	     PrintWriter serverout = null;            //서버로 내보내기 위한 출력 스트림
	     InetAddress ia = null;
	     String signal = "5";
	     String camInter = request.getParameter("camInter");
	     String data = signal + "/" + camInter;
	
	     //if(Integer.parseInt(nowTempC) <= 23){
	    //	 signal = "2,1";
	     //} 
	  	 
	     try {
	         //ia = InetAddress.getByName("");    //서버로 접속
	         socket = new Socket("125.177.204.50", 7777);
	         in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
	         in2 = new BufferedReader(new InputStreamReader(System.in));
	         serverout = new PrintWriter(new BufferedWriter(new OutputStreamWriter(socket.getOutputStream())));
	         
	         System.out.println(socket.toString());
	     }catch(IOException e) {}
	     
	     try {

	     	 serverout.write(data);
	         serverout.flush();
	         socket.close();
	         
	     }catch(IOException e) {
	    	 System.out.println("serverout error!");
	     }
	     response.sendRedirect("images.jsp");
     %>
     
</body>
</html>