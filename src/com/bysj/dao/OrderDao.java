package com.bysj.dao;

import java.util.List;

import com.bysj.model.Orders;

public interface OrderDao {
	
	public void addOrder(Orders order);
    public List<Orders> find();
    public void delete(int uid);
}
