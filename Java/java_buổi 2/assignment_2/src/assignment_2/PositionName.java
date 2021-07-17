package assignment_2;

public enum PositionName {
DEV(0),SCRUM(1),MASTER(2),PM(3);
	
	private int value; 
		
	
	PositionName(int value){
	}
	public int getValue() {
		return value;
	}
}
