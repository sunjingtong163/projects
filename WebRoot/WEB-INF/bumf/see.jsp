<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查看公文</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js" language="javascript"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="5" align="center" class="title" >查看公文</td>
  </tr>
  <tr align="center" class="column">
    <td height="27" >公文第[*]字号</td>
    <td >发送人</td>
    <td >接收人</td>
    <td >附件</td>
    <td >处理时间</td>
  </tr>
<%
	Collection coll=(Collection)request.getAttribute("msg");
		if(coll.isEmpty()){
%>
  <tr>
    <td colspan="5" align="center" class="advise">库中暂无公文</td>
  </tr>
<% 
 		}else{
			Iterator it=coll.iterator();
			while(it.hasNext()){
				Bumf bumf=(Bumf)it.next();		
%>
  <tr align="center">
    <td height="27" ><%= bumf.getId() %></td>
    <td ><%= db.IdtoName(bumf.getSendter()) %></td>
    <td ><%= db.IdtoName(bumf.getAccepter()) %></td>
    <td ><%= bumf.getAffix() %></td>
    <td ><%= bumf.getTime().substring(0,11) %></td>
  </tr>
<%
		}
	}
	request.removeAttribute("msg");
%>
  <tr>
    <td height="27" colspan="5" align="right" ><span class="return" onclick="javascript:history.go(-1);"><img src="../image/more.gif" width="30" height="9" />返回</span></td>
  </tr>
  <tr>
    <td colspan="5" align="center" >&nbsp;</td>
  </tr>
</table>
</body>
</html>
