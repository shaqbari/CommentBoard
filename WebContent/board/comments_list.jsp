<%@page import="comments.model.Comments"%>
<%@page import="java.util.List"%>
<%@page import="comments.model.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	CommentsDAO commentsDAO=new CommentsDAO();
%>
<%
	//클라이언트가 전송한 news_id에 해당하는 하위 댓글 목록을 조회한 후, 응답하자.
	String news_id=request.getParameter("news_id");
	List<Comments> list=commentsDAO.select(Integer.parseInt(news_id));
	
	StringBuffer sb=new StringBuffer();
	sb.append("{");
	sb.append("\"list\" : [");
	for(int i=0; i<list.size(); i++){
		Comments comments=list.get(i);
		sb.append("{");
		sb.append("\"comments_id\":"+comments.getComments_id()+",");
		sb.append("\"writer\":\""+comments.getWriter()+"\",");
		sb.append("\"regdate\":\""+comments.getRegdate()+"\",");
		sb.append("\"msg\":\""+comments.getMsg()+"\",");
		sb.append("\"news_id\":"+comments.getNews_id());
		
		if (i<list.size()-1){
			sb.append("},");
		}else{
			sb.append("}");
		}
	}
	sb.append("]");
	sb.append("}");
	
	out.print(sb.toString());

%>

