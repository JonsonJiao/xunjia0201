<!--#include file="Index_top.asp" -->
<!--#include file="inc/uploadcontrol.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-99=0 then
call WhereTable("identity.png","�޸���ҵ���������ϴ���ҵ������ͬ")
gourl="company_class="&request("company_class")&"&company_type="&request("company_type")&"&checkstatue="&request("checkstatue")&"&checkcondition="&request("checkcondition")&"&checkstyle="&request("checkstyle")&"&keyword1="&request("keyword1")&"&page="&request("page")
%>
<script type="text/javascript">
function firm(firmtxt,firmno){
if(confirm(firmtxt)){
	eval("document.form.companycontract"+ firmno +".value=''");
	eval("document.all.upid"+ firmno +".style.display='none';");
}
}

function firmhave(firmtxt,firmno){
if(confirm(firmtxt)){
	eval("document.form.havecompanycontract"+ firmno +".value=''");
	eval("document.all.upid"+ firmno +".style.display='none';");
}
}
</script>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form' method="post" action="upprocess_forth.asp" enctype="multipart/form-data">
<input type="hidden" name="action" value="uploadfile">
<input type="hidden" name="actiondetail" value="saveedit">
<input type="hidden" name="id" value="<%=request("id")%>">
<input type="hidden" name="gotourl" value="admin_company">
<input type="hidden" name="companyrealname" value="<%=request("companyrealname")%>">
<input type="hidden" name="company_class" value="<%=request("company_class")%>">
<input type="hidden" name="company_type" value="<%=request("company_type")%>">
<input type="hidden" name="checkstatue" value="<%=request("checkstatue")%>">
<input type="hidden" name="checkcondition" value="<%=request("checkcondition")%>">
<input type="hidden" name="checkstyle" value="<%=request("checkstyle")%>">
<input type="hidden" name="keyword1" value="<%=request("keyword1")%>">
<input type="hidden" name="page" value="<%=request("page")%>">
<%picno=0
set rsm=conn.execute("select companycontract from company where id="&request("id")&"")
if not rsm.eof then
	companycontract=rsm("companycontract")
	if companycontract<>"" then
		companycontracts=split(companycontract,",")
		picno=ubound(companycontracts)+1
	end if
end if
rsm.close%>
<tr>
	<td class="list_header_required" width="15%">�ϴ���ͬ<br><font color="#FF0000">���ϴ���˾����ҵ��������ͬ����ɨ�������3��</font></td>
	<td class="list_required" colspan="2">
		<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
		<tr valign="middle">
			<td class="list_required">�ϴ��ļ���С���ɳ�����<%=uploadlimit%> M�����ϴ���ʽΪ��<%=Forumuploadall%></td>
		</tr>
		<input type="hidden" name="picno" value="<%=picno%>">
		<%for nnn=1 to picno%>
		<tr valign="middle" id="upid<%=nnn%>">
			<td class="list_required">�ļ�<%=right("0"&nnn,2)%>��
			<input type="button" name="havecompanycontractpic<%=nnn%>" value="�鿴ͼƬ" class="form_button" onClick="window.open('<%="uploadfile/companycontract/"&companycontracts(nnn-1)%>')">
			<input type="button" value="��  ��" onClick="firmhave('ȷ������� <%=nnn%> ��ô��',<%=nnn%>);" class="form_submit"></td>
			<input type="hidden" name="havecompanycontract<%=nnn%>" value="<%=companycontracts(nnn-1)%>">
		</tr>
		<%next
		if picno<maxcfile then
			for nnn=picno+1 to maxcfile%>
			<tr valign="middle" id="upid<%=nnn%>"<%if nnn<>picno+1 then%> style="display:none;"<%end if%>>
				<td class="list_required">�ļ�<%=right("0"&nnn,2)%>��
				<input type="file" name="companycontract<%=nnn%>" style="width:400" class="form_button">
				<%if nnn<>maxcfile then%><input type="button" value="�����һ���ļ�" onClick="upid<%=(nnn+1)%>.style.display='';" class="form_button">&nbsp;&nbsp;<%end if%>
				<%if nnn<>1 then%><input type="button" value="��  ��" onClick="firm('ȷ������� <%=nnn%> ��ô��',<%=nnn%>);" class="form_submit"><%end if%></td>
			</tr>
			<%next
		end if%>
		</table>
	</td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command" colspan="2">
	<input class='form_submit' type='submit' name='cmd' id='cmd' value=' ȷ�� '>
	<input class='form_submit' type="button" name="back" value=" ������һҳ " onClick="history.go(-2);">
	<input class='form_submit' type="button" name="backall" value=" ���ع���ҳ�� " onClick="window.location.href='admin_company.asp?<%=gourl%>'"></td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->