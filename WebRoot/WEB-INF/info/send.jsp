<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>短消息发送</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form1" id="form1" method="post" action="send" onsubmit="return info()">
  <tr>
    <td height="50" colspan="4" align="center" class="title" >短消息发送</td>
  </tr>
  <tr>
    <td width="165" rowspan="5">&nbsp;</td>
    <td height="40" align="center"><span class="column">收信人序号:</span></td>
    <td width="293" align="left"><input type="text" name="acceptid" value="<%
	String acceptid=(String)request.getParameter("acceptid");
	if(acceptid!=null){
		out.print(acceptid);
	}
	request.removeAttribute("acceptid");
%>" /></td>
    <td width="168" rowspan="5">&nbsp;</td>
  </tr>
  <tr>
    <td height="40" align="center" class="column">短消息标题:</td>
    <td width="293" align="left"><input name="title" type="text" size="30" maxlength="40" /></td>
  </tr>
  <tr>
    <td height="140" align="center" class="column">内&nbsp;&nbsp;&nbsp;容:</td>
    <td align="left"><textarea name="content" cols="40" rows="10"></textarea></td>
  </tr>
  <tr>
    <td height="80" colspan="2" align="center"><input type="submit" name="Submit" value="发送" />
      &nbsp;&nbsp;&nbsp;
      <input type="button" name="Submit2" value="返回" onclick="javascript:document.location='info.htm';"/></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top">
    <span class="advise">
    <% 
		String daymsg=(String)request.getAttribute("msg");
		if(daymsg!=null){
			out.print(daymsg);
			request.removeAttribute("msg");
		}
%>
    </span>	&nbsp;</td>
  </tr>
</form>
</table>
</body>
</html>
