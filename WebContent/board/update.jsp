<%@page import="comments.model.News"%>
<%@page import="comments.model.NewsDAOMybatis"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%!
	NewsDAOMybatis newsDAO=new NewsDAOMybatis();
%>
<%

	request.setCharacterEncoding("utf-8");
	//	out.print("잘오나?");
	
	String title=request.getParameter("title");
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	String news_id=request.getParameter("news_id");
	
	News dto=new News();
	dto.setTitle(title);
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setNews_id(Integer.parseInt(news_id));
	
	int result=newsDAO.update(dto);
	if(result!=0){
		out.print(showMsgURL("수정성공", "list.jsp"));
		
	}else{
		out.print(showMsgBack("수정실패"));
		
	}
	

%>