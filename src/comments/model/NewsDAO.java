package comments.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pool.PoolManager;

public class NewsDAO {
	PoolManager pool=PoolManager.getInstance();
	
	//CRUD
	
	//C
	//create==insert
	public int insert(News dto){
		int result=0;		
		Connection con=pool.getConnection();
		PreparedStatement pstmt=null;
				
		String sql="insert into news(news_id, writer, title, content)";
		sql+="values(seq_news.nextVal, ?, ?, ?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
			
		}		
		
		return result;		
	}
	
	public List select(){
		ArrayList<News> list=new ArrayList<News>();
		Connection con=pool.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from news order by news_id desc";
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				News dto=new News();
				dto.setNews_id(rs.getInt("news_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setHit(rs.getInt("hit"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(con, pstmt, rs);
			
		}				
				
		return list;		
	}
	
	public News select(int news_id){
		News dto=null;
		Connection con=pool.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from news where news_id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){		
				dto=new News();
				dto.setNews_id(rs.getInt("news_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setHit(rs.getInt("hit"));
								
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(con, pstmt, rs);
			
		}				
				
		return dto;		
	}
	
}
