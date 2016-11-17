/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.login;

import oa.sys.*;
import oa.sys.Time;
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
public class Main extends HttpServlet{
	private String content;
	private int employeeid;
	private String time;
	private String title;
	private int id;
	private Statement stmt;
	private ResultSet rs;
	private RequestDispatcher dispatcher;
	private String sqls,sqls1;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Db db=new Db();
		Str str=new Str();
		Time moon=new Time();
		sqls="SELECT * FROM affice ORDER BY afficeid DESC";
		sqls1="SELECT * FROM emexcellence WHERE time>='"+moon.getYear()+"-"+moon.getMonth()+"-01'";
		Collection colle=new ArrayList();
		Collection colla=new ArrayList();
		PrintWriter out=response.getWriter();
		try{
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			if(rs.next()){
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
				colla.add(affice);
			}
				request.setAttribute("amsg",colla);
			db.close();
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls1);
			while(rs.next()){
				Emex emex=new Emex();
				emex.setId(rs.getInt(1));
				emex.setEmid(rs.getInt(2));
				emex.setTime(rs.getString(3));
				emex.setLevelid(rs.getInt(4));
				emex.setDeid(rs.getInt(5));
				colle.add(emex);
			}
			db.close();
			request.setAttribute("emsg",colle);
		}catch(Exception e){
			db.close();
			e.printStackTrace();
		}finally{
			dispatcher=request.getRequestDispatcher("main.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}