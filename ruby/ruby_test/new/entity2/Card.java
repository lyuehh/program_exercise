package com.www.entity;

import java.io.Serializable;
import java.util.*;

@SuppressWarnings("serial")
public class Card implements Serializable{
private Integer id;
private String card_no;
private User user;

public Integer getId() {
  return id;
}
public void setId(Integer id) {
  this.id = id;
}

public String getCard_no() {
  return card_no;
}
public void setCard_no(String card_no) {
  this.card_no = card_no;
}

public User getUser() {
  return user;
}
public void setUser(User user) {
  this.user = user;
}
}
