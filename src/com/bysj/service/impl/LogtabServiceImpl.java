package com.bysj.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.LogtabDao;
import com.bysj.model.Logtab;
import com.bysj.service.LogtabService;
import com.bysj.util.LogFind;

@Component("LogtabService")
public class LogtabServiceImpl implements LogtabService{
    
	private LogtabDao logtabDao;
	public LogtabDao getLogtabDao() {
		return logtabDao;
	}
	@Resource
	public void setLogtabDao(LogtabDao logtabDao) {
		this.logtabDao = logtabDao;
	}
	@Override
	public boolean addLog(String username,String operate,
			String others) {
		// TODO Auto-generated method stub
		Logtab logtab = new Logtab();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String operateTime =df.format(new Date());
		logtab.setOperate(operate);
		logtab.setOperateTime(operateTime);
		logtab.setOthers(others);
		logtab.setUsername(username);
		logtabDao.addLog(logtab);
		return true;
	}
	@Override
	public List<Logtab> find(LogFind logFing) {
		// TODO Auto-generated method stub
		return logtabDao.find(logFing);
	}
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		logtabDao.delete(id);
	}

}
