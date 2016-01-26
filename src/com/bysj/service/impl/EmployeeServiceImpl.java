package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.ClientDao;
import com.bysj.dao.EmployeeDao;
import com.bysj.model.Client;
import com.bysj.model.Employee;
import com.bysj.service.EmployeeService;
import com.bysj.util.EmployeeFind;

@Component("EmployeeService")
public class EmployeeServiceImpl implements EmployeeService{
	
	private EmployeeDao employeeDao;
	private ClientDao clientDao;

	public ClientDao getClientDao() {
		return clientDao;
	}
	@Resource
	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}
	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}
@Resource
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Override
	public void add(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.add(employee);
	}
	@Override
	public List<Employee> find(EmployeeFind employeeFind) {
		// TODO Auto-generated method stub
		return employeeDao.find(employeeFind);
	}
	@Override
	public List<Employee> find(int lawyerID) {
		// TODO Auto-generated method stub
		return employeeDao.find(lawyerID);
	}
	@Override
	public void delete(int lawyerID) {
		// TODO Auto-generated method stub
		employeeDao.delete(lawyerID);
	}
	@Override
	public void update(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.update(employee);
	}
	@Override
	public void updateNum(String lawyerID) {
		// TODO Auto-generated method stub
		int num = clientDao.lawyerNum(lawyerID);
		List<Employee> list = employeeDao.find(Integer.parseInt(lawyerID));
		if(!list.isEmpty()){
			list.get(0).setClientNumber(String.valueOf(num));
			employeeDao.update(list.get(0));
		}
	}

}
