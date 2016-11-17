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
<table width="780" height="480" border="0" cellpadding="0" cellspacing="0">
<form name="form1" id="form1" method="post" action="select" onsubmit="return sel()">
  <tr>
    <td height="50" colspan="12" align="center" class="title" >员工信息查找</td>
  </tr>
  <tr>
    <td width="287" height="50" align="center"  colspan="5">按
      <select name="column">
        <option value="employeeid">序号</option>
        <option value="name">姓名</option>
        <option value="sex">性别</option>
        <option value="birthday">出生日期</option>
        <option value="learn">学历</option>
        <option value="post">职称</option>
        <option value="departmentid">部门</option>
        <option value="jobid">职位</option>
        <option value="tel">电话</option>
        <option value="addr">具体地址</option>
        <option value="stateid">员工状态</option>
      </select>
      查找      </td>
    <td width="491" align="center" colspan="12"><input type="text" name="sele" />
      &nbsp;
      <input type="submit" name="Submit" value="查找" /></td>
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
    <td>删除</td>
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
				out.print("女"); 
			}else{
				out.print("男");
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
    <td height="40" colspan="12"><span class="return" onclick="javascript:document.location='em.htm';"><img src="../image/more.gif" width="30" height="9" />返回</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="12">&nbsp;</td>
  </tr>
</form>
</table>
</body>
</html>

