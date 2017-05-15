<%@page import="comments.model.Comments"%>
<%@page import="java.util.List"%>
<%@page import="comments.model.CommentsDAO"%>
<%@page import="comments.model.News"%>
<%@page import="comments.model.NewsDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%! 
	NewsDAO newsDAO=new NewsDAO();
	CommentsDAO commentsDAO=new CommentsDAO();
%>
<%
	String news_id=request.getParameter("news_id");	
	News news=newsDAO.select(Integer.parseInt(news_id));
	List<Comments> list=commentsDAO.select(Integer.parseInt(news_id));
	
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
#box{border:1px solid #CCCCCC}
#writer,#title,#content{font-size:9pt;font-weight:bold;color:#7F7F7F;돋움}
input{
	font-size:9pt;
	border-left:1px solid #C3C3C3;
	border-top:1px solid #C3C3C3;
	border-right:1px solid #C3C3C3;
	border-bottom:1px solid #C3C3C3;
	color:#7F7F7F;돋움
}
#title input{width:250px;}
#content textarea{
width:503px;
border:0;
height:153;
background:url("/board/images/write_bg.gif");
border:#C3C3C3 1px solid 
}
#copyright{font-size:9pt;}
a{text-decoration:none}
img{border:0px}

#comments_area{
	width:100%;
	background:yellow
}
</style>
	<script>
		var xhttp;//ajax의  요청객체
		var comments_area;
		
		function init(){
			xhttp=new XMLHttpRequest();
			//stateChange 상태값에 따라 우측의 콜백함수가 호출된다.
			//개발자는 이중 상태값이 4인것만 처리하면 된다.
			
			
			
			//여기다 이걸 두면 한번만 계속 열려진 상태여서 한번만 보낼수 있다. 버튼 누를때 열고 보내자
			//xhttp.open("POST", "/board/reply.jsp", true);
			//xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");//post방식으로 보낼때는 이
		
			comments_area=document.getElementById("comments_area");
			getList();
		}
	
		//서버에 댓글 등록을 요청한다.
		function reply(){
			/* form1.action="/board/reply.jsp";
			form1.submit(); 동기방식*/
			var nickname=form1.nickname.value;
			var msg=form1.msg.value;
			var news_id=form1.news_id.value;
			
			xhttp.onreadystatechange=function(){
				if (this.readyState==4&&this.status==200) {
					//alert("등록결과는 "+this.responseText);
					
					//등록이 성공하면, 조회하자!!
					if (this.responseText==1) {
						//alert("등록성공!!")
						//서버에 코멘트목록 가져오기 요청
						getList();
					}
					
				}
			}			
			//누를때마다 열고 보낸다.
			xhttp.open("POST", "/board/reply.jsp", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");//post방식으로 보낼때는 이
			xhttp.send("nickname="+nickname+"&msg="+msg+"&news_id="+news_id);
		}
		
		function getList(){
			xhttp.onreadystatechange=function(){
				if (this.readyState==4&&this.status==200) {
					//화면에 목록을 동적으로 처리...
					//alert("등록성공")
					var obj=JSON.parse(this.responseText);
					
					//DOM을 이용하여 동적 화면 구성
					var tag="";
					comments_area.innerHTML=tag; //기존꺼를 삭제!
					for(var i=0; i<obj.list.length; i++){
						tag+="<span>"+obj.list[i].writer+"</span>";//작성자
						tag+="<span>"+obj.list[i].msg+"</span>";//메시지
						tag+="<span>"+obj.list[i].regdate+"</span>";//등록시간
						tag+="<br>";
					}
					comments_area.innerHTML=tag; //누적된거 적용		
					//comments_area.innerHTML="<span>하하</span>";
					//comments_area.innerHTML="<span>하하</span>";세번해도 대체해버린다.
					
					
				/* 	var comments=document.getElementById("comments");
					while ( comments.hasChildNodes() ) {
						comments.removeChild( comments.firstChild );
					}	
					
					for(var i=0; i<obj.list.length; i++){
						var commentsDiv=document.createElement("div");
						
						var writerSpan=document.createElement("span");
						var msgSpan=document.createElement("span");
						var regdateSpan=document.createElement("span");
						
						writerSpan.innerText=obj.list[i].writer;
						msgSpan.innerText=obj.list[i].msg;
						regdateSpan.innerText=obj.list[i].regdate;
						
						commentsDiv.appendChild(writerSpan);
						commentsDiv.appendChild(msgSpan);
						commentsDiv.appendChild(regdateSpan);
						
						comments.appendChild(commentsDiv); */
					
				}
			}		
			
			xhttp.open("GET", "comments_list.jsp?news_id="+form1.news_id.value, true);
			xhttp.send();
		}
		
	</script>

</head>
<body onLoad="init()">
<form name="form1" method="post">
	<input type="hidden" name="news_id" value="<%=news.getNews_id() %>">
	<table id="box" align="center" width="603" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td><img src="/board/images/ceil.gif" width="603" height="25"></td>
	  </tr>
	  <tr>
	    <td height="2" bgcolor="#6395FA"><img src="/board/images/line_01.gif"></td>
	  </tr>
	  <tr>
	    <td height="1" bgcolor="#CCCCCC"></td>
	  </tr>
		<tr>	
			<td id="list"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td width="100">&nbsp;</td>
	            <td>&nbsp;</td>
	          </tr>
	          <tr id="writer">
	            <td height="25" align="center">작성자</td>
	            <td><input type="text" name="writer" value="<%=news.getWriter()%>"></td>
	          </tr>
	          <tr id="title">
	            <td height="25" align="center">제목</td>
	            <td><input type="text" name="title" value="<%=news.getTitle()%>"></td>
	          </tr>
	          <tr id="content">
	            <td align="center">내용</td>
	            <td><textarea name="content" style=""><%=news.getContent()%></textarea></td>
	          </tr>
	          <tr>
	            <td>&nbsp;</td>
	            <td>&nbsp;</td>
	          </tr>
	        </table></td>
		</tr>
	  <tr>
	    <td height="30" align="right" style="padding-right:2px;">
		<img src="/board/images/write_btin.gif" width="61" height="20">
		<img src="/board/images/delete_btn.gif" width="61" height="20"> <a href="list.jsp"><img src="/board/images/list_btn.gif" width="61" height="20" border="0"></a> </td>
	  </tr>
	  <tr>
	  	<td>
	  		<input type="text" name="nickname" size="8" placeholder="작성자" />
	  		<input type="text" size="60" name="msg" placeholder="댓글입력" />
	  		<input type="button"  value="등록" onclick="reply();"/>
	  	</td>
	  	<tr>
	  		<td id="comments">
	  			<%-- <%for(int i=0; i<list.size(); i++){ %>
	  			<div >
		  			<span><%=list.get(i).getWriter() %></span>
		  			<span><%=list.get(i).getMsg() %></span>
		  			<span><%=list.get(i).getRegdate() %></span>
	  			</div>
	  			<%} %> --%>
	  			<div id="comments_area">
		  			<span></span>
		  			<span></span>
		  			<span></span>
	  			</div>
	  		</td>
	  	</tr>
	  </tr>  
	  <tr>
	    <td height="1" bgcolor="#CCCCCC"></td>
	  </tr>
	  <tr>
	    <td height="20" align="center" id="copyright">Copyright zino All Rights Reserved </td>
	  </tr>
	</table>
	</form>
</body>
</html>
