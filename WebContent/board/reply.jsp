<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="comments.model.Comments"%>
<%@page import="comments.model.CommentsDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%!
	CommentsDAO commentsDAO=new CommentsDAO();

%>
<%
	request.setCharacterEncoding("utf-8");

	//넘겨받은 파라미터값을 이용하여 댓글 등록
	String writer=request.getParameter("nickname");
	String msg=request.getParameter("msg");
	String news_id=request.getParameter("news_id");
	
	Comments comments=new Comments();
	comments.setWriter(writer);
	comments.setMsg(msg);
	comments.setNews_id(Integer.parseInt(news_id));
	
	int result=commentsDAO.insert(comments);	
	out.print(result);//1 or 0
	
	/* List<Comments> list=commentsDAO.select(Integer.parseInt(news_id));
	
	JSONArray jsonArray=new JSONArray();
	for(int i=0; i<list.size(); i++){
		Comments dto=list.get(i);
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("writer", dto.getWriter());
		jsonObject.put("msg", dto.getMsg());
		jsonObject.put("regdate", dto.getRegdate());
		jsonArray.add(i, jsonObject);	
	} */
	
	
	
	
	/* if(result!=0){
		//showMsgURL("댓글등록완료", "detail.jsp?news_id="+news_id);이렇게 하면 안된다.
		//out.print(showMsgURL("댓글등록완료", "detail.jsp?news_id="+news_id));
		
	}else{
		//showMsgBack("댓글등록 실패");
		//out.print(showMsgBack("댓글등록 실패"));
	} */
	
%>