<table width='100%' class='list_table' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
<%if rs("detail")<>"" then%>
<tr class='grid_header'>
	<td><strong>����˵��</strong></td>
</tr>
<tr class="grid_odd">
	<td><%=rs("detail")%></td>
</tr>
<%end if%>
</table>
<table width='100%' class='list_table' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
<tr>
	<td class="grid_header" colspan="4"><strong>���������Ϣ</strong></td>
</tr>
<%deliverydate=""
paystyle=""
beizhu=""
alltotalprice=0
allspotprice=0
set rs_c=conn.execute("select deliverydate,paystyle,beizhu,totalprice,spotprice from competitive where djh='"&rs("djh")&"' and companyid="&session("user_id")&" and ifzu=1")
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
<tr class='grid_header'>
	<td colspan="4"><strong>��������</strong></td>
</tr>
<tr>
	<td class="list_header_required" width="10%">�����ܼ�<br>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
	<td class="list_required" width="40%"><%=alltotalprice%>Ԫ</td>
	<td class="list_header_required" width="10%">���ֳ���<br>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
	<td class="list_required" width="40%"><%=allspotprice%>Ԫ</td>
</tr>
<%set rs_sub=conn.execute("select * from tender where ifzu=0 and ifdel=0 and djh='"&rs("djh")&"'")
if not rs_sub.eof then
	wzno=0
	do while not rs_sub.eof
	wzno=wzno+1
	response.write "<tr>"%>
	<td class="list_header_required_yellow" width="10%">���� <%=wzno%></td>
	<td class="list_required" width="40%">
		<table width='100%' class='list_table' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
		<tr>
			<td class="list_required" width="100%" colspan="2">���ƣ�<%=rs_sub("material")%></td>
		</tr>
		<tr>
			<td class="list_required" colspan="2">���<%=rs_sub("material_guige")%></td>
		</tr>
		<tr>
			<td class="list_required" colspan="2">���ʣ�<%=rs_sub("material_caizhi")%></td>
		</tr>
		<tr>
			<td class="list_required" width="50%">��λ��<%=rs_sub("material_danwei")%></td>
			<td class="list_required" width="50%">������<%=rs_sub("material_shuliang")%></td>
		</tr>
		</table>
	</td>
	<%set rsc=conn.execute("select * from competitive where tenderid="&rs_sub("id")&" and companyid="&session("user_id")&"")
	if not rsc.eof then%>
	<td class="list_required" colspan="2">
		<table width='100%' class='list_table' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
		<tr>
			<td class="list_required" width="100%">���ʵ��ۣ�<%=sonic(rsc("singleprice"))%> Ԫ</td>
		</tr>
		<tr>
			<td class="list_required">�����ܼۣ�<%=sonic(rsc("totalprice"))%> Ԫ</td>
		</tr>
		<tr>
			<td class="list_required">���ֳ��ۣ�<%=sonic(rsc("spotprice"))%> Ԫ</td>
		</tr>
		</table>
	</td>
	<%end if
	rsc.close
	
	response.write "</tr>"
	rs_sub.movenext
	loop
end if
rs_sub.close%>
</table>