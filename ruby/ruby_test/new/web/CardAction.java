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
public class CardAction extends DispatchAction {
  @Resource
  private CardManager cardManager;
@Resource
       private UserManager userManager;
 public ActionForward newCard(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

   return new ActionForward('/card/newCard.jsp');
}
public ActionForward createCard(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    Card card = new Card();
String card_no = request.getParameter('card_no');
String user_id = request.getParameter('user_id');
              User user = userManager.find(user_id);
card.setCard_no(card_no);
card.setUser(user);

      cardManager.saveOrUpdate(card);
      
      List<Card> cards = cardManager.findAll();
      request.setAttribute('cards', cards);
      
      return new ActionForward('/card/listCards.jsp');
      }
public ActionForward editCard(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    
    String id = request.getParameter('id');
    
    Card card = cardManager.find(Integer.parseInt(id));
    request.setAttribute('card', card);
    return new ActionForward('/card/editCard.jsp');
    }
public ActionForward showCard(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');
    Card card = cardManager.find(Integer.parseInt(id));

    request.setAttribute('card', card);
    return new ActionForward('/card/showCard.jsp');
  }
 public ActionForward listCards(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    List<Card> cards = cardManager.findAll();
    request.setAttribute('cards', cards);
    return new ActionForward('/card/listCards.jsp');
  }
  public ActionForward deleteCard(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');

    cardManager.remove(Integer.parseInt(id));

    List<Card> cards = cardManager.findAll();
    request.setAttribute('cards', cards);
    return new ActionForward('/card/listCards.jsp');
  }
}
