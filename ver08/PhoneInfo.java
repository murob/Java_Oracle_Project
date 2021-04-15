package project1.ver08;

import java.io.Serializable;

public class PhoneInfo implements Serializable {//부모가 임프리먼트 받으면 자식들도 받으니 자식에서는 임플리먼트 해주지 않아도 된다.
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
