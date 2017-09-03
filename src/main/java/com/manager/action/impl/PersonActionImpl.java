package com.manager.action.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.manager.action.IPersonAction;
import com.manager.enity.PersonEnity;
import com.manager.util.DBUtil;
import com.manager.util.DateUtil;

public class PersonActionImpl implements IPersonAction {

	private Connection connection;

	private PreparedStatement ps;

	private ResultSet rs;

	@Override
	public boolean insertPerson(PersonEnity personEnity) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		if (! isExistByName(personEnity.getUserName())) {
			connection = DBUtil.getConnection();
			
			String sql = "INSERT INTO person(username,password,sex,email,phone,isadmin,isdelete) "
					+ "VALUES(?,?,?,?,?,?,?)";
			
			try {
				ps = connection.prepareStatement(sql);
				
				ps.setString(1, personEnity.getUserName());
				ps.setString(2, personEnity.getPassWord());
				ps.setString(3, personEnity.getSex());
				ps.setString(4, personEnity.getEmail());
				ps.setString(5, personEnity.getPhone());
				ps.setBoolean(6, personEnity.isAdmin());
				ps.setBoolean(7, personEnity.isDelete());
				
				if (ps.executeUpdate() == 1) {
					flag = true;
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				DBUtil.closeConnection(connection);
				DBUtil.closePreparedStatement(ps);
			}
		}//if
		
		return flag;
	}

	public boolean isExistByName(String username) {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		connection = DBUtil.getConnection();
		
		String sql = "select USERNAME,ISDELETE from person where username = ?";
		
		try {
			ps = connection.prepareStatement(sql);
			
			ps.setString(1, username);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				if (rs.getString("USERNAME").equals(username) && !rs.getBoolean("ISDELETE")) {
					flag = true;
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtil.closeConnection(connection);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeResultSet(rs);
		}
		
		return flag;
	}

	@Override
	public PersonEnity getOnePerson(int id) {
		// TODO Auto-generated method stub
		
		connection = DBUtil.getConnection();
		
		PersonEnity personEnity = null;
		
		String sql = "select * from person where ID = ? and ISDELETE = false";
		
		try {
			ps = connection.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
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
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtil.closeConnection(connection);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeResultSet(rs);
		}
		
		return personEnity;
	}

	public List<PersonEnity> getAllPersons() {
		// TODO Auto-generated method stub
		List<PersonEnity> list = new ArrayList<PersonEnity>();
		
		connection = DBUtil.getConnection();
		
		String sql = "select * from person WHERE ISDELETE = false";
		
		try {
			ps = connection.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				PersonEnity personEnity = new PersonEnity();
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
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtil.closeConnection(connection);
			DBUtil.closePreparedStatement(ps);
			DBUtil.closeResultSet(rs);
		}
		
		return list;
	}

	@Override
	public boolean deletePerson(int id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		connection = DBUtil.getConnection();
		
		String sql = "update person set ISDELETE = true where ID = ?";
		
		try {
			ps = connection.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			if (ps.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtil.closeConnection(connection);
			DBUtil.closePreparedStatement(ps);
		}
		
		
		return flag;
	}
	

	@Override
	public boolean updatePerson(PersonEnity personEnity) {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		connection = DBUtil.getConnection();
		
		String sql = "update person set SEX=?, EMAIL=?, PHONE=?, UPDATETIME=?,PASSWORD=? where id=? ";
		
		try {
			ps = connection.prepareStatement(sql);
			
			ps.setString(1, personEnity.getSex());
			ps.setString(2, personEnity.getEmail());
			ps.setString(3, personEnity.getPhone());
			ps.setTimestamp(4, new java.sql.Timestamp(new Date().getTime()));
			ps.setString(5, personEnity.getPassWord());
			ps.setInt(6, personEnity.getId());
			
			if (ps.executeUpdate() == 1) {
				flag = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBUtil.closeConnection(connection);
			DBUtil.closePreparedStatement(ps);
		}
		
		
		return flag;
	}

	
}
