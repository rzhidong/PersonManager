package com.manager.action.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.manager.action.IPageBeanAction;
import com.manager.bean.PageBean;
import com.manager.enity.PersonEnity;
import com.manager.util.DBUtil;
import com.manager.util.DateUtil;

public class PageBeanActionImpl implements IPageBeanAction{
	
	private Connection connection;
	
	private PreparedStatement ps;
	
	private ResultSet rs;

	@Override
	public void getAll(PageBean<PersonEnity> pageBean) {
		// TODO Auto-generated method stub
		int totalRecord = getTotalRecord();
		
		pageBean.setTotalRecord(totalRecord);
		
		if (pageBean.getCurrentPage() <= 0) {
			pageBean.setCurrentPage(1);
		}else if (pageBean.getCurrentPage() > pageBean.getTotalPage()) {
			pageBean.setCurrentPage(pageBean.getTotalPage());
		}
		
		int currentPage = pageBean.getCurrentPage();
		
		int index = (currentPage -1) * pageBean.getPageCount();
		
		int count = pageBean.getPageCount();
		
		String sql = "select * from person where ISDELETE=false limit ?,?";
		
		try {
			connection = DBUtil.getConnection();
			
			ps = connection.prepareStatement(sql);
			
			ps.setInt(1, index);
			ps.setInt(2, count);
			
			rs = ps.executeQuery();
			
			List<PersonEnity> list = new ArrayList<PersonEnity>();
			
			while (rs.next()){
				PersonEnity personEnity = new PersonEnity();
				personEnity = new PersonEnity();
				personEnity.setId(rs.getInt("ID"));
				personEnity.setUserName(rs.getString("USERNAME"));
				personEnity.setPassWord(rs.getString("PASSWORD"));
				personEnity.setSex(rs.getString("SEX"));
				personEnity.setEmail(rs.getString("EMAIL"));
				personEnity.setPhone(rs.getString("PHONE"));
				personEnity.setCreateTime(DateUtil.tranferTimeStamp(rs.getTimestamp("CREATETIME")));
				personEnity.setLastLogin(DateUtil.tranferTimeStamp(rs.getTimestamp("LASTLOGIN")));
				personEnity.setUpdateTime(DateUtil.tranferTimeStamp(rs.getTimestamp("UPDATETIME")));
				personEnity.setNewPass(rs.getString("NEWPASS"));
				personEnity.setAdmin(rs.getBoolean("ISADMIN"));
				personEnity.setDelete(rs.getBoolean("ISDELETE"));
				
				list.add(personEnity);
			}
			pageBean.setPageData(list);
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			DBUtil.closeConnection(connection);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeResultSet(rs);
		}
	}
	
	/**
	 * 获取总记录数
	 * @return
	 */
	@Override
	public int getTotalRecord() {
		// TODO Auto-generated method stub
		String sql = "select count(*) from person where ISDELETE = false";
		
		int result = 0;
		
		try {
			connection = DBUtil.getConnection();
			
			ps = connection.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			rs.next();
			result = Integer.parseInt(rs.getString(1));
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			DBUtil.closeConnection(connection);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeResultSet(rs);
		}
		
		return result;
	}

}
