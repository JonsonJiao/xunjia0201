<!--#include file="Index_top.asp" -->
<!--#include file="inc/Md5.asp" -->
<%
call WhereTable("gpa.png","�������")

if request("action")="saveedit" then
dim old_pwd,new_pwd,con_pwd
old_pwd = RemoveHTML(ReplaceQM(request("old_pwd")))
new_pwd = RemoveHTML(ReplaceQM(request("new_pwd")))
con_pwd = RemoveHTML(ReplaceQM(request("con_pwd")))
	
if new_pwd <> con_pwd  then call HintAndBack("��������ȷ�����벻һ��",1)
	
old_pwd = md5(old_pwd)

if session("iflogin")=0 then
	tablename="company"
elseif session("iflogin")>0 then
	tablename="login"
end if

set rs = server.createobject("adodb.recordset")
rs.open "select * from ["&tablename&"] where id="&session("user_id")&"",conn,1,3
if rs.eof then
	call HintAndBack("δ�ҵ������ʺ���Ϣ",1)
else
	if rs("pwd") <> old_pwd then
		call HintAndBack("��������󣬲�ִ���޸�",1)
	else
		new_pwd = md5(new_pwd)
		
		rs("pwd") = new_pwd
		rs.update
	end if
end if
rs.close
set rs = nothing
	
call HintAndTurn("�����޸ĳɹ������ס����������","changePassword.asp")
end if
%>
<script language="javascript">
function checkenter(){
	if (document.form.old_pwd.value == ""){
		alert("����������룡");
		form.old_pwd.focus();
		return false;
	}
	if (document.form.new_pwd.value == ""){
		alert("�����������룡");
		form.new_pwd.focus();
		return false;
	}
	if (document.form.con_pwd.value == ""){
		alert("������������ȷ�ϣ�");
		form.con_pwd.focus();
		return false;
	}
}
</script>
<form name='form'>
<input type="hidden" name="action" value="saveedit">
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr>
	<td class="list_header_required" width="15%">�û���</td>
	<td class="list_required"><%=session("username")%></td>
</tr>
<tr>
	<td class="list_header_required">ȫ&nbsp;&nbsp;&nbsp;��</td>
	<td class="list_required"><%=session("userrealname")%></td></tr>
<tr>
	<td class="list_header_required">������</td>
	<td class="list_required"><input type='password' class='form_password_required' name='old_pwd' value='' size='20' ></td>
</tr>
<tr>
	<td class="list_header_required">������</td>
	<td class="list_required"><input type='password' class='form_password_required' name='new_pwd' value='' size='20' ></td>
</tr>
<tr>
	<td class="list_header_required">����ȷ��</td>
	<td class="list_required"><input type='password' class='form_password_required' name='con_pwd' value='' size='20' ></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command"><input class='form_submit' type='submit' name='cmd' value='�������ȷ��' onClick="return checkenter()"></td>
</tr>
</table>
</form>
<!--#include file="Index_bottom.asp" -->