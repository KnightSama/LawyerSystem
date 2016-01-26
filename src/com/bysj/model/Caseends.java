package com.bysj.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Caseends {
	
	private String caseID;
	private String joinAdjusdgementTime;
	private String presidingJudgeTime;
	private String jurorTime;
	private String chiefJusticeTime;
	private String deanTime;
	private String adjudgementTime;
	private String effectTime;
	private String executeApplication;
	private String kindOfEndACase;
	private String caseEndTime;
	private String reportTime;
	private String adjudicateCondition;
	private String deliverTime;
	private String appeal;
	private String appealTime;
	
	public String getAppealTime() {
		return appealTime;
	}
	public void setAppealTime(String appealTime) {
		this.appealTime = appealTime;
	}
	public String getAppeal() {
		return appeal;
	}
	public void setAppeal(String appeal) {
		this.appeal = appeal;
	}
	@Id
	public String getCaseID() {
		return caseID;
	}
	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}
	public String getJoinAdjusdgementTime() {
		return joinAdjusdgementTime;
	}
	public void setJoinAdjusdgementTime(String joinAdjusdgementTime) {
		this.joinAdjusdgementTime = joinAdjusdgementTime;
	}
	public String getPresidingJudgeTime() {
		return presidingJudgeTime;
	}
	public void setPresidingJudgeTime(String presidingJudgeTime) {
		this.presidingJudgeTime = presidingJudgeTime;
	}
	public String getJurorTime() {
		return jurorTime;
	}
	public void setJurorTime(String jurorTime) {
		this.jurorTime = jurorTime;
	}
	public String getChiefJusticeTime() {
		return chiefJusticeTime;
	}
	public void setChiefJusticeTime(String chiefJusticeTime) {
		this.chiefJusticeTime = chiefJusticeTime;
	}
	public String getDeanTime() {
		return deanTime;
	}
	public void setDeanTime(String deanTime) {
		this.deanTime = deanTime;
	}
	public String getAdjudgementTime() {
		return adjudgementTime;
	}
	public void setAdjudgementTime(String adjudgementTime) {
		this.adjudgementTime = adjudgementTime;
	}
	public String getEffectTime() {
		return effectTime;
	}
	public void setEffectTime(String effectTime) {
		this.effectTime = effectTime;
	}
	public String getExecuteApplication() {
		return executeApplication;
	}
	public void setExecuteApplication(String executeApplication) {
		this.executeApplication = executeApplication;
	}
	public String getKindOfEndACase() {
		return kindOfEndACase;
	}
	public void setKindOfEndACase(String kindOfEndACase) {
		this.kindOfEndACase = kindOfEndACase;
	}
	public String getCaseEndTime() {
		return caseEndTime;
	}
	public void setCaseEndTime(String caseEndTime) {
		this.caseEndTime = caseEndTime;
	}
	public String getReportTime() {
		return reportTime;
	}
	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}
	public String getAdjudicateCondition() {
		return adjudicateCondition;
	}
	public void setAdjudicateCondition(String adjudicateCondition) {
		this.adjudicateCondition = adjudicateCondition;
	}
	public String getDeliverTime() {
		return deliverTime;
	}
	public void setDeliverTime(String deliverTime) {
		this.deliverTime = deliverTime;
	}
	
	

}
