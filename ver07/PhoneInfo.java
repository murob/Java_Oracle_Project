package project1.ver07;

import java.util.Scanner;

public class PhoneInfo {
	Scanner scan = new Scanner(System.in);
	String name;
	String phoneNumber;
	String birthday;
	
	public PhoneInfo() {
		
	}
	
	public PhoneInfo(String name, String phoneNumber) {
		this.name = name;
		this.phoneNumber = phoneNumber;
	}
	
	public PhoneInfo(String name, String phoneNumber, String birthday) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.birthday = birthday;
	}
	
	public void showPhoneInfo() {
		System.out.printf("이름:%s\n전화번호:%s\n생년월일:%s", name, phoneNumber, birthday);
		System.out.println();
	}
	
	@Override
	public int hashCode() {
		System.out.println(name+"="+name.hashCode());
		return name.hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		System.out.println(name+"=>equals(호출됨)");
		PhoneInfo phoneInfo = (PhoneInfo)obj;
		if(this.name.equals(phoneInfo.name)) {
			return true;
		}
		else
			return false;
	}
}
