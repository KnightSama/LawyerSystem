package com.bysj.service;

import java.util.List;

import com.bysj.model.Caseends;

public interface CaseendsService {
	public void add(Caseends caseends);
	public List<Caseends> find(String caseID);
	public void delete(String caseID);
	public void update(Caseends caseends);

}
