package com.bysj.service;

import java.util.List;


import com.bysj.model.Orders;

public interface OrderService {
	public void addOrder(Orders order);
	public List<Orders> find();
	public void delete(int id);
}
