<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원추가</title>
</head>
<body>
<form action="person_insert_action.jsp" method="post" name="form1" onsubmit="return check();">
사원번호:<input type="text" name="empno">    <br>
이름:<input type="text" name="empname">        <br>
부서번호:<input type="text" name="deptcode">        <br>
입사일:<input type="text" name="hiredate">      <br>
포지션:<input type="text" name="position"> 
<input type="submit" value="확인">
<input type="button" value="취소" onclick="">
</form>
</body>
</html>