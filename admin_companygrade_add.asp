<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-99=0 then
call WhereTable("gpa.png","����¹�Ӧ�����ʼ���")

nowcompanygradename=RemoveHTML(ReplaceQM(request("companygradename")))
nowcompanygradeorder=checkifnum(request("companygradeorder"))
	
if request("action")="saveadd" then
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from companygrade where companygradename='"&nowcompanygradename&"'"
	rs.open sql,conn,1,3
	if not rs.eof then
		call HintAndBack("������Ĺ�Ӧ�̼��������Ѿ�����,���������룡",1)
	else
		rs.addnew
		rs("companygradename")=nowcompanygradename
		rs("companygradeorder")=nowcompanygradeorder
		rs.update
	end if
	rs.close
	
	call HintAndTurn("����¹�Ӧ�̼���","admin_companygrade.asp")
end if
%>
<script language="javascript">
function checkenter(){
	if (document.form.companygradename.value == ""){
		alert("����д��Ӧ�̼������ƣ�");
		form.companygradename.focus();
		return false;
	}
	if (document.form.companygradeorder.value == ""){
		alert("����д����ߵ���ֵ��");
		form.companygradeorder.focus();
		return false;
	}
}
</script>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form'>
<input type="hidden" name="action" value="saveadd">
<tr>
	<td class="list_header_required" width="15%">��Ӧ�̼�������</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='companygradename' id='companygradename' value='' size='20'><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">����ߵ���ֵ</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='companygradeorder' id='companygradeorder' value='' size='20' onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><font color="#FF0000">*</font></td>
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