<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form1" id="form1" method="post" action="add" onsubmit="return affice()">
  <tr>
    <td height="50" colspan="4" align="center" class="title" >���淢��</td>
  </tr>
  <tr>
    <td width="165" rowspan="4">&nbsp;</td>
    <td width="152" height="80" align="center">�������:</td>
    <td width="293" align="center"><input name="title" type="text" size="40" maxlength="40" /></td>
    <td width="168" rowspan="4">&nbsp;</td>
  </tr>
  <tr>
    <td height="140" align="center">���幫��:</td>
    <td align="center"><textarea name="content" cols="40" rows="10"></textarea></td>
  </tr>
  <tr>
    <td height="80" colspan="2" align="center"><input type="submit" name="Submit" value="����" />
      &nbsp;&nbsp;&nbsp;
      <input type="button" name="Submit2" value="����" onclick="javascript:document.location='affice.htm';"/></td>
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
