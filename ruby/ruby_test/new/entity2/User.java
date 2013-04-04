package com.www.entity;

import java.io.Serializable;
import java.util.*;

@SuppressWarnings("serial")
public class User implements Serializable{
private Integer id;
private String name;
private String password;
private Integer age;
private Date created_at;
private Date updated_at;
private Card card;
private Set<Address> addresss = new HashSet<Address>();
private Set<Group> groups = new HashSet<Group>();

public Integer getId() {
  return id;
}
public void setId(Integer id) {
  this.id = id;
}

public String getName() {
  return name;
}
public void setName(String name) {
  this.name = name;
}

public String getPassword() {
  return password;
}
public void setPassword(String password) {
  this.password = password;
}

public Integer getAge() {
  return age;
}
public void setAge(Integer age) {
  this.age = age;
}

public Date getCreated_at() {
  return created_at;
}
public void setCreated_at(Date created_at) {
  this.created_at = created_at;
}

public Date getUpdated_at() {
  return updated_at;
}
public void setUpdated_at(Date updated_at) {
  this.updated_at = updated_at;
}

public Card getCard() {
  return card;
}
public void setCard(Card card) {
  this.card = card;
}

public Set<Address> getAddresss() {
  return addresss;
}
public void setAddresss(Set<Address> addresss) {
  this.addresss = addresss;
}

public Set<Group> getGroups() {
  return groups;
}
public void setGroups(Set<Group> groups) {
  this.groups = groups;
}
}
