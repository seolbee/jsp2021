package VO;

public class CourseVO {
	private String id;
	private String name;
	private int credit;
	private String lecturer;
	private String week;
	private Integer start_hour;
	private Integer end_end;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getLecturer() {
		return lecturer;
	}
	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public int getStart_hour() {
		return start_hour;
	}
	public void setStart_hour(int start_hour) {
		this.start_hour = start_hour;
	}
	public int getEnd_end() {
		return end_end;
	}
	public void setEnd_end(int end_end) {
		this.end_end = end_end;
	}
	
	
}
