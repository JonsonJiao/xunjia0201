<!--#include file="Index_top.asp" -->
<!--#include file="inc/uploadcontrol.asp" -->
<%
if session("iflogin")-2=0 or session("iflogin")-99=0 then
call WhereTable("identity.png","�����ҵ���������ϴ���ҵ������ͬ")
%>
<script type="text/javascript">
function firm(firmtxt,firmno){
if(confirm(firmtxt)){
	eval("document.form.companycontract"+ firmno +".value=''");
	eval("document.all.upid"+ firmno +".style.display='none';");
}
}
</script>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form' method="post" action="upprocess_forth.asp" enctype="multipart/form-data">
<input type="hidden" name="action" value="uploadfile">
<input type="hidden" name="id" value="<%=request("id")%>">
<input type="hidden" name="gotourl" value="admin_company">
<input type="hidden" name="companyrealname" value="<%=request("companyrealname")%>">
<tr>
	<td class="list_header_required" width="15%">�ϴ���ͬ<br><font color="#FF0000">���ϴ���˾����ҵ��������ͬ����ɨ�������3��</font></td>
	<td class="list_required" colspan="2">
		<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
		<tr valign="middle">
			<td class="list_required">�ϴ��ļ���С���ɳ�����<%=uploadlimit%> M�����ϴ���ʽΪ��<%=Forumuploadall%></td>
		</tr>
		<%for nnn=1 to maxcfile%>
		<tr valign="middle" id="upid<%=nnn%>"<%if nnn>3 then%> style="display:none;"<%end if%>>
			<td class="list_required">�ļ�<%=right("0"&nnn,2)%>��
			<input type="file" name="companycontract<%=nnn%>" style="width:400" class="form_button">
			<%if nnn<>maxcfile then%><input type="button" value="�����һ���ļ�" onClick="upid<%=(nnn+1)%>.style.display='';" class="form_button">&nbsp;&nbsp;<%end if%>
			<%if nnn<>1 then%><input type="button" value="��  ��" onClick="firm('ȷ������� <%=nnn%> ��ô��',<%=nnn%>);" class="form_submit"><%end if%></td>
		</tr>
		<%next%>
		</table>
	</td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command" colspan="2"><input class='form_submit' type='submit' name='cmd' id='cmd' value=' ��� '>
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-2);"></td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->