<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-99=0 then
call WhereTable("gpa.png","�޸Ĺ�˾����")

gourl="checkstyle="&request("checkstyle")&"&keyword1="&request("keyword1")&"&page="&request("page")

nowcompanytypename=RemoveHTML(ReplaceQM(request("companytypename")))
nowcompanytypeorder=checkifnum(request("companytypeorder"))
	
if request("action")="saveadd" then
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from companytype where companytypename='"&nowcompanytypename&"' and id<>"&request("id")&""
	rs.open sql,conn,1,3
	if not rs.eof then
		call HintAndBack("�����빫˾���������Ѿ�����,���������룡",1)
	end if
	rs.close
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from companytype where id="&request("id")&""
	rs.open sql,conn,1,3
	rs("companytypename")=nowcompanytypename
	rs("companytypeorder")=nowcompanytypeorder
	rs.update
	rs.close
	
	call HintAndTurn("�޸Ĺ�˾���ͳɹ���","admin_companytype.asp?"&gourl&"")
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
<%
if request("action")="" then
	set rsm=conn.execute("select * from companytype where id="&request("id")&"")
	if not rsm.eof then
		companytypename=rsm("companytypename")
		companytypeorder=rsm("companytypeorder")
	end if
	rsm.close
end if%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form'>
<input type="hidden" name="action" value="saveadd">
<input type="hidden" name="id" value="<%=request("id")%>">
<input type="hidden" name="checkstyle" value="<%=request("checkstyle")%>">
<input type="hidden" name="keyword1" value="<%=request("keyword1")%>">
<input type="hidden" name="page" value="<%=request("page")%>">
<tr>
	<td class="list_header_required" width="15%">��˾��������</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='companytypename' value='<%=companytypename%>' size='20'><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��˾��������</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='companytypeorder' value='<%=companytypeorder%>' size='20' onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command"><input class='form_submit' type='submit' name='cmd' value=' �޸� ' onClick="return checkenter()">
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->