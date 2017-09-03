package com.manager.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String tranferTimeStamp(Timestamp timestamp) {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp.getTime());
	}

}
