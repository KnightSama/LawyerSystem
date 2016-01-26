package com.bysj.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Casebegin {
	private String caseID;
	private String caseProperty;
	private String lawyerID;
	private String caseStartTime;
	private String caseHandleTime;
	private String caseReason;
	private String indicter;
	private String indictee;
	private String thirdParty;
	private String suitRequest;
	private String suitValue;
	private String suitCost;
	private String belongingsMaintain;
	private String evidenceMaintain;
	
	@Id
	public String getCaseID() {
		return caseID;
	}
	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}
	public String getCaseProperty() {
		return caseProperty;
	}
	public void setCaseProperty(String caseProperty) {
		this.caseProperty = caseProperty;
	}
	public String getLawyerID() {
		return lawyerID;
	}
	public void setLawyerID(String lawyerID) {
		this.lawyerID = lawyerID;
	}
	public String getCaseStartTime() {
		return caseStartTime;
	}
	public void setCaseStartTime(String caseStartTime) {
		this.caseStartTime = caseStartTime;
	}
	public String getCaseHandleTime() {
		return caseHandleTime;
	}
	public void setCaseHandleTime(String caseHandleTime) {
		this.caseHandleTime = caseHandleTime;
	}
	public String getCaseReason() {
		return caseReason;
	}
	public void setCaseReason(String caseReason) {
		this.caseReason = caseReason;
	}
	public String getIndicter() {
		return indicter;
	}
	public void setIndicter(String indicter) {
		this.indicter = indicter;
	}
	public String getIndictee() {
		return indictee;
	}
	public void setIndictee(String indictee) {
		this.indictee = indictee;
	}
	public String getThirdParty() {
		return thirdParty;
	}
	public void setThirdParty(String thirdParty) {
		this.thirdParty = thirdParty;
	}
	public String getSuitRequest() {
		return suitRequest;
	}
	public void setSuitRequest(String suitRequest) {
		this.suitRequest = suitRequest;
	}
	public String getSuitValue() {
		return suitValue;
	}
	public void setSuitValue(String suitValue) {
		this.suitValue = suitValue;
	}
	public String getSuitCost() {
		return suitCost;
	}
	public void setSuitCost(String suitCost) {
		this.suitCost = suitCost;
	}
	public String getBelongingsMaintain() {
		return belongingsMaintain;
	}
	public void setBelongingsMaintain(String belongingsMaintain) {
		this.belongingsMaintain = belongingsMaintain;
	}
	public String getEvidenceMaintain() {
		return evidenceMaintain;
	}
	public void setEvidenceMaintain(String evidenceMaintain) {
		this.evidenceMaintain = evidenceMaintain;
	}
		
	

}
