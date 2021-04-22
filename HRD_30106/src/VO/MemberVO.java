package VO;

public class MemberVO {
	private String p_no;
	private String p_name;
	private String p_birth;
	private String p_phone;
	private String p_gender;
	private String p_city;
	
	public MemberVO(String p_no, String p_name, String p_birth, String p_phone, String p_gender, String p_city) {
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_birth = p_birth;
		this.p_phone = p_phone;
		this.p_gender = p_gender;
		this.p_city = p_city;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_birth() {
		return p_birth;
	}
	public void setP_birth(String p_birth) {
		this.p_birth = p_birth;
	}
	public String getP_phone() {
		return p_phone;
	}
	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public String getP_city() {
		return p_city;
	}
	public void setP_city(String p_city) {
		this.p_city = p_city;
	}
	
	
}
