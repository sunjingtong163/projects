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
 *类名称：	Select<br>
 *类功能：	查找状态信息<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Select  extends HttpServlet{
	private Statement stmt=null;
	private ResultSet rs=null;
	private String name,explain,sqls,flag;
	private RequestDispatcher dispatcher;
	private int id=0;

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Db db=new Db();
		Str str=new Str();
		PrintWriter out=response.getWriter();
		try{
			id=Integer.parseInt((String)request.getParameter("id"));
		}catch(Exception e){
		}
		flag=request.getParameter("flag");
		sqls="SELECT * FROM emstate WHERE stateid="+id;
		Collection ret=new ArrayList();
		try{
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			//判断是否有数据
			if(rs.next()){
				rs.beforeFirst();
				if(rs.next()){
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
				request.setAttribute("msg2",ret);
			}
			db.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(flag!=null){
				dispatcher=request.getRequestDispatcher("del.jsp");
			}else{
				dispatcher=request.getRequestDispatcher("change.jsp");
			}
			dispatcher.forward(request,response);
		}
	}	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}