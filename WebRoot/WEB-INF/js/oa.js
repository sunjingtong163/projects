// JavaScript Document
//********admin.htm******************//
function login(){
	if(document.form1.id.value!=""&&document.form1.password.value!=""){
		return true;
	}else{
		alert("请输入用户名和密码");
		return false;
	}
}
//********em.htm******************//
function login(){
	if(document.form1.id.value!=""&&document.form1.password.value!=""){
		return true;
	}else{
		alert("请输入员工号和密码");
		return false;
	}
}
//********signstate.jsp******************//
function sign(){
	if(document.form1.up.value==""){
		alert("请输入上班日期");
		document.form1.up.focus();
		return false;
	}else if(document.form1.up.value.indexOf(":")==-1){
		alert("请填写正确日期格式");				
		document.form1.up.focus();
		return false;
	}
	if(document.form1.down.value==""){
		alert("请输入下班日期");
		document.form1.down.focus();
		return false;
	}else if(document.form1.down.value.indexOf(":")==-1){
		alert("请填写日期格式");				
		document.form1.down.focus();
		return false;
	}
	return true;
}
//********department.jsp******************//
function dep(){
	if(document.form1.name.value==""){
		alert("请输入部门名称");
		document.form1.name.focus();
		return false;
	}
	if(document.form1.explain.value==""){
		alert("请输入部门描述");
		document.form1.explain.focus();
		return false;
	}
	return true;
}
//********job.jsp******************//
function job(){
	if(document.form1.name.value==""){
		alert("请输入职位名称");
		document.form1.name.focus();
		return false;
	}
	if(document.form1.explain.value==""){
		alert("请输入职位描述");
		document.form1.explain.focus();
		return false;
	}
	return true;
}
//********emstate.jsp******************//
function emstate(){
	if(document.form1.name.value==""){
		alert("请输入员工状态");
		document.form1.name.focus();
		return false;
	}
	if(document.form1.explain.value==""){
		alert("请输入员工状态描述");
		document.form1.explain.focus();
		return false;
	}
	return true;
}
//********add.jsp******************//
function add(){
	if(document.form1.name.value==""){
		alert("请输入员工姓名");
		return false;
	}
	if(document.form1.birthday.value==""){
		alert("请输入员工出生日期");
		return false;
	}else if(document.form1.birthday.value.indexOf("-")==-1){
		alert("请填写日期格式");				
		document.form1.birthday.focus();
		return false;
	}
	if(document.form1.learn.value==""){
		alert("请输入员工学历");
		return false;
	}
	if(document.form1.post.value==""){
		alert("请输入员工职称");
		return false;
	}
	if(document.form1.tel.value==""){
		alert("请输入员工电话");
		return false;
	}
	if(document.form1.addr.value==""){
		alert("请输入员工地址");
		return false;
	}
	return true;
}
//********add.jsp******************//
function sel(){
	if(document.form1.sele.value==""){
		document.form1.sele.focus();
		alert("请输入查找内容");
		return false;
	}
	return true;
}
//********set.jsp******************//
function set(){
	if(document.form1.id.value==""){
		alert("序号不能为空");
		document.form1.id.focus();
		return false;
	}
	if(isNaN(document.form1.id.value)){
		alert("请输入正确序号");
		document.form1.id.focus();
		return false;
	}
	if(document.form1.id.value.indexOf(".")!=-1){
		alert("请输入正确序号");
		document.form1.id.focus();
		return false;
	}
	if(document.form1.password.value==""){
		alert("请输入员工密码");
		document.form1.password.focus();
		return false;
	}
	return true;
}
//********affice/add.jsp******************//
function affice(){
	if(document.form1.title.value==""){
		alert("标题不能为空");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.content.value==""){
		alert("请输入具体公告");
		document.form1.content.focus();
		return false;
	}
	return true;
}
//********emex/add.jsp******************//
function emex(){
	if(document.form1.emid.value==""){
		alert("请输入员工序号");
		document.form1.emid.focus();
		return false;
	}
	if(isNaN(document.form1.emid.value)){
		alert("请输入正确序号");
		document.form1.emid.focus();
		return false;
	}
	if(document.form1.emid.value.indexOf(".")!=-1){
		alert("请输入正确序号");
		document.form1.emid.focus();
		return false;
	}
	return true;
}
//********send.jsp******************//
function bumfs(){
	if(document.form1.emid.value==""){
		alert("请输入接收人序号");
		document.form1.emid.focus();
		return false;
	}
	if(isNaN(document.form1.emid.value)){
		alert("请输入正确序号");
		document.form1.emid.focus();
		return false;
	}
	if(document.form1.emid.value.indexOf(".")!=-1){
		alert("请输入正确序号");
		document.form1.emid.focus();
		return false;
	}
	if(document.form1.title.value==""){
		alert("请输入公文标题");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.bumf.value==""){
		alert("不允许出现空白公文");
		document.form1.bumf.focus();
		return false;
	}
	return true;
}
//********bumf/accept.jsp******************//
function accepts(){
	if(document.form1.bumf.value==""){
		alert("不允许出现空白公文");
		document.form1.bumf.focus();
		return false;
	}
	return true;
}
//********info/send.jsp******************//
function info(){
	if(document.form1.acceptid.value==""){
		alert("请输入接收人序号");
		document.form1.acceptid.focus();
		return false;
	}
	if(isNaN(document.form1.acceptid.value)){
		alert("请输入正确序号");
		document.form1.acceptid.focus();
		return false;
	}
	if(document.form1.acceptid.value.indexOf(".")!=-1){
		alert("请输入正确序号");
		document.form1.acceptid.focus();
		return false;
	}
	if(document.form1.title.value==""){
		alert("请输入标题");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.content.value==""){
		alert("不允许发送空白消息");
		document.form1.content.focus();
		return false;
	}
	return true;
}
//********error/errorpage.jsp******************//
function re(){
	parent.location.href='../index.htm';
}
