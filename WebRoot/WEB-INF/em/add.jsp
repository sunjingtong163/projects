<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Ա����Ϣ����</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form1" id="form1" method="post" action="save" onsubmit="return add()">
<%
	Collection colld=(Collection)session.getAttribute("msgd");
	Collection collj=(Collection)session.getAttribute("msgj");
	Collection colle=(Collection)session.getAttribute("msge");
	if(colld==null){
		out.print("colld");
	}else if(collj==null){
		out.print("colld");
	}else if(colld==null){
		out.print("colld");
	}else{
%>
  <tr>
    <td height="50" colspan="4" align="center" class="title" >Ա����Ϣ����</td>
  </tr>
  <tr>
    <td width="180" rowspan="13">&nbsp;</td>
    <td width="150" height="27" align="center"> ��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
    <td align="left"><input name="name" type="text" maxlength="40" /></td>
    <td width="180" rowspan="13">&nbsp;</td>
  </tr>
  <tr>
    <td height="27" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td height="27" align="left">
      <input name="sex" type="radio" value="1" checked />
  ��
      <input type="radio" name="sex" value="0" />
  Ů    </td>
  </tr>
  <tr>
    <td height="27" align="center"> �������ڣ�</td>
    <td height="27" align="left"><input name="birthday" type="text" maxlength="11" />
      ��-��-��</td>
  </tr>
  <tr>
    <td height="27" align="center">ѧ&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
    <td height="27" align="left"><input name="learn" type="text" size="20" maxlength="20" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> ְ&nbsp;&nbsp;&nbsp;&nbsp;�ƣ� </td>
    <td height="27" align="left"><input name="post" type="text" size="20" maxlength="20" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> ��&nbsp;&nbsp;&nbsp;&nbsp;�ţ� </td>
    <td height="27" align="left"><select name="depid">
<%
	Iterator itd=colld.iterator();
	while(itd.hasNext()){
		Department dep=(Department)itd.next();
%>
      <option value="<%= dep.getId() %>"><%= dep.getName() %></option>
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
      <option value="<%= dep.getId() %>"><%= dep.getName() %></option>
<%
		}
%>
    </select></td>
  </tr>
  <tr>
    <td height="27" align="center"> ��&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
    <td height="27" align="left"><input name="tel" type="text" maxlength="40" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> �����ַ�� </td>
    <td height="27" align="left"><input name="addr" type="text" size="50" maxlength="200" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> Ա��״̬�� </td>
    <td align="left"><select name="emsid">
<%
	Iterator ite=colle.iterator();
	while(ite.hasNext()){
		Emstate dep=(Emstate)ite.next();
%>
      <option value="<%= dep.getId() %>"><%= dep.getName() %></option>
<%
		}
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
    <td height="40" colspan="2" align="center"><input type="submit" name="Submit" value="���" />
&nbsp;&nbsp;
<input type="reset" name="Submit2" value="����" />
&nbsp;&nbsp;
<input type="button" name="Submit22" value="����" onclick="javascript:document.location='em.htm';"/></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    </tr>
<%
	}
%>
</form>
</table>
</body>
</html>
