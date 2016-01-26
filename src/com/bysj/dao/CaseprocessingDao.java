package com.bysj.dao;

import java.util.List;

import com.bysj.model.Caseprocessing;

public interface CaseprocessingDao {
	public boolean add(Caseprocessing caseprocessing);

	public List<Caseprocessing> find(String CaseID);

	public boolean delete(String CaseID);
	public boolean update(Caseprocessing caseprocessing);
}
