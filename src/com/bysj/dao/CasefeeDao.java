package com.bysj.dao;

import java.util.List;

import com.bysj.model.Casefee;

public interface CasefeeDao {
	public boolean add(Casefee casefee);
	public List<Casefee> find(String CaseID);
	public boolean delete(String CaseID);
	public boolean update(Casefee casefee);
	public String findClient(String caseID);
}
