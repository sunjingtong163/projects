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
 *类名称：	Bumf<br>
 *类功能：	公文（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Bumf {
	private int id;
	private int sendter;
	private int accepter;
	private String title;
	private String time;
	private String content;
	private String affix;
	private int examine;
	private int sign;

	/**
	 * 公文
	 */
	public Bumf() {
		super();
		id=0;
		sendter=0;
		accepter=0;
		title="";
		time=new Time().getYMD();
		content="";
		affix="";
		examine=0;
		sign=0;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setSendter(int sendter) {
		this.sendter = sendter;
	}
	public int getSendter() {
		return sendter;
	}
	public void setAccepter(int accepter) {
		this.accepter = accepter;
	}
	public int getAccepter() {
		return accepter;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTime() {
		return time;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	public void setAffix(String affix) {
		this.affix = affix;
	}
	public String getAffix() {
		return affix;
	}
	public void setExamine(int examine) {
		this.examine = examine;
	}
	public int getExamine() {
		return examine;
	}
	public void setSign(int sign) {
		this.sign = sign;
	}
	public int getSign() {
		return sign;
	}
}
