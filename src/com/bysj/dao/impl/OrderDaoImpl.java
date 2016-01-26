package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.OrderDao;
import com.bysj.model.Cansulation;
import com.bysj.model.Logtab;
import com.bysj.model.Orders;

@Component("OrderDao")
public class OrderDaoImpl implements OrderDao{
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void addOrder(Orders order) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(order);
	}

	@Override
	public List<Orders> find() {
		// TODO Auto-generated method stub
		List<Orders> list = hibernateTemplate.find("from Orders order by uid DESC");
		return list;
	}

	@Override
	@Transactional
	public void delete(int uid) {
		// TODO Auto-generated method stub
		List<Orders> list = hibernateTemplate.find("from Orders where id = '"+uid+"'");
		hibernateTemplate.delete(list.get(0));
	}

}
