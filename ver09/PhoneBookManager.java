package project1.ver09;
import java.sql.SQLException;
/*
//1] 학생수를 사용자로부터 입력받자
//-Scanner클래스 사용
Scanner sc = new Scanner(System.in);
System.out.println("학생수를 입력하세요?");
int numberOfStudent = sc.nextInt();
System.out.println("학생수:"+numberOfStudent);

//2] 입력받은 학생 수만큼 국영수 점수를 저장할수 있는
// int형 배열을 선언하고  메모리를 할당해라
//행의 수:학생 수
//열의 수:과목의 수
int[][] jumsues = new int[numberOfStudent][SUBJECTS];

//과목 타이틀]
String[] titles={"국어","영어","수학"};
*/
import java.util.Scanner;

public class PhoneBookManager extends IConnectImpl {
	
	public PhoneBookManager() {
		super(ORACLE_DRIVER, "kosmo", "1234");
	}
	
	public PhoneInfo[] phoneInfo = new PhoneInfo[100];
	public int numOfInfo = 0;
	
	public void printMenu() {
		while(true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("선택하세요..\n1.데이터 입력\n2.데이터 검색\n3.데이터 삭제\n4.주소록 출력\n5.프로그램 종료");
			System.out.print("선택:");
			int inputNum = sc.nextInt();
			if(inputNum==1) {
				dataInput();
			}
			else if(inputNum==2) {
				dataSearch();
			}
			else if(inputNum==3) {
				dataDelete();
			}
			else if(inputNum==4) {
				dataAllShow();
			}
			else if(inputNum==5) {
				System.out.println("프로그램을 종료합니다.");
				close();
				break;
			}
		}
		
	}
	
	public void dataInput() {
		try {
			String query = "INSERT INTO phonebook_tb VALUES (seq_phonebook.nextval, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			
			Scanner scan = new Scanner(System.in);
			System.out.print("이름:");
			String name = scan.nextLine();
			System.out.print("전화번호");
			String phone = scan.nextLine();
			System.out.print("생년월일:");
			String birthday = scan.nextLine();
			
			psmt.setString(1, name);
			psmt.setString(2, phone);
			psmt.setString(3, birthday);
			
//			java.util.Date utilDate = new java.util.Date();
//			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//			psmt.setDate(4, sqlDate);
			
			int affected = psmt.executeUpdate();
			System.out.println(affected +"행이 입력되었습니다.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	public void dataSearch() {
		try {
			while(true) {
				String sql = "SELECT * FROM phonebook_tb "
						//+ " WHERE name LIKE '%'?'%'";//에러발생:북적합한 열 인덱스
						+ " WHERE name LIKE '%'||?||'%'";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, scanValue("찾는이름"));
				rs = psmt.executeQuery();
				while(rs.next()) {
					String name = rs.getString(1);
					String phone = rs.getString(2);
					String birthday = rs.getString(3);
//					String regidate =
//							rs.getString(4).substring(0, 10);
					System.out.printf("%s %s %s\n",
							name, phone, birthday);
				}
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void dataDelete() {
		try {
			//1.쿼리문준비
			String query = "DELETE FROM phonebook_tb WHERE name=?";
			//2.쿼리문을 인자로 prepared객체 생성
			psmt = con.prepareStatement(query);
			//3.인파라미터 설정
			psmt.setString(1, scanValue("삭제할아이디"));
			//4.쿼리실행
			System.out.println(psmt.executeUpdate()
					+"행이 삭제되었습니다.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void dataAllShow() {
	try {	
		stmt = con.createStatement();
		String query = "SELECT * from phonebook_tb";
		rs = stmt.executeQuery(query);
		while(rs.next()) {
//			String idx = rs.getString(1);
			String name = rs.getString(1);//id컬럼
			String phone = rs.getString(2);
			String birthday = rs.getString(3);
			
			System.out.printf("%s %s %s\n",
					name, phone, birthday);
		}
	}
	catch(SQLException e) {
		System.out.println("쿼리오류발생");
		e.printStackTrace();
	}
	
		System.out.println("전체정보가 출력되었습니다.");
	}
	
	@Override
	public void close() {
		super.close();
	}
	
}
