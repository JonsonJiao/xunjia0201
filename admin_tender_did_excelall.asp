<!--#include file="conn.asp"-->
<!--#include file="inc/function.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<% 
if session("user_id")="" then
	response.write "<script language='javascript'>alert('����û�е�½�����ȵ�½');"
	response.write "window.location ='ad_login.asp';</script> "
	Response.End 
end if

if session("iflogin")-1=0 or session("iflogin")-3=0 or session("iflogin")-99=0 then
nowfilename="���ʻ��ܱ�"&replace(replace(replace(now,":","")," ",""),"/","")
Response.Buffer = True 
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename = "&nowfilename&".xls"
%>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>���ʻ��ܱ�</title>
</head>
<body>
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0">
<tr>
	<th>���</th>
	<th>�ɹ�����</th>
	<th>��Ŀ����</th>
	<th>��������</th>
	<th>���ʹ��</th>
	<th>���ʲ���</th>
	<th>��λ</th>
	<th>����</th>
	<th>����</th>
	<th>���ֳ���</th>
	<th>�б��˹�Ӧ��</th>
	<th>�ƻ�Ա</th>
	<th>�б�����</th>
	<th>��ע</th>
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
</body>
</html>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->