<%@page import="comments.model.NewsDAOMybatis"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%!
	NewsDAOMybatis newsDAO=new NewsDAOMybatis();
%>
<jsp:useBean id="dto" class="comments.model.News"></jsp:useBean><!--new하는것에 해당  -->
<%-- <jsp:setProperty property="writer" name="writer"/> --%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:setProperty property="*" name="dto"/><!--dto의 멤버변수 이름과 parameter name이 같아야 한다.  -->
<%
	/*  
		javaEE에서는 서버측에서 실행될 수 있는 태그가 지원된다.
		이러한 태그를 액션태그라 한다.
		
		왜쓰나? 코드량을 줄이기 위해서..
		즉 선택이다. 하지만 전송되는 파라미터의 종류가 많다면 유용하다.
	*/	
	
	out.print(dto.getWriter()+"<br>");
	out.print(dto.getTitle()+"<br>");
	out.print(dto.getContent()+"<br>");
	
	int result=newsDAO.insert(dto);
	if(result!=0){
		out.print(showMsgURL("등록완료", "list.jsp"));
		
	}else{
		out.print(showMsgBack("등록실패"));
		
	}
%>