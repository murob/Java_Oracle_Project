package project1.ver02;

public class PhoneInfo {
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
}
