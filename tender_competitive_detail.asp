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
</table>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
<tr>
	<td class="grid_header" colspan="4"><strong>���������Ϣ</strong></td>
</tr>
<%deliverydate=""
paystyle=""
beizhu=""
alltotalprice=0
allspotprice=0
set rs_c=conn.execute("select deliverydate,paystyle,beizhu,totalprice,spotprice from competitive where djh='"&rs_t("djh")&"' and companyid="&session("user_id")&" and ifzu=1")
if not rs_c.eof then
	deliverydate=rs_c(0)
	paystyle=rs_c(1)
	beizhu=rs_c(2)
	alltotalprice=checkifnum(rs_c(3))
	allspotprice=checkifnum(rs_c(4))
end if
rs_c.close%>
<tr>
	<td class="list_header_required">����ʱ��</td>
	<td class="list_required"><%=deliverydate%></td>
	<td class="list_header_required">���ʽ</td>
	<td class="list_required"><%=paystyle%></td>
</tr>
<tr>
	<td class="list_header_required">��ע</td>
	<td class="list_required" colspan="3"><%=beizhu%></td>
</tr>
<tr>
	<td class="grid_header" colspan="4"><strong>�ɹ����ʱ���</strong></td>
</tr>
<tr>
	<td class="list_header_required">�����ܼ�<br>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
	<td class="list_required"><%=alltotalprice%>Ԫ</td>
	<td class="list_header_required">���ֳ���<br>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
	<td class="list_required"><%=allspotprice%>Ԫ</td>
</tr>
<%set rs_s=conn.execute("select * from tender where ifzu=0 and ifdel=0 and djh='"&rs_t("djh")&"'")
if not rs_s.eof then
	wzno=0
	do while not rs_s.eof
	wzno=wzno+1%>
<tr>
	<td class="list_header_required" width="10%">����<%=wzno%></td>
	<td class="list_required" width="40%">
		<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
		<tr>
			<td class="list_required" colspan="2">���ƣ�<%=rs_s("material")%></td>
		</tr>
		<tr>
			<td class="list_required" colspan="2">���<%=rs_s("material_guige")%></td>
		</tr>
		<tr>
			<td class="list_required" colspan="2">���ʣ�<%=rs_s("material_caizhi")%></td>
		</tr>
		<tr>
			<td class="list_required" width="50%">��λ��<%=rs_s("material_danwei")%></td>
			<td class="list_required" width="50%">������<%=rs_s("material_shuliang")%></td>
		</tr>
		</table>
	</td>
	<%singleprice=0
	totalprice=0
	spotprice=0
	set rs_c=conn.execute("select * from competitive where tenderid="&rs_s("id")&" and companyid="&session("user_id")&" and ifzu=0")
	if not rs_c.eof then
		singleprice=rs_c("singleprice")
		totalprice=rs_c("totalprice")
		spotprice=rs_c("spotprice")
	end if
	rs_c.close%>
	<td class="list_header_required" width="10%">���ʱ���</td>
	<td class="list_required">
		<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
		<tr>
			<td class="list_required">���ʵ��ۣ�<%=singleprice%>Ԫ</td>
		</tr>
		<tr>
			<td class="list_required">�����ܼۣ�<%=totalprice%>Ԫ</td>
		</tr>
		<tr>
			<td class="list_required">���ֳ��ۣ�<%=spotprice%>Ԫ</td>
		</tr>
		</table>
	</td>
</tr>
	<%rs_s.movenext
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