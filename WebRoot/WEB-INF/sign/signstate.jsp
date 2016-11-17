<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>签到簿</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form1" id="form1" method="post" action="signstate" onsubmit="return sign()">
  <tr>
    <td height="50" colspan="4" align="center" class="title" >设定签到时间</td>
    </tr>
  <tr>
    <td width="180" rowspan="4" align="center" >&nbsp;</td>
    <td width="133" height="60" align="center">上班：</td>
    <td height="27" align="left"><input type="text" name="up" />
时:分 (24hr)</td>
    <td width="180" rowspan="4" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td height="60" align="center">下班：</td>
    <td><input type="text" name="down" />
时:分 (24hr)</td>
    </tr>
  <tr>
    <td height="60" colspan="2" align="center" class="advise"><% 
		String daymsg=(String)session.getAttribute("daymsg");
		if(daymsg!=null){
			out.print(daymsg);
			session.removeAttribute("daymsg");
		}
%>
&nbsp;</td>
  </tr>
  <tr>
    <td height="60" colspan="2" align="center"><input type="submit" name="Submit" value="设定" />
      &nbsp;&nbsp;
      <input type="reset" name="Submit2" value="返回" onclick="javascript:document.location='sign.htm';"/></td>
  </tr>
</form>
  <tr>
    <td colspan="4">&nbsp;</td>
  </tr>
</table>
</body>
</html>
