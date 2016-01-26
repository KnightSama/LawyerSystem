package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.CasefeeDao;
import com.bysj.model.Casefee;
import com.bysj.service.CasefeeService;

@Component("CasefeeService")
public class CasefeeServiceImpl implements CasefeeService {

	private CasefeeDao casefeeDao;

	public CasefeeDao getCasefeeDao() {
		return casefeeDao;
	}

	@Resource
	public void setCasefeeDao(CasefeeDao casefeeDao) {
		this.casefeeDao = casefeeDao;
	}

	@Override
	public void add(Casefee casefee) {
		// TODO Auto-generated method stub
		casefeeDao.add(casefee);
	}

	@Override
	public List<Casefee> find(String caseID) {
		// TODO Auto-generated method stub
		return casefeeDao.find(caseID);
	}

	@Override
	public void delete(String caseID) {
		// TODO Auto-generated method stub
		casefeeDao.delete(caseID);
	}

	@Override
	public void update(Casefee casefee) {
		// TODO Auto-generated method stub
		casefeeDao.update(casefee);
	}

	@Override
	public String findClient(String caseID) {
		// TODO Auto-generated method stub
		return casefeeDao.findClient(caseID);
	}

}
