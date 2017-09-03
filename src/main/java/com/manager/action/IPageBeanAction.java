package com.manager.action;

import com.manager.bean.PageBean;
import com.manager.enity.PersonEnity;

public interface IPageBeanAction {
	
	public void getAll(PageBean<PersonEnity> pageBean);
	
	public int getTotalRecord();

}
