package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.LogtabDao;
import com.bysj.model.Logtab;
import com.bysj.util.LogFind;

@Component("LogtabDao")
public class LogtabDaoImpl implements LogtabDao{
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean addLog(Logtab logtab) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(logtab);
		return true;
	}

	@Override
	public List<Logtab> find(LogFind logFind) {
		// TODO Auto-generated method stub
		int mark=0;
		String sql = "from Logtab where";
		if(logFind.getId()!=0){
			sql+=" id = "+logFind.getId();
			mark++;
		}
		if(logFind.getStartTime()!=null&&!logFind.getStartTime().equals("")){
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(operateTime) >= UNIX_TIMESTAMP('"+logFind.getStartTime()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(operateTime) >= UNIX_TIMESTAMP('"+logFind.getStartTime()+"')";
			}
			mark++;
		}
		if(logFind.getEndTime()!=null&&!logFind.getEndTime().equals("")){
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(operateTime) <= UNIX_TIMESTAMP('"+logFind.getEndTime()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(operateTime) <= UNIX_TIMESTAMP('"+logFind.getEndTime()+"')";
			}
			mark++;
		}
		if(logFind.getUsername()!=null&&!logFind.getUsername().equals("")){
			if(mark==0)
				sql+=" username = '"+logFind.getUsername()+"'";
			else {
				sql+=" AND username = '"+logFind.getUsername()+"'";
			}
			mark++;
		}
		if(mark==0)
			sql="from Logtab";
		
		sql+=" order by operateTime DESC";
		
		List<Logtab> list = hibernateTemplate.find(sql);
		return list;
	}
	@Override
	@Transactional
	public void delete(int id) {
		// TODO Auto-generated method stub
		List<Logtab> list = hibernateTemplate.find("from Logtab where id = '"+id+"'");
		hibernateTemplate.delete(list.get(0));
	}

}
