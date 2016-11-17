/*
 * Created on 2004-9-17
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package oa.data;

/**
 ****************************************************
 *类名称：	Level<br>
 *类功能：	优秀员工等级（类型）<br>
 *创建：	白伟明	2004年9月23日<br>
 ****************************************************
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class Level {
	private int id;
	private String level;
	private String explain;

	/**
	 * 优秀员工等级
	 */
	public Level() {
		super();
		id=0;
		level="";
		explain="";
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getid() {
		return id;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getLevel() {
		return level;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getExplain() {
		return explain;
	}
}
