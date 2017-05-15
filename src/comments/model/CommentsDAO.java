package comments.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pool.PoolManager;

public class CommentsDAO {
	PoolManager pool=PoolManager.getInstance();
	
	//´ñ±Û µî·Ï
	public int insert(Comments dto){
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement preparedStatement;
		
		int result=0;
		
		String sql="insert into comments(comments_id, writer, msg, news_id)";
		sql+="values(seq_comments.nextVal, ?, ?, ?)";
		
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getMsg());
			pstmt.setInt(3, dto.getNews_id());
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			pool.freeConnection(con, pstmt);
			
		}
		
		
		
		return result;
	}
	
	//´ñ±Û ¸ñ·Ï
	public List select(int news_id){
		List<Comments> list=new ArrayList<Comments>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		
		String sql="select * from comments where news_id=? order by comments_id desc";
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				Comments dto=new Comments();
				dto.setComments_id(rs.getInt("comments_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setMsg(rs.getString("msg"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setNews_id(rs.getInt("news_id"));
				
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			pool.freeConnection(con, pstmt, rs);
			
		}
		
		
		return list;
	}
	
		
	
}





