<!--#include file="Index_top.asp" -->
<%
if session("iflogin")=0 and session("statue")=1 then
call WhereTable("identity.png","������Ϣ")

set rs_t=conn.execute("select * from tender where id="&request("id")&"")
if not rs_t.eof then
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
<tr>
	<td class="list_header_required" width="10%">��Ŀ����</td>
	<td class="list_required" width="40%"><%=rs_t("tendername")%>&nbsp;&nbsp;<input type='button' value='��ӡ' onClick="window.print();" class='form_button'></td>
	<td class="list_header_required" width="10%">���۱��</td>
	<td class="list_required" width="40%"><%=rs_t("djh")%></td>
</tr>
<tr>
	<td class="list_header_required">��Ŀ����</td>
	<td class="list_required"><%=rs_t("tenderclass")%></td>
	<td class="list_header_required">��������</td>
	<td class="list_required"><%=rs_t("needdate")%></td>
</tr>
<tr>
	<td class="list_header_required">���ۿ�ʼ</td>
	<td class="list_required"><%response.write rs_t("startdate")&" "&rs_t("startdatehour")&"��"%></td>
	<td class="list_header_required">���۽�ֹ</td>
	<td class="list_required"><%response.write rs_t("enddate")&" "&rs_t("enddatehour")&"��"%></td>
</tr>
<tr>
	<td class="list_header_required">����˵��</td>
	<td class="list_required" colspan="3"><%=rs_t("detail")%></td>
</tr>
<tr>
	<td class="grid_header" colspan="4"><strong>�ɹ����ʣ�<%=gettotalitem("tender","djh",rs_t("djh")," and ifzu=0 and ifdel=0")%>�</strong></td>
</tr>
<%set rs_s=conn.execute("select * from tender where ifzu=0 and ifdel=0 and djh='"&rs_t("djh")&"'")
if not rs_s.eof then
	wzno=0
	do while not rs_s.eof
	wzno=wzno+1
	if (wzno-1) mod 2=0 then response.write "<tr>"%>
	<td class="list_header_required">����<%=wzno%></td>
	<td class="list_required">
		<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
		<tr>
			<td class="list_required">���ƣ�<%=rs_s("material")%></td>
		</tr>
		<tr>
			<td class="list_required">���<%=rs_s("material_guige")%></td>
		</tr>
		<tr>
			<td class="list_required">���ʣ�<%=rs_s("material_caizhi")%></td>
		</tr>
		<tr>
			<td class="list_required">��λ��<%=rs_s("material_danwei")%></td>
		</tr>
		<tr>
			<td class="list_required">������<%=rs_s("material_shuliang")%></td>
		</tr>
		</table>
	</td>
	<%if (wzno-1) mod 2=1 then response.write "</tr>"
	rs_s.movenext
	loop
end if
rs_s.close%>
</table>
<%end if
rs_t.close%>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->