package com.bysj.dao;

import java.util.List;


import com.bysj.model.Employee;
import com.bysj.util.EmployeeFind;


public interface EmployeeDao {
	public boolean add(Employee employee);
	public List<Employee> find(int lawyerID);
	public List<Employee> find(EmployeeFind employeeFind);
	public boolean delete(int lawyerID);
	public boolean update(Employee employee);
  
}
