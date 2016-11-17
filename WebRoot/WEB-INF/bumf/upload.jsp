<%@ page language="java" import="com.jspsmart.upload.*"%><%
	SmartUpload upload=new SmartUpload();	
	String dd=(String)session.getAttribute("msg");
	upload.initialize(pageContext);
	upload.setContentDisposition("inline;");
	upload.downloadFile("upload/"+dd);
%>