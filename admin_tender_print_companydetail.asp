<!--#include file="Index_top_print.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-3=0 or session("iflogin")-99=0 then
djh=request("djh")
comid=request("comid")
basis=getsql(request("basis"))%>
<table width='100%' cellpadding='0' cellspacing='1' border='0' style=" font-size:10px;word-break: break-all;">
<tr>
	<td align="left" colspan="3">&nbsp;</td>
</tr>
<tr>
	<td align="center" colspan="3"><div onClick="window.print();">ѯ�۲ɹ�ϵͳ��Ӧ�̱�����ϸ�嵥</div></td>
</tr>
<tr>
	<td align="center" colspan="3"><%=shownameint("companyrealname","company","id",comid)%></td>
</tr>
<tr>
	<td align="left" width="50%">��ϵͳ��ţ�<%=djh%></td>
	<td align="left" width="20%">&nbsp;</td>
	<td align="left">��λ��Ԫ</td>
</tr>
<tr>
	<td align="left">���ɹ����ݣ�<%=basis%></td>
	<td align="left"></td>
	<td align="left">��ӡ���ڣ�<%=date()%></td>
</tr>
</table>
<table width='100%' cellpadding='0' cellspacing='1' border='1' style="font-size:10px;word-break: break-all;border-collapse:collapse;">

<tr align="center">
	<td width="5%">���</td>
	<td width="17%">��������</td>
	<td width="17%">����ͺ�</td>
	<td width="12%">����</td>
	<td width="8%">��λ</td>
	<td width="8%">����</td>
	<td width="8%">����</td>
	<td width="12%">���ֳ���</td>
	<td width="13%">��ע</td>
</tr>
<%set rsc=conn.execute("select * from competitive where djh='"&djh&"' and companyid="&comid&" and ifzu=0 order by id")
if not rsc.eof then
	totalshuliang=0
	m=0
	do while not rsc.eof
	m=m+1
	set rs_s=conn.execute("select * from tender where id="&rsc("tenderid")&"")
	if not rs_s.eof then
		response.write "<tr align='center'>"
		response.write "<td>"&m&"</td>"
		response.write "<td align='left'>"&rs_s("material")&"</td>"
		response.write "<td align='center'>"&rs_s("material_guige")&"</td>"
		response.write "<td align='center'>"&rs_s("material_caizhi")&"</td>"
		response.write "<td align='center'>"&rs_s("material_danwei")&"</td>"
		response.write "<td align='center'>"&rs_s("material_shuliang")&"</td>"
		response.write "<td align='center'>"&rsc("singleprice")&"</td>"
		response.write "<td align='center'>"&rsc("spotprice")&"</td>"
		response.write "<td align='center'>&nbsp;</td>"
		response.write "</tr>"
		totalshuliang=totalshuliang+0+rs_s("material_shuliang")
	end if
	rs_s.close
	rsc.movenext
	loop
end if
rsc.close

set rsc=conn.execute("select * from competitive where djh='"&djh&"' and companyid="&comid&" and ifzu=1")
if not rsc.eof then
	response.write "<tr align='center'>"
	response.write "<td>&nbsp;</td>"
	response.write "<td align='left'>�ϼ�</td>"
	response.write "<td>&nbsp;</td>"
	response.write "<td>&nbsp;</td>"
	response.write "<td>&nbsp;</td>"
	response.write "<td align='center'>"&totalshuliang&"</td>"
	response.write "<td>&nbsp;</td>"
	response.write "<td align='center'>"&rsc("spotprice")&"</td>"
	response.write "<td align='center'>&nbsp;</td>"
	response.write "</tr>"
end if
rsc.close%>
</table>

<table width='100%' cellpadding='0' cellspacing='1' border='0' style=" font-size:10px;word-break: break-all;">
<tr>
	<td align="right">�����ݳ���<%=sysname%></td>
</tr>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->