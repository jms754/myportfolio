package anotation;

public enum Week {
	
	monday(1) {
		@Override
		double getRestHour2() {
			return this.getStydyHour() * 1;
		}
	},
	tuesday(2) {
		@Override
		double getRestHour2() {
			return this.getStydyHour() * 2;
		}
	},
	wednesday(3) {
		@Override
		double getRestHour2() {
			return this.getStydyHour() * 3;
		}
	},
	thursday(3) {
		@Override
		double getRestHour2() {
			return this.getStydyHour() * 4;
		}
	},
	friday(3) {
		double getRestHour2() {
			return this.getStydyHour() * 5;
		}
	},
	saturday(0) {
		double getRestHour2() {
			return this.getStydyHour() * 6;
		}
	},
	sunday(4,12) {
		int restHour = 7;
		@Override
		double getRestHour2() {
			return this.getStydyHour() * restHour;
		}
	};
	
	private final int hour;		//공부시간
	private final int sleep;		//취침시간
	Week(int hour) {
		this.hour = hour;
		this.sleep = 10;
	}
	
	Week(int hour, int hour2) {
		this.hour = hour;
		this.sleep = hour2;
	}
	
	private static final double restHour = 0.5; 	//휴식시간
	public int getStydyHour() {
		return this.hour;
	}
	
	public double getRestHour() {
		return this.hour * restHour;
	}
	
	public int getSleep() {
		return this.sleep;
	}
	abstract double getRestHour2();
}
