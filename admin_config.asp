<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-99=0 then
call WhereTable("licq.png","ϵͳ����")

if request("action")="saveadd" then
	nowsysname=RemoveHTML(ReplaceQM(request("sysname")))
	nowsysuser=RemoveHTML(ReplaceQM(request("sysuser")))
	nowsysmanagercontact=RemoveHTML(ReplaceQM(request("sysmanagercontact")))
	nowsysmanager=RemoveHTML(ReplaceQM(request("sysmanager")))
	nowsyscontactphone=RemoveHTML(ReplaceQM(request("syscontactphone")))
	nowgonggao=RemoveHTML(ReplaceQM(request("gonggao")))
	nowmaxrecord=checkifnum(request("maxrecord"))
	nowmaxrecord1=checkifnum(request("maxrecord1"))
	nowmaxcfile=checkifnum(request("maxcfile"))
	nowmaxccontract=checkifnum(request("maxccontract"))
	nowmaxsubtender=checkifnum(request("maxsubtender"))
	nowModalwidth=checkifnum(request("Modalwidth"))
	nowModalheight=checkifnum(request("Modalheight"))
	nowcanreg=checkifnum(request("canreg"))
	nowusercheck=checkifnum(request("usercheck"))
	nowuploadlimit=checkifnum(request("uploadlimit"))
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from config where id=1"
	rs.open sql,conn,1,3
	if not rs.eof then
		rs("sysname")=nowsysname
		rs("sysuser")=nowsysuser
		rs("sysmanagercontact")=nowsysmanagercontact
		rs("syscontactphone")=nowsyscontactphone
		rs("sysmanager")=nowsysmanager
		rs("gonggao")=nowgonggao
		rs("maxrecord")=nowmaxrecord
		rs("maxrecord1")=nowmaxrecord1
		rs("maxcfile")=nowmaxcfile
		rs("maxccontract")=nowmaxccontract
		rs("maxsubtender")=nowmaxsubtender
		rs("Modalwidth")=nowModalwidth
		rs("Modalheight")=nowModalheight
		rs("canreg")=nowcanreg
		rs("usercheck")=nowusercheck
		rs("uploadlimit")=nowuploadlimit
		rs.update
	end if
	rs.close
	
	call HintAndTurn("ϵͳ���óɹ���","admin_config.asp")
end if
%>
<script language="javascript">
function checkenter(){
	if (document.form.sysname.value == ""){
		alert("������ϵͳ���ƣ�");
		form.sysname.focus();
		return false;
	}
	if (document.form.sysuser.value == ""){
		alert("������ϵͳʹ�õ�λ��");
		form.sysuser.focus();
		return false;
	}
}
</script>
<form name='form'>
<input type="hidden" name="action" value="saveadd">
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr>
	<td class="list_header_required" width="15%">ϵͳ����</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='sysname' value='<%=sysname%>' size='40'><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">ʹ�õ�λ</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='sysuser' value='<%=sysuser%>' size='40'><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��ϵ��ʽ</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='sysmanagercontact' value='<%=sysmanagercontact%>' size='80'></td>
</tr>
<tr>
	<td class="list_header_required">��ϵ�绰</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='syscontactphone' value='<%=syscontactphone%>' size='80'></td>
</tr>
<tr>
	<td class="list_header_required">������</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='sysmanager' value='<%=sysmanager%>' size='80'></td>
</tr>
<tr>
	<td class="list_header_required">����ƹ���</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='gonggao' value='<%=gonggao%>' size='80' ></td>
</tr>
<tr>
	<td class="list_header_required">����ҳ����ʾ��¼����</td>
	<td class="list_required"><select name='maxrecord1' class='form_combo_normal'>
	<%for i=5 to 30
		response.write "<option value="&i
		if i-maxrecord1=0 then response.write " selected"
		response.write ">"&i&"</option>"
	next%>
	</select>
</tr>
<tr>
	<td class="list_header_required">��Ϣҳ����ʾ��¼����</td>
	<td class="list_required"><select name='maxrecord' class='form_combo_normal'>
	<%for i=5 to 30
		response.write "<option value="&i
		if i-maxrecord=0 then response.write " selected"
		response.write ">"&i&"</option>"
	next%>
	</select>
</tr>
<tr>
	<td class="list_header_required">��ҵ�����ϴ���������</td>
	<td class="list_required"><select name='maxcfile' class='form_combo_normal'>
	<%for i=1 to 20
		response.write "<option value="&i
		if i-maxcfile=0 then response.write " selected"
		response.write ">"&i&"</option>"
	next%>
	</select>
</tr>
<tr>
	<td class="list_header_required">��ҵ��ͬ�ϴ���������</td>
	<td class="list_required"><select name='maxccontract' class='form_combo_normal'>
	<%for i=1 to 20
		response.write "<option value="&i
		if i-maxccontract=0 then response.write " selected"
		response.write ">"&i&"</option>"
	next%>
	</select>
</tr>
<tr>
	<td class="list_header_required">һ�ξ�����Ϣ�о���������������</td>
	<td class="list_required"><select name='maxsubtender' class='form_combo_normal'>
	<%for i=50 to 500 step 50
	
		response.write "<option value="&i
		if i-maxsubtender=0 then response.write " selected"
		response.write ">"&i&"</option>"
	next%>
	</select>
</tr>
<tr>
	<td class="list_header_required">������Ϣ���С</td>
	<td class="list_required">��<input type='text' class='form_textbox_normal' name='Modalwidth' value='<%=Modalwidth%>' size='10' onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
	�ߣ�<input type='text' class='form_textbox_normal' name='Modalheight' value='<%=Modalheight%>' size='10' onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
</tr>
<tr>
	<td class="list_header_required">����Ӧ��ע��</td>
	<td class="list_required">��<input type="radio" class='form_radio_normal' name="canreg" id="canreg" value="1"<%if canreg-1=0 then response.write " checked"%>> ��<input type="radio" class='form_radio_normal' name="canreg" id="canreg" value="0"<%if canreg=0 then response.write " checked"%>></td>
</tr>
<tr>
	<td class="list_header_required">��Ӧ��ע��������</td>
	<td class="list_required">��<input type="radio" class='form_radio_normal' name="usercheck" id="usercheck" value="0"<%if usercheck=0 then response.write " checked"%>> ��<input type="radio" class='form_radio_normal' name="usercheck" id="usercheck" value="1"<%if usercheck-1=0 then response.write " checked"%>></td>
</tr>
<tr>
	<td class="list_header_required">�ϴ��ļ�����</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='uploadlimit' value='<%=uploadlimit%>' size='10' onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"> M</td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command"><input class='form_submit' type='submit' name='cmd' value=' ȷ�� ' onClick="return checkenter()"></td>
</tr>
</table>
</form>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->