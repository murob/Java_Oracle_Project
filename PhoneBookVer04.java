package project1;

import java.util.Scanner;

import project1.ver04.PhoneBookManager;
import project1.ver06.MenuSelectException;

public class PhoneBookVer04 {

	public static void main(String[] args) throws MenuSelectException {
		PhoneBookManager Manager = new PhoneBookManager(); 
		Manager.printMenu();
	}
	
}

