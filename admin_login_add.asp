<!--#include file="Index_top.asp" -->
<!--#include file="inc/Md5.asp" -->
<%
if session("iflogin")-99=0 then
call WhereTable("administration.png","����¹���Ա")

nowusername=RemoveHTML(ReplaceQM(request("username")))
nowuserrealname=RemoveHTML(ReplaceQM(request("userrealname")))
nowpwd=RemoveHTML(ReplaceQM(request("pwd")))
nowtel=RemoveHTML(ReplaceQM(request("tel")))
nowusergrade=request("usergrade")

if request("action")="saveadd" then
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from login where username='"&nowusername&"'"
	rs.open sql,conn,1,3
	if not rs.eof then
		response.write "<script language='javascript'>alert('��������û����Ѿ�����,���������룡');"
		response.write "window.history.go(-1);</script> "
		response.end
	else
		rs.addnew
		rs("username")=nowusername
		rs("userrealname")=nowuserrealname
		if nowpwd="" then
			rs("pwd")=md5("666666")
		else
			rs("pwd")=md5(nowpwd)
		end if
		rs("tel")=nowtel
		rs("usergrade")=nowusergrade
		rs.update
	end if
	rs.close
	
	call HintAndTurn("����¹���Ա�ɹ���","admin_login.asp")
end if
%>
<script language="javascript">
function checkenter(){
	if (document.form.username.value == ""){
		alert("�������û�����");
		form.username.focus();
		return false;
	}
	if (document.form.userrealname.value == ""){
		alert("��������ʵ������");
		form.userrealname.focus();
		return false;
	}
}
</script>
<form name='form'>
<input type="hidden" name="action" value="saveadd">
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr>
	<td class="list_header_required" width="15%">�� �� ��</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='username' value='' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��ʵ����</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='userrealname' value='' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">�û�����</td>
	<td class="list_required"><input type='password' class='form_password_required' name='pwd' value='' style="width:200px;"><font color="#666666">������д����Ĭ��Ϊ��666666����</font></td>
</tr>
<tr>
	<td class="list_header_required">��ϵ�绰</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='tel' value='' style="width:200px;"></td>
</tr>
<tr>
	<td class="list_header_required">����Ա����</td>
	<td class="list_required"><select name="usergrade" class='form_combo_normal'>
	<option value="1">�ƻ�Ա</option>
	<option value="2">ע�����Ա</option>
	<option value="3">�͹����Ա</option>
	<option value="99">��������Ա</option>
	</select></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command"><input class='form_submit' type='submit' name='cmd' value=' ��� ' onClick="return checkenter()">
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</table>
</form>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->