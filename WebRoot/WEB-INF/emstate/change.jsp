<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Ա��״̬�޸�</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form" id="form" method="post" action="select">
  <tr>
    <td height="50" colspan="5" align="center" class="title" >Ա��״̬�޸�</td>
  </tr>
<%
	Collection coll=(Collection)session.getAttribute("msg");
	if(coll==null){
%>
  <tr>
    <td height="50" colspan="5" align="center" class="advise" >û��Ա��״̬��Ϣ</td>
  </tr>
  <tr align="right">
	<td height="50" colspan="5"><span class="return" onclick="javascript:document.location='emstate.htm';"><img src="../image/more.gif" width="30" height="9" />����</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
<%
	}else{
%>
  <tr>
    <td width="150" align="center">&nbsp;</td>
    <td height="80" align="center">��ѡ��Ҫ�޸ĵ�Ա��״̬����:</td>
    <td width="211" height="80" align="center"><select name="id" onchange="">
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
    <td width="67" height="80" align="center"><input type="submit" name="Submit" value="GO!" /></td>
    <td width="150" align="center">&nbsp;</td>
  </tr>
<% 
		String selmsg=(String)request.getAttribute("selmsg");
		if(selmsg!=null){
%>	
  <tr>
    <td height="50" colspan="5" align="center" class="advise">&nbsp;<%= selmsg %>
	</td>
	</tr>
<%
			session.removeAttribute("selmsg");
		}
%>
 </form>
<% 
	}
	Collection coll2=(Collection)request.getAttribute("msg2");
	if(coll2!=null){
		Iterator it2=coll2.iterator();
		while(it2.hasNext()){
			Department dep2=(Department)it2.next();
%>
<form name="form1" id="form1" method="post" action="change" onsubmit="return dep()">
 <tr>
   <td width="150" rowspan="4" align="center">&nbsp;</td>
    <td width="200" height="80" align="center">Ա��״̬����:</td>
    <td height="80" colspan="2" align="center"><input name="name" type="text" size="22" maxlength="40"  value="<%= dep2.getName() %>"/></td>
    <td width="150" rowspan="4" align="center">&nbsp;</td>
 </tr>
  <tr>
    <td height="80" align="center">Ա��״̬����:</td>
    <td height="80" colspan="2" align="center"><textarea name="explain" rows="5"><%= dep2.getExplain() %></textarea></td>
    </tr>
  <tr>
    <td height="80" colspan="3" align="center">
	<input type="hidden" name="id" value="<%= dep2.getId() %>">
    <input type="submit" name="Submit2" value="�޸�" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="Submit2" value="����" onclick="javascript:document.location='emstate.htm';"/></td>
    </tr>
<% 
			}
		}
		request.removeAttribute("msg2");
%>
  <tr>
    <td colspan="3" align="center" valign="top">&nbsp;</td>
    </tr>
 </form>
</table>
</body>
</html>
