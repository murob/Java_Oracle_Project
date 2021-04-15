package project1.ver07;

public class PhoneSchoolInfo extends PhoneInfo {
	String subject;
	int grade;
	
	public PhoneSchoolInfo(String name, String phone, String subject, int grade) {
		super(name, phone);
		this.subject = subject;
		this.grade = grade;
	}
	
	public PhoneSchoolInfo(String name, String phoneNumber, String birthday, String subject, int grade){
		super(name, phoneNumber, birthday);
		this.subject = subject;
		this.grade = grade;
	}
	
	@Override
	public void showPhoneInfo() {
		System.out.printf("이름:%s\n전화번호:%s\n전공:%s\n학년:%d", name, phoneNumber, subject, grade);
		System.out.println();
	}
}
