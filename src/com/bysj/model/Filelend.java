package com.bysj.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Filelend {
	private int ID;
	private String caseID;
	private String lendTo;
	private String cManOfLend;
	private String lendFileTime;
	private String lendFileReason;
	private String backTime;
	private String appealMoveFileTime;
	private String appealBackFileTime;
	private String moveTo;
	private String moveReason;
	private String moveTime;
	private String moveMemo;

	@Id
	@GeneratedValue
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getCaseID() {
		return caseID;
	}

	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}

	public String getLendTo() {
		return lendTo;
	}

	public void setLendTo(String lendTo) {
		this.lendTo = lendTo;
	}

	public String getcManOfLend() {
		return cManOfLend;
	}

	public void setcManOfLend(String cManOfLend) {
		this.cManOfLend = cManOfLend;
	}

	public String getLendFileTime() {
		return lendFileTime;
	}

	public void setLendFileTime(String lendFileTime) {
		this.lendFileTime = lendFileTime;
	}

	public String getLendFileReason() {
		return lendFileReason;
	}

	public void setLendFileReason(String lendFileReason) {
		this.lendFileReason = lendFileReason;
	}

	public String getBackTime() {
		return backTime;
	}

	public void setBackTime(String backTime) {
		this.backTime = backTime;
	}

	public String getAppealMoveFileTime() {
		return appealMoveFileTime;
	}

	public void setAppealMoveFileTime(String appealMoveFileTime) {
		this.appealMoveFileTime = appealMoveFileTime;
	}

	public String getAppealBackFileTime() {
		return appealBackFileTime;
	}

	public void setAppealBackFileTime(String appealBackFileTime) {
		this.appealBackFileTime = appealBackFileTime;
	}

	public String getMoveTo() {
		return moveTo;
	}

	public void setMoveTo(String moveTo) {
		this.moveTo = moveTo;
	}

	public String getMoveReason() {
		return moveReason;
	}

	public void setMoveReason(String moveReason) {
		this.moveReason = moveReason;
	}

	public String getMoveTime() {
		return moveTime;
	}

	public void setMoveTime(String moveTime) {
		this.moveTime = moveTime;
	}

	public String getMoveMemo() {
		return moveMemo;
	}

	public void setMoveMemo(String moveMemo) {
		this.moveMemo = moveMemo;
	}

}
