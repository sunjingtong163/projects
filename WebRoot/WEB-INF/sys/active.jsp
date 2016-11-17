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
  <tr>
    <td height="50" colspan="7" align="center" class="title" >员工激活账号查看</td>
  </tr>
  <tr class="column">
    <td width="17" align="center"  >&nbsp;</td>
    <td width="150" align="center"  >员工姓名</td>
    <td width="104" height="27" align="center"  >员工id</td>
    <td width="143" align="center"  >员工密码</td>
    <td width="217" align="center"  >最后激活时间</td>
    <td width="129" align="center"  >删除记录</td>
    <td width="20" align="center"  >&nbsp;</td>
  </tr>
<% 
	Collection coll=(Collection)request.getAttribute("msg");
	if(coll==null){
%>
   <tr align="center">
     <td height="40" colspan="7" align="center" class="advise"  >没有激活账号</td>
  </tr>
<%
	}else{
		Iterator it=coll.iterator();
		while(it.hasNext()){
			Password pass=(Password)it.next();
%>
  <tr>
    <td align="center"  >&nbsp;</td>
    <td align="center"  ><%= db.IdtoName(pass.getId()) %></td>
    <td height="27" align="center"  ><%= pass.getId() %></td>
    <td align="center"  ><%= pass.getPassword() %></td>
    <td align="center"  ><%= pass.getTime().substring(0,19) %></td>
    <td align="center"><a href="del?active=<%=pass.getId()%>"><img src="../image/empty.gif" width="20" height="20" border="0" /></a></td>
    <td align="center"  >&nbsp;</td>
  </tr>
<%
		}
	}
%>
  <tr align="right">
    <td height="40" colspan="7"><span class="return" onclick="javascript:document.location='sys.htm';"><img src="../image/more.gif" width="30" height="9" />返回</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
  </tr>
</table>
</body>
</html>

