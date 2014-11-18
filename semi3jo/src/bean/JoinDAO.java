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
	
	public JoinDAO(){ // �����ڿ� dbcp�� �̿��ϱ� ���� �غ�
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("JoinDAO(): " + err);
		}
	}
	
	// �α���
	public int login(JoinDTO dto){
		String sql = null;
		try{
			con = pool.getConnection(); //����
				
			sql = "select * from member where id=? and pw=?"; // ���
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId()); // �Ķ���Ͱ� id�� �־��ش� id=?���⿡
			pstmt.setString(2, dto.getPw()); // �Ķ���Ͱ� id�� �־��ش� id=?���⿡
			rs = pstmt.executeQuery(); //������ ������� rs�� ����
					
			if(rs.next()){ // �ݺ��� ������ ��� 
				return 1;
			}else{
				return 0;
			}
		}
		catch(Exception err){
			System.out.println("login() : " + err);
			return -1; // ���� �߻� -1����
		}
		finally{
			pool.freeConnection(con, pstmt,rs);
		}
	}

	// �α��� han
	public boolean loginconfirm(String id){
		String sql = null;
		boolean bool = false;
		try{
			con = pool.getConnection(); //����
			
			sql = "select * from member where id=?"; // ���
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // �Ķ���Ͱ� id�� �־��ش� id=?���⿡
			rs = pstmt.executeQuery(); //������ ������� rs�� ����
			
			if(rs.next()){ // �ݺ��� ������ ��� 
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
	
	//ȸ�������ϱ�
	public void insertJoin(JoinDTO dto){
		String sql = null;
		try{
			System.out.println(dto.getName());
			sql = "insert into member(id, pw, name, phone, email, address) "
					+ "values(?, ?, ?, ?, ?, ?)"; //num�ڵ�

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
	
	// �α����� ȸ���� ������ ���� �´�
	public JoinDTO getMemberInfo(String id){
		JoinDTO dto = new JoinDTO();
		String sql = null;
		try{
			con = pool.getConnection(); //����
				
			sql = "select * from member where id=?"; // ���
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // �Ķ���Ͱ� id�� �־��ش� id=?���⿡
			rs = pstmt.executeQuery(); //������ ������� rs�� ����
					
			if(rs.next()){ // �ݺ��� ������ ��� //�� �׸��� ������� dto�� ��Ƽ�
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

	// ȸ������ ����
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
	// ȸ������ ����
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
