package project1.ver07;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;

public class PhoneBookManager implements MenuItem, SubMenuItem {
	
	HashSet<PhoneInfo> phoneInfo = new HashSet<PhoneInfo>();
	
	public void printMenu() {
		System.out.println("선택하세요..\n1.데이터 입력\n2.데이터 검색\n3.데이터 삭제\n4.주소록 출력\n5.프로그램 종료");
		System.out.print("선택:");
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
				if(phoneInfo.add(inputPhone)){//저장되면 true값 반환
					System.out.println("데이터 입력이 완료되었습니다.");
				}
				else {
					Scanner sc = new Scanner(System.in);
					System.out.println("이미 저장된 데이터입니다.\n덮어쓸까요? Y(y) / N(n)");
					String yesOrNo = sc.nextLine();
					
					if(yesOrNo.equalsIgnoreCase("y")) {
						phoneInfo.remove(inputPhone);
						phoneInfo.add(inputPhone);
					}
					else if(yesOrNo.equalsIgnoreCase("n")) {
						System.out.println("데이터 저장이 안됐습니다.");
					}
					break;
				}
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
				if(phoneInfo.add(school)) {
					System.out.println("데이터 입력이 완료되었습니다.");
				}
				else {
					Scanner sc = new Scanner(System.in);
					System.out.println("이미 저장된 데이터입니다.\n덮어쓸까요? Y(y) / N(n)");
					String yesOrNo = sc.nextLine();
					
					if(yesOrNo.equalsIgnoreCase("y")) {
						phoneInfo.remove(school);
						phoneInfo.add(school);
					}
					else if(yesOrNo.equalsIgnoreCase("n")) {
						System.out.println("데이터 저장이 안됐습니다.");
					}
					break;
				}
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
				if(phoneInfo.add(company)) {
					System.out.println("데이터 입력이 완료되었습니다.");
				}
				else {
					Scanner sc = new Scanner(System.in);
					System.out.println("이미 저장된 데이터입니다.\n덮어쓸까요? Y(y) / N(n)");
					String yesOrNo = sc.nextLine();
					
					if(yesOrNo.equalsIgnoreCase("y")) {
						phoneInfo.remove(company);
						phoneInfo.add(company);
					}
					else if(yesOrNo.equalsIgnoreCase("n")) {
						System.out.println("데이터 저장이 안됐습니다.");
					}
					break;
				}
				break;
			}
		}
		
	}
	public void dataSearch() {
		boolean isFind = false;
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 이름을 입력하세요:");
		String searchName = sc.nextLine();
		
		Iterator itr = phoneInfo.iterator();
		while(itr.hasNext()) {
			PhoneInfo phone = (PhoneInfo)itr.next();
			
			if(searchName.compareTo(phone.name)==0) {
				phone.showPhoneInfo();
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
		
		boolean deletePhone = false;
		
		Iterator itr = phoneInfo.iterator();
		while(itr.hasNext()) {
			PhoneInfo phone = (PhoneInfo)itr.next();
			
			if(deleteName.compareTo(phone.name)==0) {
				System.out.println("데이터("+phone.name+")가 삭제되었습니다."); //주소값궁금해요
				phoneInfo.remove(phone);
				deletePhone = true;
				break;
			}
		}
		
	}
	
	public void dataAllShow() {
		Iterator itr = phoneInfo.iterator();
		while(itr.hasNext()) {
			PhoneInfo phone = (PhoneInfo)itr.next();
			phone.showPhoneInfo();
			System.out.println("전체정보가 출력되었습니다.");
		}
	}
	
}