<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ page import="oa.sys.*,java.util.*,oa.data.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>top</title>
<link href="../css/word.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="780" height="65"  border="0"  cellpadding="0" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="144" background="../image/mrbiao.gif" >&nbsp;</td> 
    <td width="636" colspan="5" background="../image/title.gif" >&nbsp;</td> 
  </tr> 
</table>
<%!
	int id,j;
	String jobname;
%> 
<%
	try{
		id=Integer.parseInt((String)session.getAttribute("id"));
	}catch(Exception e){
		id=0;
	}
	UserList list=UserList.getInstance();
	Vector ve=new Vector();
	ve=list.getList();
	if(ve!=null&&ve.size()>0){
		for(j=0;j<ve.size();j++){
			Eminfo em=(Eminfo)ve.elementAt(j);
				if(id==em.getId()){
					jobname=em.getJob();
				}
		}
	}else{
	out.print("<script>parent.location.href='../index.htm';</script>");
	}
	if(id>1){
		if(jobname.indexOf("#")==-1){
%>
<table width="780" height="50"  cellpadding="0" cellspacing="0" > 
  <tr valign="bottom" class="top2"> 
      <td align="center" valign="middle" ><a href="../sign/state" target="mainFrame">ǩ����</a></td>
      <td align="center" valign="middle" ><a href="../bumf/bumf.htm" target="mainFrame">���Ĺ���</a></td> 
    <td align="center" valign="middle"><a href="../info/info.htm" target="mainFrame">�շ���Ϣ</a></td> 
    <td align="center" valign="middle"><a href="../department/departmentinfo.htm" target="mainFrame">������Ϣ</a></td> 
  </tr> 
</table> 
<% 
		}else{
%>
<table width="780" height="30"  cellpadding="0" cellspacing="1" bgcolor="#FF3333"><br>
  <tr valign="bottom" bgcolor="#FFFFFF" class="top2"> 
      <td align="center" valign="middle" ><a href="../sign/signstate.htm" target="mainFrame">ǩ����</a> </td>
      <td align="center" valign="middle" ><a href="../affice/affice.htm" target="mainFrame">�������</a></td>
      <td align="center" valign="middle" ><a href="../bumf/bumf.htm" target="mainFrame">���Ĺ���</a></td> 
      <td align="center" valign="middle" ><a href="../em/em.htm" target="mainFrame">Ա������</a></td>
    <td align="center" valign="middle"><a href="../department/departmentinfo.htm" target="mainFrame">������Ϣ</a></td> 
    <td align="center" valign="middle"><a href="../info/info.htm" target="mainFrame">�շ���Ϣ</a></td> 
    <td align="center" valign="middle"><a href="../emex/emex.htm" target="mainFrame">����Ա������</a></td>
  </tr> 
</table>
<% 
		}
	}else if(id==-1){
%>
<table width="780" height="27"  cellpadding="0" cellspacing="1" bgcolor="#FF3333" >
<br>
  <tr valign="bottom" bgcolor="#FFFFFF" class="top3" > 
      <td align="center" valign="middle" ><a href="../sign/sign.htm" target="mainFrame">ǩ��������</a></td> 
      <td align="center" valign="middle" ><a href="../department/department.htm" target="mainFrame">���Ź���</a></td>
      <td align="center" valign="middle" ><a href="../job/job.htm" target="mainFrame">ְλ����</a></td> 
      <td align="center" valign="middle" ><a href="../affice/view" target="mainFrame">�������</a></td>
      <td align="center" valign="middle"><a href="../bumf/see" target="mainFrame">���Ĳ鿴</a></td> 
    <td align="center" valign="middle"><a href="../em/em.htm" target="mainFrame">Ա������</a></td>
    <td align="center" valign="middle"><a href="../sys/sys.htm" target="mainFrame">�˺Ź���</a></td> 
    <td align="center" valign="middle"><a href="../info/view" target="mainFrame">����Ϣ����</a></td>
    <td align="center" valign="middle"><a href="../sys/line.jsp" target="mainFrame">���߹���</td>
    <td align="center" valign="middle"><a href="../emstate/emstate.htm" target="mainFrame">Ա��״̬����</a></td>
  </tr>
</table>
<% 
	}else{
	out.print("<script>parent.location.href='../index.htm';</script>");
	} 
%>
</body>
</html>
