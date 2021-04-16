package project1.ver08;

public class PhoneCompanyInfo extends PhoneInfo {
	String company;
	
	public PhoneCompanyInfo(String name, String phoneNumber, String company) {
		super(name, phoneNumber);
		this.company = company;
	}
	
	@Override
	public void showPhoneInfo() {
		System.out.printf("이름:%s\n전화번호:%s\n회사:%s", name, phoneNumber, company);
		System.out.println();
	}
	
	@Override
	public String toString() {
		return "이름:" + name + " 전화번호:" + phoneNumber + " 회사:" +company;
	}
}
