<!--#include file="Index_top.asp" -->
<!--#include file="inc/uploadcontrol.asp" -->
<%
if session("iflogin")-2=0 or session("iflogin")-99=0 then
call WhereTable("identity.png","�����ҵ�ڶ������ϴ���ҵ���ʲ���")
%>
<script type="text/javascript">
function checkenter(){
	if (document.form.companyfile1.value == ""){
		alert("���ϴ����۲ɹ���ŵ�飡");
		form.companyfile1.focus();
		return false;
	}
	if (document.form.companyfile2.value == ""){
		alert("���ϴ���ҵ����Ӫҵִ�գ�");
		form.companyfile2.focus();
		return false;
	}
	if (document.form.companyfile3.value == ""){
		alert("���ϴ�˰��Ǽ�֤��");
		form.companyfile3.focus();
		return false;
	}
	if (document.form.companyfile4.value == ""){
		alert("���ϴ���֯��������֤��");
		form.companyfile4.focus();
		return false;
	}
}
function firm(firmtxt,firmno){
if(confirm(firmtxt)){
	eval("document.form.companyfile"+ firmno +".value=''");
	eval("document.all.upid"+ firmno +".style.display='none';");
}
}
</script>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form' method="post" action="upprocess_third.asp" enctype="multipart/form-data">
<input type="hidden" name="action" value="uploadfile">
<input type="hidden" name="gotourl" value="admin_company_add_third">
<input type="hidden" name="id" value="<%=request("id")%>">
<input type="hidden" name="companyrealname" value="<%=request("companyrealname")%>">
<tr>
	<td class="list_header_required" width="15%">�ϴ����ʲ���<br><font color="#FF0000">���ϴ���ʵ�Ĺ�˾����ҵ�����ʸ���ɨ���</font></td>
	<td class="list_required" colspan="2">
		<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
		<tr valign="middle">
			<td class="list_required">�ϴ��ļ���С���ɳ�����<%=uploadlimit%> M�����ϴ���ʽΪ��<%=Forumuploadall%></td>
		</tr>		<tr valign="middle">
			<td class="list_required">���۲ɹ���ŵ�飺������
			<input type="file" name="companyfile1" style="width:400" class="form_button"></td>
		</tr>
		<tr valign="middle">
			<td class="list_required">��ҵ����Ӫҵִ�գ�����
			<input type="file" name="companyfile2" style="width:400" class="form_button"></td>
		</tr>
		<tr valign="middle">
			<td class="list_required">˰��Ǽ�֤������������
			<input type="file" name="companyfile3" style="width:400" class="form_button"></td>
		</tr>
		<tr valign="middle">
			<td class="list_required">��֯��������֤��������
			<input type="file" name="companyfile4" style="width:400" class="form_button">
			<%if maxcfile>4 then%>
			<input type="button" value="�����һ���ļ�" onClick="upid5.style.display='';" class="form_button">&nbsp;&nbsp;
			<%end if%></td>
		</tr>
		<%for nnn=5 to maxcfile%>
		<tr valign="middle" id="upid<%=nnn%>"<%if nnn<>1 then%> style="display:none;"<%end if%>>
			<td class="list_required">�ļ�<%=right("0"&nnn,2)%>��
			<input type="file" name="companyfile<%=nnn%>" style="width:400" class="form_button">
			<%if nnn<>maxcfile then%><input type="button" value="�����һ���ļ�" onClick="upid<%=(nnn+1)%>.style.display='';" class="form_button">&nbsp;&nbsp;<%end if%>
			<%if nnn<>1 then%><input type="button" value="��  ��" onClick="firm('ȷ������� <%=nnn%> ��ô��',<%=nnn%>);" class="form_submit"><%end if%></td>
		</tr>
		<%next%>
		</table>
	</td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command" colspan="2"><input class='form_submit' type='submit' name='cmd' id='cmd' value=' ��� ' onClick="return checkenter()">
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-2);"></td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->