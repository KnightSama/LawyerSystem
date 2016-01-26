package com.bysj.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Casefee {
	private String caseID;
	private String legalCost;
	private String maintainCost;
	private String transactCost;
	private String shouldCost;
	private String costRecieved;
	private String costRemain;
	
	@Id
	public String getCaseID() {
		return caseID;
	}
	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}
	public String getLegalCost() {
		return legalCost;
	}
	public void setLegalCost(String legalCost) {
		this.legalCost = legalCost;
	}
	public String getMaintainCost() {
		return maintainCost;
	}
	public void setMaintainCost(String maintainCost) {
		this.maintainCost = maintainCost;
	}
	public String getTransactCost() {
		return transactCost;
	}
	public void setTransactCost(String transactCost) {
		this.transactCost = transactCost;
	}
	public String getShouldCost() {
		return shouldCost;
	}
	public void setShouldCost(String shouldCost) {
		this.shouldCost = shouldCost;
	}
	public String getCostRecieved() {
		return costRecieved;
	}
	public void setCostRecieved(String costRecieved) {
		this.costRecieved = costRecieved;
	}
	public String getCostRemain() {
		return costRemain;
	}
	public void setCostRemain(String costRemain) {
		this.costRemain = costRemain;
	}
	
	
	

}
