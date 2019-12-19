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
	     String signal = request.getParameter("signal");
	     String nowTempC = request.getParameter("nowTempC");
	     String nowTempF = request.getParameter("nowTempF");	
	     int camInterval = 0;
	     int tempInterval = 0;
	     //String device = request.getParameter("device");
	     //device = "1";
	     switch(signal){
	     	case "lghtsignal1":
	     		signal = "1,1";
	     		
	     		break;
	     	case "lghtsignal2":
	     		signal = "1,0";
	     		break;
	     	case "heatsignal1":
	     		signal = "2,1";
	     		break;
	     	case "heatsignal2":
	     		signal = "2,0";
	     		break;
	     	case "othersignal1":
	     		signal = "3,1";
	     		break;
	     	case "ohtersignal2":
	     		signal = "3,0";
	     		break;
	     	default : 
	     		signal = "0,0";
	     		break;
	     }
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

	     	 serverout.write(signal);
	         serverout.flush();
	         socket.close();
	         
	     }catch(IOException e) {
	    	 System.out.println("serverout error!");
	     }
	     
     %>
</body>
</html>