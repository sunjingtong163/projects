<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>接收公文</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js" language="javascript"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form action="complete" method="post" name="form1" id="form1" onsubmit="return accepts()">
  <tr>
    <td height="50" colspan="3" align="center" class="title" >接收公文</td>
  </tr>
<%
	Collection coll=(Collection)request.getAttribute("msg");
		if(coll.isEmpty()){
%>
  <tr>
    <td align="center" class="advise" colspan="3">无待办公文</td>
  </tr>
  <tr align="right" >
    <td height="80" colspan="3" ><span class="return" onclick="javascript:document.location='bumf.htm';"><img src="../image/more.gif" width="30" height="9" />返回</span></td>
    </tr>
<%  		}else{
			Iterator it=coll.iterator();
			if(it.hasNext()){
				Bumf bumf=(Bumf)it.next();		
%>
  <tr>
    <td width="390" height="27" align="left" >&nbsp;&nbsp;发送人序号：<%=bumf.getSendter()%></td>
    <td width="227" align="center" class="column" >现在有
      <%
	String ok=(String)request.getAttribute("count");
	if(ok!=null){
		out.print(ok);
	}
	request.removeAttribute("count");
%>条待办公文</td>
    <td width="193" align="right" >公文第[<%=bumf.getId()%>]字号&nbsp;&nbsp;</td></tr>
  <tr>
    <td height="27" colspan="3" align="center" >标&nbsp;&nbsp;题：<%=bumf.getTitle()%></td>
    </tr>
  <tr>
    <td height="269" colspan="3" align="center" valign="top"><textarea name="bumf" cols="100" rows="20"><%=bumf.getContent()%></textarea></td>
  </tr>
  <tr>
    <td height="27" colspan="2" >&nbsp;&nbsp;附件：<a href="upload.jsp">
<%
	out.print(bumf.getAffix());
	session.setAttribute("msg",bumf.getAffix());
%></a></td>
    <td height="27" align="center" ><span class="return" onclick="javascript:document.location='bumf.htm';"><img src="../image/more.gif" width="30" height="9" />返回</span></td>
  </tr>
  <tr>
    <td colspan="3" align="center" ><input type="submit" name="Submit" value="处理完成" />
&nbsp;&nbsp;<input type="hidden" name="bumfid" value="<%=bumf.getId()%>">&nbsp;&nbsp;
<input type="submit" name="Submit" value="以后处理" /></td>
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
