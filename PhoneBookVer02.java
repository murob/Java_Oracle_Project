package project1;

import java.util.InputMismatchException;
import java.util.Scanner;

import project1.ver02.PhoneInfo;

public class PhoneBookVer02 {

	public static void main(String[] args) {
		try{
			while(true) {
				Scanner sc = new Scanner(System.in);
				System.out.println("선택하세요..\n1.데이터입력\n2.프로그램 종료");
				System.out.print("선택:");
				int choice = sc.nextInt();
				if(choice==1) {
					inputPhoneInfo();
				}
				else if(choice==2) {
					System.out.println("프로그램을종료합니다.");
					break;
				}
				else
					System.out.println("숫자 (1), (2) 중 하나를 입력하세요.");
				continue;
			}
		}
		catch(InputMismatchException e) {
			e.printStackTrace();
			System.out.println("문자가 아닌 숫자를 입력하세요.");
		}

	}
	public static void inputPhoneInfo() {
		Scanner sc = new Scanner(System.in);
		System.out.print("이름:");
		String name = sc.nextLine();
		
		System.out.print("전화번호:");
		String phoneNumber = sc.nextLine();
		
		System.out.print("생년월일:");
		String birthday = sc.nextLine();
		
		System.out.println();
		System.out.println("입력된 정보 출력...");
		PhoneInfo phoneInfo	= new PhoneInfo(name, phoneNumber, birthday);
		phoneInfo.showPhoneInfo();
		System.out.println();
	}

}
