<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����Ϣ</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="4" align="center" class="title" >����Ϣ</td>
  </tr>
<%
	Collection coll=(Collection)request.getAttribute("msg");
	Str str=new Str();
	if(coll!=null){	
		Iterator it=coll.iterator();
		if(it.hasNext()){
			Info dep=(Info)it.next();
%>
  <tr >
    <td width="150" rowspan="5" >&nbsp;</td>
    <td width="180" height="40" align="center" class="column" >�� �� �ˣ�</td>
    <td >
<%
	Connection con=Db.getCon();
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs=stmt.executeQuery("SELECT name FROM eminfo WHERE employeeid="+dep.getSendter());
		if(rs.next()){
			out.print(str.outStr(rs.getString(1)));
		}else{
			out.print(dep.getSendter());
		}
	db.close();
%>
</td>
    <td width="150" rowspan="5" >&nbsp;</td>
  </tr>
  <tr >
    <td height="40" align="center" class="column" >����ʱ�䣺</td>
    <td ><%= dep.getTime().substring(0,19)%></td>
  </tr>
  <tr >
    <td height="40" align="center" class="column" >��&nbsp;&nbsp;&nbsp;&nbsp;�⣺</td>
    <td ><%= dep.getTitle() %></td>
  </tr>
  <tr >
    <td height="100" align="center" ><p class="column">��&nbsp;&nbsp;&nbsp;&nbsp;�ݣ�</p>    </td>
    <td valign="middle" ><%= dep.getContent() %></td>
  </tr>
  <tr >
    <td height="50" colspan="2" align="center" ><a href="del?infoid=<%= dep.getId() %>">ɾ��</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="send.jsp?acceptid=<%= dep.getSendter() %>">�ظ�</a></td>
  </tr>
<%
		}
	}
	request.removeAttribute("msg");
%>
  <tr align="right">
    <td height="40" colspan="4"><span class="return" onclick="javascript:document.location='view'"><img src="../image/more.gif" width="30" height="9" />����</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4">&nbsp;</td>
  </tr>
</table>
</body>
</html>
