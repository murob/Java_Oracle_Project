package project1;

import project1.ver06.PhoneBookManager;

import java.util.InputMismatchException;
import java.util.Scanner;

import project1.ver06.MenuItem;
import project1.ver06.MenuSelectException;

public class PhoneBookVer06 {

	public static void main(String[] args) {
		PhoneBookManager Manager = new PhoneBookManager(); 
		Scanner sc = new Scanner(System.in);
		int inputNum;
		while(true) {
			Manager.printMenu();
			try {
				inputNum = sc.nextInt();
				if(inputNum>5 || inputNum<1) {
					MenuSelectException e = new MenuSelectException();
					throw e;
				}
				switch(inputNum) {
				
					case MenuItem.ONE:
						System.out.println("데이터 입력을 시작합니다.");
						Manager.dataInput();
						continue;
					case MenuItem.TWO:
						Manager.dataSearch();
						continue;
					case MenuItem.THR:
						Manager.dataDelete();
						continue;
					case MenuItem.FOUR:
						Manager.dataAllShow();
						continue;
					case MenuItem.FIVE:
						System.out.println("프로그램을 종료합니다.");
						System.exit(inputNum);
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
		}
		
	}
	
	
}

