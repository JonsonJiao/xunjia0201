<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-3=0 or session("iflogin")-99=0 then
call WhereTable("identity.png","��ҵ��ϸ��Ϣ")

set rsm=conn.execute("select * from company where id="&request("id")&"")
if not rsm.eof then%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all">
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
	<td class="list_header_required">���״̬</td>
	<td class="list_required" colspan="5"><%response.write getcompanystatue(rsm("statue"))
	if rsm("ifshen1")>0 then
		response.write "<br>һ�����&nbsp;&nbsp;&nbsp;&nbsp;����ˣ�1����"&shownameint("userrealname","login","id",rsm("shenman1"))
		response.write "&nbsp;&nbsp;&nbsp;&nbsp;���ʱ�䣨1����"&rsm("shentime1")
		response.write "&nbsp;&nbsp;&nbsp;&nbsp;��˽����1����"&getcompanystatue(rsm("ifshen1"))
	end if
	if rsm("ifshen2")>0 then
		response.write "<br>�������&nbsp;&nbsp;&nbsp;&nbsp;����ˣ�2����"&shownameint("userrealname","login","id",rsm("shenman2"))
		response.write "&nbsp;&nbsp;&nbsp;&nbsp;���ʱ�䣨2����"&rsm("shentime2")
		response.write "&nbsp;&nbsp;&nbsp;&nbsp;��˽����2����"&getcompanystatue(rsm("ifshen2"))
	end if%></td>
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
</table>

<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all">
<tr>
	<td class="list_header_required" width="13%">���ۼ�¼��Ϣ</td>
	<td class="list_required">
	<%call getcompanycompetitiveno(request("id"))   '������Ϣ
	dim competitiveno,getcompetitiveno,getcompetitiveallprice,gettime%>
	�μӾ��۴�����<%=competitiveno%>��
	�б������<%=getcompetitiveno%>��
	�б��ܶ<%=getcompetitiveallprice%>Ԫ
	�ϴ��б꣺<%=gettime%>
	</td>
</tr>
</table>
<%end if
rsm.close%>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->