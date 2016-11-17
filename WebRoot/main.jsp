<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ page import="java.util.*,oa.data.*,oa.sys.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>main</title>
<link href="css/word.css" rel="stylesheet" type="text/css" />
</head>
<body> 
<table width="780" height="480"  border="0"  cellpadding="0" cellspacing="0"> 
  <tr> 
    <td width="390"  valign="top" background="image/emexcellence.gif"> <table width="386" border="0" align="left" cellpadding="0" cellspacing="0" > 
        <tr> 
          <td width="72" rowspan="8">&nbsp;</td> 
          <td height="120" colspan="2">&nbsp;</td> 
          <td width="72" rowspan="8">&nbsp;</td> 
        </tr> 
        <tr> 
          <td width="109" height="27" align="center" class="top2">姓名</td> 
          <td width="133" align="center" class="top2">部门</td> 
        </tr> 
        <% 
	Db db=new Db();
	Str str=new Str();
	Collection colle=(Collection)request.getAttribute("emsg");
	if(colle!=null){
	Iterator it=colle.iterator();
		while(it.hasNext()){
		Emex emex=(Emex)it.next();
%> 
        <tr> 
          <td height="27" align="center" class="top2"><%=db.IdtoName(emex.getEmid())%></td> 
          <td align="center" class="top2"><%=db.IdtoDeName(emex.getDeid())%></td> 
        </tr>
        <%
		}
	}
%> 
        <tr> 
          <td colspan="2" align="center">&nbsp;</td> 
        </tr> 
      </table></td> 
    <td width="404" valign="top" background="image/affice.gif"> 
	<table width="390"  cellpadding="0"  cellspacing="0" border="0"> 
        <tr> 
          <td width="40" rowspan="6">&nbsp;</td> 
          <td height="120" colspan="2">&nbsp;</td> 
          <td width="40" rowspan="6">&nbsp;</td> 
        </tr> 
        <%
	Collection colla=(Collection)request.getAttribute("amsg");
	if(colla!=null){
	Iterator it=colla.iterator();
		if(it.hasNext()){
		Affice affice=(Affice)it.next();
%> 
        <tr> 
          <td height="40" colspan="2" align="center" class="top1"><%=affice.getTitle()%></td> 
        </tr> 
        <tr> 
          <td height="200" colspan="2" valign="top" class="text">&nbsp;&nbsp;&nbsp;&nbsp;<%=affice.getContent()%></td> 
        </tr> 
        <tr> 
          <td width="201" height="27" align="right" class="text">发&nbsp;布&nbsp;人：</td> 
          <td width="109" align="center" class="text1"><%=db.IdtoName(affice.getEmid())%></td> 
        </tr> 
        <tr> 
          <td height="27" align="right" class="text">发布时间： </td> 
          <td height="27" align="center" valign="middle" class="text1"> <%
		out.print(affice.getTime().substring(0,11));
		}
	}
%> </td> 
        </tr> 
        <tr> 
          <td colspan="2">&nbsp;</td> 
        </tr> 
      </table></td> 
  </tr> 
</table> 
</body>
</html>
