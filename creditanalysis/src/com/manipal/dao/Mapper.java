package com.manipal.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.manipal.bean.credit;

import oracle.sql.TIMESTAMP;







public class Mapper implements RowMapper<credit> {

	@Override
	public credit mapRow(ResultSet arg0, int arg1) throws SQLException {
		
		
			credit at = new credit(); 
			at.setUser(arg0.getString(1));
			//at.setCno(arg0.getInt(2));
			at.setCno(arg0.getBigDecimal(2));
			at.setLimit(arg0.getInt(3));
			at.setAmount(arg0.getFloat(4));
			
			at.setCategory(arg0.getString(5));
			at.setTime(arg0.getTimestamp(6));
			
		
		
		
		return at;
		
	}

	
	

	
}
