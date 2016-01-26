package com.bysj.dao;

import java.util.List;
import java.util.Set;

import com.bysj.model.Manager;
import com.bysj.util.ManagerEdit;
import com.bysj.util.ManagerFind;

public interface ManagerDao {
	public String findPassword(String username);
    public void add(Manager manager);
    public boolean hasuser(String username);
    public void changePassword(Manager manager);
    public List<Manager> find(Manager manager);
    public List<Manager> find(ManagerFind managerFind);
    public List<Manager> find(String username);
    public void delete(String username);
    public void update(ManagerEdit managerEdit);
}
