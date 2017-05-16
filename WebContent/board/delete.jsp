<%@page import="comments.model.NewsDAOMybatis"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%!
	NewsDAOMybatis newsDAO=new NewsDAOMybatis();
%>
<%
	String news_id=request.getParameter("news_id");	
	int result=newsDAO.delete(Integer.parseInt(news_id));
	
	if(result!=0){
		out.print(showMsgURL("삭제 성공했습니다", "list.jsp"));
		
	}else{
		out.print(showMsgBack("삭제 실패했습니다."));
		
	}
%>