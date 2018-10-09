package com.manipal.dao;



import java.math.BigDecimal;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.manipal.bean.MainBean;
import com.manipal.bean.MyBean;
import com.manipal.bean.credit;

@Repository
public class MyDao
{	@Autowired
	private JdbcTemplate jdbcTemplate;
	
		
	public int validate(MyBean mb)
	{
        Integer n = jdbcTemplate.queryForObject("select count(*) from user_details where U_NAME='"+mb.getUser()+"' and U_PASSWORD='"+mb.getPass()+"' ", Integer.class);
        System.out.println("   "+n);
        if(n!=null)
			return n;
		return 0;
	}
	
	public MainBean details(String user,String month)
	{ 
		
		 Calendar c = Calendar.getInstance();
	     
	      int lastDate = c.getActualMaximum(Calendar.DATE);
	String m=month;
	String st="01-"+m+"-18";
	
	
	 String st1=lastDate+"-"+m+"-"+"18";
	
	
		System.out.println(month);
		Float n[]=new Float[9];
		
		n[0] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='food' AND c_name='"+user+"'",Float.class);
		n[1] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='health' AND c_name='"+user+"'",Float.class);
		n[2] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='travel' AND c_name='"+user+"'",Float.class);
	    n[3] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='bills' AND c_name='"+user+"'",Float.class);
		n[4] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='entertainment' AND c_name='"+user+"'",Float.class);
		n[5] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='miscellaneous' AND c_name='"+user+"'",Float.class);
		n[6] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='shopping' AND c_name='"+user+"'",Float.class);
		n[7] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='gifts' AND c_name='"+user+"'",Float.class);
		n[8] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY') AND c_category='education' AND c_name='"+user+"'",Float.class);
		
		
		for(int i=0;i<9;i++)
		{
			if(n[i]==null)
				n[i]=0.0f;
		}
       
        
        System.out.println("  "+n[0]+"  "+n[1]+"  "+n[2]+"  "+n[3]+"  "+n[4]+"  "+n[5]+"  "+n[6]+"  "+n[7] + " "+n[8]);
        MainBean mb = new MainBean();
		mb.setUser1(user);
		mb.setFood(n[0]);
		mb.setHolidays(n[2]);
		mb.setPetrol(n[3]);
		mb.setHousehold(n[1]);
		mb.setClothes(n[5]);
		mb.setGrocery(n[6]);
		mb.setEnt(n[4]);
		mb.setGifts(n[7]);
		mb.setEdu(n[8]);
		return mb;
		
		
	}
	
	
	public MainBean detailsmonthsdao(String month1,String month2,String user)
	{System.out.println("inside monhh dao+month");
		
	
	
	
	Float n[]=new Float[9];
		
		n[0] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='food' AND c_name='"+user+"'",Float.class);
		n[1] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='health' AND c_name='"+user+"'",Float.class);
		n[2] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='travel' AND c_name='"+user+"'",Float.class);
	    n[3] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='bills' AND c_name='"+user+"'",Float.class);
		n[4] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='entertainment' AND c_name='"+user+"'",Float.class);
		n[5] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='miscelleneous' AND c_name='"+user+"'",Float.class);
		n[6] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='shopping' AND c_name='"+user+"'",Float.class);
		n[7] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='gifts' AND c_name='"+user+"'",Float.class);
		n[8] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where trunc(c_time) between to_date('"+month1+"','DD-Mon-YY') and to_date('"+month2+"','DD-Mon-YY') AND c_category='education' AND c_name='"+user+"'",Float.class);
		
		
		
		
		for(int i=0;i<9;i++)
		{
			if(n[i]==null)
				n[i]=0.0f;
		}
       
        
        System.out.println("  "+n[0]+"  "+n[1]+"  "+n[2]+"  "+n[3]+"  "+n[4]+"  "+n[5]+"  "+n[6]+"  "+n[7] + " "+n[8]);
        MainBean mb = new MainBean();
		mb.setUser1(user);
		mb.setFood(n[0]);
		mb.setHolidays(n[2]);
		mb.setPetrol(n[3]);
		mb.setHousehold(n[1]);
		mb.setClothes(n[5]);
		mb.setGrocery(n[6]);
		mb.setEnt(n[4]);
		mb.setGifts(n[7]);
		mb.setEdu(n[8]);
		return mb;
		
		
		
	}
	
	
	
	public List<credit> ListAll(String month,String category,String user) {
		
		

		 Calendar c = Calendar.getInstance();
	     
	      int lastDate = c.getActualMaximum(Calendar.DATE);
		
		String m=month;
		String st="01-"+m+"-18";
				 String st1=lastDate+"-"+m+"-"+"18";
		
		String query;
		
		 query="select * from spend_details where (trunc(c_time) between to_date('"+st+"','DD-Mon-YY') and to_date('"+st1+"','DD-Mon-YY')) AND c_category='"+category+"' AND c_name='"+user+"' order by c_time ";
		List<credit> list = jdbcTemplate.query(query, new Mapper());
		return list;
		
		
	}


	public List<credit> ListAllcatmonth(String from_month,String to_month,String category,String user) {
		System.out.println(category);
		String query;
		
		System.out.println("listallcat page 3 returning"+from_month+to_month+category);
		query="select * from spend_details where (trunc(c_time) between to_date('"+from_month+"','DD-Mon-YY') and to_date('"+to_month+"','DD-Mon-YY')) AND c_category='"+category+"' AND c_name='"+user+"' order by c_time ";
		List<credit> list = jdbcTemplate.query(query, new Mapper());
		return list;
		
		
	}
   
	
	public Float[] getchartdetail(String gcat,String user)
	{
		Float month[]= new Float[12];
		
		
		
		System.out.println("inside chart getchart"+gcat);
		
	     month[0] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=1 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
	
	     
	     month[1] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=2 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[2] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=3 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[3] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=4 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[4] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=5 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[5] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=6 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[6] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=7 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[7] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=8 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[8] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=9 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[9] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=10 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[10] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=11 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 month[11] = jdbcTemplate.queryForObject("select sum(c_amount) from spend_details where extract(month from c_time)=12 AND c_category='"+gcat+"' AND c_name='"+user+"'",Float.class);
		 
		 for(int i=0;i<12;i++)
		 {
			 System.out.println("radom value generator");
			 System.out.println(month[i]);
			 
			 if(month[i]== null)
			 { month[i]= 0.0f;}
			 
		 }
		 
	
		return month;
		
	
	
}
	
	public String getcard1(String user)
	{
		String cno=(String) jdbcTemplate.queryForObject("select distinct(c_cardnumber) from spend_details where c_name='"+user+"'",String.class);
		
		return cno;
	}
	
}


