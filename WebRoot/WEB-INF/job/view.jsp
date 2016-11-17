<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>职位查看</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="3" align="center" class="title" >职位信息一览表</td>
  </tr>
  <tr align="center" class="column">
    <td width="120" height="30">职位序号</td>
    <td height="30">职位名称</td>
    <td width="390" height="30">大概工作描述</td>
  </tr>
  <%
Collection coll=(Collection)request.getAttribute("msg");
if(coll==null){
%>
  <tr align="center">
    <td height="30" colspan="3" class="advise">没有添加职位</td>
  </tr>
  <%
}else{
Iterator it=coll.iterator();
while(it.hasNext()){
	Department dep=(Department)it.next();
%>
  <tr align="center">
    <td height="22"><%= dep.getId() %></td>
    <td height="22"><%= dep.getName() %></td>
    <td height="22" align="left"><%= dep.getExplain() %></td>
  </tr>
  <%
	}
}
request.removeAttribute("msg");
%>
  <tr align="right">
    <td height="27" colspan="3"><span class="return" onclick="javascript:history.go(-1);"><img src="../image/more.gif" width="30" height="9" />返回</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
</body>
</html>
