<!--#include file="Conn.asp" -->
<!--#include file="Const1.asp" -->
<!--#include file="Inc/Function.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
  <!--
	p {font-family: "Arial, Helvetica, sans-serif"; font-size: 10pt}
	td {font-family: "Arial, Helvetica, sans-serif"; font-size: 10pt ; line-height:normal; }
	A{font-family: "Arial, Helvetica, sans-serif";text-transform: none; text-decoration: none; font-size: 10pt}
	select{font-family: "Arial, Helvetica, sans-serif";font-size: 10pt;}
	input{font-family: "Arial, Helvetica, sans-serif";font-size: 10pt;}
	a:hover {font-family: "Arial, Helvetica, sans-serif";text-decoration:underline; color: #FFFFFF; font-size: 10pt}
	body {font-family: "Arial, Helvetica, sans-serif";font-size: 10pt}
	div {font-family: "Arial, Helvetica, sans-serif"; font-size: 10pt}
  -->
</style>
<link href='css/workspace.css' rel='stylesheet' type='text/css'>
<script language="JavaScript1.2" src="js/Function.js"></script>
<SCRIPT src="inc/day.js"></SCRIPT>
</head>
<body onkeydown="if(event.keyCode==13)event.keyCode=9">

<%
'ȫ�ֱ���
Dim CurrentPage,sql,i,rs
'ȫ�ֱ���

call WhereTable("todo.png","����")

dim nowlogin_zu,nowcheckstyle,nowkeyword
currentpage=request("page")
'if currentpage="" then currentpage=0
'response.write currentpage
'response.end
if currentpage<1 or currentpage="" then
  currentpage="1"
end if

nowlogin_zu = request("login_zu")
nowcheckzi = request("checkzi")
nowcheckstyle = request("checkstyle")
nowkeyword1 = RemoveHTML(ReplaceQM(request("keyword1")))

gourl="login_zu="&nowlogin_zu&"&checkzi="&nowcheckzi&"&checkstyl ="&nowcheckstyle&"&keyword1="&nowkeyword1&""
%>
<table class='grid_search' cellpadding='0' cellspacing='1' border='0'>
<form name="form2">
<tr class='grid_header'>
	<td width='180'>��ѯ����</td>
	<td width='140'>�ؼ���</td>
	<td width='70'>��ѯ</td>
	<td width='140'>���</td>
	<td width='*'></td>
</tr>
<tr class="grid_odd" align="center">
	<td class="grid_cell">
	<select name="checkzi" class='form_combo_normal' onChange="form2.submit();">
	<option value="1"<%if nowcheckzi="1" then%> selected="selected"<%end if%>>������</option>
	<option value="2"<%if nowcheckzi="2" then%> selected="selected"<%end if%>>������</option>
	<option value="3"<%if nowcheckzi="3" then%> selected="selected"<%end if%>>��������</option>
	</select>
	<select name="checkstyle" class='form_combo_normal' onChange="form2.submit();">
	<option value="mohu"<%if nowcheckstyle="mohu" then%> selected="selected"<%end if%>>ģ��</option>
	<option value="jing"<%if nowcheckstyle="jing" then%> selected="selected"<%end if%>>��ȷ</option>
	</select></td>
	<td class="grid_cell"><input type='text' class='form_textbox_normal' name='keyword1' value='<%=nowkeyword1%>' size='15' ></td>
	<td class="grid_cell"><input type='submit' value='��ѯ' class='form_button'></td>
	<td class="grid_cell"><input type="button" name="clean" value="�����ѯ����" onClick="location.href='?'" class="form_button"></td>
	<td class="grid_cell" align="left"></td>
</tr>
</form>
</table>
<%
dim thisClass
thisClass = "grid_even"

Set Rs = server.createobject("adodb.recordset")
sql="select * from gonggao where id<>0"
if nowkeyword1<>"" then
	if nowcheckstyle="mohu" then
		select case nowcheckzi
		case "1"
		sql=sql&" and title like '%"&nowkeyword1&"%'"
		case "2"
		sql=sql&" content like '%"&nowkeyword1&"%'"
		case "3"
		sql=sql&" and addman like '%"&nowkeyword1&"%'"
		end select
	elseif nowcheckstyle="jing" then
		select case nowcheckzi
		case "1"
		sql=sql&" and title='"&nowkeyword1&"'"
		case "2"
		sql=sql&" content='"&nowkeyword1&"'"
		case "3"
		sql=sql&" and addman='"&nowkeyword1&"'"
		end select
	end if
end if
sql=sql&" order by id desc"%>
<form name='form1'>
<table class='grid_table' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td width='100'>ID��</td>
	<td width='150'>����</td>
	<td width='*'>����</td>
	<td width='150'>������</td>
	<td width='200'>���ʱ��</td>
	<td width='80'>�鿴</td>
</tr>
<%
set rs =server.createobject("ADODB.RecordSet")	
rs.open sql,conn,1,3
if not rs.eof then
	rs.pagesize=maxrecord
	rs.absolutepage=currentpage
	for currentrec=1 to rs.pagesize
    if rs.eof then
		exit for
    end if
	if thisClass = "grid_even" then thisClass = "grid_odd" else thisClass = "grid_even"
	%>
	<tr class=<%=thisClass%> align="center">
		<td class="grid_cell"><%=rs("id")%></td>
		<td class="grid_cell"><font color=green><%=rs("title")%></font></td>
		<td class="grid_cell"><%=cutstr(rs("content"),40)%></td>
		<td class="grid_cell"><%=rs("addman")%></td>
		<td class="grid_cell"><%=rs("addtime")%></td>
		<td class="grid_cell"><input type='button' value='�鿴' onClick="doCheckDetail('gonggao_detail.asp?id=<%=rs("id")%>',800,840)" class='form_button'></td>
	</tr>
	<%
	Rs.movenext
	next
	
	if rs.recordcount>0 then 
	%>
	<tr class='grid_header'>
		<td colspan="8">
			<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
			<tr class="list_command">
				<td align="right">
				<%showdel="no"%>
				<!--#include file="inc/page_bar.asp" --></td>
			</tr>
			</table>
		</td>
	</tr>
	<%end if
else
	response.write "<tr class='grid_span'><td colspan='8'><font color='red'>�������ϼ�¼��</font></td></tr>"
end if

rs.close
set rs = nothing
%>
</table>
</form>
<!--#include file="Index_bottom.asp" -->