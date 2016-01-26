package com.bysj.service;

import java.util.List;

import com.bysj.model.Cansulation;


public interface CansulationService {
	public void addCansulation(Cansulation cansulation);
	public List<Cansulation> find();
	public void delete(int id);

}
