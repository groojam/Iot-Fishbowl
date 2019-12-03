<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>

<head>

<style>
	table{
		border-collapse: collapse;
		border: 1px;
		padding: 50px;
	}
		#td1{
			height: 300px;
			width: 400px;
		}
		#td2{
			height: 300px;
			width: 640px;
		}
        #topMenu {
                height:70px; /*메뉴 높이 설정*/
                width:100vw; /*메뉴 넓이 설정*/
        }
        #topMenu ul li {
            list-style: none; /*목록 리스트 기호 없앰*/
            color: black;  /*글씨 색 지정*/
            background-color: grey; /*배경 색 지정*/
            float: left; /*좌우 정렬 속성*/
            line-height: 70px; /*글씨가 가운데로 오도록 하기 위해 한 줄의 높이를 30px로 설정*/
            vertical-align: middle; /*세로 정렬을 가운데로 설정*/
            text-align: center;
        }
        #topMenu .menu {
            text-decoration: none;  /*a태그 기본 꾸밈효과 없앰*/
            color:black;
            display: block;  /*영역클릭시에도 링크 연결되게 설정*/
            width: 23.5vw;  /*메뉴 링크 넓이 설정*/
            font-size: 24px;
            font-weight: bold;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        #topMenu .menu:hover {  /*menu클래스를 가진 태그에 마우스를 올릴경우의 스타일 설정 */
            color:grey;
            background-color: lightgrey;
        }
</style>
<script type="text/javascript" src="./relayweb.js" ></script> 
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
     <div>
         <%@include file="rel_web.html"%>
     <!--<%
     	Socket socket = null;            //Server와 통신하기 위한 Socket
     	BufferedReader in = null;        //Server로부터 데이터를 읽어들이기 위한 입력스트림
     	BufferedReader in2 = null;        //키보드로부터 읽어들이기 위한 입력스트림
     	PrintWriter out = null;            //서버로 내보내기 위한 출력 스트림
     	InetAddress ia = null;
     	try {
	         ia = InetAddress.getByName("125.177.204.50:11055");    //서버로 접속
	         socket = new Socket(ia,서버가 열어놓은 포트 입력);
	         in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
	         in2 = new BufferedReader(new InputStreamReader(System.in));
	         out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(socket.getOutputStream())));
	         
	         System.out.println(socket.toString());
	     }catch(IOException e) {}
	     
	     try {
	         System.out.print("서버로 보낼 메세제 : ");
	         String data = in2.readLine();            //키보드로부터 입력
	         out.println(data);                        //서버로 데이터 전송
	         out.flush();
	
	         String str2 = in.readLine();            //서버로부터 되돌아오는 데이터 읽어들임
	         System.out.println("서버로부터 되돌아온 메세지 : " + str2);
	         socket.close();
	         
	     }catch(IOException e) {}
	     
     %>-->
     </div>

</body>
</html>