<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-3=0 or session("iflogin")-99=0 then
call WhereTable("identity.png","������Ϣ")

set rs_t=conn.execute("select * from tender where id="&request("id")&"")
if not rs_t.eof then
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;"><%if rs_t("lastdjh")<>"" then%>
<tr>
	<td class="list_header_required">��Ŀ��Դ</td>
	<td class="list_required"><strong>���ξ���</strong></td>
	<td class="list_header_required">ԭ �� Ŀ</td>
	<td class="list_required"><a href="#" onClick="doCheckDetail('admin_tender_main.asp?id=<%=checkifnum(shownamestrnull("id","tender","djh",rs_t("lastdjh")," and ifzu=1"))%>',<%=Modalwidth%>,<%=Modalheight%>)"><%=rs_t("lastdjh")%></a></td>
</tr>
<%end if%>
<tr>
	<td class="list_header_required" width="10%">��Ŀ����</td>
	<td class="list_required" width="40%"><%=rs_t("tendername")%></td>
	<td class="list_header_required" width="10%">���۱��</td>
	<td class="list_required" width="40%"><%=rs_t("djh")%></td>
</tr>
<tr>
	<td class="list_header_required">�ɹ�����</td>
	<td class="list_required"><%=rs_t("basis")%></td>
	<td class="list_header_required">��Ŀ����</td>
	<td class="list_required"><%=rs_t("tenderclass")%></td>
</tr>
<tr>
	<td class="list_header_required">���۵ȼ�</td>
	<td class="list_required"><%=showtendergrade(rs_t("tendergradeid"))%></td>
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
	<td class="grid_header" colspan="4"><strong>�ɹ�����</strong></td>
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
<tr>
	<td class="grid_header" colspan="4"><strong>��������</strong></td>
</tr>
<tr>
	<td class="list_header_required">�ɹ�����</td>
	<td class="list_required" colspan="3">������ҵ�����ﵽ <strong><%=rs_t("companyno")%></strong> ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	������߽��ﵽ <strong><%=rs_t("minmoney")%></strong> Ԫ</td>
</tr>
</table>
<%end if
rs_t.close%>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->