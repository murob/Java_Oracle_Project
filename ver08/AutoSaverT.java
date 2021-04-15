package project1.ver08;

public class AutoSaverT extends Thread {
	
	PhoneBookManager manager;
	public AutoSaverT(PhoneBookManager manager) {
		super();
		this.manager = manager;
	}
	
	@Override
	public void run() {
		try {
			while(true) {
				manager.autoSave();
				sleep(5000);
				System.out.println("--자동저장진행--");
			}
		} 
		catch (InterruptedException e) {
			
		}
	}
}
