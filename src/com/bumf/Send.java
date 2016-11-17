/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.bumf;

import oa.data.Bumf;
import oa.sys.*;
import oa.sys.Time;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Send<br>
 *类功能：	公文发送(附件)<br>
 *创建：	白伟明	2004年10月7日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Send extends HttpServlet{
	private int sign;
	private int examine;
	private int id;
	private int accepter;
	private int sendter;
	private int bumfid;
	private String axffix;
	private String content;
	private String title;
	private String time;
	private String sqls;
	private String sqli;
	private String submit;
	private String bumf;
	private HttpSession session=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		Str str=new Str();
		Db db=new Db();
		Time times=new Time();
		Collection coll=new ArrayList();
		//获取发送人id
		try{
			id=Integer.parseInt((String)session.getAttribute("id"));
		}catch(Exception e){
			e.printStackTrace();
		}
		//查看发送人是否有临时公文
		sqls="SELECT * FROM bumf WHERE sendter="+id+" AND sign="+0;
		out.print(sqls+"<br>");
		try{
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			//如果没有生成一个临时文件
			if(!rs.next()){
				db.close();
				sqli="INSERT INTO bumf(sendter,accepter,title,time,content,affix,examine,sign) VALUES("+id+","+id+",'','"+times.getYMDHMS()+"',' ','',1,0)";
				stmt=db.getStmt();
				stmt.executeUpdate(sqli);
			}
			db.close();
			//调出临时文件
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sqls);
			if(rs.next()){
				bumfid=rs.getInt(1);
				sendter=rs.getInt(2);
				accepter=rs.getInt(3);
				title=rs.getString(4);
				time=rs.getString(5);
				content=rs.getString(6);
				axffix=rs.getString(7);
				examine=rs.getInt(8);
				sign=rs.getInt(9);
				content=str.outStr(content);
				axffix=str.outStr(axffix);
				Bumf bumf=new Bumf();
				bumf.setId(bumfid);
				bumf.setSendter(sendter);
				bumf.setAccepter(accepter);
				bumf.setTitle(title);
				bumf.setTime(time);
				bumf.setContent(content);
				bumf.setExamine(examine);
				bumf.setSign(sign);
				bumf.setAffix(axffix);
				coll.add(bumf);
			}
			request.setAttribute("msg",coll);
			
			 coll=(Collection)request.getAttribute("msg");
			if(coll!=null){
				Iterator it=coll.iterator();
				if(it.hasNext()){
					Bumf bumf=(Bumf)it.next();
					out.print(bumf.getId());		
				}
			}

		}catch(Exception e){
			e.printStackTrace();
			out.print(e);
		}finally{
			db.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("send.jsp");
			dispatcher.forward(request,response);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}