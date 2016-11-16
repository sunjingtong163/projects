/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.emstate;

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
 *类功能：	查看状态信息<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class View  extends HttpServlet{
	private Statement stmt=null;
	private ResultSet rs=null;
	private String name,explain,flag;
	private RequestDispatcher dispatcher;
	private int id=0;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		flag=(String)request.getParameter("flag");
		Db db=new Db();
		Str str=new Str();
		Collection ret=new ArrayList();
		PrintWriter out=response.getWriter();
		try{
			stmt=db.getStmtread();
			rs=stmt.executeQuery("SELECT * from emstate");
			//判断是否有数据
			if(rs.next()){
				rs.beforeFirst();
				while(rs.next()){
					id=rs.getInt(1);
					name=rs.getString(2);
					explain=rs.getString(3);
					name=str.outStr(name);
					explain=str.outStr(explain);
					Department dep=new Department();
					dep.setId(id);
					dep.setName(name);
					dep.setExplain(explain);
					ret.add(dep);
				}
				if(flag.equals("view")){
					request.setAttribute("msg",ret);
				}else if(flag.equals("change")||flag.equals("del")){
					HttpSession session=request.getSession();
					session.removeAttribute("msg");
					session.setAttribute("msg",ret);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
			if(flag.equals("view")){
				dispatcher=request.getRequestDispatcher("view.jsp");
			}else if(flag.equals("change")){
				dispatcher=request.getRequestDispatcher("change.jsp");
			}else if(flag.equals("del")){
				dispatcher=request.getRequestDispatcher("del.jsp");
			}
			dispatcher.forward(request,response);
		}
	}	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}