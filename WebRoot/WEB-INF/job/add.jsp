<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>职位增加</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form1" id="form1" method="post" action="add" onsubmit="return job()">
  <tr>
    <td height="50" colspan="4" align="center" class="title" >职位增加</td>
  </tr>
  <tr>
    <td height="50">&nbsp;</td>
    <td height="50" colspan="2" class="advise" >注意：添加管理层职位时，请在职务前加“#”号。如：#部长</td>
  </tr>
  <tr>
    <td width="200" rowspan="4" align="center">&nbsp;</td>
    <td width="150" height="80" align="center">职位名称:</td>
    <td width="327" align="center"><input name="name" type="text" size="22" maxlength="40" /></td>
    <td width="200" rowspan="4" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td height="80" align="center">职位描述:</td>
    <td align="center"><textarea name="explain" rows="5"></textarea></td>
  </tr>
  <tr>
    <td height="80" colspan="2" align="center"><input type="submit" name="Submit" value="添加" />
      &nbsp;&nbsp;&nbsp;
      <input type="button" name="Submit2" value="返回" onclick="javascript:document.location='job.htm';"/></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top">
    <span class="advise">
    <% 
		String daymsg=(String)session.getAttribute("depmsg");
		if(daymsg!=null){
			out.print(daymsg);
			session.removeAttribute("depmsg");
		}
%>
    </span>	&nbsp;</td>
  </tr>
</form>
</table>
</body>
</html>
