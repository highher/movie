package dao;

import dto.MemberDTO;
import util.Dbcon;

public class MemberDAO extends Dbcon {

	public int login(MemberDTO member) {
		
		  int success=0;
		 
		 String sql = "select * from member where member_id = ? and member_password = ? ";
		 
		 try{
		    con = getConnection();
		    pstmt = con.prepareStatement(sql);    
		    pstmt.setString(1, member.getMember_id());
		    pstmt.setString(2 , member.getMember_password());
		    rs = pstmt.executeQuery();
		    
		    if(rs.next()) {
		    	success++;
		    }
			    
			} catch(Exception e){
			    e.printStackTrace();
			}
			    close();
			    return success;
		}

	public void createMember(MemberDTO member) {
		
		String sql = "insert into member (member_id,member_password,member_name,member_tel,member_email)"+
				 "values (?,?,?,?,?)";
		
		try {
		    con = getConnection();
		    pstmt = con.prepareStatement(sql);    
		    pstmt.setString(1, member.getMember_id());
		    pstmt.setString(2, member.getMember_password());
		    pstmt.setString(3, member.getMember_name());
		    pstmt.setString(4, member.getMember_tel());
		    pstmt.setString(5, member.getMember_email());
		    pstmt.executeUpdate();
		    
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		
	}

	

}