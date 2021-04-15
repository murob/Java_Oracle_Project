package project1.ver05;
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

public class PhoneBookManager implements MenuItem, SubMenuItem {
	
	public PhoneInfo[] phoneInfo = new PhoneInfo[100];
	public int numOfInfo = 0;
	
	public void printMenu() {
		while(true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("선택하세요..\n1.데이터 입력\n2.데이터 검색\n3.데이터 삭제\n4.주소록 출력\n5.프로그램 종료");
			System.out.print("선택:");
			int inputNum = sc.nextInt();
			if(inputNum==MenuItem.ONE) {
				System.out.println("데이터 입력을 시작합니다.");
				dataInput();
			}
			else if(inputNum==MenuItem.TWO) {
				dataSearch();
			}
			else if(inputNum==MenuItem.THR) {
				dataDelete();
			}
			else if(inputNum==MenuItem.FOUR) {
				dataAllShow();
			}
			else if(inputNum==MenuItem.FIVE) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
		}
		
	}
	
	public void dataInput() {
		Scanner scan = new Scanner(System.in);
		String iName, iPhone, iBirthday, iSubject, iCompany;
		int iGrade, choice;
		System.out.println("1.일반, 2.대학, 3.회사");
		System.out.print("선택>>");
		choice = scan.nextInt();
		
		while(true) {
			if(choice==SubMenuItem.ONE) {
				scan.nextLine();
				System.out.print("이름:");
				iName = scan.nextLine();
				System.out.print("전화번호:");
				iPhone = scan.nextLine();
				System.out.print("생년월일:");
				iBirthday = scan.nextLine();
				
				PhoneInfo inputPhone = new PhoneInfo(iName, iPhone, iBirthday);
				phoneInfo[numOfInfo++] = inputPhone;
				System.out.println("데이터 입력이 완료되었습니다.");
				break;
			}
			else if(choice==SubMenuItem.TWO) {
				scan.nextLine();
				System.out.print("이름:");
				iName = scan.nextLine();
				System.out.print("전화번호:");
				iPhone = scan.nextLine();
				System.out.print("전공:");
				iSubject = scan.nextLine();
				System.out.print("학년:");
				iGrade = scan.nextInt();
				
				PhoneSchoolInfo school = new PhoneSchoolInfo(iName, iPhone, iSubject, iGrade);
				phoneInfo[numOfInfo++] = school;
				System.out.println("데이터 입력이 완료되었습니다.");
				break;
			}
			else if(choice==SubMenuItem.THR) {
				scan.nextLine();
				System.out.print("이름:");
				iName = scan.nextLine();
				System.out.print("전화번호:");
				iPhone = scan.nextLine();
				System.out.print("회사:");
				iCompany = scan.nextLine();
				
				PhoneCompanyInfo company = new PhoneCompanyInfo(iName, iPhone, iCompany);
				phoneInfo[numOfInfo++] = company;
				System.out.println("데이터 입력이 완료되었습니다.");
				break;
			}
		}
		

	}
	public void dataSearch() {
		boolean isFind = false;
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 이름을 입력하세요:");
		String searchName = sc.nextLine();
		
		for(int i=0; i<numOfInfo; i++) {
			if(searchName.compareTo(phoneInfo[i].name)==0) {
				phoneInfo[i].showPhoneInfo();
				System.out.println("데이터 검색이 완료되었습니다.");
				isFind = true;
			}
		}
		if(isFind==false)
			System.out.println("찾는 정보가 없습니다.");
		
	}
	public void dataDelete() {
		Scanner sc = new Scanner(System.in);
		System.out.print("삭제할 이름을 입력하세요:");
		String deleteName = sc.nextLine();
		
		int deleteIndex = -1;
		
		for(int i=0; i<numOfInfo; i++) {
			if(deleteName.compareTo(phoneInfo[i].name)==0) {
				phoneInfo[i] = null;
				deleteIndex = i;
				numOfInfo--;
				break;
			}
		}
		
		if(deleteIndex==-1) {
			System.out.println("삭제된 데이터가 없습니다.");
		}
		else {
			for(int i=deleteIndex; i<numOfInfo; i++) {
				phoneInfo[i] = phoneInfo[i+1];
			}
			System.out.println("데이터("+deleteIndex+")가 삭제되었습니다.");
		}
	}
	
	public void dataAllShow() {
		for(int i=0; i<numOfInfo; i++) {
			phoneInfo[i].showPhoneInfo();
		}
		System.out.println("전체정보가 출력되었습니다.");
	}
	
}
