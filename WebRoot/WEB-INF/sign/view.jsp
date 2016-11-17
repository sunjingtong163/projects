<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>签到簿</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" colspan="7" align="center" class="title">签到记录</td>
  </tr>
  <tr class="column">
    <td height="27" align="center" >签到时间</td>
    <td align="center" >签到人</td>
    <td align="center" >是否迟到</td>
    <td align="center" >是否早退</td>
    <td align="center" >是否请假</td>
    <td align="center" >是否旷工</td>
    <td align="center" >上班/下班</td>
  </tr>
<%
	Collection coll=(Collection)request.getAttribute("msg");
	if(coll==null){
%>
  <tr>
    <td height="40" colspan="7" align="center" class="advise" >签到簿为空</td>
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
		out.print("是");
	}else{
		out.print("否");
	}
%>	</td>
    <td height="27" align="center" ><%
	if(sign.getQuit()==1){
		out.print("是");
	}else{
		out.print("否");
	}
%></td>
    <td height="27" align="center" ><%
	if(sign.getLeave()==1){
		out.print("是");
	}else{
		out.print("否");
	}
%></td>
    <td height="27" align="center" ><%
	if(sign.getWork()==1){
		out.print("是");
	}else{
		out.print("否");
	}
%></td>
    <td height="27" align="center" ><%
	if(sign.getSignstateid()==1){
		out.print("上班");
	}else{
		out.print("下班");
	}
%></td>
  </tr>
<%
		}	
	}
%>
  <tr align="right">
	<td height="27" colspan="7"><span class="return" onclick="javascript:history.go(-1);"><img src="../image/more.gif" width="30" height="9" />返回</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="7" >&nbsp;</td>
  </tr>
</table>
</body>
</html>
