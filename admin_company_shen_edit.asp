<!--#include file="Index_top.asp" -->
<!--#include file="inc/Md5.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-99=0 then
call WhereTable("identity.png","��˻�����Ϣ")

gourl="company_class="&request.form("company_class")&"&company_type="&request.form("company_type")&"&checkstatue="&request.form("checkstatue")&"&checkcondition="&request.form("checkcondition")&"&checkstyle="&request.form("checkstyle")&"&keyword1="&request.form("keyword1")&"&page="&request.form("page")

if request.form("action")="saveedit" then
	nowstatue=checkifnum(request.form("statue"))
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from company where id="&request.form("id")&""
	rs.open sql,conn,1,3
	if checkifnum(rs("ifshen1"))=0 then
		rs("ifshen1")=nowstatue
		rs("shenman1")=session("user_id")
		rs("shentime1")=now()
		
		if nowstatue-2=0 then
			rs("statue")=2
		else
			rs("statue")=0
		end if
	elseif checkifnum(rs("ifshen1"))>0 then
		if nowstatue>0 then
			rs("ifshen2")=nowstatue
			rs("shenman2")=session("user_id")
			rs("shentime2")=now()
			
			if nowstatue-1=0 and rs("ifshen1")-1=0 then
				rs("statue")=1
			else
				rs("statue")=2
			end if
		end if
	end if
	rs.update
	rs.close
	
	call HintAndTurn("��˳ɹ���","admin_company_shen.asp?"&gourl)
end if

set rsm=conn.execute("select * from company where id="&request("id")&"")
if not rsm.eof then%>
<form name='form' method="post">
<input type="hidden" name="action" value="saveedit">
<input type="hidden" name="id" value="<%=request("id")%>">
<input type="hidden" name="company_class" value="<%=request("company_class")%>">
<input type="hidden" name="company_type" value="<%=request("company_type")%>">
<input type="hidden" name="checkstatue" value="<%=request("checkstatue")%>">
<input type="hidden" name="checkcondition" value="<%=request("checkcondition")%>">
<input type="hidden" name="checkstyle" value="<%=request("checkstyle")%>">
<input type="hidden" name="keyword1" value="<%=request("keyword1")%>">
<input type="hidden" name="page" value="<%=request("page")%>">
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr>
	<td class="list_header_required">��˽��</td>
	<td class="list_required" colspan="5">
	<%if rsm("ifshen1")-2=0 then
		response.write "��һ�����δͨ��"
	elseif rsm("ifshen1")-1=0 then
		response.write "��ͨ��һ�����"
		if checkifnum(rsm("shenman1"))-checkifnum(session("user_id"))=0 then
			response.write "<br>���Ѿ���˹�һ���ˣ��������ظ���ˣ�"
		else
			response.write "<br>ͨ��<input type='radio' name='statue' class='form_radio_normal' value='1' checked>"
			response.write "��ͨ��<input type='radio' name='statue' class='form_radio_normal' value='2'>"
		end if
	else
		response.write "<br>ͨ��<input type='radio' name='statue' class='form_radio_normal' value='1' checked>"
		response.write "��ͨ��<input type='radio' name='statue' class='form_radio_normal' value='2'>"
	end if%>
	<font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��ҵ����</td>
	<td class="list_required" colspan="5"><%=rsm("companyrealname")%></td>
</tr>
<tr>
	<td class="list_header_required" width="13%">��½�û���</td>
	<td class="list_required" width="20%"><%=rsm("companyname")%></td>
	<td class="list_header_required" width="13%">��ҵ����</td>
	<td class="list_required" width="20%"><%=rsm("companyclass")%></td>
	<td class="list_header_required" width="13%">��ҵ����</td>
	<td class="list_required" width="21%"><%=shownameint("companytypename","companytype","id",rsm("companytype"))%></td>
</tr>
<tr>
	<td class="list_header_required">��������֤��</td>
	<td class="list_required"><%=rsm("companyorgno")%></td>
	<td class="list_header_required">˰��</td>
	<td class="list_required"><%=rsm("companytaxno")%></td>
	<td class="list_header_required">��ҵ����</td>
	<td class="list_required"><%=shownameint("companygradename","companygrade","id",rsm("companygrade"))%></td>
</tr>
<tr>
	<td class="list_header_required">����������</td>
	<td class="list_required"><%=rsm("companymanager")%></td>
	<td class="list_header_required">��ϵ������</td>
	<td class="list_required"><%=rsm("companycontactman")%></td>
	<td class="list_header_required">��ϵ�绰</td>
	<td class="list_required"><%=rsm("companycontacttel")%></td>
</tr>
<tr>
	<td class="list_header_required">��˾��ַ</td>
	<td class="list_required" colspan="3"><%=rsm("companyaddress")%></td>
	<td class="list_header_required">�����ʼ�</td>
	<td class="list_required"><%=rsm("companyemail")%></td>
</tr>
<tr>
	<td class="list_header_required">��Ӫҵ��</td>
	<td class="list_required" colspan="5"><%=rsm("companymajor")%></td>
</tr>
<tr>
	<td class="list_header_required">��ע</td>
	<td class="list_required" colspan="5"><%=rsm("companybeizhu")%></td>
</tr>
</table>

<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all">
<tr>
	<td class="list_header_required" width="13%">��ҵ���ʸ���ͼƬ</td>
	<td class="list_required">
		<%companyfile=rsm("companyfile")
		if companyfile<>"" then
			companyfiles=split(companyfile,",")
			response.write "<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style='word-break: break-all;'>"
			response.write "<tr align='center'>"
			response.write "<td class='list_required' width='25%'>���۲ɹ���ŵ��</td>"
			response.write "<td class='list_required' width='25%'>��ҵ����Ӫҵִ��</td>"
			response.write "<td class='list_required' width='25%'>˰��Ǽ�֤</td>"
			response.write "<td class='list_required' width='25%'>��֯��������֤</td>"
			response.write "</tr>"
			
			response.write "<tr align='center'>"
			for i=0 to ubound(companyfiles)
				response.write "<td class='list_required'><img src='uploadfile/companyfile/"&companyfiles(i)&"' width='120' height='160' border=0 title='�������ͼ' onClick='doCheckDetailEx(""uploadfile/companyfile/"&companyfiles(i)&""","&Modalwidth&","&Modalheight&")'></td>"
				if i=3 then exit for
			next
			response.write "</tr>"
			for i=4 to ubound(companyfiles)
				if i mod 4=0 then response.write "<tr align='center'>"
				response.write "<td class='list_required'><img src='uploadfile/companyfile/"&companyfiles(i)&"' width='120' height='160' border=0 title='�������ͼ' onClick='doCheckDetailEx(""uploadfile/companyfile/"&companyfiles(i)&""","&Modalwidth&","&Modalheight&")'></td>"
				if i mod 4=3 then response.write "</tr>"
			next
			response.write "</table>"
		else
			response.write "��δ�ϴ���������ɨ��ͼƬ"
		end if%>
	</td>
</tr>
</table>

<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all">
<tr>
	<td class="list_header_required" width="13%">��ҵ��ͬ����ͼƬ</td>
	<td class="list_required">
		<%companycontract=rsm("companycontract")
		if companycontract<>"" then
			companycontracts=split(companycontract,",")
			response.write "<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style='word-break: break-all;'>"
			for i=0 to ubound(companycontracts)
				if i mod 4=0 then response.write "<tr align='center'>"
				response.write "<td width='20%' class='list_required'><img src='uploadfile/companycontract/"&companycontracts(i)&"' width='120' height='160' border=0 title='�������ͼ' onClick='doCheckDetailEx(""uploadfile/companycontract/"&companycontracts(i)&""","&Modalwidth&","&Modalheight&")'></td>"
				if i mod 4=3 then response.write "</tr>"
			next
			response.write "</table>"
		else
			response.write "��δ�ϴ���������ɨ��ͼƬ"
		end if%>
	</td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command" colspan="2"><input class='form_submit' type='submit' name='cmd' id='cmd' value=' ȷ�� '>
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</table>
</form>
<%end if
rsm.close
else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->