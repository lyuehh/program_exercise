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
public class AddressAction extends DispatchAction {
  @Resource
  private AddressManager addressManager;
@Resource
       private UserManager userManager;
 public ActionForward newAddress(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

   return new ActionForward('/address/newAddress.jsp');
}
public ActionForward createAddress(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    Address address = new Address();
String street = request.getParameter('street');
String user_id = request.getParameter('user_id');
              User user = userManager.find(user_id);
address.setStreet(street);
address.setUser(user);

      addressManager.saveOrUpdate(address);
      
      List<Address> addresss = addressManager.findAll();
      request.setAttribute('addresss', addresss);
      
      return new ActionForward('/address/listAddresss.jsp');
      }
public ActionForward editAddress(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    
    String id = request.getParameter('id');
    
    Address address = addressManager.find(Integer.parseInt(id));
    request.setAttribute('address', address);
    return new ActionForward('/address/editAddress.jsp');
    }
public ActionForward showAddress(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');
    Address address = addressManager.find(Integer.parseInt(id));

    request.setAttribute('address', address);
    return new ActionForward('/address/showAddress.jsp');
  }
 public ActionForward listAddresss(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    List<Address> addresss = addressManager.findAll();
    request.setAttribute('addresss', addresss);
    return new ActionForward('/address/listAddresss.jsp');
  }
  public ActionForward deleteAddress(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');

    addressManager.remove(Integer.parseInt(id));

    List<Address> addresss = addressManager.findAll();
    request.setAttribute('addresss', addresss);
    return new ActionForward('/address/listAddresss.jsp');
  }
}
