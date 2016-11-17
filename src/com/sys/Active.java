/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.sys;

import oa.sys.*;
import oa.data.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Active<br>
 *类功能：	激活账号（类型）<br>
 *创建：	白伟明	2004年10月11日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Active extends HttpServlet{
	private String password;
	private String time;
	private Statement stmt;
	private ResultSet rs;
	private RequestDispatcher dispatcher;
	private int id=0;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Db db=new Db();
		Str str=new Str();
		Collection ret=new ArrayList();
		PrintWriter out=response.getWriter();
		try{
			stmt=db.getStmtread();
			rs=stmt.executeQuery("SELECT * FROM password");
			while(rs.next()){
				id=rs.getInt(1);
				password=rs.getString(2);
				time=rs.getString(3);
				Password pass=new Password();
				pass.setId(id);
				pass.setPassword(password);
				pass.setTime(time);
				ret.add(pass);
			}
				request.setAttribute("msg",ret);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
			dispatcher=request.getRequestDispatcher("active.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}