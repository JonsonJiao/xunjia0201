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
%><html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>���ʻ��ܱ�</title>
</head>
<body>
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0">
<tr>
	<th>ID��</th>
	<th>��Ŀ����</th>
	<th>���۱��</th>
	<th>�ɹ�����</th>
	<th>��Ŀ����</th>
	<th>���۵ȼ�</th>
	<th>��������</th>
	<th>����ʱ��</th>
	<th>������</th>
	<th>����ʱ��</th>
	<th>��ǰ״̬</th>
	<th>�б���ҵ</th>
	<th>�б��ܶ�</th>
</tr>
<%sql=getsql(request("sql"))
Set rs = server.createobject("adodb.recordset")
rs.open sql,conn,1,3
if not rs.eof then
	i=0
	do while not rs.eof
	i=i+1%>
<tr align="center">
	<td><%=i%></td>
	<td><%=rs("tendername")%></td>
	<td><%=rs("djh")%></td>
	<td><%=rs("basis")%></td>
	<td><%=rs("tenderclass")%></td>
	<td><%=showtendergrade(rs("tendergradeid"))%></td>
	<td><%=rs("needdate")%></td>
	<td><%response.write rs("startdate")&" "&rs("startdatehour")&"�� �� "&rs("enddate")&" "&rs("enddatehour")&"��"%></td>
	<td><%=shownameint("userrealname","login","id",rs("addman"))%></td>
	<td><%=rs("addtime")%></td>
	<td><%=gettenderstatue(rs("statue"))%></td>
	<td><%finalcomid=rs("finalcompany")
	response.write "<a href='#' onClick='doCheckDetail(""company_main.asp?id="&finalcomid&""","&Modalwidth&","&Modalheight&")' title='����鿴��ҵ����'>"&shownameint("companyrealname","company","id",finalcomid)&"</a>"%></td>
	<td><%=getfinalmoney(rs("djh"))%></td>
</tr>
	<%Rs.movenext
	loop
else
	response.write "<tr class='grid_span'><td colspan='16'><font color='red'>�������ϼ�¼��</font></td></tr>"
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