<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script >
   function Update() {
      if(frmPersonUpdate.custno.value == ""){
          alert("회원번호가 입력되지 않았습니다");
          frmPersonUpdate.custno.focus();
          return false; } 
      if(frmPersonUpdate.cusname.value == ""){
          alert("회원성명 입력되지 않았습니다");
          frmPersonUpdate.cusname.focus();
          return false; }
      if(frmPersonUpdate.phone.value == ""){
          alert("회원전화 입력되지 않았습니다");
          frmPersonUpdate.phone.focus();
          return false; }
      if(frmPersonUpdate.address.value == ""){
          alert("회원주소 입력되지 않았습니다");
          frmPersonUpdate.address.focus();
          return false; }
      if(frmPersonUpdate.joindate.value == ""){
          alert("가입일자 입력되지 않았습니다");
          frmPersonUpdate.joindate.focus();
          return false; }
      if(frmPersonUpdate.grade.value == ""){
          alert("고객등급 입력되지 않았습니다");
          frmPersonUpdate.grade.focus();
          return false; }
      if(frmPersonUpdate.city.value == ""){
          alert("도시코드 입력되지 않았습니다");
          frmPersonUpdate.city.focus();
          return false; }
      frmPersonUpdate.action = "member_update_action.jsp";
      frmPersonUpdate.submit();
      alert("회원정보수정이 완료 되었습니다!.");
   }
      function Delete() {
          frmPersonUpdate.action = "member_delete_action.jsp";
          frmPersonUpdate.submit();
          alert("사원정보가 삭제 되었습니다!.");
   
   } 

</script>   
<%
  String  szcustno   	 = null;
  String  szcustname  	 = null;
  String  szphone  	 	 = null;
  String  szjoindate 	 = null;
  String  szaddress  	 = null;
  String  szgrade  		 = null;
  String  szcity  		 = null;
  

  szcustno    = request.getParameter("k_custno");
  szcustname  = request.getParameter("k_custname");
  szphone 	  = request.getParameter("k_phone");
  szjoindate  = request.getParameter("k_joindate");
  szaddress   = request.getParameter("k_address");
  szgrade     = request.getParameter("k_grade");
  szcity      = request.getParameter("k_city");
%>


<center><h2>사원수정</h2></center>
<form  name="frmPersonUpdate" method="post" >
<table border="1">
  <tr><th width = "100" >회원번호  </th>
      <td align="center"><INPUT TYPE="text" name="custno" SIZE="10" maxlength="10" value="<%=szcustno%>"></td>
  </tr>
  <tr><th>회원성명  </th>
      <td align="center"><INPUT TYPE="Text" name="custname" SIZE="10"  maxlength="20" value="<%=szcustname%>"> </td>
  </tr>  
  <tr><th>회원전화  </th>`
      <td align="center"><INPUT TYPE="Text" name="phone" SIZE="10"  maxlength="10" value="<%=szphone%>" ></td>
  </tr>      
  <tr><th>회원주소 </th>
      <td align="center"><INPUT TYPE="text" name="joindate" SIZE="10"  value="<%=szjoindate%>" > </td>
  </tr>      
  <tr><th>가입일자</th>
      <td align="center"><INPUT TYPE="text" name="address" SIZE="10"  value="<%=szaddress%>" > </td> 
  </tr>    
  <tr><th>고객등급(A:VIP, B:일반, C:직원) </th>
      <td align="center"><INPUT TYPE="text" name="grade" SIZE="10"  value="<%=szgrade%>" > </td> 
  </tr>   
  <tr><th>도시코드 </th>
      <td align="center"><INPUT TYPE="text" name="city" SIZE="10"  value="<%=szcity%>" > </td> 
  </tr>   
  <tr><td COLSPAN="2" style="width:300px" align="center">
  	<INPUT TYPE="button" name="btnUpdate"  value=" 수 정  " ONCLICK = "Update()">
  	<input TYPE="button" name="btnExit" value="삭 제" onclick="Delete()">
  	<INPUT TYPE="button" name="btnExit"  value="조 회"  ONCLICK="document.location.href='index.jsp?section=member_List.jsp'">
  </td></tr>
</table> 
</form>