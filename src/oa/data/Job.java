/*
 * Created on 2004-9-17
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.data;

/**
 ****************************************************
 *类名称：	Job<br>
 *类功能：	职位（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Job {
	private String explain;
	private int id;
	private String name;
	/**
	 * 职位
	 */
	public Job() {
		super();
		id=0;
		name="";
		explain="";
	}

	public String getExplain(){
		return explain;
	}
	public int getId(){
		return id;
	}
	public String getName(){
		return name;
	}
	public void setExplain(String explain){
		this.explain=explain;
	}
	
	public void setId(int id){
		this.id=id;
	}
	public void setName(String name){
		this.name=name;
	}
}
