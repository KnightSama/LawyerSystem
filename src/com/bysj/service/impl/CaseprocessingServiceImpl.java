package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.CaseprocessingDao;
import com.bysj.model.Caseprocessing;
import com.bysj.service.CaseprocessingService;

@Component("CaseprocessingService")
public class CaseprocessingServiceImpl implements CaseprocessingService {
	private CaseprocessingDao caseprocessingDao;

	public CaseprocessingDao getCaseprocessingDao() {
		return caseprocessingDao;
	}

	@Resource
	public void setCaseprocessingDao(CaseprocessingDao caseprocessingDao) {
		this.caseprocessingDao = caseprocessingDao;
	}

	@Override
	public void add(Caseprocessing caseprocessing) {
		// TODO Auto-generated method stub
		caseprocessingDao.add(caseprocessing);
	}

	@Override
	public List<Caseprocessing> find(String caseID) {
		// TODO Auto-generated method stub
		return caseprocessingDao.find(caseID);
	}

	@Override
	public void delete(String caseID) {
		// TODO Auto-generated method stub
		caseprocessingDao.delete(caseID);
	}

	@Override
	public void update(Caseprocessing caseprocessing) {
		// TODO Auto-generated method stub
		caseprocessingDao.update(caseprocessing);
	}

}
