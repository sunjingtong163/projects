<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>部门查看</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="5" align="center" class="title" >公告信息</td>
  </tr>
  <tr align="center" class="column">
    <td width="60" height="30">发布人</td>
    <td width="194" height="30">公告标题</td>
    <td width="84" height="30">发布时间</td>
    <td width="398">具体公告</td>
    <td width="42">删除</td>
  </tr>
<%
	Collection coll=(Collection)request.getAttribute("msg");
	if(coll==null){	
%>
  <tr align="center">
    <td height="30" colspan="5" class="advise">没有添加公告</td>
  </tr>
<%
	}else{
		Iterator it=coll.iterator();
		while(it.hasNext()){
			Affice dep=(Affice)it.next();
%>
  <tr align="center"  >
    <td height="22"><%=db.IdtoName(dep.getEmid())%></td>
    <td height="22"><%= dep.getTitle()%></td>
    <td height="22"><%= dep.getTime().substring(0,10)%>&nbsp;</td>
    <td height="22"><%= dep.getContent() %></td>
    <td height="22"><a href="del?afficeid=<%=dep.getId()%>"><img src="../image/empty.gif" width="20" height="20" border="0" /></a></td>
  </tr>
<%
		}
	}
	request.removeAttribute("msg");
%>
  <tr align="right">
    <td height="27" colspan="5"><span class="return" onclick="javascript:history.go(-1);"><img src="../image/more.gif" width="30" height="9" />返回</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5">&nbsp;</td>
  </tr>
</table>
</body>
</html>
