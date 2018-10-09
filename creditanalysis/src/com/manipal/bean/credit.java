package com.manipal.bean;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;

import oracle.sql.TIMESTAMP;

public class credit {
  String user;
  //long cno;
  int limit;
  float amount;
  String category;
 BigDecimal cno;
 // TIMESTAMP time;
  Timestamp time;
  
  
  public int getLimit() {
	return limit;
}
public void setLimit(int limit) {
	this.limit = limit;
}

  
   

	
public Timestamp getTime() {
	return time;
}
public void setTime(Timestamp time) {
	this.time = time;
}
public String getUser() {
	return user;
}

public void setUser(String user) {
	this.user = user;
}


public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public float getAmount() {
	return amount;
}
public void setAmount(float amount) {
	this.amount = amount;
}
public BigDecimal getCno() {
	return cno;
}
public void setCno(BigDecimal cno) {
	this.cno = cno;
}

  
  
  

}
