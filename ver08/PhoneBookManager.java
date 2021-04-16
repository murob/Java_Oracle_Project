package project1.ver08;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;

public class PhoneBookManager implements MenuItem, SubMenuItem {
	
	HashSet<PhoneInfo> phoneInfo = new HashSet<PhoneInfo>();
	
	public void printMenu() {
		System.out.println("=================메뉴를 선택하세요==================");
		System.out.println("1.주소록입력 2.검색 3.삭제 4.출력 5.저장옵션 6.종료");
		System.out.println("====================================================");
		System.out.print("메뉴선택:");
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
				scan.nextLine();//이름,전화번호 입력란이 같이 뜨는 것을 방지하기 위해 작성
				System.out.print("이름:");
				iName = scan.nextLine();
				System.out.print("전화번호:");
				iPhone = scan.nextLine();
				System.out.print("생년월일:");
				iBirthday = scan.nextLine();
				
				PhoneInfo inputPhone = new PhoneInfo(iName, iPhone, iBirthday);//PhoneInfo타입의 객체에 입력받은 값들을 저장
				if(phoneInfo.add(inputPhone)){//=> true값 반환(내부에 중복된 값이 없을 경우/그러므로 저장이 되므로 true값을 반환)
					//참조타입의 부모 클래스에서 오버라이딩한 해쉬코드로 지정된 값을 비교 후 
					//equals를 통해 중복값을 확인후 중복값이 없다면 false를 반환해서
					//해시내부에 중복값이 없을 알려줌, 중복값이 없기때문에 저장이 가능하므로 add()는 true를 반환(저장이 됨)
					//HashSet내부에 같은 값이 없다면 저장과 함께 true값 반환 / 반대의 경우는 false값
					//true값이면 if문 안으로 진입 false(중복된 값이 있다면)일 경우 if문으로 진입하지 않음
					//phoneInfo: HashSet내부의 값들을 가지고 있는 객체 / inputPhone: 입력받은 값을 가지고 있는 객체
					System.out.println("데이터 입력이 완료되었습니다.");
				}
				else {//if조건식에 따라 중복된 값이 존재하여 false를 반환할 경우 진입
					Scanner sc = new Scanner(System.in);
					System.out.println("이미 저장된 데이터입니다.\n덮어쓸까요? Y(y) / N(n)");
					String yesOrNo = sc.nextLine();
					
					if(yesOrNo.equalsIgnoreCase("y")) {//덮어쓰기
						phoneInfo.remove(inputPhone);//
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
		String searchName = sc.nextLine();//검색한 이름을 searchName으로 받음
		
		//Iterator는 컬렉션에 저장되어 있는 요소들을 읽어오는 방법을 표준화한것 
		Iterator itr = phoneInfo.iterator();//phoneInfo (HashSet)컬렉션에 저장된 요소들을 읽어옴
		//phoneInfo객체를 참조하여 iterator(반복문?)를 사용할 수 있는 itr객체 생성
		/*
		hasNext() : 읽어올 요소가 남아있는지 확인하는 메소드이다. 요소가 있으면 true, 없으면 false
		next() : 다음 데이터를 반환한다.
		remove() : next()로 읽어온 요소를 삭제한다.
		 */
		while(itr.hasNext()) {//HashSet객체 배열의 값을 참조받은 itr의 내부 값들을 확인하기 위해 hasNext()를 사용
			//hasNext()는 다음에 값이 안나올때까지 반복하는 조건문
			//읽어올 요소가 남아있는지 확인하는 메소드로, 요소가 있으면 true, 없으면 false
			//메소드 호출 순서는 hasNext() -> next() -> remove()이다.
			PhoneInfo phone = (PhoneInfo)itr.next();//next() iterator안에서 다음 요소값들을 반환하는 함수
			
			if(searchName.compareTo(phone.name)==0) {//입력된 searchName과 반환된 phone의 name 값을 비교시 같으면 0을 반환(비교하여 0이 반환되면 if문으로 진입)
				//위에 반복문을 통해 next()메소드로 다음 값을 반환하다가 seachName과 같은 값을 가진 값이 반환되면 if조건문 안으로 진입
				phone.showPhoneInfo();//같은 이름의 값이 있다면 저장되어있는 정보를showPhoneInfo를 통해 호출하여 출력
				System.out.println("데이터 검색이 완료되었습니다.");
				isFind = true;//찾는 값이 있다면 isFind를 true로 초기화하여 밑에 있는 if(isFind==false)조건문에 진입하는 것 막음
				//만약, 여기서 isFind를 true로 초기화 하지 않는다면 isFind는 false값을 가지고 있기 때문에 밑에 조건으로 진입하게 되어
				//"찾는 정보가 없습니다."를 출력하게 됨.
			}
		}
		
		if(isFind==false)//찾는 정보가 없을경우 isFind의 초기 지정한 값인 false와 같으므로 여기로 진입
			System.out.println("찾는 정보가 없습니다.");
		
	}
	public void dataDelete() {
		Scanner sc = new Scanner(System.in);
		System.out.print("삭제할 이름을 입력하세요:");
		String deleteName = sc.nextLine();
		
		boolean deletePhone = false;
		
		Iterator itr = phoneInfo.iterator();//phoneInfo컬렉션에 저장된 요소들을 읽어옴 
		while(itr.hasNext()) {//읽어올 요소들을 끝까지 확인
			PhoneInfo phone = (PhoneInfo)itr.next();//phone에다가 컬렉션의 요소값들을 전부 저장
			//next()를 통해 읽어올 요소들이 안나올때까지 확인하여 객체변수phone에 저장
			
			if(deleteName.compareTo(phone.name)==0) {//삭제할 데이터가 있을경우 조건문으로 진입
				System.out.println("데이터("+phone.name+")가 삭제되었습니다."); //주소값궁금해요
				phoneInfo.remove(phone);//이름으로 검색된 phone객체를 삭제
				deletePhone = true;
//				break;
			}
		}
		if(deletePhone==false) {
			System.out.println("입력하신 데이터가 없습니다.");
		}
		
	}
	
	public void dataAllShow() {
		Iterator itr = phoneInfo.iterator();
		while(itr.hasNext()) {
			PhoneInfo phone = (PhoneInfo)itr.next();
			System.out.println("");
			phone.showPhoneInfo();
		}
		System.out.println("전체정보가 출력되었습니다.");
	}
	
	/*
	자바는 메모리에 생성된 객체를 파일이나 네트워크로 출력이 가능하다
	객체는 문자가 아니기 때문에 바이트 기반 스트림으로 출력해야한다.
	- 객체직렬화 : 객체를 출력하기 위해 객체의 데이터를 일렬로 늘어선 
		연속적인 바이트로 변경하는 것을 말한다.
	
	- 객체역직렬화 : 파일에 저장되어 있거나 네트워크에서 전송된 객체를 읽을 수 있는데,
		입력 스팀으로부터 읽어 들인 연속적인 바이트를 객체로 복원하는 것을 말한다.
		
	ObjectInputStream / ObjectOutputStream : 객체를 입력 또는 출력할 수 있는 보조 스트림입니다.
	- ObjectOutputStream은 객체 직렬화에 사용되고
	- ObjectInputStream은 객체 역직렬화에 사용됩니다.
	
	다른 보조 스트림들과 마찬가지로 연결할 바이트 입출력 스트림을 매개값으로 가집니다.
	- ObjectOutputStream objOut = new ObjectOutputStream(바이트 출력  스트림);
	- ObjectInputStream objIn = new ObjectInputStream(바이트 입력 스트림);
	 */
	public void savePhoneBook() {
		try {
			FileOutputStream fileOut = new FileOutputStream("src/project1/ver08/PhoneBook.obj");
			ObjectOutputStream objOut = new ObjectOutputStream(fileOut);//객체를 일렬로 늘어선 바이트로 직렬화해서 내보냄
			
			Iterator itr = phoneInfo.iterator();
			while(itr.hasNext()) {
				Object a = (Object)itr.next();
				objOut.writeObject(a);//wirteObject() 매개변수를 받아서 Object타입의 파일을 내보낸다.			
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void callPhoneBook() {
		try {
			FileInputStream fileIn = new FileInputStream("src/project1/ver08/PhoneBook.obj");
			ObjectInputStream objIn = new ObjectInputStream(fileIn);
			
			while(true) {
				//phone객체 복원
				PhoneInfo phone = (PhoneInfo)objIn.readObject();
				if(phone==null) {//더이상 복원할 내용이 없다면 루프 탈출
					break;
				}
				phoneInfo.add(phone);
			}
		}
		catch(EOFException e) {
		}
		catch (Exception e) {
		}
	}
	
	public void autoSave() {
		try {
			FileWriter wriOut = new FileWriter("src/project1/ver08/AutoSaveBook.txt");
			PrintWriter pntOut = new PrintWriter(wriOut);
			Iterator itr = phoneInfo.iterator();
			while(itr.hasNext()) {
				PhoneInfo a = (PhoneInfo)itr.next();
				pntOut.println(a.toString());		 		
			}
			pntOut.close();//close를 안하면 저장이 안되고 값들이 날아감.
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}