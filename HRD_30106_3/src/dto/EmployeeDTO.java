package dto;

public class EmployeeDTO {
	private int empno;
	private String empname;
	private String joindate;
	private String rank;
	private String dept;
	
	public int getEmpno() {
		return empno;
	}
	
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	public String getEmpname() {
		return empname;
	}
	
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	
	public String getJoindate() {
		return joindate;
	}
	
	public void setJoindate(String joinDate) {
		this.joindate = joinDate;
	}
	
	public String getRank() {
		return rank;
	}
	
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	public String getDept() {
		return dept;
	}
	
	public void setDept(String dept) {
		this.dept = dept;
	}
	
}
