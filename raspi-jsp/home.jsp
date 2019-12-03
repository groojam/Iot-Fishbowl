<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	table{
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
			display: block;
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
                <a class="menu" title="히터" href="heater.jsp">조명</a>
            </li>  
        </ul> 
     </nav>
      
	<table>
		<tr>
			<td id="td1">
				<jsp:include page="/events.jsp" flush="false"></jsp:include>
			</td>
			<td id="td1" >
				<jsp:include page="/nowtemp.jsp" flush="false"></jsp:include>
			</td>
			<td id="td1" >
				<jsp:include page="/light.jsp" flush="false"></jsp:include>
			</td>
			<td id="td1" >
				<jsp:include page="/emptypage.jsp" flush="false"></jsp:include>
			</td>
		</tr>
		<tr>
			<td id="td2" colspan="2">
				<img align="middle" src="/showimage.jsp">
			</td>
			<td id="td1" >
				<jsp:include page="/heater.jsp" flush="false"></jsp:include>
			</td>
			<td id="td1" >
				<jsp:include page="/emptypage.jsp" flush="false"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>