package com.bysj.dao;

import java.util.List;

import com.bysj.model.Caseends;


public interface CaseendsDao {
	public boolean add(Caseends caseends);
	public List<Caseends> find(String CaseID);
	public boolean delete(String CaseID);
	public boolean update(Caseends caseends);

}
