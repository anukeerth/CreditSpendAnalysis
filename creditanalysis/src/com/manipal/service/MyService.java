package com.manipal.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.manipal.bean.MainBean;
import com.manipal.bean.MyBean;
import com.manipal.bean.credit;
import com.manipal.dao.MyDao;

public class MyService {
	
	@Autowired
	private MyDao mydao;
	
	
	public String getcard(String user)
	{
		return mydao.getcard1(user); 
		
	}
	
	public MainBean details(String user,String month)
	{
		return mydao.details(user,month);
	}
	
	public MainBean detailsmonth(String month1,String month2,String user)
	{System.out.println("inside months ervice");
		return mydao.detailsmonthsdao(month1,month2,user);
	}
	
	
	
	public List<credit> getcatdetails(String from_month,String to_month,String category,String user) {
		
		List<credit> list=mydao.ListAllcatmonth(from_month,to_month,category,user);
		System.out.println("inside the from date and to date inside cat page3 returning");
		for(credit e:list)
		{
			System.out.println(e);
		}
		
		return list;
		
	}

	
	
	public List<credit> getcategory(String month,String category,String user) {
		
		List<credit> list=mydao.ListAll(month,category,user);
		
		for(credit e:list)
		{
			System.out.println(e);
		}
		
		return list;
		
	}

	
	public Float[] getArray(String gcat,String user)
	{
		System.out.println("indide nothing ");
		Float temp[]=new Float[12];
		temp=mydao.getchartdetail(gcat,user);
		
		System.out.println("inside service class");
		for(int i=0;i<12;i++)
		{
			System.out.println(temp[i]);
		}
		return temp;
	}
	
	public int validate(MyBean mb)
	{
		return mydao.validate(mb);
	}

	
	
	
}
