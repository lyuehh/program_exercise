package com.www.web;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.www.entity.*;
import com.www.service.*;
public class UserAction extends DispatchAction {
  @Resource
  private UserManager userManager;
 public ActionForward newUser(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

   return new ActionForward('/user/newUser.jsp');
}
public ActionForward createUser(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    User user = new User();
String name = request.getParameter('name');
String password = request.getParameter('password');
String age = request.getParameter('age');
user.setName(name);
user.setPassword(password);
user.setAge(Integer.parseInt(age));
user.setCreated_at(new Date());
user.setUpdated_at(new Date());

      userManager.saveOrUpdate(user);
      
      List<User> users = userManager.findAll();
      request.setAttribute('users', users);
      
      return new ActionForward('/user/listUsers.jsp');
      }
public ActionForward editUser(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    
    String id = request.getParameter('id');
    
    User user = userManager.find(Integer.parseInt(id));
    request.setAttribute('user', user);
    return new ActionForward('/user/editUser.jsp');
    }
public ActionForward showUser(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');
    User user = userManager.find(Integer.parseInt(id));

    request.setAttribute('user', user);
    return new ActionForward('/user/showUser.jsp');
  }
 public ActionForward listUsers(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    List<User> users = userManager.findAll();
    request.setAttribute('users', users);
    return new ActionForward('/user/listUsers.jsp');
  }
  public ActionForward deleteUser(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');

    userManager.remove(Integer.parseInt(id));

    List<User> users = userManager.findAll();
    request.setAttribute('users', users);
    return new ActionForward('/user/listUsers.jsp');
  }
}
