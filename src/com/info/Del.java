/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.info;

import oa.sys.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Del<br>
 *类功能：	删除短消息<br>
 *创建：	白伟明	2004年10月11日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Del extends HttpServlet{
	private int temp;
	private String sqli;
	private int id;
	private int infoid;
	private HttpSession session=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Str str=new Str();
		Db db=new Db();
		PrintWriter out=response.getWriter();
		session=request.getSession();
		try{
		id=Integer.parseInt((String)session.getAttribute("id"));
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			infoid=Integer.parseInt((String)request.getParameter("infoid"));
		}catch(Exception e){
			e.printStackTrace();
		}
		if(id==-1){
			sqli="DELETE FROM info WHERE infoid="+infoid;
		}else{
			sqli="DELETE FROM info WHERE accepter="+id+" AND infoid="+infoid;
		}
		try {
			stmt=db.getStmt();
			temp=stmt.executeUpdate(sqli);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("view");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}