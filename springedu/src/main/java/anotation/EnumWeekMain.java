package anotation;

import java.util.Calendar;

public class EnumWeekMain {
	public static void main(String[] args) {
		Week day = null;
	  Calendar cal = Calendar.getInstance();
		int week = cal.get(Calendar.DAY_OF_WEEK);
		
		switch(week) {
		case 1: day =  Week.sunday;
						break;
		case 2: day =  Week.monday;
						break;
		case 3: day =  Week.tuesday;
						break;
		case 4: day =  Week.wednesday;
						break;
		case 5: day =  Week.thursday;
						break;
		case 6: day =  Week.friday;
						break;
		case 7: day =  Week.saturday;
		}
		System.out.println("오늘 요일 : " + day);
		System.out.println("월요일 자바공부시간" + day.getStydyHour());
		System.out.println("요일별 자바공부시간");
		Week[] weeks = Week.values();
		for(Week k : weeks) {
			System.out.println(
					k.name() + 
					" : " + 
					k.getStydyHour() + 
					" : " +
					k.getRestHour() +
					" : " +
					k.getRestHour2() +
					" : " +
					k.getSleep());
		}
		System.out.println(Week.sunday.getRestHour());
		System.out.println(Week.sunday.getRestHour2());
	}
		
}
