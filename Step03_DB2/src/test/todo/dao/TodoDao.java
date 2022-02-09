package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.utill.DbcpBean;

public class TodoDao {
	//TodoDao 객체의 참조값을 저장할 Static 필드
	private static TodoDao dao;
	//외부에서 객체 생성을 하지 못하도록 생성자의 접근지정자를  private로 설정
	private	TodoDao() {}
	//TodoDao 객체를 한번만 생성해서 그 참조값을 리턴해주는 static 메소드
	public static TodoDao getInstance() {
		//만일 최초 호출되었다면
		if(dao==null) {
			//TodoDao 객체를 생성해서 static 필드에 저장해 놓기
			dao=new TodoDao();
		}
		//static 필드에 저장된 TodoDao 객체의 참조값을 리턴해주기
		return dao;
	}
	
	public List<TodoDto> selectAll() {
		List<TodoDto> list=new ArrayList<TodoDto>();
    
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비
			String sql = "SELECT num,content,regdate"
					+ " FROM todo"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
       
			//query 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TodoDto dto=new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	public TodoDto select(int num) {
		TodoDto dto=null;
	
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn=new DbcpBean().getConn();
			//실행할 sql 문 준비
			String sql="SELECT content,regdate"
					+ " From todo"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setInt(1, num);
			//query 문 수행하고 결과 받아오기 
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new TodoDto();
				dto.setNum(num);
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}catch(Exception e) {
		}
		}
	return dto;
	}
	public boolean insert(TodoDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			//실행할 sql문 준비하기
			String sql="INSERT INTO todo"
					+ " (num,content,regdate)"
					+ " VALUES(todo_seq.NEXTVAL, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			//? 에 값 바인딩하기
		    pstmt.setString(1, dto.getContent());
		    pstmt.setString(2, dto.getRegdate());
			//sql 문 수행하고 변화된 row 의 갯수 리턴 받기
			flag=pstmt.executeUpdate();
			}catch(Exception e) {
		         e.printStackTrace();
		      }finally {
		         try {
		            if(pstmt!=null)pstmt.close();
		            if(conn!=null)conn.close();
		         }catch(Exception e) {}
		      }
		      if(flag>0) {
		         return true;
		      }else {
		         return false;
		      }
	}
	public boolean update(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "UPDATE todo"
					+ " SET content=?, regdate=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getRegdate());
			pstmt.setInt(3,dto.getNum());
			//sql 문 수행하고 변화된 row 의 갯수 리턴 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "DELETE FROM todo"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 값 바인딩하기
			pstmt.setInt(1, num);
			//sql 문 수행하고 변화된 row 의 갯수 리턴 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
