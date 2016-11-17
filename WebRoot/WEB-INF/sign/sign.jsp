<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>签到</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<%
	String up="",down="",ups="",downs="";
	String msg=(String)request.getAttribute("advmsg");
	Collection coll=(Collection)request.getAttribute("msg");
	if(coll!=null){
		Iterator it=coll.iterator();
		while(it.hasNext()){
			Signstate ss=(Signstate)it.next();
			if(ss.getId()==1){
				up=ss.getTime().substring(11,19);
			}
			if(ss.getId()==2){
				down=ss.getTime().substring(11,19);
			}
		}
	}
	coll.clear();
	coll=(Collection)request.getAttribute("singmsg");
	if(coll!=null){
		Iterator it=coll.iterator();
		while(it.hasNext()){
			Sign sign=(Sign)it.next();
			if(sign.getSignstateid()==1){
				ups=sign.getTime().substring(11,19);
			}
			if(sign.getSignstateid()==2){
				downs=sign.getTime().substring(11,19);
			}
		}
	}
	request.removeAttribute("advmsg");
	request.removeAttribute("msg");
	request.removeAttribute("singmsg");
%>
 <tr>
    <td height="50" colspan="4" align="center" class="title">签到</td>
  </tr>
  <tr>
    <td width="180" rowspan="8" >&nbsp;</td>
    <td height="50" colspan="2" align="center" class="advise" ><%=msg%></td>
    <td width="180" rowspan="8" >&nbsp;</td>
  </tr>
<form name="form1" id="form1" method="post" action="sign">
  <tr>
    <td width="150" height="50" align="center" >上班：</td>
    <td width="268" align="left" ><input type="text" name="up" readonly value="<%=up%>" /></td>
  </tr>
  <tr>
    <td height="50" colspan="2" align="center" >
<%
	if(ups!=""){
		out.print("签到时间："+ups);
	}else{
%>
      <input type="submit" name="Submit" value="上班签到"/>
<%
	}
%>
	  </td>
  </tr>
</form>  
<form name="form2" id="form2" method="post" action="sign">
  <tr>
    <td height="50" align="center" >下班：</td>
    <td align="left" ><input type="text" name="down" readonly value="<%=down%>" /></td>
  </tr>
  <tr>
    <td height="50" colspan="2" align="center" >
<%
	if(downs!=""){
		out.print("签到时间："+downs);
	}else{
%>
      <input type="submit" name="Submit2" value="下班签到" />
<%
	}
%>
	  </td>
  </tr>
</form>
 <tr>
	<td height="27" colspan="2" align="right"><span class="return" onclick="javascript:history.go(-1);"><img src="../image/more.gif" width="30" height="9" />返回</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
 </tr>
  <tr>
    <td colspan="2" >&nbsp;</td>
  </tr>
</table>
</body>
</html>
