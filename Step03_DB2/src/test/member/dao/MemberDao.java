package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.utill.DbcpBean;

public class MemberDao {
   //MemberDao 객체의 참조값을 저장할 static 필드 
   private static MemberDao dao;
   //외부에서 객체 생성하지 못하도록 생성자의 접근 지정자를 private 로 설정
   private MemberDao() {}
   //MemberDao 객체를 한번만 생성해서 그 참조값을 리턴해주는 static 메소드
   public static MemberDao getInstance() {
      //만일 최초 호출되었다면
      if(dao==null) {
         //MemberDao 객체를 생성해서 static 필드에 저장해 놓기 
         dao=new MemberDao();
      }
      //static 필드에 저장된 MemberDao 객체의 참조값을 리턴해 주기
      return dao;
   }
   
   public boolean insert(MemberDto dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int flag = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 sql 문 준비하기
         String sql = "INSERT INTO member"
               + " (num,name,addr)"
               + " VALUES(member_seq.NEXTVAL, ?, ?)";
         pstmt = conn.prepareStatement(sql);
         //? 에 값 바인딩하기
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getAddr());
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
   public boolean update(MemberDto dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int flag = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 sql 문 준비하기
         String sql = "UPDATE member"
               + " SET name=?, addr=?"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         //? 에 값 바인딩하기
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getAddr());
         pstmt.setInt(3, dto.getNum());
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
         String sql = "DELETE FROM member"
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
   public MemberDto select(int num) {
      MemberDto dto=null;
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         //Connection 객체의 참조값 얻어오기 
         conn = new DbcpBean().getConn();
         //실행할 sql 문 준비
         String sql = "SELECT name, addr"
               + " FROM member"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         //? 에 값 바인딩하기
         pstmt.setInt(1, num);
         //query 문 수행하고 결과 받아오기 
         rs = pstmt.executeQuery();
         if (rs.next()) {
            dto=new MemberDto();
            dto.setNum(num);
            dto.setName(rs.getString("name"));
            dto.setAddr(rs.getString("addr"));
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

   
   public List<MemberDto> selectAll(){
      List<MemberDto> list=new ArrayList<MemberDto>();
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         //Connection 객체의 참조값 얻어오기 
         conn = new DbcpBean().getConn();
         //실행할 sql 문 준비
         String sql = "SELECT num,name,addr"
               + " FROM member"
               + " ORDER BY num ASC";
         pstmt = conn.prepareStatement(sql);
         //? 에 값 바인딩하기
         
         //query 문 수행하고 결과 받아오기 
         rs = pstmt.executeQuery();
         while (rs.next()) {
            MemberDto dto=new MemberDto();
            dto.setNum(rs.getInt("num"));
            dto.setName(rs.getString("name"));
            dto.setAddr(rs.getString("addr"));
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
   public List<MemberDto> getList(MemberDto dto){
      List<MemberDto> list=new ArrayList<MemberDto>();
      
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
               "      (SELECT num,name,addr" + 
               "      FROM member" + 
               "      ORDER BY num ASC) result1)" + 
               " WHERE rnum BETWEEN ? AND ?";
         pstmt = conn.prepareStatement(sql);
         //? 에 값 바인딩하기
         pstmt.setInt(1, dto.getStartRowNum());
         pstmt.setInt(2, dto.getEndRowNum());
         //query 문 수행하고 결과 받아오기 
         rs = pstmt.executeQuery();
         while (rs.next()) {
            MemberDto dto2=new MemberDto();
            dto2.setNum(rs.getInt("num"));
            dto2.setName(rs.getString("name"));
            dto2.setAddr(rs.getString("addr"));
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
}