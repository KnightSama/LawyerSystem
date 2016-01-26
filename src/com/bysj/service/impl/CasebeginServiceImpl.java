package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.CasebeginDao;
import com.bysj.model.Casebegin;
import com.bysj.service.CasebeginService;
import com.bysj.util.CaseFind;

@Component("CasebeginService")
public class CasebeginServiceImpl implements CasebeginService {
	private CasebeginDao casebeginDao;

	public CasebeginDao getCasebeginDao() {
		return casebeginDao;
	}

	@Resource
	public void setCasebeginDao(CasebeginDao casebeginDao) {
		this.casebeginDao = casebeginDao;
	}

	@Override
	public void add(Casebegin casebegin) {
		// TODO Auto-generated method stub
		casebeginDao.add(casebegin);
	}

	@Override
	public boolean hasCase(String caseID) {
		// TODO Auto-generated method stub
		if(casebeginDao.find(caseID).isEmpty())
			return false;
		return true;
	}

	@Override
	public List<Casebegin> find(String caseID) {
		// TODO Auto-generated method stub
		return casebeginDao.find(caseID);
	}

	@Override
	public List<Casebegin> find(CaseFind caseFind) {
		// TODO Auto-generated method stub
		return casebeginDao.find(caseFind);
	}

	@Override
	public void delete(String caseID) {
		// TODO Auto-generated method stub
		casebeginDao.delete(caseID);
	}

	@Override
	public void update(Casebegin casebegin) {
		// TODO Auto-generated method stub
		casebeginDao.update(casebegin);
	}

}
