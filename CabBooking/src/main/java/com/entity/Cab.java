package com.entity;

public class Cab {
	private int id;
	private String cabNo;
	private String cabType;
	private int noSeats;
	private int dId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCabNo() {
		return cabNo;
	}
	public void setCabNo(String cabNo) {
		this.cabNo = cabNo;
	}
	public String getCabType() {
		return cabType;
	}
	public void setCabType(String cabType) {
		this.cabType = cabType;
	}
	public int getNoSeats() {
		return noSeats;
	}
	public void setNoSeats(int noSeats) {
		this.noSeats = noSeats;
	}
	
	public void setDId(int dId) {
		this.dId = dId;
	}
	public int getDId() {
		return dId;
	}
}
