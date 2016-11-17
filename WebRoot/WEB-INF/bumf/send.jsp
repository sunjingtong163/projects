<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>发送公文</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js" language="javascript"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form action="save" method="post" name="form1" id="form1" enctype="multipart/form-data" onsubmit="return bumfs()">
<%
	Collection coll=(Collection)request.getAttribute("msg");
		if(coll==null){
			out.print("您的网页已过期请重新登录");
		}else{
			Iterator it=coll.iterator();
			if(it.hasNext()){
				Bumf bumf=(Bumf)it.next();		
%>
  <tr>
    <td height="50" colspan="3" align="center" class="title" >发送公文</td>
  </tr>
  <tr>
    <td width="390" height="27" align="left" >&nbsp;&nbsp;接收人序号：
      <input type="text" name="emid" value="<%=bumf.getAccepter()%>" /></td>
    <td width="227" align="center" class="column" >
<%
	String ok=(String)request.getAttribute("ok");
	if(ok!=null){
		out.print(ok);
	}
	request.removeAttribute("ok");
%>
	&nbsp;</td>
    <td width="161" align="right" ><input name="bumfid" type="hidden" value="<%=bumf.getId()%>" />公文第[<%=bumf.getId()%>]字号&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td height="27" colspan="3" align="center" >标&nbsp;&nbsp;题：
      <input type="text" name="title" value="<%=bumf.getTitle()%>" /></td>
    </tr>
  <tr>
    <td height="269" colspan="3" align="center" valign="top"><textarea name="bumf" cols="100" rows="20"><%=bumf.getContent()%></textarea></td>
  </tr>
  <tr>
    <td height="27" colspan="2" >&nbsp;&nbsp;附件：
      <input type="file" name="file"  value="<%=bumf.getAffix()%>"/></td>
    <td height="27" align="center" ><span class="return" onclick="javascript:document.location='bumf.htm';"><img src="../image/more.gif" width="30" height="9" />返回</span></td>
  </tr>
  <tr>
    <td colspan="3" align="center" ><input type="submit" name="Submit" value="现在发送" />
&nbsp;&nbsp;&nbsp;
<input type="submit" name="Submit" value="暂时保存" /></td>
    </tr>
<%
		}
	}
	request.removeAttribute("msg");
%>
</form>
</table>
</body>
</html>
