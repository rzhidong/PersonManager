package com.test;

import org.junit.Test;

import com.manager.util.DBUtil;

public class DBTest {
	
	@Test
	public void connect(){
		System.out.println(DBUtil.getConnection());
	}

}
