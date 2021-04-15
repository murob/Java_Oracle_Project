package project1.ver07;

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
}
