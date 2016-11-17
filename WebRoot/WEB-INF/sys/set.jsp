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
<form name="form1" id="form1" method="post" action="set" onsubmit="return set()">
  <tr>
    <td width="778" height="50" align="center" class="title" >员工密码设定</td>
  </tr>
  <tr>
    <td height="50" align="center"  >请输入要设定的员工id序号</td>
  </tr>
  <tr>
    <td height="50" align="center"  ><input type="text" name="id" />
      </td>
    </tr>
  <tr>
    <td height="50" align="center" >请输入要设定的员工密码</td>
  </tr>
  <tr>
    <td height="50" align="center" ><input type="text" name="password" />
      </td>
  </tr>
  <tr align="right">
    <td height="40" align="center"><input type="submit" name="Submit2" value="设定" /></td>
  </tr>
  <tr align="right">
    <td height="40" align="center" class="advise">
<%
	String msg=(String)request.getAttribute("msg");
		if(msg!=null){
			out.print(msg);
		}
		request.removeAttribute("msg");
%>
	&nbsp;</td>
  </tr>
  <tr>
  <tr align="right">
    <td height="40"><span class="return" onclick="javascript:document.location='sys.htm';"><img src="../image/more.gif" width="30" height="9" />返回</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</form>
</table>
</body>
</html>

