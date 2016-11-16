/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.emex;

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
 *类功能：	查看优秀员工信息<br>
 *创建：	白伟明	2004年10月6日<br>
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
			rs=stmt.executeQuery("SELECT * FROM emexcellence");
			while(rs.next()){
				Emex emex=new Emex();
				emex.setId(rs.getInt(1));
				emex.setEmid(rs.getInt(2));
				emex.setTime(rs.getString(3));
				emex.setLevelid(rs.getInt(4));
				emex.setDeid(rs.getInt(5));
				ret.add(emex);
			}
				request.setAttribute("msg",ret);
		}catch(Exception e){
			e.printStackTrace();
			out.print(e);
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