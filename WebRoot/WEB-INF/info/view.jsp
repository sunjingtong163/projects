<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
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
    <td height="50" colspan="5" align="center" class="title" >����Ϣ</td>
  </tr>
  <tr align="center" class="column">
    <td width="145" height="30">������</td>
    <td width="194" height="30">��Ϣ����</td>
    <td width="194" height="30">����ʱ��</td>
    <td width="127">ɾ��</td>
    <td width="118">����Ϣ</td>
  </tr>
<%
	Collection coll=(Collection)request.getAttribute("msg");
	Str str=new Str();
	if(coll==null){	
%>
  <tr align="center">
    <td height="30" colspan="5" class="advise">û�ж���Ϣ</td>
  </tr>
<%
	}else{
		Iterator it=coll.iterator();
		while(it.hasNext()){
			Info dep=(Info)it.next();
%>
  <tr align="center">
    <td height="22"><%=db.IdtoName(dep.getSendter())%></td>
    <td height="22"><a href="read?infoid=<%=dep.getId()%>"><%= dep.getTitle()%></a></td>
    <td height="22"><%= dep.getTime().substring(0,19)%>&nbsp;</td>
    <td height="22"><a href="del?infoid=<%=dep.getId()%>"><img src="../image/empty.gif" width="20" height="20" border="0" /></a></td>
    <td height="22">
<%
	if(dep.getNews()!=0){
		out.print("�Ѷ�");
	}else{
		out.print("δ��");
	}
%>
	</td>
  </tr>
<%
		}
	}
	request.removeAttribute("msg");
%>
  <tr align="right">
    <td height="27" colspan="5"><span class="return" onclick="javascript:document.location='info.htm';"><img src="../image/more.gif" width="30" height="9" />����</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5">&nbsp;</td>
  </tr>
</table>
</body>
</html>
