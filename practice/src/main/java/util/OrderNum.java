package util;

import java.time.LocalDate;

public class OrderNum {

	public String  getOrderNum() {
		
		String num = "";
		
		LocalDate localdate = LocalDate.now();
		

		String year = String.valueOf(localdate.getYear());
		String month =  String.valueOf(localdate.getMonthValue());
		String day =  String.valueOf(localdate.getDayOfMonth());
		String number = String.valueOf((int)Math.floor((Math.random()*10000000)));
		
		num+=year+month+day+number;

		
		
		return num;
		
		
	}
	
}
