<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
 function Update(){
	 if(frmPersonUpdate.empno.value == ""){
		 alert("사원번호가 입력되지 않았습니다.");
		 frmPersonUpdate.empno.focus();
		 return false;
	 	}
 	 if(frmPersonUpdate.empname.value == ""){
	 alert("사원번호가 입력되지 않았습니다.");
	 frmPersonUpdate.empname.focus();
	 return false;
 	}
	 if(frmPersonUpdate.deptcode.value == ""){
		 alert("사원번호가 입력되지 않았습니다.");
		 frmPersonUpdate.deptcode.focus();
		 return false;
	 	}
	 if(frmPersonUpdate.hiredate.value == ""){
		 alert("사원번호가 입력되지 않았습니다.");
		 frmPersonUpdate.hiredate.focus();
		 return false;
	 	}
	 if(frmPersonUpdate.position.value == ""){
		 alert("사원번호가 입력되지 않았습니다.");
		 frmPersonUpdate.position.focus();
		 return false;
	 	}
	 frmPersonUpdate.action= "person_update_action.jsp";
	 frmPersonUpdate.submit();
	 alert("사원정보가 수정되었습니다!");
 	}
 
   function Delecte(){
	   frmPersonUpdate.action = "person_delete_action.jsp";
	   frmPersonUpdate.submit();
	   alret("사원정보가 삭제되었습니다.");
   }
   
   function Insert(){
	   frmPersonUpdate.action = "person_insert_action.jsp";
	   frmPersonUpdate.submit();
	   alert("사원정보가 추가되었습니다.");
   }

</script>

<% 
  String szEmpno  = null;
  String szEmpname  = null;
  String szDeptcode  = null;
  String szHiredate  = null;
  String szPosition  = null;
  szEmpno = request.getParameter("k_empno");
  szEmpname = request.getParameter("k_empname");
  szDeptcode = request.getParameter("k_deptcode");
  szHiredate = request.getParameter("k_hiredate");
  szPosition = request.getParameter("k_position");
%>

<h3>사원수정</h3>
<form name="frmPersonInsert" method="post">
<table border="1">
  <tr><th width ="100">사원번호</th>
      <td align="center"><INPUT TYPE="Text" name="empno" size="10" maxlength="10" value="<%=szEmpno%>"></td>
  </tr>
  <tr><th>사원이름</th>
      <td align="center"><INPUT TYPE="Text" name="empname" size="10" maxlength="20" value="<%=szEmpname%>"></td>
  </tr>
    <tr><th>부서번호</th>
      <td align="center"><INPUT TYPE="Text" name="deptcode" size="10" maxlength="10" value="<%=szDeptcode%>"></td>
  </tr>
    <tr><th>입사일</th>
      <td align="center"><INPUT TYPE="Text" name="hiredate" size="10" value="<%=szHiredate%>"></td>
  </tr>
  <tr><th>직급</th>
      <td align="center"><INPUT TYPE="Text" name="position" size="10" value="<%=szPosition%>"></td>
  </tr>
  <tr><td COLSPAN="2" style="width:250px" align="center">
    <input TYPE="button" name="btnExit" value="등 록" onclick="Insert()">
    <input TYPE="button" name="btnExit" value="수 정" onclick="Update()" >                     
    <input TYPE="button" name="btnExit" value="삭 제" onclick="Delete()">
    <input TYPE="button" name="btnExit" value="돌아가기"
                      ONCLICK="document.location.href='person_list01.jsp'">
  </td></tr>
</table>
<p>직급 코드( 1: 사원, 2: 대리, 3 : 과자, 4: 차장)
</form>
</body>
</html>