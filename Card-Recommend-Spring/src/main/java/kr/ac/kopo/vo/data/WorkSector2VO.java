package kr.ac.kopo.vo.data;

public class WorkSector2VO {
	private int workSector1Code;
	private int workSector2Code;
	private String workSector2Name;
	public int getWorkSector1Code() {
		return workSector1Code;
	}
	public void setWorkSector1Code(int workSector1Code) {
		this.workSector1Code = workSector1Code;
	}
	public int getWorkSector2Code() {
		return workSector2Code;
	}
	public void setWorkSector2Code(int workSector2Code) {
		this.workSector2Code = workSector2Code;
	}
	public String getWorkSector2Name() {
		return workSector2Name;
	}
	public void setWorkSector2Name(String workSector2Name) {
		this.workSector2Name = workSector2Name;
	}
	@Override
	public String toString() {
		return "WorkSector2VO [workSector1Code=" + workSector1Code + ", workSector2Code=" + workSector2Code
				+ ", workSector2Name=" + workSector2Name + "]";
	}

	
}
