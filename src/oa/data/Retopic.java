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
 *类名称：	Retopic<br>
 *类功能：	回复议题（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Retopic {
	private int id;
	private int reid;
	private String time;
	private int emid;
	private String content;
	
	/**
	 * 回复议题
	 */
	public Retopic() {
		super();
		id=0;
		reid=0;
		time=new Time().getYMDHMS();
		emid=0;
		content="";
	}

	public void setReidd(int reid){
		this.reid=reid;
	}
	public int getReid(){
		return reid;
	}
	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setTime(String time){
		this.time=time;
	}
	public String getTime(){
		return time;
	}
	public void setEmid(int emid){
		this.emid=emid;
	}
	public int getEmid(){
		return emid;
	}
	public void setContent(String content){
		this.content=content;
	}
	public String getContent(){
		return content;
	}
}
