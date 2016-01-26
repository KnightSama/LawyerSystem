package com.bysj.service;

import java.util.List;
import com.bysj.model.Employee;
import com.bysj.util.EmployeeFind;


public interface EmployeeService {
      public void add(Employee employee);
  	public List<Employee> find(EmployeeFind employeeFind);
  	public List<Employee> find(int lawyerID);
  	public void delete(int lawyerID);
      public void update(Employee employee);
      public void updateNum(String lawyerID);
}
