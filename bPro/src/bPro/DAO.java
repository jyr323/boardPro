//SQL
package bPro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	private Connection conn ;
	//private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DAO(){
		try {
			String url = "jdbc:mysql://localhost:3306/board";
			String id = "root";
			String pw = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,id,pw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	//현재날짜
	public String getDate(){
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //연결
			rs = pstmt.executeQuery(); 
			if(rs.next()){
				return rs.getString(1); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	//num 1씩 증가
	public int getNext(){
		String SQL = "select num from board order by num desc ";  
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1)+1;  //현재 num에 1추가
			}
			
			return 1;  //처음 글
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	//글쓰기
	public int write(String name, String title, String password, String content, Integer hitCount, String newdate, Integer available){
		String SQL = "insert into board values (?, ?, ?, ?, ?, ?, ?,?, ?)"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, getNext()); //num
			pstmt.setString(2, name);
			pstmt.setString(3, title);
			pstmt.setString(4, password);
			pstmt.setString(5, content);
			pstmt.setInt(6, hitCount);
			pstmt.setString(7, getDate());
			pstmt.setString(8, newdate);
			pstmt.setInt(9, 1);
		
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //오류
	}
	
	//list.jsp
	public ArrayList<DTO> getList(int pageNumger){ 
		String SQL = "Select * from board where num < ? and available =1 order by num desc limit 10";  //10개이하
		ArrayList<DTO> list = new ArrayList<DTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, getNext() - (pageNumger-1) * 10); //10개씩
			rs = pstmt.executeQuery();
			while(rs.next()){
				DTO dto = new DTO();
				dto.setNum(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setPassword(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setHitCount(rs.getInt(6));
				dto.setDate(rs.getString(7));
				dto.setNewdate(rs.getString(8));
				dto.setAvailable(rs.getInt(9));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
		
	}
	
	//num이 10개 이상일때
	public boolean nextPage(int pageNumber){ 
		String SQL = "Select * from board where num < ? and available =1 order by num desc limit 10"; 
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, getNext() - (pageNumber-1) * 10); 
			rs = pstmt.executeQuery();
			if(rs.next()){ 
				return true; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 
		
	}
	
	//글내용 불러오기
	public DTO getDTO(int num){
		String SQL = "Select * from board where num= ?";  
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, num);  
			rs = pstmt.executeQuery();
			if(rs.next()){ 
				DTO dto = new DTO();
				dto.setNum(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setPassword(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setHitCount(rs.getInt(6));
				dto.setDate(rs.getString(7));
				dto.setNewdate(rs.getString(8));
				dto.setAvailable(rs.getInt(9));
				return dto; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
		
		
	}
}
