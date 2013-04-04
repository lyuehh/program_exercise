package com.www.entity;

import java.io.Serializable;
import java.util.*;

@SuppressWarnings("serial")
public class Address implements Serializable{
private Integer id;
private String street;
private User user;

public Integer getId() {
  return id;
}
public void setId(Integer id) {
  this.id = id;
}

public String getStreet() {
  return street;
}
public void setStreet(String street) {
  this.street = street;
}

public User getUser() {
  return user;
}
public void setUser(User user) {
  this.user = user;
}
}
