package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.ManagerDao;
import com.bysj.model.Manager;
import com.bysj.service.ManagerService;
import com.bysj.util.ManagerEdit;
import com.bysj.util.ManagerFind;

@Component("managerService")
public class ManagerServiceImpl implements ManagerService{
	private ManagerDao managerDao;

	public ManagerDao getManagerDao() {
		return managerDao;
	}
    @Resource
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	@Override
	public String check(Manager manager) {
		// TODO Auto-generated method stub
		String result = managerDao.findPassword(manager.getUsername());
		if(result==null)
		   return "null";
		else if (result.equals(manager.getPassword())) {
			return "success";
		}else {
			return "fail";
		}
	}
	@Override
	public void add(Manager manager) {
		// TODO Auto-generated method stub
		managerDao.add(manager);
		
	}
	@Override
	public boolean hasuser(String username) {
		// TODO Auto-generated method stub		
		return managerDao.hasuser(username);
	}
	@Override
	public void changePassword(Manager manager) {
		// TODO Auto-generated method stub
		managerDao.changePassword(manager);
	}
	@Override
	public List<Manager> find(Manager manager) {
		// TODO Auto-generated method stub
		
		return managerDao.find(manager);
	}
	@Override
	public List<Manager> find(ManagerFind managerFind) {
		// TODO Auto-generated method stub
		return managerDao.find(managerFind);
	}
	@Override
	public void delete(String username) {
		// TODO Auto-generated method stub
		managerDao.delete(username);
	}
	@Override
	public List<Manager> find(String username) {
		// TODO Auto-generated method stub
		
		return managerDao.find(username);
	}
	@Override
	public void update(ManagerEdit managerEdit) {
		// TODO Auto-generated method stub
		managerDao.update(managerEdit);
	}
 
}
