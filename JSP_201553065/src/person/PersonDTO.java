package person;

public class PersonDTO {
	private String empno;
	private String empname;
	private String deptcode;
	private String hiredate;
	private String position;
	
	
	public PersonDTO() {
		super();
	}
	
	public String getempno() {
		return empno;
	}
	public void setempno(String empno) {
		this.empno = empno;
	}
	public String getempname() {
		return empname;
	}
	public void setempname(String empname) {
		this.empname = empname;
	}
	public String getdeptcode() {
		return deptcode;
	}
	public void setdeptcode(String deptcode) {
		this.deptcode = deptcode;
	}
	public String gethiredate() {
		return hiredate;
	}
	public void sethiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getposition() {
		return position;
	}
	public void setposition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "PersonDTO [empno=" + empno + ", empname=" + empname + ", deptcode=" + deptcode + ", hiredate=" + hiredate + ", position=" + position + "]";
	}
}