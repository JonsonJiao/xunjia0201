<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-99=0 then
call WhereTable("gpa.png","����¹�˾����")

nowcompanytypename=RemoveHTML(ReplaceQM(request("companytypename")))
nowcompanytypeorder=checkifnum(request("companytypeorder"))
	
if request("action")="saveadd" then
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from companytype where companytypename='"&nowcompanytypename&"'"
	rs.open sql,conn,1,3
	if not rs.eof then
		call HintAndBack("������Ĺ�˾���������Ѿ�����,���������룡",1)
	else
		rs.addnew
		rs("companytypename")=nowcompanytypename
		rs("companytypeorder")=nowcompanytypeorder
		rs.update
	end if
	rs.close
	
	call HintAndTurn("����¹�˾���ͣ�","admin_companytype.asp")
end if
%>
<script language="javascript">
function checkenter(){
	if (document.form.companytypename.value == ""){
		alert("����д��˾�������ƣ�");
		form.companytypename.focus();
		return false;
	}
	if (document.form.companytypeorder.value == ""){
		alert("����д��˾��������");
		form.companytypeorder.focus();
		return false;
	}
}
</script>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form'>
<input type="hidden" name="action" value="saveadd">
<tr>
	<td class="list_header_required" width="15%">��˾��������</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='companytypename' id='companytypename' value='' size='20'><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��˾��������</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='companytypeorder' id='companytypeorder' value='' size='20' onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command"><input class='form_submit' type='submit' name='cmd' value=' ��� ' onClick="return checkenter()">
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->