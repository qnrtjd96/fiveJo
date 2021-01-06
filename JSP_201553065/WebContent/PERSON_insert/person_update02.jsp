<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script >
   function Update() {
      if(frmPersonUpdate.empno.value == ""){
          alert("사원코드가 입력되지 않았습니다");
          frmPersonUpdate.empno.focus();
          return false; } 
      if(frmPersonUpdate.empname.value == ""){
          alert("사원성명이 입력되지 않았습니다");
          frmPersonUpdate.empname.focus();
          return false; }
      if(frmPersonUpdate.deptcode.value == ""){
          alert("부서번호가 입력되지 않았습니다");
          frmPersonUpdate.deptcode.focus();
          return false; }
      if(frmPersonUpdate.hiredate.value == ""){
          alert("입사일이 입력되지 않았습니다");
          frmPersonUpdate.hiredate.focus();
          return false; }
      if(frmPersonUpdate.position.value == ""){
          alert("직급이 입력되지 않았습니다");
          frmPersonUpdate.position.focus();
          return false; }
      frmPersonUpdate.action = "person_update_action.jsp";
      frmPersonUpdate.submit();
      alert("사원정보가 수정 되었습니다!.");
   } 
      function Delete() {
          frmPersonUpdate.action = "person_delete_action.jsp";
          frmPersonUpdate.submit();
          alert("사원정보가 삭제 되었습니다!.");
   }
      function Insert() {
          frmPersonUpdate.action = "person_insert_action.jsp";
          frmPersonUpdate.submit();
          alert("사원정보가 등록 되었습니다!.");
   }
</script>   
<%
	String  szEmpno   	 = null;
  String  szEmpname  	 = null;
  String  szDeptcode  	 = null;
  String  szHiredate 	 = null;
  String  szPosition  	 = null;
  

	szEmpno    = request.getParameter("empno");
	szEmpname  = request.getParameter("empname");
	szDeptcode = request.getParameter("deptcode");
	szHiredate = request.getParameter("hiredate");
	szPosition = request.getParameter("position");
%>


<h3>사원수정</h3>
<form  name="frmPersonUpdate" method="post" >
<table border="1">
  <tr><th width = "100" >사원번호  </th>
      <td align="center"><INPUT TYPE="text" name="empno" SIZE="10" 
                                maxlength="10" value="<%=szEmpno%>"></td>
  </tr>
  <tr><th>사원이름  </th>
      <td align="center"><INPUT TYPE="Text" name="empname" SIZE="10"  maxlength="20" value="<%=szEmpname%>"> </td>
  </tr>  
  <tr><th>부서번호  </th>
      <td align="center"><INPUT TYPE="Text" name="deptcode" SIZE="10"  maxlength="10" value="<%=szDeptcode%>" ></td>
  </tr>      
  <tr><th>입사일 </th>
      <td align="center"><INPUT TYPE="text" name="hiredate" SIZE="10"  value="<%=szHiredate%>" > </td>
  </tr>      
  <tr><th>직급 </th>
      <td align="center"><INPUT TYPE="text" name="position" SIZE="10"  value="<%=szPosition%>" > </td> 
  </tr>       
  <tr><td COLSPAN="2" style="width:300px" align="center">
  	<INPUT TYPE="button" name="btnUpdate"  value=" 등 록  " ONCLICK = "Insert()">
  	<INPUT TYPE="button" name="btnUpdate"  value=" 수 정  " ONCLICK = "Update()">
  	<INPUT TYPE="button" name="btnUpdate"  value=" 삭 제  " ONCLICK = "Delete()">
  	<INPUT TYPE="button" name="btnExit"  value=" 돌아가기"  ONCLICK="document.location.href='person_list02.jsp'">
  </td></tr>
</table>
<p>직급 코드 (1 : 사원, 2 : 대리,  3 : 과장, 4 : 차장) 
</form>