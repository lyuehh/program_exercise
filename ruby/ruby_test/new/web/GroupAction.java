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
public class GroupAction extends DispatchAction {
  @Resource
  private GroupManager groupManager;
 public ActionForward newGroup(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

   return new ActionForward('/group/newGroup.jsp');
}
public ActionForward createGroup(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    Group group = new Group();
String name = request.getParameter('name');
group.setName(name);
group.setCreated_at(new Date());
group.setUpdated_at(new Date());

      groupManager.saveOrUpdate(group);
      
      List<Group> groups = groupManager.findAll();
      request.setAttribute('groups', groups);
      
      return new ActionForward('/group/listGroups.jsp');
      }
public ActionForward editGroup(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    
    String id = request.getParameter('id');
    
    Group group = groupManager.find(Integer.parseInt(id));
    request.setAttribute('group', group);
    return new ActionForward('/group/editGroup.jsp');
    }
public ActionForward showGroup(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');
    Group group = groupManager.find(Integer.parseInt(id));

    request.setAttribute('group', group);
    return new ActionForward('/group/showGroup.jsp');
  }
 public ActionForward listGroups(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    List<Group> groups = groupManager.findAll();
    request.setAttribute('groups', groups);
    return new ActionForward('/group/listGroups.jsp');
  }
  public ActionForward deleteGroup(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');

    groupManager.remove(Integer.parseInt(id));

    List<Group> groups = groupManager.findAll();
    request.setAttribute('groups', groups);
    return new ActionForward('/group/listGroups.jsp');
  }
}
