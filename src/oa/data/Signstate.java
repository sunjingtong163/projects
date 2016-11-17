/*
 * Created on 2004-9-17
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.data;
import oa.sys.*;

/**
 ****************************************************
 *类名称：	Signstate<br>
 *类功能：	签到状态（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Signstate {
	private int id;
	private String describestate;
	private String time;
	
	/**
	 * 签到状态
	 */
	public Signstate() {
		super();
		id=0;
		describestate="";
		time=new Time().getHMS();
	}

	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setDescribestate(String describestate){
		this.describestate=describestate;
	}
	public String getDescribestate(){
		return describestate;
	}
	public void setTime(String time){
		this.time=time;
	}
	public String getTime(){
		return time;
	}

}
