<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
div.horizontal
{
    width:100%;
    height:30px;
    background-color:#8888dd;
}

div.horizontal ul
{
    list-style-type:none;
    margin:0;
    padding:0;
}

div.horizontal li
{
       float:left;
}

div.horizontal a
{
                display:block;
                width:140px;
}
</style>
<div class="horizontal">
<ul>
<li><a href="index.jsp?section=member_insert.jsp">회원등록</a></li>
<li><a href="index.jsp?section=member_List.jsp">회원목록조회</a></li>
<li><a href="index.jsp?section=money_list.jsp">회원매출조회</a></li>
<li><a href="index.jsp">홈으로</a></li>
</ul>
</div>