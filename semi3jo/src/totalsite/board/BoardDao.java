package totalsite.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import bean.DBConnectionMgr;

public class BoardDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public BoardDao(){ // �����ڿ� dbcp�� �̿��ϱ� ���� �غ�
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("BoardDao(): " + err);
		}
	}
	
	//��ü �� ��������
	
	public Vector getBoardList(String keyField, String keyWord){
		Vector v = new Vector(); // ��ü ���� ��� ���� ��
		String sql;
				
		try{
			if(keyWord==null || keyWord.isEmpty() || keyWord.equals("null")){
				sql = "select * from tblboard order by pos";
			}
			else{
				sql="select * from tblboard where "
						+ keyField + " like '%" + keyWord + "%' order by pos";
			}
			
			con = pool.getConnection(); // DB�� ����
			pstmt = con.prepareStatement(sql); // �̸� �ۼ��� ������ DB�� �����ϱ� ���� ����
			rs = pstmt.executeQuery(); //������ ������� rs�� ����
			
			while(rs.next()){ // �ݺ��� ������ ���
				BoardDto dto = new BoardDto(); //DTO����
				dto.setContent(rs.getString("content")); //�� �׸��� ������� dto�� ��Ƽ�
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPass(rs.getString("pass"));
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				
				v.add(dto); // �� ���� dto�� ������ �� 
			}
		}
		catch(Exception err){
			System.out.println("getBoardList(): " + err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs); // ������ �߿� 
		}
		
		return v; // ����!! 
	}
	
	//�� �����ϱ�(�����ϱ� ���� pos�� ������Ʈ)
	public void insertBoard(BoardDto dto){ //
		String sql = null;
		try{
			sql = "update tblBoard set pos=pos+1";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "insert into tblboard(name,email,homepage,subject,content,pass,count,ip,regdate,pos,depth,filename,ofilename)"
					+ " values(?, ?, ?, ?, ?, ?, 0, ?,sysdate(), 0, 0, ?, ?)";
			pstmt = con.prepareStatement(sql); // �̸� �ۼ��� ������ DB�� �����ϱ� ���� ����
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHomepage());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getPass());
			pstmt.setString(7, dto.getIp());
			pstmt.setString(8, dto.getFilename());
			pstmt.setString(9, dto.getOfilename());
			
			
			pstmt.executeUpdate();
			
			
		}
		catch(Exception err){
			System.out.println("insertBoard(): " + err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
	}
	
	//������ �� �Ѱ� ��������(���б�, ���������������� ��� ����)
	public BoardDto getBoard(int num){ //76
		String sql ="";
		BoardDto dto = new BoardDto(); //DTO����
		try{
			sql = "update tblboard set count=count+1 where num="+num; // ��ȸ�� ���� 
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "select * from tblboard where num=" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content")); //�� �׸��� ������� dto�� ��Ƽ�
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setIp(rs.getString("ip"));
				dto.setNum(rs.getInt("num"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				dto.setPass(rs.getString("pass"));
				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));
				dto.setFilename(rs.getString("filename"));
				dto.setOfilename(rs.getString("ofilename"));
			}
		}
		catch(Exception err){
			System.out.println("getBoard(): " + err);
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		
		return dto;
	}
	
	// �� ����(�̸�, �̸���, ����, ����)
	public void updateBoard(BoardDto dto){
		String sql = null;
		try{
			sql = "update tblboard set name= ?, email=?, subject=?, content=? where num=?";
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getNum());
						
			pstmt.executeUpdate();
			
			
		}
		catch(Exception err){
			System.out.println("updateBoard(): " + err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
	}
	
	//�� ����
	public void deleteBoard(int num){
		String sql=null;
		
		try{
			sql = "delete from tblboard where num=?";
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
						
			pstmt.executeUpdate();
			
			
		}
		catch(Exception err){
			System.out.println("delteBoard(): " + err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	// ���� ���� pos�� ���� (������ - �亯���� �ޱ� ���� �θ� ��)
	public void replyUpdatePos(BoardDto dto){ // �θ��� ��
		String sql=null;
		try{
			System.out.println(dto.getPos()); //0
			sql = "update tblBoard set pos = pos+1 where pos > ?";
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getPos());
			
			pstmt.executeUpdate();
			
		}
		catch(Exception err){
			System.out.println("replyUpdatePos(): " + err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
	}
	
	// �亯 - �亯�� �ٴ� ���� ��
	public void replyBoard(BoardDto dto){ // ���� �亯�� �Է��� ��
		String sql = null;
		try{
			sql = "insert into tblboard(name, email, homepage, subject, content, pass, count, ip, regdate,pos, depth)"
					+" values(?, ?, ?, ?, ?, ?, 0, ?,sysdate(), ?, ?)";
			
			con = pool.getConnection(); // DB�� ����
			pstmt = con.prepareStatement(sql); // �̸� �ۼ��� ������ DB�� �����ϱ� ���� ����
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHomepage());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getPass());
			pstmt.setString(7, dto.getIp());
			pstmt.setInt(8, dto.getPos()+1);
			pstmt.setInt(9, dto.getDepth()+1);
			
			pstmt.executeUpdate();
			
			
		}
		catch(Exception err){
			System.out.println("replyBoard(): " + err);
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
		
	}
	
	//�鿩����
	public String useDepth(int depth){
		String result = "";
		for(int i=0; i<depth*3; i++){
			result += "&nbsp;";
		}
		return result;
	}
}
