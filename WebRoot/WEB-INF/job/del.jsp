<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ְλɾ��</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form" id="form" method="post" action="del">
  <tr>
    <td height="50" colspan="5" align="center" class="title" >ְλɾ��</td>
  </tr>
<%
	Collection coll=(Collection)session.getAttribute("msg");
	if(coll==null){
%>
  <tr>
    <td height="50" colspan="4" align="center" class="advise" >û��ְλ��Ϣ</td>
  </tr>
  <tr align="right">
	<td height="50" colspan="5"><span class="return" onclick="javascript:document.location='job.htm';"><img src="../image/more.gif" width="30" height="9" />����</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
<%
	}else{
%>
  <tr>
    <td height="50" align="center" class="advise" >&nbsp;</td>
    <td height="50" colspan="2" class="advise" >ע�⣺������ɾ�����ڴ�ְλ�µ�����Ա����Ϣ</td>
    <td height="50" align="center" class="advise" >&nbsp;</td>
  </tr>
  <tr>
    <td width="150" align="center">&nbsp;</td>
    <td width="210" height="80" align="center">��ѡ��Ҫɾ����ְλ����:</td>
    <td width="268" height="80" align="center"><select name="id" >
<%
	Iterator it=coll.iterator();
	while(it.hasNext()){
		Department dep=(Department)it.next();
%>
      <option value="<%= dep.getId() %>"><%= dep.getName() %></option>
      <%
		}
%>
    </select></td>
    <td width="150" align="center">&nbsp;</td>
  <tr>
    <td height="50" colspan="4" align="center" class="advise"><input type="submit" name="Submit" value="ɾ��" />
      &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="Submit2" value="����" onclick="javascript:document.location='job.htm';"/></td>
  </tr>
  </tr>
  <tr>
<% 
		String delmsg=(String)request.getAttribute("delmsg");
		if(delmsg!=null){
%>	
    <td height="50" colspan="4" align="center" class="advise">&nbsp;<%= delmsg %></td>
<%
			session.removeAttribute("msg");
		}
	}
%>
	</tr>
 </form>
 <tr>
   <td colspan="4">&nbsp;</td>
  </tr>
</table>
</body>
</html>
