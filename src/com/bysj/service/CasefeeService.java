package com.bysj.service;

import java.util.List;

import com.bysj.model.Caseends;
import com.bysj.model.Casefee;

public interface CasefeeService {
	public void add(Casefee casefee);
	public List<Casefee> find(String caseID);
	public void delete(String caseID);
    public void update(Casefee casefee);
    public String findClient(String caseID);
}
