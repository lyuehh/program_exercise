string = [
["User","Integer:id;String:name;String:password;Integer:age;Date:created_at;Date:updated_at",
    "has_one:Card;has_many:Address;has_many_and_belongs_to:Group"],
["Card","Integer:id;String:card_no",
    "belongs_to:User"],
["Group","Integer:id;String:name;Date:created_at;Date:updated_at",
    "has_many_and_belongs_to:User"],
["Address","Integer:id;String:street",
    "belongs_to:User"]]

#返回包含所有实体的数组
def string.entity_names 
  a = []
  self.each do |s|
    a << s[0]
  end
  return a
end

class String
  #返回某个实体的所有属性
  def type_attrs
    return self.split(";")
  end
  #返回某个实体的所有关联关系
  def relations
    return (self.include?(";"))?self.split(";"):self.to_a
  end
end

p string.entity_names
p string[0][1].type_attrs
p string[0][2].relations

unless File.exist?("web")
  Dir.mkdir("web")
end
Dir.chdir("web")

#entity = nil   #实体，以大些字母开头
#entity_dc = entity.downcase  #实体，全小写
type_attrs_aa = []#包含某个实体的所有类型_属性的数组["Integer:id","String:card_no"] 
relation_aa = []  #包含某个实体 关系的数组 ["belongs_to:User"]
#或["has_one:Card","has_many_and_belongs_to:User"]

string.each do |s|
  entity = s[0]
  entity_dc = entity.downcase
  type_attrs = s[1].type_attrs
  relations = s[2].relations
  File.open("#{entity}Action.java","w") do |f|
    
    
    f.puts "package com.www.web;

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
import com.www.service.*;"
    
    
    f.puts "public class #{entity}Action extends DispatchAction {
  @Resource
  private #{entity}Manager #{entity_dc}Manager;"
    
    #和其他实体有关系时，尤其是属于某个其他实体时，需要初始化其他实体的manager
    relations.each do |r|
      rela = r.split(":")[0] #has_one
      partner = r.split(":")[1] #User
      partner_dc = partner.downcase #user
      case rela
        when "has_one"
        #..不需要
        when "has_many"
        #..不需要
        when "belongs_to"
        f.puts "@Resource
       private #{partner}Manager #{partner_dc}Manager;"
        when "has_many_and_belongs_to"
        #..创建时不用管
      end
    end
    
    #new
    f.puts " public ActionForward new#{entity}(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

   return new ActionForward('/#{entity_dc}/new#{entity}.jsp');
}"
    
    #创建时Create {
    
    f.puts "public ActionForward create#{entity}(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    #{entity} #{entity_dc} = new #{entity}();"
    
    #循环变量属性  ["Integer:id","String:card_no","Date:created_at","Date:updated_at"] 
    type_attrs.each do |t|
      type = t.split(":")[0] #Integer,String
      attr = t.split(":")[1] #id,card_no
      case type
        when "String"
        f.puts "String #{attr} = request.getParameter('#{attr}');"
        when "Date"
        #..后面set时处理
        when "Integer"
        if(attr != "id")
          f.puts "String #{attr} = request.getParameter('#{attr}');"
        end
      end
    end
    #循环关系 ["has_one:Card","belongs_to:User"]
    relations.each do |r|
      rela = r.split(":")[0] #has_one
      partner = r.split(":")[1] #User
      partner_dc = partner.downcase #user
      case rela
        when "has_one"
        #..不需要
        when "has_many"
        #..不需要
        when "belongs_to"
        f.puts "String #{partner_dc}_id = request.getParameter('#{partner_dc}_id');
              #{partner} #{partner_dc} = #{partner_dc}Manager.find(#{partner_dc}_id);"
        when "has_many_and_belongs_to"
        #..创建时不用管
      end
    end
    #设置属性 card.setCard_no(card_no);
    type_attrs.each do |t|
      type = t.split(":")[0] #Integer,String
      attr = t.split(":")[1] #id,card_no
      if(type=="Integer")&&(attr=="id")
        #不做任何事，不用设置id
      elsif(type=="Integer")&&(attr!="id")
        f.puts "#{entity_dc}.set#{attr.capitalize}(Integer.parseInt(#{attr}));"
      elsif(type=="Date")&&(attr=="created_at")
        f.puts "#{entity_dc}.setCreated_at(new Date());"
      elsif(type=="Date")&&(attr=="updated_at")
        f.puts "#{entity_dc}.setUpdated_at(new Date());"
      else
        f.puts "#{entity_dc}.set#{attr.capitalize}(#{attr});"
      end
    end
    #设置关联关系时的setXXX
    relations.each do |r|
      rela = r.split(":")[0] #has_one
      partner = r.split(":")[1] #User
      partner_dc = partner.downcase #user
      case rela
        when "has_one"
        #..不需要
        when "has_many"
        #..不需要
        when "belongs_to"
        f.puts "#{entity_dc}.set#{partner}(#{partner_dc});"
        when "has_many_and_belongs_to"
        #..创建时不用管
      end
    end
    
    f.puts "
      #{entity_dc}Manager.saveOrUpdate(#{entity_dc});
      
      List<#{entity}> #{entity_dc}s = #{entity_dc}Manager.findAll();
      request.setAttribute('#{entity_dc}s', #{entity_dc}s);
      
      return new ActionForward('/#{entity_dc}/list#{entity}s.jsp');
      }"
    #create}

    #edit{
    f.puts "public ActionForward edit#{entity}(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    
    String id = request.getParameter('id');
    
    #{entity} #{entity_dc} = #{entity_dc}Manager.find(Integer.parseInt(id));
    request.setAttribute('#{entity_dc}', #{entity_dc});
    return new ActionForward('/#{entity_dc}/edit#{entity}.jsp');
    }"
     #edit}
     
    #show{
  f.puts "public ActionForward show#{entity}(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');
    #{entity} #{entity_dc} = #{entity_dc}Manager.find(Integer.parseInt(id));

    request.setAttribute('#{entity_dc}', #{entity_dc});
    return new ActionForward('/#{entity_dc}/show#{entity}.jsp');
  }"
#show}
   #list{
 f.puts" public ActionForward list#{entity}s(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    List<#{entity}> #{entity_dc}s = #{entity_dc}Manager.findAll();
    request.setAttribute('#{entity_dc}s', #{entity_dc}s);
    return new ActionForward('/#{entity_dc}/list#{entity}s.jsp');
  }"
#list}
#delete{
f.puts "  public ActionForward delete#{entity}(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    String id = request.getParameter('id');

    #{entity_dc}Manager.remove(Integer.parseInt(id));

    List<#{entity}> #{entity_dc}s = #{entity_dc}Manager.findAll();
    request.setAttribute('#{entity_dc}s', #{entity_dc}s);
    return new ActionForward('/#{entity_dc}/list#{entity}s.jsp');
  }"
#delete}
    f.puts "}"
  end
end





