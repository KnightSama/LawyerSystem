package com.bysj.service;

import java.util.List;

import com.bysj.model.Casefee;
import com.bysj.model.Caseprocessing;

public interface CaseprocessingService {
	public void add(Caseprocessing caseprocessing);
	public List<Caseprocessing> find(String caseID);
	public void delete(String caseID);
	public void update(Caseprocessing caseprocessing);
}
