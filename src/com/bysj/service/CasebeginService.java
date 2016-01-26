package com.bysj.service;

import java.util.List;

import com.bysj.model.Casebegin;
import com.bysj.util.CaseFind;

public interface CasebeginService {
	public void add(Casebegin casebegin);
	public boolean hasCase(String caseID);
	public List<Casebegin> find(String caseID);
	public List<Casebegin> find(CaseFind caseFind);
	public void delete(String caseID);
	public void update(Casebegin casebegin);

}
