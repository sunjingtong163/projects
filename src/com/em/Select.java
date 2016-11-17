/*
 * Created on 2004-9-25
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.em;

import oa.sys.*;
import oa.data.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 ****************************************************
 *类名称：	Select<br>
 *类功能：	查询部门、职位、员工状态信息<br>
 *创建：	白伟明	2004年9月28日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Select extends HttpServlet{
	private RequestDispatcher dispatcher=null;
	private HttpSession session=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	private Statement stmt1=null;
	private ResultSet rs1=null;
	private String select,column,name,birthday,dep,job,state,learn,post,tel,addr,sql;
	private PrintWriter out=null;
	private int id,sex,deid,jobid,stateid;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		session=request.getSession();
		out=response.getWriter();
		Db db=new Db();
		Str str=new Str();
		Collection coll=new ArrayList();
		column=(String)request.getParameter("column");
		select=(String)request.getParameter("sele");
		select=str.inStr(select).trim();
		//调整性别系数
		if(select.equals("男")){
			select="1";
		}
		if(select.equals("女")){
			select="0";
		}
		//利用部门、职位、状态各自名称分别取出id号再进行查询
		if(column.equals("departmentid")){
			try{
				stmt=db.getStmtread();
				rs=stmt.executeQuery("SELECT departmentid FROM department WHERE name LIKE '%"+select+"%'");
				if(rs.next()){
					select=new Integer(rs.getInt(1)).toString();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				db.close();
			}
		}
		if(column.equals("jobid")){
			try{
				stmt=db.getStmtread();
				rs=stmt.executeQuery("SELECT jobid FROM job WHERE name LIKE '%"+select+"%'");
				if(rs.next()){
					select=new Integer(rs.getInt(1)).toString();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				db.close();
			}
		}
		if(column.equals("stateid")){
			try{
				stmt=db.getStmtread();
				rs=stmt.executeQuery("SELECT stateid FROM emstate WHERE name LIKE '%"+select+"%'");
				if(rs.next()){
					select=new Integer(rs.getInt(1)).toString();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				db.close();
			}
		}
		//查询员工信息
		sql="SELECT * FROM eminfo WHERE "+column+" LIKE '%"+select+"%'";
		if(column.equals("birthday")){
			sql="SELECT * FROM eminfo WHERE "+column+" = '"+select+"'";
		}
		try{
			stmt=db.getStmtread();
			rs=stmt.executeQuery(sql);
			if(rs.next()){
				rs.beforeFirst();
				while(rs.next()){
					id=rs.getInt(1);
					name=rs.getString(2);
					sex=rs.getInt(3);
					birthday=rs.getString(4);
					learn=rs.getString(5);
					post=rs.getString(6);
					deid=rs.getInt(7);
					jobid=rs.getInt(8);
					tel=rs.getString(9);
					addr=rs.getString(10);
					stateid=rs.getInt(11);
					dep=db.IdtoDo("Name","department WHERE departmentid="+deid);
					job=db.IdtoDo("Name","job WHERE jobid="+jobid);
					state=db.IdtoDo("Name","emstate WHERE stateid="+stateid);
					//字符转换
					name=str.outStr(name);
					birthday=birthday.substring(0,10);
					dep=str.outStr(dep);
					job=str.outStr(job);
					state=str.outStr(state);
					learn=str.outStr(learn);
					post=str.outStr(post);
					tel=str.outStr(tel);
					addr=str.outStr(addr);
					Eminfo eminfo=new Eminfo();
					eminfo.setId(id);
					eminfo.setName(name);
					eminfo.setSex(sex);
					eminfo.setBirthday(birthday);
					eminfo.setLearn(learn);
					eminfo.setPost(post);
					eminfo.setDepartment(dep);
					eminfo.setJob(job);
					eminfo.setTel(tel);
					eminfo.setAddr(addr);
					eminfo.setState(state);
					coll.add(eminfo);
				}//while
				request.setAttribute("msg",coll);
			}else{
				request.setAttribute("msg2","没有您要的查询结果");
			}
		}catch(Exception e){
			e.printStackTrace();
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
