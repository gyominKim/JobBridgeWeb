package employmentDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class employmentDao {

	String id = System.getenv("JOBBRIDGE_DB_USER");
	String password = System.getenv("JOBBRIDGE_DB_PASSWORD");
	String url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf-8";

	// jdbc 이용을 위한 기본 객체 설정(전역 변수)
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void connect() {
		try {
			// 1. mySql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 디비 연결
			conn = DriverManager.getConnection(url, id, password);
			System.out.println("디비 연결 완료 !! ");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void disConnect() {

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if ( rs !=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void insertEmployment(employmentDo ado) {
		System.out.println("insertEmployment() 처리 시작");
		connect();

		String sql = "insert into employment values(null,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ado.getName());
			pstmt.setString(2, ado.getPeriod());
			pstmt.setString(3, ado.getPersonnel());
			pstmt.setString(4, ado.getField());
			pstmt.setString(5, ado.getImage());

			pstmt.executeUpdate();

			System.out.println("insertEmployment() 처리 완료 !!");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		disConnect();

	}

	public ArrayList<employmentDo> getAllEmployment() {
		connect();
 
	
		ArrayList<employmentDo> aList = new ArrayList<employmentDo>();
		String sql = "select * from employment";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				employmentDo ado = new employmentDo();
				ado.setNum(rs.getInt(1));
				ado.setName(rs.getString(2));
				ado.setPeriod(rs.getString(3));
				ado.setPersonnel(rs.getString(4));
				ado.setField(rs.getString(5));
				ado.setImage(rs.getString(6));

				aList.add(ado);
			}

			System.out.println("getAllEmployment() 처리 완료!!");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		disConnect();

		return aList;

	}

	public void employmentDelete(int num) {
		connect();

		// sql문 처리
		String slq = "delete from employment where num=?"; // search 문은 where자리에 회사 이름 들어가면 됨
		try {
			pstmt = conn.prepareStatement(slq);
			pstmt.setInt(1, num);

			// sql문
			pstmt.executeUpdate();

			System.out.println("employmentDelete() 처리 완료 !!");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		disConnect();

	}

	 public ArrayList<employmentDo> getAllEmploymentByName(String name) {
	       connect();

	       ArrayList<employmentDo> aList = new ArrayList<employmentDo>();
	       String sql = "SELECT * FROM employment WHERE name LIKE ?";
	       
	       try {
	           pstmt = conn.prepareStatement(sql);
	           pstmt.setString(1, "%" + name + "%");

	           rs = pstmt.executeQuery();
	           while (rs.next()) {
	               employmentDo ado = new employmentDo();
	               ado.setNum(rs.getInt(1));
	               ado.setName(rs.getString(2));
	               ado.setPeriod(rs.getString(3));
	               ado.setPersonnel(rs.getString(4));
	               ado.setField(rs.getString(5));
	               ado.setImage(rs.getString(6));

	               aList.add(ado);
	           }

	           System.out.println("getAllEmploymentByName() 처리 완료!!");
	       } catch (SQLException e) {
	           e.printStackTrace();
	       }

	       disConnect();

	       return aList;
	   }
	}