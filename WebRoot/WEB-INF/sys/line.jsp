<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../hear/hear.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���Ų鿴</title>
<link href="../css/work.css" rel="stylesheet" type="text/css" />
<script src="../js/oa.js"></script>
</head>
<body>
<table width="780" height="480" cellpadding="0" cellspacing="0">
<form name="form2" id="form2" method="post" action=""> 
 <tr>
    <td height="50" colspan="4" align="center" class="title" >������Ϣ</td>
  </tr>
  <tr>
    <td height="27" colspan="3" align="center" class="column"> �����б� </td>
    <td width="320" rowspan="2" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td height="30" align="center" class="column">Ա�����</td>
    <td align="center" class="column">Ա������</td>
    <td align="center" class="column">Ա������</td>
    </tr>
  <tr>
    <td colspan="3" rowspan="4" align="center">
	<textarea name="textarea" cols="50" rows="20" disabled>
<% 	
	int delid=0,temp=0;
	UserList list=UserList.getInstance();
	try{
		delid=Integer.parseInt((String)request.getParameter("delid"));
	}catch(Exception e){
		delid=-1;
	}
	if(delid!=-1){
		temp=list.removeUser(delid);
		if(temp>0){
		}
	}
	Vector  vector=list.getList();
	if(!vector.isEmpty()&&vector!=null){
	Enumeration em=vector.elements();
		while(em.hasMoreElements()){
			Eminfo emin=(Eminfo)em.nextElement();
			if(emin.getId()!=-1){
				out.print(emin.getId()+"            ");
				out.print(emin.getName()+"            ");
				out.print(emin.getDepartment()+"            ");
			}
		}
	}
%>	</textarea></td>
    <td height="80" align="center" class="advise">ɾ��������Ա</td>
  </tr>
  <tr>
    <td height="80" align="center">
	<input type="submit" name="Submit2" value="ɾ��" /> &nbsp;&nbsp;
	<input type="text" name="delid" /></td>
  </tr>
</form>
  <tr>
<form name="form2" id="form2" action=""> 
    <td height="80" align="center"><input type="submit" name="Submit" value="ˢ��" /></td>
</form>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
