package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.FilelendDao;
import com.bysj.model.Filelend;
import com.bysj.service.FilelendService;

@Component("FilelendService")
public class FilelendServiceImpl implements FilelendService {
	private FilelendDao filelendDao;

	public FilelendDao getFilelendDao() {
		return filelendDao;
	}

	@Resource
	public void setFilelendDao(FilelendDao filelendDao) {
		this.filelendDao = filelendDao;
	}

	@Override
	public void add(Filelend filelend) {
		// TODO Auto-generated method stub
		filelendDao.add(filelend);
	}

	@Override
	public List<Filelend> find(String caseID) {
		// TODO Auto-generated method stub
		return filelendDao.find(caseID);
	}

	@Override
	public void delete(String caseID) {
		// TODO Auto-generated method stub
		filelendDao.delete(caseID);
	}

	@Override
	public void update(Filelend filelend) {
		// TODO Auto-generated method stub
		filelendDao.update(filelend);
	}

}
