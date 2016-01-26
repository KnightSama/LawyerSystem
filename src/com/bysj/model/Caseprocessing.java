package com.bysj.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Caseprocessing {
	private String caseID;
	private String service;
	private String bullentinTime;
	private String sittingTime;
	private String singleInquisition;
	private String joinInquisition;
	private String adjournmentTime;
	private String adjPrecidingJudgeTime;
	private String adjDeanTime;
	private String adjIntermediateTime;
	private String fileTime;
	private String memo;

	@Id
	public String getCaseID() {
		return caseID;
	}

	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getBullentinTime() {
		return bullentinTime;
	}

	public void setBullentinTime(String bullentinTime) {
		this.bullentinTime = bullentinTime;
	}

	public String getSittingTime() {
		return sittingTime;
	}

	public void setSittingTime(String sittingTime) {
		this.sittingTime = sittingTime;
	}

	public String getSingleInquisition() {
		return singleInquisition;
	}

	public void setSingleInquisition(String singleInquisition) {
		this.singleInquisition = singleInquisition;
	}

	public String getJoinInquisition() {
		return joinInquisition;
	}

	public void setJoinInquisition(String joinInquisition) {
		this.joinInquisition = joinInquisition;
	}

	public String getAdjournmentTime() {
		return adjournmentTime;
	}

	public void setAdjournmentTime(String adjournmentTime) {
		this.adjournmentTime = adjournmentTime;
	}

	public String getAdjPrecidingJudgeTime() {
		return adjPrecidingJudgeTime;
	}

	public void setAdjPrecidingJudgeTime(String adjPrecidingJudgeTime) {
		this.adjPrecidingJudgeTime = adjPrecidingJudgeTime;
	}

	public String getAdjDeanTime() {
		return adjDeanTime;
	}

	public void setAdjDeanTime(String adjDeanTime) {
		this.adjDeanTime = adjDeanTime;
	}

	public String getAdjIntermediateTime() {
		return adjIntermediateTime;
	}

	public void setAdjIntermediateTime(String adjIntermediateTime) {
		this.adjIntermediateTime = adjIntermediateTime;
	}

	public String getFileTime() {
		return fileTime;
	}

	public void setFileTime(String fileTime) {
		this.fileTime = fileTime;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}
