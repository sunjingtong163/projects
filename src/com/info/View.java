/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.info;

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
 *类功能：	查看短消息<br>
 *创建：	白伟明	2004年10月11日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class View extends HttpServlet{
	private int accepter;
	private int news;
	private int sendter;
	private String time;
	private int infoid;
	private int acceptid;
	private HttpSession session=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	private String title,content,sqli,sqls;
	private int temp=0,id,count;
	private RequestDispatcher dispatcher;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		Str str=new Str();
		Db db=new Db();
		PrintWriter out=response.getWriter();
		Collection coll=new ArrayList();
		session=request.getSession();
		try{
			id=Integer.parseInt((String)session.getAttribute("id"));
		}catch(Exception e){
		//	e.printStackTrace();
		}
		try{
			acceptid=Integer.parseInt((String)request.getParameter("acceptid"));
		}catch(Exception e){
		//	e.printStackTrace();
		}
		count=db.getRowCount("info WHERE new ="+0+" AND accepter="+id);
		if(count>0){
			request.setAttribute("count",new Integer(count).toString());
		}
		if(id==-1){
			sqls="SELECT * FROM info";
		}else{
			sqls="SELECT * FROM info WHERE accepter="+id;
		}
		try {
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			while(rs.next()){
				infoid=rs.getInt(1);
				title=rs.getString(2);
				time=rs.getString(3);
				sendter=rs.getInt(4);
				accepter=rs.getInt(5);
				content=rs.getString(6);
				news=rs.getInt(7);
				Info info=new Info();
				info.setId(infoid);
				info.setTitle(title);
				info.setTime(time);
				info.setSendter(sendter);
				info.setAccepter(accepter);
				info.setContent(content);
				info.setNews(news);
				coll.add(info);
			}
			request.setAttribute("msg",coll);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
			if(id==-1){
				dispatcher=request.getRequestDispatcher("adminview.jsp");
			}else{
				dispatcher=request.getRequestDispatcher("view.jsp");
			}
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}