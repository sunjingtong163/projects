// JavaScript Document
//********admin.htm******************//
function login(){
	if(document.form1.id.value!=""&&document.form1.password.value!=""){
		return true;
	}else{
		alert("�������û���������");
		return false;
	}
}
//********em.htm******************//
function login(){
	if(document.form1.id.value!=""&&document.form1.password.value!=""){
		return true;
	}else{
		alert("������Ա���ź�����");
		return false;
	}
}
//********signstate.jsp******************//
function sign(){
	if(document.form1.up.value==""){
		alert("�������ϰ�����");
		document.form1.up.focus();
		return false;
	}else if(document.form1.up.value.indexOf(":")==-1){
		alert("����д��ȷ���ڸ�ʽ");				
		document.form1.up.focus();
		return false;
	}
	if(document.form1.down.value==""){
		alert("�������°�����");
		document.form1.down.focus();
		return false;
	}else if(document.form1.down.value.indexOf(":")==-1){
		alert("����д���ڸ�ʽ");				
		document.form1.down.focus();
		return false;
	}
	return true;
}
//********department.jsp******************//
function dep(){
	if(document.form1.name.value==""){
		alert("�����벿������");
		document.form1.name.focus();
		return false;
	}
	if(document.form1.explain.value==""){
		alert("�����벿������");
		document.form1.explain.focus();
		return false;
	}
	return true;
}
//********job.jsp******************//
function job(){
	if(document.form1.name.value==""){
		alert("������ְλ����");
		document.form1.name.focus();
		return false;
	}
	if(document.form1.explain.value==""){
		alert("������ְλ����");
		document.form1.explain.focus();
		return false;
	}
	return true;
}
//********emstate.jsp******************//
function emstate(){
	if(document.form1.name.value==""){
		alert("������Ա��״̬");
		document.form1.name.focus();
		return false;
	}
	if(document.form1.explain.value==""){
		alert("������Ա��״̬����");
		document.form1.explain.focus();
		return false;
	}
	return true;
}
//********add.jsp******************//
function add(){
	if(document.form1.name.value==""){
		alert("������Ա������");
		return false;
	}
	if(document.form1.birthday.value==""){
		alert("������Ա����������");
		return false;
	}else if(document.form1.birthday.value.indexOf("-")==-1){
		alert("����д���ڸ�ʽ");				
		document.form1.birthday.focus();
		return false;
	}
	if(document.form1.learn.value==""){
		alert("������Ա��ѧ��");
		return false;
	}
	if(document.form1.post.value==""){
		alert("������Ա��ְ��");
		return false;
	}
	if(document.form1.tel.value==""){
		alert("������Ա���绰");
		return false;
	}
	if(document.form1.addr.value==""){
		alert("������Ա����ַ");
		return false;
	}
	return true;
}
//********add.jsp******************//
function sel(){
	if(document.form1.sele.value==""){
		document.form1.sele.focus();
		alert("�������������");
		return false;
	}
	return true;
}
//********set.jsp******************//
function set(){
	if(document.form1.id.value==""){
		alert("��Ų���Ϊ��");
		document.form1.id.focus();
		return false;
	}
	if(isNaN(document.form1.id.value)){
		alert("��������ȷ���");
		document.form1.id.focus();
		return false;
	}
	if(document.form1.id.value.indexOf(".")!=-1){
		alert("��������ȷ���");
		document.form1.id.focus();
		return false;
	}
	if(document.form1.password.value==""){
		alert("������Ա������");
		document.form1.password.focus();
		return false;
	}
	return true;
}
//********affice/add.jsp******************//
function affice(){
	if(document.form1.title.value==""){
		alert("���ⲻ��Ϊ��");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.content.value==""){
		alert("��������幫��");
		document.form1.content.focus();
		return false;
	}
	return true;
}
//********emex/add.jsp******************//
function emex(){
	if(document.form1.emid.value==""){
		alert("������Ա�����");
		document.form1.emid.focus();
		return false;
	}
	if(isNaN(document.form1.emid.value)){
		alert("��������ȷ���");
		document.form1.emid.focus();
		return false;
	}
	if(document.form1.emid.value.indexOf(".")!=-1){
		alert("��������ȷ���");
		document.form1.emid.focus();
		return false;
	}
	return true;
}
//********send.jsp******************//
function bumfs(){
	if(document.form1.emid.value==""){
		alert("��������������");
		document.form1.emid.focus();
		return false;
	}
	if(isNaN(document.form1.emid.value)){
		alert("��������ȷ���");
		document.form1.emid.focus();
		return false;
	}
	if(document.form1.emid.value.indexOf(".")!=-1){
		alert("��������ȷ���");
		document.form1.emid.focus();
		return false;
	}
	if(document.form1.title.value==""){
		alert("�����빫�ı���");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.bumf.value==""){
		alert("��������ֿհ׹���");
		document.form1.bumf.focus();
		return false;
	}
	return true;
}
//********bumf/accept.jsp******************//
function accepts(){
	if(document.form1.bumf.value==""){
		alert("��������ֿհ׹���");
		document.form1.bumf.focus();
		return false;
	}
	return true;
}
//********info/send.jsp******************//
function info(){
	if(document.form1.acceptid.value==""){
		alert("��������������");
		document.form1.acceptid.focus();
		return false;
	}
	if(isNaN(document.form1.acceptid.value)){
		alert("��������ȷ���");
		document.form1.acceptid.focus();
		return false;
	}
	if(document.form1.acceptid.value.indexOf(".")!=-1){
		alert("��������ȷ���");
		document.form1.acceptid.focus();
		return false;
	}
	if(document.form1.title.value==""){
		alert("���������");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.content.value==""){
		alert("�������Ϳհ���Ϣ");
		document.form1.content.focus();
		return false;
	}
	return true;
}
//********error/errorpage.jsp******************//
function re(){
	parent.location.href='../index.htm';
}
