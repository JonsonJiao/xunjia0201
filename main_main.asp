<!--#include file="Index_top.asp" -->
<%call WhereTable("filetypes.png","�ۺ���Ϣ")

if request("action")="saveadd" then
	nowtitle=request.form("title")
	nowcontent=request.form("content")
	
	biao=""
	strcontent=""

	select case request.form("login")
	case "yes"
	biao="gonggao"
	strcontent="����"
	case "no"
	biao="yijian"
	strcontent="�������"
	end select
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from "&biao&""
	rs.open sql,conn,1,3
	rs.addnew
	rs("title")=nowtitle
	rs("content")=nowcontent
	rs("addtime")=now()
	rs("addman")=session("userrealname")
	rs("id_addman")=session("user_id")
	rs.update
	rs.close
	
	call HintAndTurn("����"&strcontent&"�ɹ���","main_main.asp")
end if%>
<script type="text/javascript" charset="utf-8" src="edit/kindeditor.js"></script>
<script language="javascript">
KE.show({
id : 'content1',
cssPath : 'edit/index.css'
});

function checkenter(){
	if (document.form.title.value == ""){
		alert("����д���⣡");
		form.title.focus();
		return false;
	}
	if (document.form.content1.value == ""){
		alert("����д���ݣ�");
		//form.content1.focus();
		return false;
	}
}
</script>
<!--#include file="gonggao_check.asp" -->
<form name='form' method="post">
<input type="hidden" name="action" value="saveadd">
<%if session("iflogin")>0 then
	loginsign="yes"
	contenttitle="��������"
else
	loginsign="no"
	contenttitle="�������"
end if%>
<input type="hidden" name="login" value="<%=loginsign%>">
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr>
	<td class="list_header_required" width="15%">����</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='title' value='' size='40'><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required"><%=contenttitle%></td>
	<td class="list_required"><textarea id="content1" name="content" style="width:620px;height:150px;visibility:hidden;"></textarea></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command"><input class='form_submit' type='submit' name='cmd' value=' �ύ ' onClick="return checkenter()"> </td>
</tr>
<tr height='1' class='list_split'>
	<td colspan='2'></td>
</tr>
</table>
</form>
<!--#include file="Index_bottom.asp" -->