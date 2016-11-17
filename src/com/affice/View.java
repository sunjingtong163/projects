/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.affice;

import oa.sys.*;
import oa.data.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	View<br>
 *类功能：	查看公告信息<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class View extends HttpServlet{
	private int employeeid;
	private String time;
	private Statement stmt;
	private ResultSet rs;
	private String title,content;
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
			rs=stmt.executeQuery("SELECT * FROM affice");
			while(rs.next()){
				id=rs.getInt(1);
				title=rs.getString(2);
				time=rs.getString(3);
				employeeid=rs.getInt(4);
				content=rs.getString(5);
				title=str.outStr(title);
				content=str.outStr(content);
				Affice affice=new Affice();
				affice.setId(id);
				affice.setTitle(title);
				affice.setEmid(employeeid);
				affice.setTime(time);
				affice.setContent(content);
				ret.add(affice);
			}
				request.setAttribute("msg",ret);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
			dispatcher=request.getRequestDispatcher("view.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}