package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.todo.dto.TodoDto;
import test.utill.DbcpBean;

public class TodoDao {
   //1. 자신의 객체를 담을 static 필드 선언
   private static TodoDao dao;
   
   //2. 외부에서 객체 생성이 불가 하도록 생성자의 접근 지정자를 private 로
   private TodoDao() {}
   
   //3. 자신의 참조값을 리턴해주는 public static 메소드 정의
   public static TodoDao getInstance() {
      if(dao==null) { // getInstance() 메소드가 최초 호출되는 경우
         dao=new TodoDao();//객체를 생성해서 참조값을 static 필드에 저장한다. 
      }
      //static 필드에 저장된 참조값을 리턴해준다.
      return dao;
   }
   public boolean insert(TodoDto dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int flag = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 insert, update, delete 문 구성
         String sql = "INSERT INTO todo"
               + " (num, content, regdate)"
               + " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 바인딩한다.
         pstmt.setString(1, dto.getContent());
         flag = pstmt.executeUpdate(); //sql 문 실행하고 변화된 row 갯수 리턴 받기
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
   public boolean update(TodoDto dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int flag = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 insert, update, delete 문 구성
         String sql = "UPDATE todo"
               + " SET content=?"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 바인딩한다.
         pstmt.setString(1, dto.getContent());
         pstmt.setInt(2, dto.getNum());
         flag = pstmt.executeUpdate(); //sql 문 실행하고 변화된 row 갯수 리턴 받기
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
         //실행할 insert, update, delete 문 구성
         String sql = "DELETE FROM todo WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 바인딩한다.
         pstmt.setInt(1, num);
         flag = pstmt.executeUpdate(); //sql 문 실행하고 변화된 row 갯수 리턴 받기
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
   public TodoDto select(int num) {
      //TodoDto 객체를 담을 지역 변수 미리 만들기
      TodoDto dto=null;
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = new DbcpBean().getConn();
         //select 문 작성
         String sql = "SELECT content, regdate"
               + " FROM todo"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
         pstmt.setInt(1, num);
         //select 문 수행하고 ResultSet 받아오기
         rs = pstmt.executeQuery();
         //while문 혹은 if문에서 ResultSet 으로 부터 data 추출
         if (rs.next()) {
            dto=new TodoDto();
            dto.setNum(num);
            dto.setContent(rs.getString("content"));
            dto.setRegdate(rs.getString("regdate"));
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
      return dto;
   }
   public List<TodoDto> selectAll() {
      List<TodoDto> list=new ArrayList<TodoDto>();
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = new DbcpBean().getConn();
         //select 문 작성
         String sql = "SELECT num, content, TO_CHAR(regdate,'YY.MM.DD HH24:MI') AS regdate"
               + " FROM todo"
               + " ORDER BY num ASC";
         pstmt = conn.prepareStatement(sql);
         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
         
         //select 문 수행하고 ResultSet 받아오기
         rs = pstmt.executeQuery();
         //while문 혹은 if문에서 ResultSet 으로 부터 data 추출
         while(rs.next()) {
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
   // dto 에 들어 있는 startRowNum 과 endRowNum 을 이용해서 목록을 리턴하는 메소드 
   public List<TodoDto> getList(TodoDto dto){
      List<TodoDto> list=new ArrayList<TodoDto>();
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         //Connection 객체의 참조값 얻어오기 
         conn = new DbcpBean().getConn();
         //실행할 sql 문 준비
         String sql = "SELECT *" +
               " FROM" +
               "   (SELECT result1.*, ROWNUM rnum" +
               "   FROM" +
               "      (SELECT num,content,regdate" +
               "      FROM todo" +
               "      ORDER BY num ASC) result1)" +
               " WHERE rnum BETWEEN ? AND ?";
         pstmt = conn.prepareStatement(sql);
         //? 에 값 바인딩하기
         pstmt.setInt(1, dto.getStartRowNum());
         pstmt.setInt(2, dto.getEndRowNum());
         //query 문 수행하고 결과 받아오기 
         rs = pstmt.executeQuery();
         while (rs.next()) {
            TodoDto dto2=new TodoDto();
            dto2.setNum(rs.getInt("num"));
            dto2.setContent(rs.getString("content"));
            dto2.setRegdate(rs.getString("regdate"));
            list.add(dto2);
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
   // todo 테이블의 전체 row 의 갯수를 리턴하는 메소드
   public int getCount() {
	   
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection 객체의 참조값 얻어오기 
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 준비
	         String sql = "SELECT MAX(ROWNUM) AS num FROM member";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩하기

	         //query 문 수행하고 결과 받아오기 
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            count=rs.getInt("num");
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

	      return count;
	   }
}