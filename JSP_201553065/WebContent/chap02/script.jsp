<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
  <h2>Scripting Tag</h2>
  
 <%! int count = 3;
 String makeItLower(String data) {
	 return data.toLowerCase(); //대문자->소문자로 변경
 } %>
 
 <% for (int i = 1; i <= count; i++){
	 out.println("Java Server Pages " + i + ".<br>");
	 }%>
	 
 <%=makeItLower("Hello World") %>
 
<%--  <!--
<%!선언문 태그 : 선언문 태그를 사용하여 자바 변수와 메소드를 정의 한다 %>
<%스크립틀릿 태그로 자바로직 코드를 작성한다. %>
<%=표현문 태그 : 선언문의 메소드를 호출하여 문자열 형태로 출력 %>
--> --%>

<!-- 주석처리 -->
<%-- 주석처리 --%>
<!-- // /* 은 자바 주석코드지 html주석코드가아님 -->

 
</body>
</html>