<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Ա����Ϣ�޸�</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form1" id="form1" method="post" action="save" onsubmit="return add()">
<%
	Collection coll=(Collection)session.getAttribute("msgem");
	Collection colld=(Collection)session.getAttribute("msgd");
	Collection collj=(Collection)session.getAttribute("msgj");
	Collection colle=(Collection)session.getAttribute("msge");
	if(coll==null){
		out.print("colld");
	}else if(colld==null){
		out.print("colld");
	}else if(collj==null){
		out.print("colld");
	}else if(colld==null){
		out.print("colld");
	}else{
%>
  <tr>
    <td height="50" colspan="4" align="center" class="title" >Ա����Ϣ�޸�</td>
  </tr>
<%
	Iterator it=coll.iterator();
	if(it.hasNext()){
		Eminfo em=(Eminfo)it.next();
%>
  <tr>
    <td height="25" align="center">&nbsp;</td>
    <td height="27" align="center">Ա����ţ�</td>
    <td height="25" align="left"><input name="id" type="text"  value="<%=em.getId()%>" readonly/></td>
    <td height="25" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="180" rowspan="13">&nbsp;</td>
    <td width="150" height="27" align="center"> ��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
    <td align="left"><input name="name" type="text" maxlength="40" value="<%=em.getName()%>" /></td>
    <td width="180" rowspan="13">&nbsp;</td>
  </tr>
  <tr>
    <td height="27" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td height="27" align="left">
      <input name="sex" type="radio"  value="1"
<%
		if(em.getSex()==1){
			out.print("checked");
		}
%>
	 />
  ��
      <input type="radio" name="sex" value="0" 
<%
		if(em.getSex()==0){
			out.print("checked");
		}
%>
	   />
  Ů    </td>
  </tr>
  <tr>
    <td height="27" align="center"> �������ڣ�</td>
    <td height="27" align="left"><input name="birthday" type="text" maxlength="11" value="<%=em.getBirthday()%>" />
      ��-��-��</td>
  </tr>
  <tr>
    <td height="27" align="center">ѧ&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
    <td height="27" align="left"><input name="learn" type="text" size="20" maxlength="20" value="<%=em.getLearn()%>" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> ְ&nbsp;&nbsp;&nbsp;&nbsp;�ƣ� </td>
    <td height="27" align="left"><input name="post" type="text" size="20" maxlength="20" value="<%=em.getPost()%>"/></td>
  </tr>
  <tr>
    <td height="27" align="center"> ��&nbsp;&nbsp;&nbsp;&nbsp;�ţ� </td>
    <td height="27" align="left"><select name="depid">
<%
		Iterator itd=colld.iterator();
		while(itd.hasNext()){
			Department dep=(Department)itd.next();
%>
      <option value="<%= dep.getId() %>" 
<% 
			if(dep.getName().equals(em.getDepartment())){
				out.print("selected");
			}
%>
		><%= dep.getName() %></option>
<%
			}
%>
    </select></td>
  </tr>
  <tr>
    <td height="27" align="center"> ְ&nbsp;&nbsp;&nbsp;&nbsp;λ�� </td>
    <td height="27" align="left"><select name="jobid">
<%
		Iterator itj=collj.iterator();
		while(itj.hasNext()){
			Job dep=(Job)itj.next();
%>
      <option value="<%= dep.getId() %>"
<% 
			if(dep.getName().equals(em.getJob())){
				out.print("selected");
			}
%>
	  ><%= dep.getName() %></option>
<%
			}
%>
    </select></td>
  </tr>
  <tr>
    <td height="27" align="center"> ��&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
    <td height="27" align="left"><input name="tel" type="text" maxlength="40" value="<%=em.getTel()%>"/></td>
  </tr>
  <tr>
    <td height="27" align="center"> �����ַ�� </td>
    <td height="27" align="left"><input name="addr" type="text" size="50" maxlength="200" value="<%=em.getAddr()%>"/></td>
  </tr>
  <tr>
    <td height="27" align="center"> Ա��״̬�� </td>
    <td align="left"><select name="emsid">
<%
		Iterator ite=colle.iterator();
		while(ite.hasNext()){
			Emstate dep=(Emstate)ite.next();
%>
      <option value="<%= dep.getId() %>"
<% 
			if(dep.getName().equals(em.getState())){
				out.print("selected");
			}
%>
	  ><%= dep.getName() %></option>
<%
			}
	}//it
%>
    </select></td>
  </tr>
  <tr>
<td height="40" colspan="2" align="center" class="advise">
<% 
		String msg=(String)request.getAttribute("msg");
		if(msg!=null){
			out.print(msg);
			request.removeAttribute("msg");
		}
%>
	&nbsp;</td>
    </tr>
  <tr>
    <td height="40" colspan="2" align="center"><input type="submit" name="Submit" value="�޸�" />
&nbsp;&nbsp;
<input type="reset" name="Submit2" value="����" />
&nbsp;&nbsp;
<input type="button" name="Submit22" value="����" onclick="javascript:document.location='em.htm';"/></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
<%
	}//else
%>
</form>
</table>
</body>
</html>
