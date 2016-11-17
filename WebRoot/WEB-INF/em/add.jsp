<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>员工信息增加</title>
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
    <td height="50" colspan="4" align="center" class="title" >员工信息增加</td>
  </tr>
  <tr>
    <td width="180" rowspan="13">&nbsp;</td>
    <td width="150" height="27" align="center"> 姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
    <td align="left"><input name="name" type="text" maxlength="40" /></td>
    <td width="180" rowspan="13">&nbsp;</td>
  </tr>
  <tr>
    <td height="27" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
    <td height="27" align="left">
      <input name="sex" type="radio" value="1" checked />
  男
      <input type="radio" name="sex" value="0" />
  女    </td>
  </tr>
  <tr>
    <td height="27" align="center"> 出生日期：</td>
    <td height="27" align="left"><input name="birthday" type="text" maxlength="11" />
      年-月-日</td>
  </tr>
  <tr>
    <td height="27" align="center">学&nbsp;&nbsp;&nbsp;&nbsp;历： </td>
    <td height="27" align="left"><input name="learn" type="text" size="20" maxlength="20" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> 职&nbsp;&nbsp;&nbsp;&nbsp;称： </td>
    <td height="27" align="left"><input name="post" type="text" size="20" maxlength="20" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> 部&nbsp;&nbsp;&nbsp;&nbsp;门： </td>
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
    <td height="27" align="center"> 职&nbsp;&nbsp;&nbsp;&nbsp;位： </td>
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
    <td height="27" align="center"> 电&nbsp;&nbsp;&nbsp;&nbsp;话： </td>
    <td height="27" align="left"><input name="tel" type="text" maxlength="40" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> 具体地址： </td>
    <td height="27" align="left"><input name="addr" type="text" size="50" maxlength="200" /></td>
  </tr>
  <tr>
    <td height="27" align="center"> 员工状态： </td>
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
    <td height="40" colspan="2" align="center"><input type="submit" name="Submit" value="添加" />
&nbsp;&nbsp;
<input type="reset" name="Submit2" value="重置" />
&nbsp;&nbsp;
<input type="button" name="Submit22" value="返回" onclick="javascript:document.location='em.htm';"/></td>
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
