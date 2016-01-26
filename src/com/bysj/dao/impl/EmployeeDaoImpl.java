package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.EmployeeDao;
import com.bysj.model.Client;
import com.bysj.model.Employee;
import com.bysj.util.EmployeeFind;

@Component("EmployeeDao")
public class EmployeeDaoImpl implements EmployeeDao{
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	

	@Override
	public boolean add(Employee employee) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(employee);
		return false;
	}

	@Override
	public List<Employee> find(int lawyerID) {
		// TODO Auto-generated method stub
		List<Employee> list = hibernateTemplate.find("from Employee where lawyerID = '"+lawyerID+"'");
		return list;
	}

	@Override
	@Transactional
	public boolean delete(int lawyerID) {
		// TODO Auto-generated method stub
		List<Employee> list = hibernateTemplate.find("from Employee where lawyerID = '"+lawyerID+"'");
		hibernateTemplate.delete(list.get(0));
		return true;
	}

	@Override
	@Transactional
	public boolean update(Employee employee) {
		// TODO Auto-generated method stub
		List<Employee> list = hibernateTemplate.find("from Employee where lawyerID = '"+employee.getLawyerID()+"'");
		list.get(0).setAllowance(employee.getAllowance());
		list.get(0).setBaseSalary(employee.getBaseSalary());
		list.get(0).setBirthArea(employee.getBirthArea());
		list.get(0).setCardID(employee.getCardID());
		list.get(0).setClientNumber(employee.getClientNumber());
		list.get(0).setContractTime(employee.getContractTime());
		list.get(0).setCreditLevel(employee.getCreditLevel());
		list.get(0).setEducation(employee.getEducation());
		list.get(0).setGraduate(employee.getGraduate());
		list.get(0).setGraduateTime(employee.getGraduateTime());
		list.get(0).setHealth(employee.getHealth());
		list.get(0).setHomeAddress(employee.getHomeAddress());
		list.get(0).setHomeTel(employee.getHomeTel());
		list.get(0).setInTime(employee.getInTime());
		list.get(0).setMarrage(employee.getMarrage());
		list.get(0).setMemo(employee.getMemo());
		list.get(0).setMobile(employee.getMobile());
		list.get(0).setName(employee.getName());
		list.get(0).setNation(employee.getNation());
		list.get(0).setSex(employee.getSex());
		list.get(0).setTypeWork(employee.getTypeWork());
		list.get(0).setWork(employee.getWork());
		list.get(0).setWorkSalary(employee.getWorkSalary());
		list.get(0).setWorkTel(employee.getWorkTel());
		list.get(0).setWorkTime(employee.getWorkTime());
		hibernateTemplate.merge(list.get(0));
		return true;
	}

	@Override
	public List<Employee> find(EmployeeFind employeeFind) {
		// TODO Auto-generated method stub
		int mark = 0;
		String sql = "from Employee where";
		if (!employeeFind.getName().equals("")) {
			if (mark == 0)
				sql += " name = '" + employeeFind.getName() + "'";
			else {
				sql += " AND name = '" + employeeFind.getName() + "'";
			}
			mark++;
		}
		if (!employeeFind.getContractTime().equals("")) {
			if (mark == 0)
				sql += " contractTime = '" + employeeFind.getContractTime() + "'";
			else {
				sql += " AND contractTime = '" + employeeFind.getContractTime() + "'";
			}
			mark++;
		}
		if (!employeeFind.getTypeWork().equals("")) {
			if (mark == 0)
				sql += " typeWork = '" + employeeFind.getTypeWork() + "'";
			else {
				sql += " AND typeWork = '" + employeeFind.getTypeWork() + "'";
			}
			mark++;
		}
		if (!employeeFind.getWork().equals("")) {
			if (mark == 0)
				sql += " work = '" + employeeFind.getWork() + "'";
			else {
				sql += " AND work = '" + employeeFind.getWork() + "'";
			}
			mark++;
		}
		if (!employeeFind.getInTime1().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(inTime) >= UNIX_TIMESTAMP('"+employeeFind.getInTime1()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(inTime) >= UNIX_TIMESTAMP('"+employeeFind.getInTime1()+"')";
			}
			mark++;
		}
		if (!employeeFind.getInTime2().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(inTime) <= UNIX_TIMESTAMP('"+employeeFind.getInTime2()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(inTime) <= UNIX_TIMESTAMP('"+employeeFind.getInTime2()+"')";
			}
			mark++;
		}
		if (!employeeFind.getWorkTime1().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(workTime) >= UNIX_TIMESTAMP('"+employeeFind.getWorkTime1()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(workTime) >= UNIX_TIMESTAMP('"+employeeFind.getWorkTime1()+"')";
			}
			mark++;
		}
		if (!employeeFind.getWorkTime2().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(workTime) <= UNIX_TIMESTAMP('"+employeeFind.getWorkTime2()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(workTime) <= UNIX_TIMESTAMP('"+employeeFind.getWorkTime2()+"')";
			}
			mark++;
		}
		if(mark==0)
			sql="from Employee";
		List<Employee> list = hibernateTemplate.find(sql);
		return list;
	}

}
