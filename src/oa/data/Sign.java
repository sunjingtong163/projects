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
 *类名称：	Sign<br>
 *类功能：	签到簿（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Sign {
	private int id;
	private String time;
	private int emid;
	private int late;
	private int quit;
	private int leave;
	private int work;
	private int signstateid;
	
	/**
	 * 签到簿
	 */
	public Sign() {
		super();
		id=0;
		time=new Time().getYMDHMS();
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
	public void setLate(int late){
		this.late=late;
	}
	public int getLate(){
		return late;
	}
	public void setQuit(int quit){
		this.quit=quit;
	}
	public int getQuit(){
		return quit;
	}
	public void setLeave(int leave){
		this.leave=leave;
	}
	public int getLeave(){
		return leave;
	}
	public void setWork(int work){
		this.work=work;
	}
	public int getWork(){
		return work;
	}
	public void setSignstateid(int signstateid){
		this.signstateid=signstateid;
	}
	public int getSignstateid(){
		return signstateid;
	}
}
