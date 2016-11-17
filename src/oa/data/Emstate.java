/*
 * Created on 2004-9-17
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.data;

/**
 ****************************************************
 *类名称：	Emstate<br>
 *类功能：	员工状态（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Emstate {
	private int id;
	private String name;
	private String explain;
	
	/**
	 * 员工状态
	 */
	public Emstate() {
		super();
		id=0;
		name="";
		explain="";
	}

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setExplain(String explain){
		this.explain=explain;
	}
	public String getExplain(){
		return explain;
	}
}
