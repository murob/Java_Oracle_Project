package project1;

import java.util.Scanner;

import project1.ver03.PhoneBookManager;

public class PhoneBookVer03 {

	public static void main(String[] args) {
		PhoneBookManager manager = new PhoneBookManager(); 
		
		while(true) {
			manager.printMenu();
			Scanner sc = new Scanner(System.in);

			int inputNum = sc.nextInt();
			if(inputNum==1) {
				manager.dataInput();
			}
			else if(inputNum==2) {
				manager.dataSearch();
			}
			else if(inputNum==3) {
				manager.dataDelete();
			}
			else if(inputNum==4) {
				manager.dataAllShow();
			}
			else if(inputNum==5) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
		}
	}
	
}
