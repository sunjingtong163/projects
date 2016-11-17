/*
 * Created on 2004-9-28
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.sys;

import java.util.*;
/**
 ****************************************************
 *类名称：	#Page<br>
 *类功能：	分页解决方案<br>
 *创建：	白伟明	2004年9月28日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Page {
	public int curPage;//当前页
	public int maxPage;//最大页
	public int maxRowCount;//最大行
	public int rowsPerPage=5;//每页行
	public Collection coll=null;
	public Page(){
	}
	/***************************************************
	*函数名称：	getCountPage()<br>
	*函数功能：	获取总页数<br>
	*返回值：  	无<br>
	*参数说明：	无<br>
	*创建：		白伟明	2004年9月28日
	****************************************************/
	public void getCountPage(){
		if(this.maxRowCount%this.rowsPerPage==0){
			this.maxPage=this.maxRowCount/this.rowsPerPage;
		}else{
			this.maxPage=this.maxRowCount/this.rowsPerPage+1;
		}
	}
	public Collection getResult(){
		return this.coll;
	}
	public Page(Contact contact)throws Exception{
		this.maxRowCount=contact.getCount();
		this.coll=contact.getResult();
	}
}
