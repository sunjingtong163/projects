<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Ա���鿴</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="11" align="center" class="title" >Ա����Ϣһ����</td>
  </tr>
  <tr align="center" class="column">
    <td height="30">���</td>
    <td>����</td>
    <td>�Ա�</td>
    <td>��������</td>
    <td>ѧ��</td>
    <td>ְ��</td>
    <td>����</td>
    <td>ְλ</td>
    <td>�绰</td>
    <td>��ַ</td>
    <td>״̬</td>
  </tr>
<%
Collection coll=(Collection)request.getAttribute("msg");
if(coll==null){
%>
  <tr align="center">
    <td height="30" colspan="11" class="advise">û�����Ա��</td>
  </tr>
  <%
}else{
Iterator it=coll.iterator();
while(it.hasNext()){
	Eminfo dep=(Eminfo)it.next();
%>
  <tr align="center">
    <td height="22"><%= dep.getId() %></td>
    <td height="22"><%= dep.getName() %></td>
    <td height="22">
<% 
	if(dep.getSex()==0){
		out.print("Ů"); 
	}else{
		out.print("��");
	}
%></td>
    <td height="22"><%= dep.getBirthday() %></td>
    <td height="22"><%= dep.getLearn() %></td>
    <td height="22"><%= dep.getPost() %></td>
    <td height="22"><%= dep.getDepartment()%></td>
    <td height="22"><%= dep.getJob() %></td>
    <td height="22"><%= dep.getTel() %></td>
    <td height="22"><%= dep.getAddr() %></td>
    <td height="22"><%= dep.getState() %></td>
  </tr>
  <%
	}
}
request.removeAttribute("msg");
%>
  <tr align="right">
    <td height="27" colspan="11"><span class="return" onclick="javascript:history.go(-1);"><img src="../image/more.gif" width="30" height="9" />����</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="11">&nbsp;</td>
  </tr>
</table>
</body>
</html>
