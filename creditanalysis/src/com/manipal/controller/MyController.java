

package com.manipal.controller;


import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.manipal.bean.MainBean;
import com.manipal.bean.MyBean;
import com.manipal.bean.credit;
import com.manipal.service.MyService;



@Controller
@RequestMapping("/")
public class MyController {
   
	@Autowired
	private MyService myService;
	String ask="";
	String gcat="";
	String gmonth;
	
	//login to dashboard
	@RequestMapping(value="/login",method=RequestMethod.POST)
       public ModelAndView transaction(		  
		  @RequestParam(name="user") String user,
		  @RequestParam(name="pass") String pass,
		  ModelMap model
				  )
     {
		MyBean mb = new MyBean();
		mb.setPass(pass);
		mb.setUser(user);
		int n=myService.validate(mb);
		
	    String msg=null;
		System.out.println("the user"+user+"pass"+pass);
		
		if(n==1)
		{
			msg="successfull login";
			ask = user;
	      Calendar c = Calendar.getInstance();
	      int c1=c.get(Calendar.MONTH);
	      System.out.println(c1);
	    String m1="";
	        switch(c1)
	        {
	        case 0:{m1="JAN";break;}
	        case 1:{m1="FEB";break;}
	        case 2:{m1="MAR";break;}
	        case 3:{m1="APR";break;}
	        case 4:{m1="MAY";break;}
	        case 5:{m1="JUN";break;}
	        case 6:{m1="JUL";break;}
	        case 7:{m1="AUG";break;}
	        case 8:{m1="SEP";break;}
	        case 9:{m1="OCT";break;}
	        case 10:{m1="NOV";break;}
	        case 11:{m1="DEC";break;}
	        }
	      
	      
	      gmonth=m1;
			MainBean mb1 = new MainBean();
			mb1 = myService.details(user,gmonth); 
	
			float sum=mb1.getFood() + mb1.getClothes() + mb1.getGrocery() + mb1.getHolidays() + mb1.getPetrol() + mb1.getHousehold()+mb1.getGifts()+mb1.getEnt()+mb1.getEdu();
			mb1.setTotal(sum);
            int i;
			
			String card1="";
			String card="";
			card1=myService.getcard(ask);
			
			for(i=0;i<card1.length()-5;i++)
				card=card+"*";
			
			card=card+card1.substring(i, card1.length());
			System.out.println(card1);
			
			
			
			System.out.println(card.length());
			
	
			ModelAndView m=new ModelAndView();
		
			m.setViewName("detail4");
			m.addObject("cno",card);
			m.addObject("data",mb1);
			return m;	
			}
		else
		{
			ModelAndView m=new ModelAndView();
			m.setViewName("error");
						msg="invalid credentials";
			m.addObject("data",msg);
			return m;	
				
		}
	 
     }
	
	
	

	//category selection from dshboard to category page

		@RequestMapping(value="/option",method=RequestMethod.POST)
		public ModelAndView listEmpl(
			@RequestParam(name="option") String category,
			ModelMap model
			)
			{
				System.out.println(category);
				ModelAndView m=new ModelAndView();
				List<credit> data= myService.getcategory(gmonth,category,ask);
		
				gcat=category;
		
				Float[] chart = new Float[12];
				chart = myService.getArray(gcat,ask);
				for(int i=0;i<12;i++)
				{
					System.out.println(chart[i]);
				}      
				
				m.setViewName("detail5");
				m.addObject("arr", chart);
				m.addObject("data",data);
				return m;	
			}

		//dashboard page 2nd prt cycling
		
		@RequestMapping(value="/month",method=RequestMethod.POST)
		public ModelAndView selectmonth(
			@RequestParam(name="month1") String month1,
			@RequestParam(name="month2") String month2,
			ModelMap model
			)
		{
		System.out.println("month"+month1+month2);
		MainBean mb1 = new MainBean();
	
		
		
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MMM-yyyy");
		String m1="";
		try {
			m1 = sdf2.format(sdf1.parse(month1));
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		String m2="";
		try {
			m2 = sdf2.format(sdf1.parse(month2));
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		
		
		mb1 = myService.detailsmonth(m1,m2,ask); 
		
		float sum=mb1.getFood() + mb1.getClothes() + mb1.getGrocery() + mb1.getHolidays() + mb1.getPetrol() + mb1.getHousehold()+mb1.getGifts()+mb1.getEnt()+mb1.getEdu();
		mb1.setTotal(sum);
		
		
		String card1="";int i;
		String card="";
		card1=myService.getcard(ask);
		
		for(i=0;i<card1.length()-5;i++)
			card=card+"*";
		
		card=card+card1.substring(i, card1.length());
		System.out.println(card1);
		
		
		
	
		ModelAndView m=new ModelAndView();
		m.setViewName("detail4");
		m.addObject("cno",card);
		m.addObject("data",mb1);
		return m;	
		
		}
	
		//categories page cycling-method 4
	
	@RequestMapping(value="/catmonth",method=RequestMethod.POST)
	public ModelAndView catselectmonth(
			
			@RequestParam(name="month1") String month1,
			@RequestParam(name="month2") String month2,
			
			
			ModelMap model
			)
	{
		
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MMM-yyyy");
		String m1="";
		try {
			m1 = sdf2.format(sdf1.parse(month1));
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		String m2="";
		try {
			m2 = sdf2.format(sdf1.parse(month2));
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		ModelAndView m=new ModelAndView();
		List<credit> data= myService.getcatdetails(m1,m2,gcat,ask);
		Float[] chart = new Float[12];
		chart = myService.getArray(gcat,ask);
		
		System.out.println("returned page inside chart");
		for(int i=0;i<12;i++)
		{
			System.out.println(chart[i]);
		}                         
		
		m.setViewName("detail5");
		m.addObject("data",data);
		m.addObject("arr",chart);
		return m;	
			
	}
	
	@RequestMapping(value="/back",method=RequestMethod.POST)
	public ModelAndView month(ModelMap model)
	{
	System.out.println("inside controller");	
	
	MainBean mb1 = new MainBean();
	mb1 = myService.details(ask,gmonth); 

	float sum=mb1.getFood() + mb1.getClothes() + mb1.getGrocery() + mb1.getHolidays() + mb1.getPetrol() + mb1.getHousehold()+mb1.getGifts()+mb1.getEnt()+mb1.getEdu();
	mb1.setTotal(sum);

	
	
	String card1="";int i;
	String card="";
	card1=myService.getcard(ask);
	card="";
	for(i=0;i<card1.length()-5;i++)
		card=card+"*";
	
	card=card+card1.substring(i, card1.length());
	System.out.println(card1);
	

	ModelAndView m=new ModelAndView();

	m.setViewName("detail4");
	m.addObject("cno",card);
	m.addObject("data",mb1);
	
		
		return m;
		
	}
	
	
   }
	
	

	