<!--#include file="Index_top_print.asp" -->
<% 
if session("user_id")="" then
	response.write "<script language='javascript'>alert('����û�е�½�����ȵ�½');"
	response.write "window.location ='ad_login.asp';</script> "
	Response.End 
end if
if session("iflogin")-1=0 or session("iflogin")-3=0 or session("iflogin")-99=0 then
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>���ʻ��ܱ� - ��ӡ</title>
<table width='100%' cellpadding='0' cellspacing='1' border='0' style=" font-size:10px;word-break: break-all;">
<tr>
	<td align="center" colspan="14" height="30"><div onClick="window.print();">���ʻ��ܱ�</div></td>
</tr>
</table>
<table width='100%' cellpadding='0' cellspacing='1' border='1' style="font-size:10px;word-break: break-all;border-collapse:collapse;">
<tr align="center">
	<td>���</td>
	<td>�ɹ�����</td>
	<td>��Ŀ����</td>
	<td>��������</td>
	<td>���ʹ��</td>
	<td>���ʲ���</td>
	<td>��λ</td>
	<td>����</td>
	<td>����</td>
	<td>���ֳ���</td>
	<td>�б��˹�Ӧ��</td>
	<td>�ƻ�Ա</td>
	<td>�б�����</td>
	<td>��ע</td>
</tr>
<%sql=getsql(request("sql"))
Set rs = server.createobject("adodb.recordset")
rs.open sql,conn,1,3
if not rs.eof then
	i=0
	do while not rs.eof
	set rsc=conn.execute("select * from tender where djh='"&rs("djh")&"' and ifzu=0")
	if not rsc.eof then
		do while not rsc.eof
		i=i+1
		
		set rsf=conn.execute("select * from competitive where tenderid="&rsc("id")&" and (statue=1 or statue=2) and ifzu=0")%>
<tr align="center">
	<td><%=i%></td>
	<td><%=rs("basis")%></td>
	<td><%=rs("tenderclass")%></td>
	<td><%=rsc("material")%></td>
	<td><%=rsc("material_guige")%></td>
	<td><%=rsc("material_caizhi")%></td>
	<td><%=rsc("material_danwei")%></td>
	<td><%=rsc("material_shuliang")%></td>
	<td><%=rsf("singleprice")%></td>
	<td><%=rsf("spotprice")%></td>
	<td><%=shownameint("companyrealname","company","id",rsf("companyid"))%></td>
	<td><%=shownameint("userrealname","login","id",rs("addman"))%></td>
	<td><%=rsf("gettime")%></td>
	<td>&nbsp;</td>
</tr>
		<%rsf.close
		
		rsc.movenext
		loop
	end if
	rsc.close
	
	Rs.movenext
	loop
else
	response.write "<tr><td colspan='14'><font color='red'>�������ϼ�¼��</font></td></tr>"
end if

rs.close
set rs = nothing
%>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->