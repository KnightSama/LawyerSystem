package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.OrderDao;
import com.bysj.model.Orders;
import com.bysj.service.OrderService;

@Component("OrderService")
public class OrderServiceImpl implements OrderService{
	
	private OrderDao orderDao;
	

	public OrderDao getOrderDao() {
		return orderDao;
	}

	@Resource
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}


	@Override
	public void addOrder(Orders order) {
		// TODO Auto-generated method stub
		orderDao.addOrder(order);
	}

	@Override
	public List<Orders> find() {
		// TODO Auto-generated method stub
		return orderDao.find();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		orderDao.delete(id);
	}

}
