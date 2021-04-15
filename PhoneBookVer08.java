package project1;

import project1.ver08.PhoneBookManager;

import java.util.InputMismatchException;
import java.util.Scanner;

import project1.ver08.AutoSaverT;
import project1.ver08.MenuItem;
import project1.ver08.MenuSelectException;

public class PhoneBookVer08 {

	public static void main(String[] args) {
		PhoneBookManager manager = new PhoneBookManager();//PhoneBookManager의 함수들을 사용
		AutoSaverT autoSaver = new AutoSaverT(manager);
		autoSaver.setDaemon(true);
		
		manager.callPhoneBook();//이미 저장된 값들을 불러옴
		Scanner sc = new Scanner(System.in);
		int inputNum;
		while(true) {
			manager.printMenu();
			try {
				inputNum = sc.nextInt();
				if(inputNum>6 || inputNum<1) {
					MenuSelectException e = new MenuSelectException();
					throw e;
				}
				switch(inputNum) {
				
					case MenuItem.ONE:
						System.out.println("데이터 입력을 시작합니다.");
						manager.dataInput();
						break;
					case MenuItem.TWO:
						manager.dataSearch();
						break;
					case MenuItem.THR:
						manager.dataDelete();
						break;
					case MenuItem.FOUR:
						manager.dataAllShow();
						break;
					case MenuItem.FIVE:
						System.out.println("==저장옵션선택==");
						System.out.println("저장옵션을 선택하세요.");
						System.out.println("1.자동저장On, 2.자동저장Off");
						System.out.print("선택:");
						int answer=sc.nextInt();
						if(answer==1) {
							autoSaver.start();
							System.out.println("자동저장on");
						}
						else if(answer==2) {
							autoSaver.interrupt(); 
							System.out.println("자동저장off");
							break;
						}
						break;
					case MenuItem.SIX:
						manager.savePhoneBook();//위에서 받은 값들을 저장하기 위해서
						System.out.println("obj 파일로 저장되었습니다.");
						System.out.println("프로그램을 종료합니다.");
						System.exit(0);
					}
				}
			catch(MenuSelectException e) {
				System.out.println(e.getMessage());
			}
			catch(InputMismatchException e) {
				e.printStackTrace();
				sc.nextLine();
			}
			catch(NullPointerException e) {
				e.printStackTrace();
				sc.nextLine();
			}
			catch(IllegalThreadStateException e) {
				if(autoSaver.isAlive()) {
					autoSaver.interrupt();
					System.out.println("자동저장이 이미 실행중입니다.");
				}
				autoSaver=new AutoSaverT(manager);
				autoSaver.start();
			}
		}
		
	}
	
	
}

