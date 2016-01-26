package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.CansulationDao;
import com.bysj.model.Cansulation;
import com.bysj.service.CansulationService;
@Component("CansulationService")
public class CansulationServiceImpl implements CansulationService {
	
	private CansulationDao cansulationDao;
	
	public CansulationDao getCansulationDao() {
		return cansulationDao;
	}

    @Resource
	public void setCansulationDao(CansulationDao cansulationDao) {
		this.cansulationDao = cansulationDao;
	}


	@Override
	public void addCansulation(Cansulation cansulation) {
		// TODO Auto-generated method stub
        cansulationDao.addCansulation(cansulation);
	}

	@Override
	public List<Cansulation> find() {
		// TODO Auto-generated method stub
		return cansulationDao.find();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		cansulationDao.delete(id);
	}

}
