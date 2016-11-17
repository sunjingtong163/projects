/*
 * Created on 2004-9-25
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.em;

import oa.sys.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Del<br>
 *类功能：	删除员工信息<br>
 *创建：	白伟明	2004年9月29日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Del extends HttpServlet{
	private Statement stmt=null;
	private String sql;
	private RequestDispatcher dispatcher=null;
	private HttpSession session=null;
	private int id,temp;
	private PrintWriter out=null;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		out=response.getWriter();
		session=request.getSession();
		//获取数据
		id=Integer.parseInt((String)request.getParameter("id"));
		Db db=new Db();
		Str str=new Str();
		sql="DELETE FROM eminfo WHERE employeeid="+id;
		try{
			stmt=db.getStmt();
			temp=stmt.executeUpdate(sql);
			db.close();
			if(temp>0){
				request.setAttribute("msg2","删除成功");
			}else{
				request.setAttribute("msg2","删除失败");
			}
		}catch(Exception e){
			request.setAttribute("msg2","删除失败,请删除有关该员工的其它信息!");
			System.err.print(e.getMessage());
		}finally{
			db.close();
			dispatcher=request.getRequestDispatcher("select.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
