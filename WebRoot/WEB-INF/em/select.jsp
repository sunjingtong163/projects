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
<table width="780" height="480" border="0" cellpadding="0" cellspacing="0">
<form name="form1" id="form1" method="post" action="select" onsubmit="return sel()">
  <tr>
    <td height="50" colspan="12" align="center" class="title" >Ա����Ϣ����</td>
  </tr>
  <tr>
    <td width="287" height="50" align="center"  colspan="5">��
      <select name="column">
        <option value="employeeid">���</option>
        <option value="name">����</option>
        <option value="sex">�Ա�</option>
        <option value="birthday">��������</option>
        <option value="learn">ѧ��</option>
        <option value="post">ְ��</option>
        <option value="departmentid">����</option>
        <option value="jobid">ְλ</option>
        <option value="tel">�绰</option>
        <option value="addr">�����ַ</option>
        <option value="stateid">Ա��״̬</option>
      </select>
      ����      </td>
    <td width="491" align="center" colspan="12"><input type="text" name="sele" />
      &nbsp;
      <input type="submit" name="Submit" value="����" /></td>
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
    <td>ɾ��</td>
  </tr>
<%
Collection coll=(Collection)request.getAttribute("msg");
if(coll!=null){
	Iterator it=coll.iterator();
	while(it.hasNext()){
		Eminfo dep=(Eminfo)it.next();
%>
  <tr align="center">
    <td height="22"><%= dep.getId() %></td>
    <td height="22"><a href="add?id=<%= dep.getId() %>"><%= dep.getName() %></a></td>
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
    <td height="22"><%= dep.getDepartment() %></td>
    <td height="22"><%= dep.getJob() %></td>
    <td height="22"><%= dep.getTel() %></td>
    <td height="22"><%= dep.getAddr() %></td>
    <td height="22"><%= dep.getState() %></td>
    <td height="22"><a href="del?id=<%= dep.getId() %>"><img src="../image/empty.gif" width="20" height="20" border="0" /></a></td>
  </tr>
<% 
		}//while
}//coll
			String selmsg=(String)request.getAttribute("msg2");
			if(selmsg!=null){
%>	
  <tr>
    <td height="50" colspan="12" align="center" class="advise">&nbsp;<%= selmsg %>
	</td>
	</tr>
<%
				request.removeAttribute("msg2");
			}
request.removeAttribute("msg");
%>
  <tr align="right">
    <td height="40" colspan="12"><span class="return" onclick="javascript:document.location='em.htm';"><img src="../image/more.gif" width="30" height="9" />����</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="12">&nbsp;</td>
  </tr>
</form>
</table>
</body>
</html>

