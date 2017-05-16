package comments.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.FactoryManager;

public class NewsDAOMybatis {
	FactoryManager manager=FactoryManager.getInstance();	
	
	//CRUD �޼ҵ� ����
	public List selectAll(){
		SqlSession session=manager.getSession();
		List list=session.selectList("News.selectJoin");
		manager.closeSession(session);
		
		return list;
	}
	
	public News select(int news_id) {
		SqlSession session=manager.getSession();
		News news=session.selectOne("News.select", news_id);
		manager.closeSession(session);
		
		return news;
	}
	
	public int delete(int news_id) {
		int result=0;
		SqlSession session=manager.getSession();
		result=session.delete("News.delete", news_id);
		session.commit();//�ڵ� commit�Ǵ� jdbc�� �޸� commit�� ��������� �Ѵ�.
		manager.closeSession(session);
		
		return result;
	}
	
	public int update(News dto) {
		int result=0;
		SqlSession session=manager.getSession();
		result=session.update("News.update", dto);
		session.commit();//�ڵ� commit�Ǵ� jdbc�� �޸� commit�� ��������� �Ѵ�.
		manager.closeSession(session);
		
		return result;
	}
	
	public int insert(News dto){
		int result=0;
		SqlSession session=manager.getSession();
		result=session.insert("News.insert", dto);
		session.commit();//�ڵ� commit�Ǵ� jdbc�� �޸� commit�� ��������� �Ѵ�.
		manager.closeSession(session);
		
		return result;
	}
	
	/*public List commentsNewsOuterJoin(){
		SqlSession session=manager.getSession();
		List list=session.selectList("News.commentsNewsOuterJoin");
		manager.closeSession(session);
		
		return list;
		
	}*/
}
