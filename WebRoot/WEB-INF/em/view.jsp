<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>员工查看</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="11" align="center" class="title" >员工信息一览表</td>
  </tr>
  <tr align="center" class="column">
    <td height="30">序号</td>
    <td>姓名</td>
    <td>性别</td>
    <td>出生日期</td>
    <td>学历</td>
    <td>职称</td>
    <td>部门</td>
    <td>职位</td>
    <td>电话</td>
    <td>地址</td>
    <td>状态</td>
  </tr>
<%
Collection coll=(Collection)request.getAttribute("msg");
if(coll==null){
%>
  <tr align="center">
    <td height="30" colspan="11" class="advise">没有添加员工</td>
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
		out.print("女"); 
	}else{
		out.print("男");
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
    <td height="27" colspan="11"><span class="return" onclick="javascript:history.go(-1);"><img src="../image/more.gif" width="30" height="9" />返回</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="11">&nbsp;</td>
  </tr>
</table>
</body>
</html>
