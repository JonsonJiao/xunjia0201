<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-99=0 then
'ȫ�ֱ���
Dim CurrentPage,sql,i,rs
'ȫ�ֱ���

call WhereTable("filetypes.png","����������")

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

if request("action")="delall" then
	id=replace(request("id")," ","")

	goon=0
	if replace(id,",","")<>"" then goon=1

	if goon=0 then
		call HintAndBack("������ѡ��һ����¼��",1)
	end if
	
	id=split(id,",")
	for i=0 to UBound(id)
		conn.execute("delete from [yijian] where id="&id(i)&"")
	next
	
	
	call HintAndTurn("ɾ���ɹ���","?"&gourl&"&page="&currentpage&"")
end if
%>
<table class='grid_search' cellpadding='0' cellspacing='1' border='0'>
<form name="form2">
<tr class='grid_header'>
	<td width='180'>��ѯ����</td>
	<td width='140'>�ؼ���</td>
	<td width='70'>��ѯ</td>
	<td width='70'>���</td>
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
	<td class="grid_cell"><input type="button" name="clean" value="���" onClick="location.href='?'" class="form_button"></td>
	<td class="grid_cell" align="left"></td>
</tr>
</form>
</table>
<%
dim thisClass
thisClass = "grid_even"

Set Rs = server.createobject("adodb.recordset")
sql="select * from yijian where id<>0"
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
<input type="hidden" name="action" value="delall">
<input type="hidden" name="login_zu" value="<%=nowlogin_zu%>">
<input type="hidden" name="checkstyle" value="<%=nowcheckstyle%>">
<input type="hidden" name="checkzi" value="<%=nowcheckzi%>">
<input type="hidden" name="keyword1" value="<%=nowkeyword1%>">
<table class='grid_table' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td width='80'>ID��</td>
	<td width='150'>����</td>
	<td width='*'>����</td>
	<td width='150'>������</td>
	<td width='200'>���ʱ��</td>
	<td width='80'>�鿴</td>
	<td width='80'>ɾ��</td>
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
		<td class="grid_cell"><%=cutstr(RemoveHTML(rs("content")),40)%></td>
		<td class="grid_cell"><%=rs("addman")%></td>
		<td class="grid_cell"><%=rs("addtime")%></td>
		<td class="grid_cell"><input type='button' value='�鿴' onClick="doCheckDetail('yijian_main.asp?id=<%=rs("id")%>',<%=Modalwidth%>,<%=Modalheight%>)" class='form_button'></td>
		<td class="grid_cell"><input type="checkbox" name="ID" value="<%=rs("id")%>" class="form_checkbox_normal"></td>
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
				<%showdel="yes"%>
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
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->