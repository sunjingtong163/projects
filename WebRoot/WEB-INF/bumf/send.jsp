<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���͹���</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js" language="javascript"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form action="save" method="post" name="form1" id="form1" enctype="multipart/form-data" onsubmit="return bumfs()">
<%
	Collection coll=(Collection)request.getAttribute("msg");
		if(coll==null){
			out.print("������ҳ�ѹ��������µ�¼");
		}else{
			Iterator it=coll.iterator();
			if(it.hasNext()){
				Bumf bumf=(Bumf)it.next();		
%>
  <tr>
    <td height="50" colspan="3" align="center" class="title" >���͹���</td>
  </tr>
  <tr>
    <td width="390" height="27" align="left" >&nbsp;&nbsp;��������ţ�
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
    <td width="161" align="right" ><input name="bumfid" type="hidden" value="<%=bumf.getId()%>" />���ĵ�[<%=bumf.getId()%>]�ֺ�&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td height="27" colspan="3" align="center" >��&nbsp;&nbsp;�⣺
      <input type="text" name="title" value="<%=bumf.getTitle()%>" /></td>
    </tr>
  <tr>
    <td height="269" colspan="3" align="center" valign="top"><textarea name="bumf" cols="100" rows="20"><%=bumf.getContent()%></textarea></td>
  </tr>
  <tr>
    <td height="27" colspan="2" >&nbsp;&nbsp;������
      <input type="file" name="file"  value="<%=bumf.getAffix()%>"/></td>
    <td height="27" align="center" ><span class="return" onclick="javascript:document.location='bumf.htm';"><img src="../image/more.gif" width="30" height="9" />����</span></td>
  </tr>
  <tr>
    <td colspan="3" align="center" ><input type="submit" name="Submit" value="���ڷ���" />
&nbsp;&nbsp;&nbsp;
<input type="submit" name="Submit" value="��ʱ����" /></td>
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
