package com.manager.enity;

import java.util.Date;

public class PersonEnity {
	
	private int id;
	
	private String userName;
	
	private String passWord;
	
	private String sex;
	
	private String email;
	
	private String phone;
	
	private String newPass;
	
	private String createTime;
	
	private String lastLogin;
	
	private String updateTime;
	
	private boolean isAdmin;
	
	private boolean isDelete;

	public PersonEnity() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "PersonEnity [id=" + id + ", userName=" + userName + ", passWord=" + passWord + ", sex=" + sex
				+ ", email=" + email + ", phone=" + phone + ", newPass=" + newPass + ", createTime=" + createTime
				+ ", lastLogin=" + lastLogin + ", updateTime=" + updateTime + ", isAdmin=" + isAdmin + ", isDelete="
				+ isDelete + "]";
	}

	

}
