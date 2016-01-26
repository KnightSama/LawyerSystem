package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.CaseendsDao;
import com.bysj.model.Caseends;
import com.bysj.service.CaseendsService;

@Component("CaseendsService")
public class CaseendsServiceImpl implements CaseendsService {
	private CaseendsDao caseendsDao;

	public CaseendsDao getCaseendsDao() {
		return caseendsDao;
	}

	@Resource
	public void setCaseendsDao(CaseendsDao caseendsDao) {
		this.caseendsDao = caseendsDao;
	}

	@Override
	public void add(Caseends caseends) {
		// TODO Auto-generated method stub
		caseendsDao.add(caseends);
	}

	@Override
	public List<Caseends> find(String caseID) {
		// TODO Auto-generated method stub
		return caseendsDao.find(caseID);
	}

	@Override
	public void delete(String caseID) {
		// TODO Auto-generated method stub
		caseendsDao.delete(caseID);
	}

	@Override
	public void update(Caseends caseends) {
		// TODO Auto-generated method stub
		caseendsDao.update(caseends);
	}

}
