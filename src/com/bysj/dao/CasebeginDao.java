package com.bysj.dao;

import java.util.List;

import com.bysj.model.Casebegin;
import com.bysj.util.CaseFind;

public interface CasebeginDao {
	public boolean add(Casebegin casebegin);
	public List<Casebegin> find(String CaseID);
	public List<Casebegin> find(CaseFind caseFind);
	public boolean delete(String CaseID);
	public boolean update(Casebegin casebegin);

}
