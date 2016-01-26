package com.bysj.dao.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.ManagerDao;
import com.bysj.model.Logtab;
import com.bysj.model.Manager;
import com.bysj.util.ManagerEdit;
import com.bysj.util.ManagerFind;

@Component("managerDao")
public class ManagerDaoImpl implements ManagerDao{

	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	@Override
	public String findPassword(String username) {
		// TODO Auto-generated method stub
		List<Manager> list = hibernateTemplate.find("from Manager m where m.username='"+username+"'");
		if(list.isEmpty())
		   return null;
		return list.get(0).getPassword();
	}
	@Override
	public void add(Manager manager) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(manager);

	}
	@Override
	public boolean hasuser(String username) {
		// TODO Auto-generated method stub
		List<Manager> list = hibernateTemplate.find("from Manager m where m.username='"+username+"'");
		if(list.isEmpty())
			   return false;
		return true;
	}
	@Override
	@Transactional
	public void changePassword(Manager manager) {
		// TODO Auto-generated method stub
		//List<Manager> list = hibernateTemplate.find("from Manager m where m.username='"+manager.getUsername()+"'");
		//manager.setUserId(list.get(0).getUserId());
		//hibernateTemplate.update(manager);
		hibernateTemplate.merge(manager);
	}
	@Override
	public List<Manager> find(Manager manager) {
		// TODO Auto-generated method stub
		return hibernateTemplate.find("from Manager m where m.username='"+manager.getUsername()+"'");
		
	}
	@Override
	public List<Manager> find(ManagerFind managerFind) {
		// TODO Auto-generated method stub
		int mark=0;
		String sql = "from Manager where";
		if(managerFind.getStartTime()!=null&&!managerFind.getStartTime().equals("")){
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(createdata) >= UNIX_TIMESTAMP('"+managerFind.getStartTime()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(createdata) >= UNIX_TIMESTAMP('"+managerFind.getStartTime()+"')";
			}
			mark++;
		}
		if(managerFind.getEndTime()!=null&&!managerFind.getEndTime().equals("")){
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(createdata) <= UNIX_TIMESTAMP('"+managerFind.getEndTime()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(createdata) <= UNIX_TIMESTAMP('"+managerFind.getEndTime()+"')";
			}
			mark++;
		}
		if(managerFind.getUsername()!=null&&!managerFind.getUsername().equals("")){
			if(mark==0)
				sql+=" username = '"+managerFind.getUsername()+"'";
			else {
				sql+=" AND username = '"+managerFind.getUsername()+"'";
			}
			mark++;
		}
		if(mark==0)
			sql="from Manager";
				
		List<Manager> list = hibernateTemplate.find(sql);
		return list;
	}
	@Override
	@Transactional
	public void delete(String username) {
		// TODO Auto-generated method stub
		List<Manager> list = hibernateTemplate.find("from Manager where username = '"+username+"'");
		hibernateTemplate.delete(list.get(0));
	}
	@Override
	public List<Manager> find(String username) {
		// TODO Auto-generated method stub
		List<Manager> list = hibernateTemplate.find("from Manager where username = '"+username+"'");
		return list;
	}
	@Override
	@Transactional
	public void update(ManagerEdit managerEdit) {
		// TODO Auto-generated method stub
		List<Manager> list = hibernateTemplate.find("from Manager where username = '"+managerEdit.getUsername()+"'");
	    list.get(0).setAuthority(managerEdit.getAuthority());
	    list.get(0).setPassword(managerEdit.getPassword());
	    hibernateTemplate.merge(list.get(0));
	}

}
