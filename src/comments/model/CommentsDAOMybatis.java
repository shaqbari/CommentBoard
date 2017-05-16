package comments.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.FactoryManager;

public class CommentsDAOMybatis {
	FactoryManager manager=FactoryManager.getInstance();
	
	public List select(int news_id){
		List list=null;
		SqlSession session=manager.getSession();
		list=session.selectList("Comments.select", news_id);//앞에 다른 mapper와 구별위해 namespace를 꼭 써주자.
		manager.closeSession(session);
				
		return list;		
	}
	
	public int insert(Comments dto){
		int result=0;
		SqlSession session=manager.getSession();
		result=session.insert("Comments.insert", dto);		
		session.commit();
		manager.closeSession(session);
		
		return result;
		
	}
	
	public List commentsNewsOuterJoin(){
		List list=null;
		SqlSession session=manager.getSession();
		list=session.selectList("Comments.commentsNewsOuterJoin");//앞에 다른 mapper와 구별위해 namespace를 꼭 써주자.
		manager.closeSession(session);
				
		return list;		
	}
	
}
