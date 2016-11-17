<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="oa.sys.*,java.util.*,oa.data.*"%>
<% 
	Db db=new Db();
	session.setMaxInactiveInterval(300);
	int id=0;
	boolean bl=false;
	try{
		id=Integer.parseInt((String)session.getAttribute("id"));
	}catch(Exception e){
		id=0;
	}

	UserList userlist=UserList.getInstance();
	Vector  vc=userlist.getList();
	if(!vc.isEmpty()||vc!=null){
	Enumeration em=vc.elements();
		while(em.hasMoreElements()){
			Eminfo emin=(Eminfo)em.nextElement();
		//	out.print(emin.getId()+"eminid");
		//	out.print(id+"id<br>");
			if(emin.getId()==id){
				bl=true;
			}
		}
		//	out.print(bl+"bl<br>");
		if(!bl){
			//	session.setAttribute("error","你的时间以超时请重新登录");
				out.print("<script>parent.location.href='../index.htm';</script>");
		}
	}else{
			//	session.setAttribute("error","你的时间以超时请重新登录");
				out.print("<script>parent.location.href='../index.htm';</script>");
	}
%>	