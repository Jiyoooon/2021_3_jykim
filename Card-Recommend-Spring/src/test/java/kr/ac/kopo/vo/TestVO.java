package kr.ac.kopo.vo;

import java.util.List;

public class TestVO {
	private int id;
	private String colToUpdate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getColToUpdate() {
		return colToUpdate;
	}
	public void setColToUpdate(String colToUpdate) {
		this.colToUpdate = colToUpdate;
	}
	@Override
	public String toString() {
		return "TestVO [id=" + id + ", colToUpdate=" + colToUpdate + "]";
	}
	
		
	
}
