<!--#include file="Index_top.asp" -->
<!--#include file="inc/uploadcontrol.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-99=0 then
call WhereTable("identity.png","�޸���ҵ�ڶ������ϴ���ҵ���ʲ���")
gourl="company_class="&request("company_class")&"&company_type="&request("company_type")&"&checkstatue="&request("checkstatue")&"&checkcondition="&request("checkcondition")&"&checkstyle="&request("checkstyle")&"&keyword1="&request("keyword1")&"&page="&request("page")
%>
<script type="text/javascript">
function checkenter(){
	if (document.getElementById("companyfile1").value == "" && document.form.havecompanyfile1.value == ""){
		alert("���ϴ����۲ɹ���ŵ�飡");
		return false;
	}
	if (document.getElementById("companyfile2").value == "" && document.form.havecompanyfile2.value == ""){
		alert("���ϴ���ҵ����Ӫҵִ�գ�");
		return false;
	}
	if (document.getElementById("companyfile3").value == "" && document.form.havecompanyfile3.value == ""){
		alert("���ϴ�˰��Ǽ�֤��");
		return false;
	}
	if (document.getElementById("companyfile4").value == "" && document.form.havecompanyfile4.value == ""){
		alert("���ϴ���֯��������֤��");
		return false;
	}
}
function firmhavestay(firmtxt,firmno){
if(confirm(firmtxt)){
	eval("document.form.companyfile"+ firmno +".style.display=''");
	eval("document.form.havecompanyfilepic"+ firmno +".style.display='none'");
	eval("document.form.clear"+ firmno +".style.display='none'");
	eval("document.form.havecompanyfile"+ firmno +".value=''");
	//eval("document.form.havecompanyfile"+ firmno +".style.disable=true");
}
}

function firmhave(firmtxt,firmno){
if(confirm(firmtxt)){
	eval("document.form.havecompanyfile"+ firmno +".value=''");
	eval("document.all.upid"+ firmno +".style.display='none';");
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
<form name='form' method="post" action="upprocess_third_edit.asp" enctype="multipart/form-data">
<input type="hidden" name="action" value="uploadfile">
<input type="hidden" name="actiondetail" value="saveedit">
<input type="hidden" name="gotourl" value="admin_company_edit_third">
<input type="hidden" name="id" value="<%=request("id")%>">
<input type="hidden" name="companyrealname" value="<%=request("companyrealname")%>">
<input type="hidden" name="company_class" value="<%=request("company_class")%>">
<input type="hidden" name="company_type" value="<%=request("company_type")%>">
<input type="hidden" name="checkstatue" value="<%=request("checkstatue")%>">
<input type="hidden" name="checkcondition" value="<%=request("checkcondition")%>">
<input type="hidden" name="checkstyle" value="<%=request("checkstyle")%>">
<input type="hidden" name="keyword1" value="<%=request("keyword1")%>">
<input type="hidden" name="page" value="<%=request("page")%>">
<%picno=0
set rsm=conn.execute("select companyfile from company where id="&request("id")&"")
if not rsm.eof then
	companyfile=rsm("companyfile")
	if companyfile<>"" then
		companyfiles=split(companyfile,",")
		picno=ubound(companyfiles)+1
	end if
end if
rsm.close%>
<tr>
	<td class="list_header_required" width="15%">�ϴ����ʲ���<br><font color="#FF0000">���ϴ���ʵ�Ĺ�˾����ҵ�����ʸ���ɨ���</font></td>
	<td class="list_required" colspan="2">
		<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
		<tr valign="middle">
			<td class="list_required">�ϴ��ļ���С���ɳ�����<%=uploadlimit%> M�����ϴ���ʽΪ��<%=Forumuploadall%></td>
		</tr>
		<input type="hidden" name="picno" value="<%=picno%>">
		<%if picno>=1 then%>
		<tr valign="middle">
			<td class="list_required">���۲ɹ���ŵ�飺������
			<input type="button" name="havecompanyfilepic1" id="havecompanyfilepic1" value="�鿴ͼƬ" class="form_button" onClick="window.open('<%="uploadfile/companyfile/"&companyfiles(0)%>')">
			<input type="file" name="companyfile1" id="companyfile1" style="width:400;display:none;" class="form_button">
			<input type="button" name="clear1" id="clear1" value="�����ϴ�" onClick="firmhavestay('ȷ�������ϴ����۲ɹ���ŵ��ô��',1);" class="form_submit"></td>
			<input type="hidden" name="havecompanyfile1" id="havecompanyfile1" value="<%=companyfiles(0)%>">
			<input type="hidden" name="allpaixu1" id="allpaixu1" value="1">
		</tr>
		<%else%>
		<tr valign="middle">
			<td class="list_required">���۲ɹ���ŵ�飺������
			<input type="file" name="companyfile1" style="width:400" class="form_button"></td>
			<input type="hidden" name="allpaixu1" id="allpaixu1" value="1">
			<input type="hidden" name="havecompanyfile1" id="havecompanyfile1" value="">
		</tr>
		<%end if
		if picno>=2 then%>
		<tr valign="middle">
			<td class="list_required">��ҵ����Ӫҵִ�գ�����
			<input type="button" name="havecompanyfilepic2" id="havecompanyfilepic2" value="�鿴ͼƬ" class="form_button" onClick="window.open('<%="uploadfile/companyfile/"&companyfiles(1)%>')">
			<input type="file" name="companyfile2" id="companyfile2" style="width:400;display:none;" class="form_button">
			<input type="button" name="clear2" id="clear2" value="�����ϴ�" onClick="firmhavestay('ȷ�������ϴ���ҵ����Ӫҵִ��ô��',2);" class="form_submit"></td>
			<input type="hidden" name="havecompanyfile2" id="havecompanyfile2" value="<%=companyfiles(1)%>">
			<input type="hidden" name="allpaixu2" id="allpaixu2" value="2">
		</tr>
		<%else%>
		<tr valign="middle">
			<td class="list_required">��ҵ����Ӫҵִ�գ�����
			<input type="file" name="companyfile2" style="width:400" class="form_button"></td>
			<input type="hidden" name="allpaixu2" id="allpaixu2" value="2">
			<input type="hidden" name="havecompanyfile2" id="havecompanyfile2" value="">
		</tr>
		<%end if
		if picno>=3 then%>
		<tr valign="middle">
			<td class="list_required">˰��Ǽ�֤������������
			<input type="button" name="havecompanyfilepic3" id="havecompanyfilepic3" value="�鿴ͼƬ" class="form_button" onClick="window.open('<%="uploadfile/companyfile/"&companyfiles(2)%>')">
			<input type="file" name="companyfile3" id="companyfile3" style="width:400;display:none;" class="form_button">
			<input type="button" name="clear3" id="clear3" value="�����ϴ�" onClick="firmhavestay('ȷ�������ϴ�˰��Ǽ�֤ô��',3);" class="form_submit"></td>
			<input type="hidden" name="havecompanyfile3" id="havecompanyfile3" value="<%=companyfiles(2)%>">
			<input type="hidden" name="allpaixu3" id="allpaixu3" value="3">
		</tr>
		<%else%>
		<tr valign="middle">
			<td class="list_required">˰��Ǽ�֤������������
			<input type="file" name="companyfile3" style="width:400" class="form_button"></td>
			<input type="hidden" name="allpaixu3" id="allpaixu3" value="3">
			<input type="hidden" name="havecompanyfile3" id="havecompanyfile3" value="">
		</tr>
		<%end if
		if picno>=4 then%>
		<tr valign="middle">
			<td class="list_required">��֯��������֤��������
			<input type="button" name="havecompanyfilepic4" id="havecompanyfilepic4" value="�鿴ͼƬ" class="form_button" onClick="window.open('<%="uploadfile/companyfile/"&companyfiles(3)%>')">
			<input type="file" name="companyfile4" id="companyfile4" style="width:400;display:none;" class="form_button">
			<input type="button" name="clear4" id="clear4" value="�����ϴ�" onClick="firmhavestay('ȷ�������ϴ���֯��������֤ô��',4);" class="form_submit"></td>
			<input type="hidden" name="havecompanyfile4" id="havecompanyfile4" value="<%=companyfiles(3)%>">
			<input type="hidden" name="allpaixu4" id="allpaixu4" value="4">
		</tr>
		<%else%>
		<tr valign="middle">
			<td class="list_required">��֯��������֤��������
			<input type="file" name="companyfile4" style="width:400" class="form_button">
			<input type="hidden" name="allpaixu4" id="allpaixu4" value="4">
			<input type="hidden" name="havecompanyfile4" id="havecompanyfile4" value="">
			<%if maxcfile>4 then%>
			<input type="button" value="�����һ���ļ�" onClick="upid5.style.display='';" class="form_button">&nbsp;&nbsp;
			<%end if%></td>
		</tr>
		<%end if
		
		nnn=5
		for nnn=5 to picno%>
		<tr valign="middle" id="upid<%=nnn%>">
			<td class="list_required">�ļ�<%=right("0"&nnn,2)%>��
			<input type="button" name="havecompanyfilepic<%=nnn%>" value="�鿴ͼƬ" class="form_button" onClick="window.open('<%="uploadfile/companyfile/"&companyfiles(nnn-1)%>')">
			<input type="button" value="��  ��" onClick="firmhave('ȷ������� <%=nnn%> ��ô��',<%=nnn%>);" class="form_submit"></td>
			<input type="hidden" name="havecompanyfile<%=nnn%>" value="<%=companyfiles(nnn-1)%>">
			<input type="hidden" name="allpaixu<%=nnn%>" id="allpaixu<%=nnn%>" value="<%=nnn%>">
		</tr>
		<%next
		if nnn<maxcfile then
			for nnn=picno+1 to maxcfile%>
			<tr valign="middle" id="upid<%=nnn%>"<%if nnn<>picno+1 then%> style="display:none;"<%end if%>>
				<td class="list_required">�ļ�<%=right("0"&nnn,2)%>��
				<input type="file" name="companyfile<%=nnn%>" style="width:400" class="form_button">
				<%if nnn<>maxcfile then%><input type="button" value="�����һ���ļ�" onClick="upid<%=(nnn+1)%>.style.display='';" class="form_button">&nbsp;&nbsp;<%end if%>
				<%if nnn<>1 then%><input type="button" value="��  ��" onClick="firm('ȷ������� <%=nnn%> ��ô��',<%=nnn%>);" class="form_submit"><%end if%></td>
			<input type="hidden" name="allpaixu<%=nnn%>" id="allpaixu<%=nnn%>" value="<%=nnn%>">
			</tr>
			<%next
		end if%>
		</table>
	</td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command" colspan="2">
	<input class='form_submit' type='submit' name='cmd' id='cmd' value=' ȷ�� ' onClick="return checkenter()">
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