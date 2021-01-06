<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title></head><body>
<center><h2>회원등록</h2></center>
<form name="frmPersonInsert" method="post" action="member_insert_action.jsp">
<table border="1">
  <tr><th width ="100">회원번호(자동발생)</th>
      <td align="center"><INPUT TYPE="Text" name="custno" size="10" maxlength="10"></td>
  </tr>
  <tr><th>고객성명</th>
      <td align="center"><INPUT TYPE="Text" name="custname" size="10" maxlength="20"></td>
  </tr>
    <tr><th>회원전화</th>
      <td align="center"><INPUT TYPE="Text" name="phone" size="10" maxlength="10"></td>
  </tr>
    <tr><th>회원주소</th>
      <td align="center"><INPUT TYPE="Text" name="address" size="10"></td>
  </tr>
  <tr><th>가입일자</th>
      <td align="center"><INPUT TYPE="date" name="joindate" size="8"></td>
  </tr>
  <tr><th>고객등급(A:VIP,B:일반,C:직원)</th>
      <td align="center"><INPUT TYPE="Text" name="grade" size="10"></td>
  </tr>
  <tr><th>도시코드</th>
      <td align="center"><INPUT TYPE="Text" name="city" size="10"></td>
  </tr>
  <tr><td COLSPAN="2" style="width:250px" align="center">
    <input TYPE="submit" name="btnInsert" value="등 록 ">
    <input TYPE="button" name="btnExit" value="조회"
                      ONCLICK="document.location.href='index.jsp?section=member_List.jsp'">
  </td></tr>
</table>
</form>
</body>
</html>