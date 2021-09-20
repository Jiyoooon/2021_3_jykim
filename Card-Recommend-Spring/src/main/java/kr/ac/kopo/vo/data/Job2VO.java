package kr.ac.kopo.vo.data;

public class Job2VO {
	private int job2Code;
	private String job2Name;
	public int getJob2Code() {
		return job2Code;
	}
	public void setJob2Code(int job2Code) {
		this.job2Code = job2Code;
	}
	public String getJob2Name() {
		return job2Name;
	}
	public void setJob2Name(String job2Name) {
		this.job2Name = job2Name;
	}
	@Override
	public String toString() {
		return "Job2VO [job2Code=" + job2Code + ", job2Name=" + job2Name + "]";
	}
	
	

	
}
