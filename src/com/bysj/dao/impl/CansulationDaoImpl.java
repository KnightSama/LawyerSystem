package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.CansulationDao;
import com.bysj.model.Cansulation;
import com.bysj.model.Orders;

@Component("CansulationDao")
public class CansulationDaoImpl implements CansulationDao{
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void addCansulation(Cansulation cansulation) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(cansulation);
	}

	@Override
	public List<Cansulation> find() {
		// TODO Auto-generated method stub
		List<Cansulation> list = hibernateTemplate.find("from Cansulation order by uid DESC");
		return list;
	}

	@Override
	@Transactional
	public void delete(int uid) {
		// TODO Auto-generated method stub
		List<Cansulation> list = hibernateTemplate.find("from Cansulation where id = '"+uid+"'");
		hibernateTemplate.delete(list.get(0));
	}

}
