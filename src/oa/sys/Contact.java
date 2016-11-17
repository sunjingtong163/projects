/*
 * Created on 2004-9-28
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.sys;

import oa.data.*;
import java.util.*;
import java.sql.*;

/**
 ****************************************************
 *类名称：	#Contact<br>
 *类功能：	数据库分页操作<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Contact{
	private String state;
	private String job;
	private String dep;
	private ResultSet rs1;
	private Statement stmt1;
	private int stateid;
	private String addr;
	private String tel;
	private int jobid;
	private int deid;
	private String post;
	private String learn;
	private String birthday;
	private int sex;
	private String name;
	private int id;
	private Statement stmt=null;
	private ResultSet rs=null;
	private Db db=new Db();
	Collection coll;
	/***************************************************
	*函数名称：	Contact()<br>
	*函数功能：	构造函数初始化数据库连接、数据类型<br>
	*返回值：  	无<br>
	*参数说明：	无<br>
	*创建：		白伟明	2004年9月28日
	****************************************************/
	public Contact()throws Exception{
		Calendar dd;
		stmt=db.getStmtread();
		coll= new ArrayList();
	}
	/***************************************************
	*函数名称：	getCount()<br>
	*函数功能：	获取数据库表格行数<br>
	*返回值：  	int 行数<br>
	*参数说明：	String sql 表格名称<br>
	*创建：		白伟明	2004年9月28日
	****************************************************/
	public int getCount()throws Exception{
		int ret=0;
		String sql="SELECT count(*) FROM eminfo";
		rs=stmt.executeQuery(sql);
		if(rs.next()){
			ret=rs.getInt(1);
		}
			return ret;
	}
	/***************************************************
	*函数名称：	getCount()<br>
	*函数功能：	获取数据库表格行数<br>
	*返回值：  	int 行数<br>
	*参数说明：	String sql 表格名称<br>
	*创建：		白伟明	2004年9月28日
	****************************************************/
	public Page listData(String page)throws Exception{
		try{
			Page pages=new Page(this);
			int pageNum=Integer.parseInt(page);
			stmt=db.getStmtread();
			Str str=new Str();
			String sql="SELECT TOP "+pageNum*pages.rowsPerPage+" * FROM eminfo";
			rs=stmt.executeQuery(sql);
			int i=0;
			while(rs.next()){
				if(i>(pageNum-1)*pages.rowsPerPage-1){
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
					stmt1=db.getStmtread();
					rs1=stmt1.executeQuery("SELECT Name FROM department WHERE departmentid="+deid);
					if(rs1.next()){
						dep=rs1.getString(1);
						rs1.close();
						stmt1.close();
						db.close();
					}
					stmt1=db.getStmtread();
					rs1=stmt1.executeQuery("SELECT Name FROM job WHERE jobid="+jobid);
					if(rs1.next()){
						job=rs1.getString(1);
						rs1.close();
						stmt1.close();
						db.close();
					}
					stmt1=db.getStmtread();
					rs1=stmt1.executeQuery("SELECT Name FROM emstate WHERE stateid="+stateid);
					if(rs1.next()){
						state=rs1.getString(1);
						rs1.close();
						stmt1.close();
						db.close();
					}
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
				}//if
				i++;
			}//while
			db.close();
			pages.curPage=pageNum;
			pages.coll=coll;
			return pages;
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public Collection getResult()throws Exception{
		return coll;
	}
}
