<!--#include file="Index_top.asp" -->
<!--#include file="inc/Md5.asp" -->
<%
if session("iflogin")-99=0 then
call WhereTable("administration.png","�޸Ĺ���Ա")

gourl="grade="&request("grade")&"&checkclass="&request("checkclass")&"&checkstyle="&request("checkstyle")&"&keyword1="&request("keyword1")&"&page="&request("page")&""

if request("action")="saveadd" then
	nowusername=RemoveHTML(ReplaceQM(request("username")))
	nowuserrealname=RemoveHTML(ReplaceQM(request("userrealname")))
	nowpwd=RemoveHTML(ReplaceQM(request("pwd")))
	nowtel=RemoveHTML(ReplaceQM(request("tel")))
	nowusergrade=request("usergrade")
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from login where username='"&nowusername&"' and id<>"&request("id")&""
	rs.open sql,conn,1,3
	if not rs.eof then
		response.write "<script language='javascript'>alert('��������û����Ѿ�����,���������룡');"
		response.write "window.history.go(-1);</script> "
		response.end
	end if
	rs.close
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from login where id="&request("id")&""
	rs.open sql,conn,1,3
	rs("username")=nowusername
	rs("userrealname")=nowuserrealname
	if nowpwd<>"" then
		rs("pwd")=md5(nowpwd)
	end if
	rs("tel")=nowtel
	rs("usergrade")=nowusergrade
	rs.update
	rs.close
	
	call HintAndTurn("�޸Ĺ���Ա�ɹ���","admin_login.asp?"&gourl&"")
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
<%
if request("action")="" then
	set rsm=conn.execute("select * from login where id="&request("id")&"")
	if not rsm.eof then
		nowusername=rsm("username")
		nowuserrealname=rsm("userrealname")
		nowtel=rsm("tel")
		nowusergrade=rsm("usergrade")
	end if
	rsm.close
end if%>
<form name='form'>
<input type="hidden" name="action" value="saveadd">
<input type="hidden" name="id" value="<%=request("id")%>">
<input type="hidden" name="grade" value="<%=request("grade")%>">
<input type="hidden" name="checkclass" value="<%=request("checkclass")%>">
<input type="hidden" name="checkstyle" value="<%=request("checkstyle")%>">
<input type="hidden" name="keyword1" value="<%=request("keyword1")%>">
<input type="hidden" name="page" value="<%=request("page")%>">
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr>
	<td class="list_header_required" width="15%">�� �� ��</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='username' value='<%=nowusername%>' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��ʵ����</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='userrealname' value='<%=nowuserrealname%>' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">�û�����</td>
	<td class="list_required"><input type='password' class='form_password_required' name='pwd' value='' style="width:200px;"><font color="#666666">������дΪ���޸ģ�</font></td>
</tr>
<tr>
	<td class="list_header_required">��ϵ�绰</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='tel' value='<%=nowtel%>' style="width:200px;"></td>
</tr>
<tr>
	<td class="list_header_required">����Ա����</td>
	<td class="list_required"><select name="usergrade" class='form_combo_normal'>
	<option value="1"<%if nowusergrade="1" then response.write " selected"%>>�ƻ�Ա</option>
	<option value="2"<%if nowusergrade="2" then response.write " selected"%>>ע�����Ա</option>
	<option value="3"<%if nowusergrade="3" then response.write " selected"%>>�͹����Ա</option>
	<option value="99"<%if nowusergrade="99" then response.write " selected"%>>��������Ա</option>
	</select></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command"><input class='form_submit' type='submit' name='cmd' value=' �޸� ' onClick="return checkenter()">
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</table>
</form>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->