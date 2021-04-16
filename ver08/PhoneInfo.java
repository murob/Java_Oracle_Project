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
	
	
	//HashSet은 기본적으로 객체를 중복해서 저장하지 않는다.
	@Override
	public int hashCode() {
		return name.hashCode();//비교 대상을 name값으로 비교해서 equals로 보내줌
		//name값이 같으면 equals로 보내서 값들의 중복 값을 비교
	}
	
	@Override
	public boolean equals(Object obj) {
		System.out.println(name+"=>equals(호출됨)");
		PhoneInfo phoneInfo = (PhoneInfo)obj;
		if(this.name.equals(phoneInfo.name)){
			return true;//equals값이 true라는 것은 중복값이 있다는 것이므로 HashSet에 저장이 될 수 없음
		}
		else
			return false;//equals값이 false라는 것은 중복값이 없다는 것이므로 저장이 가능하다.
	}
	
	@Override
		public String toString() {
			return ("이름:"+ name + " 전화번호:" + phoneNumber + " 생일:" + birthday);
		}
}
