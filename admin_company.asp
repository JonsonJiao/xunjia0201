<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-3=0 or session("iflogin")-99=0 then
'ȫ�ֱ���
Dim CurrentPage,sql,i,rs
'ȫ�ֱ���

call WhereTable("identity.png","��Ӧ�̹���")

dim nowlogin_zu,nowcheckstyle,nowkeyword
currentpage=request("page")
'if currentpage="" then currentpage=0
'response.write currentpage
'response.end
if currentpage<1 or currentpage="" then
  currentpage="1"
end if

nowcompany_grade = request("company_grade")
nowcompany_class = request("company_class")
nowcompany_type = request("company_type")
nowcheckstyle = request("checkstyle")
nowcheckcondition = request("checkcondition")
nowcheckstatue = request("checkstatue")
nowkeyword1 = RemoveHTML(ReplaceQM(request("keyword1")))

gourl="company_class="&nowcompany_class&"&company_grade="&nowcompany_grade&"&company_type="&nowcompany_type&"&checkstyle="&nowcheckstyle&"&checkcondition="&nowcheckcondition&"&checkstatue="&nowcheckstatue&"&keyword1="&nowkeyword1&""

if request("action")="delall" then
	id=replace(request("id")," ","")

	goon=0
	if replace(id,",","")<>"" then goon=1

	if goon=0 then
		call HintAndBack("������ѡ��һ����¼��",1)
	end if
	
	id=split(id,",")
	for i=0 to UBound(id)
		conn.execute("delete from [company] where id="&id(i)&"")
	next
	
	
	call HintAndTurn("ɾ���ɹ���","?"&gourl&"&page="&currentpage&"")
end if

dim thisClass,modifytitlestr
thisClass = "grid_even"
modifytitlestr = ""

'if session("iflogin")-1=0 or session("iflogin")-2=0 then
'	modifytitlestr="���"
'elseif session("iflogin")-99=0 then
'	modifytitlestr="�޸�"
'end if

Set Rs = server.createobject("adodb.recordset")
sql="select * from company where id<>0"
if nowcompany_class<>"" then
	sql=sql&" and companyclass='"&nowcompany_class&"'"
end if
if nowcompany_grade<>"" then
	sql=sql&" and companygrade="&nowcompany_grade&""
end if
if nowcompany_type<>"" then
	sql=sql&" and companytype="&nowcompany_type&""
end if
if nowcheckstatue<>"" then
	sql=sql&" and statue="&nowcheckstatue&""
end if
if nowkeyword1<>"" then
	if nowcheckstyle="mohu" then
		select case nowcheckcondition
		case "1"
		sql=sql&" and companyrealname like '%"&nowkeyword1&"%'"
		case "2"
		sql=sql&" and companyname like '%"&nowkeyword1&"%'"
		case "3"
		sql=sql&" and companyorgno like '%"&nowkeyword1&"%'"
		case "4"
		sql=sql&" and companytaxno like '%"&nowkeyword1&"%'"
		case "5"
		sql=sql&" and companymanager like '%"&nowkeyword1&"%'"
		case "6"
		sql=sql&" and companycontactman like '%"&nowkeyword1&"%'"
		case "7"
		sql=sql&" and companycontacttel like '%"&nowkeyword1&"%'"
		case "8"
		sql=sql&" and companyaddress like '%"&nowkeyword1&"%'"
		case "9"
		sql=sql&" and companyemail like '%"&nowkeyword1&"%'"
		case "10"
		sql=sql&" and companymajor like '%"&nowkeyword1&"%'"
		case "11"
		sql=sql&" and companybeizhu like '%"&nowkeyword1&"%'"
		case else
		sql=sql&" and (companyrealname like '%"&nowkeyword1&"%' or companyname like '%"&nowkeyword1&"%' or companyorgno like '%"&nowkeyword1&"%' or companytaxno like '%"&nowkeyword1&"%' or companymanager like '%"&nowkeyword1&"%' or companycontactman like '%"&nowkeyword1&"%' or companycontacttel like '%"&nowkeyword1&"%' or companyaddress like '%"&nowkeyword1&"%' or companyemail like '%"&nowkeyword1&"%' or companymajor like '%"&nowkeyword1&"%' or companybeizhu like '%"&nowkeyword1&"%')"
		end select
	elseif nowcheckstyle="jing" then
		select case nowcheckcondition
		case "1"
		sql=sql&" and companyrealname = '"&nowkeyword1&"'"
		case "2"
		sql=sql&" and companyname = '"&nowkeyword1&"'"
		case "3"
		sql=sql&" and companyorgno = '"&nowkeyword1&"'"
		case "4"
		sql=sql&" and companytaxno = '"&nowkeyword1&"'"
		case "5"
		sql=sql&" and companymanager = '"&nowkeyword1&"'"
		case "6"
		sql=sql&" and companycontactman = '"&nowkeyword1&"'"
		case "7"
		sql=sql&" and companycontacttel = '"&nowkeyword1&"'"
		case "8"
		sql=sql&" and companyaddress = '"&nowkeyword1&"'"
		case "9"
		sql=sql&" and companyemail = '"&nowkeyword1&"'"
		case "10"
		sql=sql&" and companymajor = '"&nowkeyword1&"'"
		case "11"
		sql=sql&" and companybeizhu = '"&nowkeyword1&"'"
		case else
		sql=sql&" and (companyrealname = '"&nowkeyword1&"' or companyname = '"&nowkeyword1&"' or companyorgno = '"&nowkeyword1&"' or companytaxno = '"&nowkeyword1&"' or companymanager = '"&nowkeyword1&"' or companycontactman = '"&nowkeyword1&"' or companycontacttel = '"&nowkeyword1&"' or companyaddress = '"&nowkeyword1&"' or companyemail = '"&nowkeyword1&"' or companymajor = '"&nowkeyword1&"' or companybeizhu = '"&nowkeyword1&"')"
		end select
	end if
end if
sql=sql&" order by id"

sqlz=sql%>
<table class='grid_search' cellpadding='0' cellspacing='1' border='0'>
<form name="form2">
<tr class='grid_header'>
	<td width='600'>��ѯ����</td>
	<td width='140'>�ؼ���</td>
	<td width='70'>��ѯ</td>
	<td width='70'>���</td>
	<%if session("iflogin")-2=0 or session("iflogin")-99=0 then%>
	<td width='70'>������ҵ</td>
	<%end if%>
	<td width='70'>����</td>
	<td width='*'></td>
</tr>
<tr class="grid_odd" align="center">
	<td class="grid_cell">
	<select name="company_class" class='form_combo_normal' onChange="form2.submit();">
	<option value="">��ҵ����</option>
	<option value="����"<%if nowcompany_class="����" then%> selected="selected"<%end if%>>����</option>
	<option value="�豸"<%if nowcompany_class="�豸" then%> selected="selected"<%end if%>>�豸</option>
	<option value="�ۺ�"<%if nowcompany_class="�ۺ�" then%> selected="selected"<%end if%>>�ۺ�</option>
	</select>
	<select name="company_type" class='form_combo_normal' onChange="form2.submit();">
	<%response.write "<option value=''>��ҵ����</option>"
	set rsc=conn.execute("select * from companytype where id<>0 order by companytypeorder")
	if not rsc.eof then
	do while not rsc.eof
	response.write "<option value="&rsc(0)
	if nowcompany_type=trim(cstr(rsc(0))) then
		response.write " selected"
	end if
	response.write ">"&rsc(1)&"</option>"
	rsc.movenext
	loop
	end if
	rsc.close%>
	</select>
	<select name="company_grade" class='form_combo_normal' onChange="form2.submit();">
	<%response.write "<option value=''>���ʼ���</option>"
	set rsc=conn.execute("select * from companygrade where id<>0 order by companygradeorder")
	if not rsc.eof then
	do while not rsc.eof
	response.write "<option value="&rsc(0)
	if nowcompany_grade=trim(cstr(rsc(0))) then
		response.write " selected"
	end if
	response.write ">"&rsc(1)&"</option>"
	rsc.movenext
	loop
	end if
	rsc.close%>
	</select>
	<select name="checkstatue" class='form_combo_normal' onChange="form2.submit();">
	<option value="">���״̬</option>
	<option value="1"<%if nowcheckstatue="1" then%> selected="selected"<%end if%>>��ͨ�����</option>
	<option value="2"<%if nowcheckstatue="2" then%> selected="selected"<%end if%>>δͨ�����</option>
	<option value="0"<%if nowcheckstatue="0" then%> selected="selected"<%end if%>>δ���</option>
	</select>
	<select name="checkcondition" class='form_combo_normal' onChange="form2.submit();">
	<option value="">��ѯ����</option>
	<option value="1"<%if nowcheckcondition="1" then%> selected="selected"<%end if%>>����ҵ����</option>
	<option value="2"<%if nowcheckcondition="2" then%> selected="selected"<%end if%>>����½�û���</option>
	<option value="3"<%if nowcheckcondition="3" then%> selected="selected"<%end if%>>����������֤��</option>
	<option value="4"<%if nowcheckcondition="4" then%> selected="selected"<%end if%>>��˰��</option>
	<option value="5"<%if nowcheckcondition="5" then%> selected="selected"<%end if%>>������������</option>
	<option value="6"<%if nowcheckcondition="6" then%> selected="selected"<%end if%>>����ϵ������</option>
	<option value="7"<%if nowcheckcondition="7" then%> selected="selected"<%end if%>>����ϵ�绰</option>
	<option value="8"<%if nowcheckcondition="8" then%> selected="selected"<%end if%>>����˾��ַ</option>
	<option value="9"<%if nowcheckcondition="9" then%> selected="selected"<%end if%>>�������ʼ�</option>
	<option value="10"<%if nowcheckcondition="10" then%> selected="selected"<%end if%>>����Ӫҵ��</option>
	<option value="11"<%if nowcheckcondition="11" then%> selected="selected"<%end if%>>����ע</option>
	</select>
	<select name="checkstyle" class='form_combo_normal' onChange="form2.submit();">
	<option value="mohu"<%if nowcheckstyle="mohu" then%> selected="selected"<%end if%>>ģ��</option>
	<option value="jing"<%if nowcheckstyle="jing" then%> selected="selected"<%end if%>>��ȷ</option>
	</select></td>
	<td class="grid_cell"><input type='text' class='form_textbox_normal' name='keyword1' value='<%=nowkeyword1%>' size='15' ></td>
	<td class="grid_cell"><input type='submit' value='��ѯ' class='form_button'></td>
	<td class="grid_cell"><input type='button' value='���' class='form_button' onClick="window.location.href='?'"></td>
	<%if session("iflogin")-2=0 or session("iflogin")-99=0 then%>
	<td class="grid_cell"><input type='button' value='����' onClick="location.href='admin_company_add_first.asp'" class='form_submit'></td>
	<%end if%>
	<td class="grid_cell"><a href="admin_company_excelall.asp?sql=<%=Filtersql(sqlz)%>" target="_blank" title="���������ѯ��¼"><img src="images/excel.jpg" border="0"></a></td>
<td class="grid_cell" align="left"></td>
</tr>
</form>
</table>
<form name='form1'>
<input type="hidden" name="action" value="delall">
<input type="hidden" name="company_class" value="<%=nowcompany_class%>">
<input type="hidden" name="company_type" value="<%=nowcompany_type%>">
<input type="hidden" name="checkstatue" value="<%=nowcheckstatue%>">
<input type="hidden" name="checkcondition" value="<%=nowcheckcondition%>">
<input type="hidden" name="checkstyle" value="<%=nowcheckstyle%>">
<input type="hidden" name="keyword1" value="<%=nowkeyword1%>">
<table class='grid_table' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td>ID��</td>
	<td>��ҵ����</td>
	<td>��ҵ����</td>
	<td>��ҵ����</td>
	<td>���ʼ���</td>
	<td>��½�û���</td>
	<td>��������֤��</td>
	<td>˰��</td>
	<td>����������</td>
	<td>��ϵ��</td>
	<td>��ϵ�绰</td>
	<td>��˾��ַ</td>
	<td>�����ʼ�</td>
	<td>��Ӫҵ��</td>
	<td>ע��״̬</td>
	<td>���״̬</td>
	<td>ע��ʱ��</td>
	<td>����</td>
	<%if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-99=0 then%>
	<td>�޸�</td>
	<%end if
	if session("iflogin")-2=0 or session("iflogin")-99=0 then%>
	<td>ɾ��</td>
	<%end if%>
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
		<td class="grid_cell"><%=rs("companyrealname")%></td>
		<td class="grid_cell"><font color=green><%=rs("companyclass")%></font> </td>
		<td class="grid_cell"><font color=green><%=shownameint("companytypename","companytype","id",rs("companytype"))%></font></td>
		<td class="grid_cell"><font color=green><%=shownameint("companygradename","companygrade","id",rs("companygrade"))%></font></td>
		<td class="grid_cell"><%=rs("companyname")%></td>
		<td class="grid_cell"><%=rs("companyorgno")%></td>
		<td class="grid_cell"><%=rs("companytaxno")%></td>
		<td class="grid_cell"><%=rs("companymanager")%></td>
		<td class="grid_cell"><%=rs("companycontactman")%></td>
		<td class="grid_cell"><%=rs("companycontacttel")%></td>
		<td class="grid_cell"><%=rs("companyaddress")%></td>
		<td class="grid_cell"><%=rs("companyemail")%></td>
		<td class="grid_cell"><%=rs("companymajor")%></td>
		<td class="grid_cell"><%=getcompanyregstatue(rs("regstatue"))%></td>
		<td class="grid_cell"><%=getcompanystatue(rs("statue"))%></td>
		<td class="grid_cell"><%=rs("companyregtime")%></td>
		<td class="grid_cell"><input type='button' value='�鿴'  onClick="doCheckDetail('company_main.asp?id=<%=rs("id")%>',<%=Modalwidth%>,<%=Modalheight%>)" class='form_button'></td>
		<%if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-99=0 then%>
		<td class="grid_cell"><input type='button' value='�޸�' onClick="location.href='admin_company_edit_first.asp?id=<%=rs("id")%>&<%=gourl%>&page=<%=currentpage%>'" class='form_submit'></td>
		<%end if
		if session("iflogin")-2=0 or session("iflogin")-99=0 then%>
		<td class="grid_cell"><input type="checkbox" name="ID" value="<%=rs("id")%>" class="form_checkbox_normal"></td>
		<%end if%>
	</tr>
	<%
	Rs.movenext
	next
	
	if rs.recordcount>0 then 
	%>
	<tr class='grid_header'>
		<td colspan="20">
			<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
			<tr class="list_command">
				<td align="right">
				<%if session("iflogin")-2=0 or session("iflogin")-99=0 then
					showdel="yes"
				else
					showdel="no"
				end if%>
				<!--#include file="inc/page_bar.asp" --></td>
			</tr>
			</table>
		</td>
	</tr>
	<%end if
else
	response.write "<tr class='grid_span'><td colspan='20'><font color='red'>�������ϼ�¼��</font></td></tr>"
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