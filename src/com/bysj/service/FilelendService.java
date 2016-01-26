package com.bysj.service;

import java.util.List;

import com.bysj.model.Caseprocessing;
import com.bysj.model.Filelend;

public interface FilelendService {
	public void add(Filelend filelend);
	public List<Filelend> find(String caseID);
	public void delete(String caseID);
	public void update(Filelend filelend);
}
