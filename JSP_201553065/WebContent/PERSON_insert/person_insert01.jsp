<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title></head><body>
<h3>사원등록</h3>
<form name="frmPersonInsert" method="post" action="person_insert_action.jsp">
<table border="1">
  <tr><th width ="100">사원번호</th>
      <td align="center"><INPUT TYPE="Text" name="empno" size="10" maxlength="10"></td>
  </tr>
  <tr><th>사원이름</th>
      <td align="center"><INPUT TYPE="Text" name="empname" size="10" maxlength="20"></td>
  </tr>
    <tr><th>부서번호</th>
      <td align="center"><INPUT TYPE="Text" name="deptcode" size="10" maxlength="10"></td>
  </tr>
    <tr><th>입사일</th>
      <td align="center"><INPUT TYPE="Text" name="hiredate" size="10"></td>
  </tr>
  <tr><th>직급</th>
      <td align="center"><INPUT TYPE="Text" name="position" size="10"></td>
  </tr>
  <tr><td COLSPAN="2" style="width:250px" align="center">
    <input TYPE="submit" name="btnInsert" value="등 록 ">
    <input TYPE="button" name="btnExit" value="돌아가기"
                      ONCLICK="document.location.href='person_list01.jsp'">
  </td></tr>
</table>
<p>직급 코드( 1: 사원, 2: 대리, 3 : 과자, 4: 차장)
</form>
</body>
</html>