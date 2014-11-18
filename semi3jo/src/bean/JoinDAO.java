package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bean.DBConnectionMgr;

public class JoinDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public JoinDAO(){ // 생성자에 dbcp를 이용하기 위한 준비
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("JoinDAO(): " + err);
		}
	}
	
	// 로그인
	public int login(JoinDTO dto){
		String sql = null;
		try{
			con = pool.getConnection(); //연결
				
			sql = "select * from member where id=? and pw=?"; // 출력
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId()); // 파라미터값 id를 넣어준다 id=?여기에
			pstmt.setString(2, dto.getPw()); // 파라미터값 id를 넣어준다 id=?여기에
			rs = pstmt.executeQuery(); //가져온 결과값을 rs에 저장
					
			if(rs.next()){ // 반복문 돌려서 출력 
				return 1;
			}else{
				return 0;
			}
		}
		catch(Exception err){
			System.out.println("login() : " + err);
			return -1; // 오류 발생 -1리턴
		}
		finally{
			pool.freeConnection(con, pstmt,rs);
		}
	}

	// 로그인 han
	public boolean loginconfirm(String id){
		String sql = null;
		boolean bool = false;
		try{
			con = pool.getConnection(); //연결
			
			sql = "select * from member where id=?"; // 출력
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // 파라미터값 id를 넣어준다 id=?여기에
			rs = pstmt.executeQuery(); //가져온 결과값을 rs에 저장
			
			if(rs.next()){ // 반복문 돌려서 출력 
				bool = true;
			}
		}
		catch(Exception err){
			System.out.println("login() : " + err);
		}
		finally{
			pool.freeConnection(con, pstmt,rs);
		}
		
		return bool;
	}
	
	//회원가입하기
	public void insertJoin(JoinDTO dto){
		String sql = null;
		try{
			System.out.println(dto.getName());
			sql = "insert into member(id, pw, name, phone, email, address) "
					+ "values(?, ?, ?, ?, ?, ?)"; //num자동

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress());

			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertJoin() : " + err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 로그인한 회원의 정보를 갖고 온다
	public JoinDTO getMemberInfo(String id){
		JoinDTO dto = new JoinDTO();
		String sql = null;
		try{
			con = pool.getConnection(); //연결
				
			sql = "select * from member where id=?"; // 출력
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // 파라미터값 id를 넣어준다 id=?여기에
			rs = pstmt.executeQuery(); //가져온 결과값을 rs에 저장
					
			if(rs.next()){ // 반복문 돌려서 출력 //각 항목의 결과값을 dto에 담아서
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
			}
		}
		catch(Exception err){
			System.out.println("getMemberInfo() : " + err);
		}
		finally{
			pool.freeConnection(con, pstmt,rs);
		}
		
		return dto;
	}

	// 회원정보 수정
	public void updateJoin(JoinDTO dto){
		String sql = null;
		try{
			sql = "update member set pw=?, name=?, phone=?, email=?, address=? where id=?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getId());
			pstmt.executeUpdate();		
		}
		catch(Exception err){
			System.out.println("updateJoin() : " + err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
	}
	
	/*
	// 회원정보 삭제
	public void deleteBoard(int num){
		String sql = null;
		try{
			sql = "delete from tblboard where num=?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();		
		}
		catch(Exception err){
			System.out.println("deleteBoard() : " + err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
	}
	*/	
}
