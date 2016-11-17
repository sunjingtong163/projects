/*
 * Created on 2004-9-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.bumf;

import oa.sys.*;
import oa.sys.Time;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.jspsmart.upload.*;
import com.jspsmart.upload.File;
/**
 ****************************************************
 *类名称：	Send<br>
 *类功能：	公文发送(附件)<br>
 *创建：	白伟明	2004年10月7日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Save extends HttpServlet{
	private String affix;
	private String sqli;
	private String submit;
	private String filepath;
	private String filename;
	private String file;
	private String bumf;
	private HttpSession session=null;
	private JspFactory jspxFactory = null;
	private PageContext pagecontext=null;
	private ResultSet rs=null;
	private Statement stmt=null;
	private String title,sqls,sqlu;
	private int temp,id,emid,filesize,sign,bumfid;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html; charset=gb2312");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		Str str=new Str();
		Db db=new Db();
		Time time=new Time();
		SmartUpload supload=new SmartUpload();
		jspxFactory=JspFactory.getDefaultFactory();
		pagecontext=jspxFactory.getPageContext(this, request, response,"", true, 8192, true);
		supload.initialize(pagecontext);
		try {
			supload.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//获取发送人id
		try{
			id=Integer.parseInt((String)session.getAttribute("id"));
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("ok","您的网页已过期请重新登录");
		}
		//获取基本信息
		try{
			emid=Integer.parseInt((String)supload.getRequest().getParameter("emid"));
		}catch(Exception e){
			e.printStackTrace();
		}
		title=supload.getRequest().getParameter("title");
		bumf=supload.getRequest().getParameter("bumf");
		try{
			bumfid=Integer.parseInt((String)supload.getRequest().getParameter("bumfid"));
		}catch(Exception e){
			e.printStackTrace();
		}
		submit=supload.getRequest().getParameter("Submit");
		title=str.inStr(title);
		bumf=str.inStr(bumf);
		if(submit.equals("现在发送")){
			sign=1;
		}else{
			sign=0;
		}
		//上传文件
		File file=supload.getFiles().getFile(0);
			filename=file.getFileName();
			filesize=file.getSize();
			filepath=file.getFilePathName();
		if (!file.isMissing()){
			try {
				file.saveAs("/upload/"+id+filename);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}else{
			filename=null;		
			filesize=0;
			filepath="";
		}
		if(filename!=null){
			affix=id+filename;
		}else{
			affix="";
		}
		if(sign==0){
			//保存
			sqlu="UPDATE bumf SET sendter="+id+",accepter="+id+",title='"+title+"',time='"+time.getYMDHMS()
					+"',content='"+bumf+"',affix='"+affix+"',examine="+1+",sign="+sign+" WHERE bumfid="+bumfid;
			try{
				stmt=db.getStmt();
				temp=stmt.executeUpdate(sqlu);
				if(temp>0){
					request.setAttribute("ok","操作成功");
				}else{
					request.setAttribute("ok","操作失败");
				}
				db.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{
			//发送
			sqls="SELECT * FROM eminfo WHERE employeeid="+emid;
			sqlu="UPDATE  bumf SET sendter="+id+",accepter="+emid+",title='"+title+"',time='"+time.getYMDHMS()
					+"',content='"+bumf+"',affix='"+affix+"',examine="+0+",sign="+sign+" WHERE bumfid="+bumfid;
			try {
				stmt=db.getStmtread();
				rs=stmt.executeQuery(sqls);
				if(rs.next()){
					db.close();
					stmt=db.getStmt();
					temp=stmt.executeUpdate(sqlu);
					if(temp>0){
						request.setAttribute("ok","操作成功");
					}else{
						request.setAttribute("ok","操作失败");
					}
					db.close();
				}else{
					request.setAttribute("ok","接收人ID并不存在");
					db.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("send");
		dispatcher.forward(request,response);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
