<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ǩ����</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="7" align="center" class="title">ǩ����¼</td>
  </tr>
  <tr class="column">
    <td height="27" align="center" >ǩ��ʱ��</td>
    <td align="center" >ǩ����</td>
    <td align="center" >�Ƿ�ٵ�</td>
    <td align="center" >�Ƿ�����</td>
    <td align="center" >�Ƿ����</td>
    <td align="center" >�Ƿ����</td>
    <td align="center" >�ϰ�/�°�</td>
  </tr>
<%
	Collection coll=(Collection)request.getAttribute("msg");
	if(coll==null){
%>
  <tr>
    <td height="40" colspan="7" align="center" class="advise" >ǩ����Ϊ��</td>
  </tr>
<% 
	}else{
		Iterator it=coll.iterator();
		while(it.hasNext()){
		Sign sign=(Sign)it.next();
%>
  <tr>
    <td height="27" align="center" ><%=sign.getTime().substring(0,19)%></td>
    <td height="27" align="center" ><%=db.IdtoName(sign.getEmid())%></td>
    <td height="27" align="center" >
<%
	if(sign.getLate()==1){
		out.print("��");
	}else{
		out.print("��");
	}
%>	</td>
    <td height="27" align="center" ><%
	if(sign.getQuit()==1){
		out.print("��");
	}else{
		out.print("��");
	}
%></td>
    <td height="27" align="center" ><%
	if(sign.getLeave()==1){
		out.print("��");
	}else{
		out.print("��");
	}
%></td>
    <td height="27" align="center" ><%
	if(sign.getWork()==1){
		out.print("��");
	}else{
		out.print("��");
	}
%></td>
    <td height="27" align="center" ><%
	if(sign.getSignstateid()==1){
		out.print("�ϰ�");
	}else{
		out.print("�°�");
	}
%></td>
  </tr>
<%
		}	
	}
%>
  <tr align="right">
	<td height="27" colspan="7"><span class="return" onclick="javascript:history.go(-1);"><img src="../image/more.gif" width="30" height="9" />����</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="7" >&nbsp;</td>
  </tr>
</table>
</body>
</html>
