<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���Ų鿴</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="7" align="center" class="title" >����Ա����Ϣ</td>
  </tr>
  <tr align="center" class="column">
    <td width="50" rowspan="300">&nbsp;</td>
    <td width="112" height="30">����</td>
    <td width="91">���</td>
    <td width="197">��ѡʱ��</td>
    <td width="164">��ѡ����</td>
    <td width="100">ɾ��</td>
    <td width="64" rowspan="300">&nbsp;</td>
  </tr>
<%
	Collection coll=(Collection)request.getAttribute("msg");
	Str str=new Str();
	if(coll==null){	
%>
  <tr align="center">
    <td height="30" colspan="5" class="advise">û����ӹ���</td>
  </tr>
<%
	}else{
		Iterator it=coll.iterator();
		while(it.hasNext()){
			Emex dep=(Emex)it.next();
%>
  <tr align="center"  >
    <td height="22"><%= db.IdtoName(dep.getEmid()) %></td>
    <td height="22"><%= dep.getEmid()%></td>
    <td height="22"><%= dep.getTime().substring(0,10)%> </td>
    <td height="22"><%= db.IdtoDeName(dep.getDeid()) %></td>
    <td height="22"><a href="del?emexid=<%=dep.getId()%>"><img src="../image/empty.gif" width="20" height="20" border="0" /></a></td>
  </tr>
<%
		}
	}
	request.removeAttribute("msg");
%>
  <tr align="right">
    <td height="27" colspan="6"><span class="return" onclick="javascript:document.location='emex.htm';"><img src="../image/more.gif" width="30" height="9" />����</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6">&nbsp;</td>
  </tr>
</table>
</body>
</html>
