<!--#include file="Index_top.asp" -->
<!--#include file="inc/Md5.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-99=0 then
call WhereTable("identity.png","�޸���ҵ��һ�����޸Ļ�����Ϣ")

gourl="company_class="&request.form("company_class")&"&company_type="&request.form("company_type")&"&checkstatue="&request.form("checkstatue")&"&checkcondition="&request.form("checkcondition")&"&checkstyle="&request.form("checkstyle")&"&keyword1="&request.form("keyword1")&"&page="&request.form("page")

if request.form("action")="saveedit" then
	nowcompanyclass=request.form("companyclass")
	nowcompanytype=request.form("companytype")
	nowrestatue=checkifnum(request.form("restatue"))
	'oldstatue=request.form("oldstatue")
	nowcompanyrealname=RemoveHTML(ReplaceQM(request.form("companyrealname")))
	nowcompanyname=RemoveHTML(ReplaceQM(request.form("companyname")))
	nowpwd=RemoveHTML(ReplaceQM(request.form("pwd")))
	nowcompanygrade=request.form("companygrade")
	nowcompanyorgno=RemoveHTML(ReplaceQM(request.form("companyorgno")))
	nowcompanytaxno=RemoveHTML(ReplaceQM(request.form("companytaxno")))
	nowcompanymanager=RemoveHTML(ReplaceQM(request.form("companymanager")))
	nowcompanycontactman=RemoveHTML(ReplaceQM(request.form("companycontactman")))
	nowcompanycontacttel=RemoveHTML(ReplaceQM(request.form("companycontacttel")))
	nowcompanyaddress=RemoveHTML(ReplaceQM(request.form("companyaddress")))
	nowcompanyemail=request.form("companyemail")
	nowcompanymajor=request.form("companymajor")
	nowcompanybeizhu=request.form("companybeizhu")
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from company where (companyrealname='"&nowcompanyrealname&"' or companyname='"&nowcompanyname&"') and id<>"&request.form("id")
	rs.open sql,conn,1,3
	if not rs.eof then
		call HintAndBack("���������ҵ���ƻ��¼�û����Ѿ�����,���������룡",1)
	end if
	rs.close
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from company where id="&request.form("id")&""
	rs.open sql,conn,1,3
	rs("companyclass")=nowcompanyclass
	rs("companytype")=nowcompanytype
	rs("companyrealname")=nowcompanyrealname
	rs("companyname")=nowcompanyname
	if nowpwd<>"" then
		rs("pwd")=md5(nowpwd)
	end if
	rs("companygrade")=nowcompanygrade
	rs("companyorgno")=nowcompanyorgno
	rs("companytaxno")=nowcompanytaxno
	rs("companymanager")=nowcompanymanager
	rs("companycontactman")=nowcompanycontactman
	rs("companycontacttel")=nowcompanycontacttel
	rs("companyaddress")=nowcompanyaddress
	rs("companyemail")=nowcompanyemail
	rs("companymajor")=nowcompanymajor
	rs("companybeizhu")=nowcompanybeizhu
	if rs("regstatue")<=1 then
		rs("regstatue")=1
	end if
	if nowrestatue-1=0 then
		rs("statue")=0
		rs("ifshen1")=0
		rs("shenman1")=0
		rs("shentime1")=now()
		rs("ifshen2")=0
		rs("shenman2")=0
		rs("shentime2")=now()
	end if
	rs.update
	rs.close
	
	if session("iflogin")-99=0 then
		call HintAndTurn("������Ϣ�޸ĳɹ�����һ���ϴ���ҵ���ʲ��ϣ�","admin_company_edit_second.asp?id="&request.form("id")&"&companyrealname="&nowcompanyrealname&"&"&gourl)
	else
		call HintAndTurn("������Ϣ����޸ĳɹ���","admin_company.asp?"&gourl)
	end if
end if
%>
<script type="text/javascript" charset="utf-8" src="edit/kindeditor.js"></script>
<script type="text/javascript">
KE.show({
id : 'companybeizhu',
cssPath : 'edit/index.css'
});

function checkenter(){
	if (document.form.companyrealname.value == ""){
		alert("����д��ҵ���ƣ�");
		form.companyrealname.focus();
		return false;
	}
	if (document.form.companyname.value == ""){
		alert("����д��¼�û�����");
		form.companyname.focus();
		return false;
	}
	if (document.form.companyorgno.value == ""){
		alert("����д��֯��������֤�ţ�");
		form.companyorgno.focus();
		return false;
	}
	if (document.form.companytaxno.value == ""){
		alert("����д˰�ţ�");
		form.companytaxno.focus();
		return false;
	}
	if (document.form.companymanager.value == ""){
		alert("����д���������ˣ�");
		form.companymanager.focus();
		return false;
	}
	if (document.form.companycontactman.value == ""){
		alert("����д��ϵ��������");
		form.companycontactman.focus();
		return false;
	}
	if (document.form.companycontacttel.value == ""){
		alert("����д��ϵ�绰��");
		form.companycontacttel.focus();
		return false;
	}
	if (document.form.companyaddress.value == ""){
		alert("����д��˾��ַ��");
		form.companyaddress.focus();
		return false;
	}
	if (document.form.companyemail.value == ""){
		alert("����д��˾�����ʼ���");
		form.companyemail.focus();
		return false;
	}
}

var xmlHttp = false;
try {
  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttp = false;
  }
}
if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
  xmlHttp = new XMLHttpRequest();
}

function callServer1() {
  var p_name = document.getElementById("companyrealname").value;
  if ((p_name == null) || (p_name == "")) return;
  var url = "Checkcompany1.asp?companyrealname=" + escape(p_name);
  xmlHttp.open("GET", url, true);
  xmlHttp.onreadystatechange = updatePage1;
  xmlHttp.send(null);  
}

function updatePage1() {
  if (xmlHttp.readyState < 4) {
    test1.innerHTML="���ڲ�ѯ���û����Ƿ��Ѵ���";
  }
  if (xmlHttp.readyState == 4) {
    var response = xmlHttp.responseText;
    test1.innerHTML=response;
  }
  if (response.indexOf("err")>=0){
    document.form.cmd.disabled=true;
  }
  else
  {
  	if(document.all.test2.innerHTML=="" || document.all.test2.innerHTML.indexOf("succ")>=0)
	{
    	document.form.cmd.disabled=false;
	}
	else
	{
    	document.form.cmd.disabled=true;
	}
  }
}

function callServer2() {
  var p_name = document.getElementById("companyname").value;
  if ((p_name == null) || (p_name == "")) return;
  var url = "Checkcompany2.asp?companyname=" + escape(p_name);
  xmlHttp.open("GET", url, true);
  xmlHttp.onreadystatechange = updatePage2;
  xmlHttp.send(null);  
}

function updatePage2() {
  if (xmlHttp.readyState < 4) {
    test2.innerHTML="���ڲ�ѯ���û����Ƿ��Ѵ���";
  }
  if (xmlHttp.readyState == 4) {
    var response = xmlHttp.responseText;
    test2.innerHTML=response;
  }
  if (response.indexOf("err")>=0){
    document.form.cmd.disabled=true;
  }
  else
  {
  	if(document.all.test1.innerHTML=="" || document.all.test1.innerHTML.indexOf("succ")>=0)
	{
    	document.form.cmd.disabled=false;
	}
	else
	{
    	document.form.cmd.disabled=true;
	}
  }
}
</script>
<%set rsm=conn.execute("select * from company where id="&request("id")&"")
if not rsm.eof then%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form' method="post">
<input type="hidden" name="action" value="saveedit">
<input type="hidden" name="id" value="<%=request("id")%>">
<input type="hidden" name="company_class" value="<%=request("company_class")%>">
<input type="hidden" name="company_type" value="<%=request("company_type")%>">
<input type="hidden" name="checkstatue" value="<%=request("checkstatue")%>">
<input type="hidden" name="checkcondition" value="<%=request("checkcondition")%>">
<input type="hidden" name="checkstyle" value="<%=request("checkstyle")%>">
<input type="hidden" name="keyword1" value="<%=request("keyword1")%>">
<input type="hidden" name="page" value="<%=request("page")%>">
<tr>
	<td class="list_header_required">��ҵ����</td>
	<td class="list_required" colspan="2"><select class='form_combo_normal' name='companyclass'>
	<option value="����"<%if rsm("companyclass")="����" then response.write " selected"%>>����</option>
	<option value="�豸"<%if rsm("companyclass")="�豸" then response.write " selected"%>>�豸</option>
	<option value="�ۺ�"<%if rsm("companyclass")="�ۺ�" then response.write " selected"%>>�ۺ�</option>
	</select><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��ҵ����</td>
	<td class="list_required" colspan="2"><select class='form_combo_normal' name='companytype'>
	<%set rsa=conn.execute("select * from companytype order by companytypeorder")
	if not rsa.eof then
		do while not rsa.eof
		response.write "<option value="&rsa("id")
		if rsm("companytype")-rsa("id")=0 then response.write " selected"
		response.write ">"&rsa("companytypename")&"</option>"
		rsa.movenext
		loop
	end if
	rsa.close%>
	</select><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">���״̬</td>
	<td class="list_required" colspan="2"><%response.write getcompanystatue(rsm("statue"))
	response.write "<br>�������<input type='checkbox' name='restatue' class='form_checkbox_normal' value='1'>"%></td>
</tr>
<tr>
	<td class="list_header_required" width="15%">��ҵ����</td>
	<td class="list_required" width="45%"><input type='text' class='form_textbox_normal' name='companyrealname' id='companyrealname' value='<%=rsm("companyrealname")%>' onKeyUp="callServer1();" style="width:300px;"><font color="#FF0000">*</font></td>
	<td class="list_required" width="40%"><span id="test1"></span></td>
</tr>
<tr>
	<td class="list_header_required">��½�û���</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='companyname' id='companyname' value='<%=rsm("companyname")%>' onKeyUp="callServer2();" style="width:200px;"><font color="#FF0000">*</font></td>
	<td class="list_required"><span id="test2"></span></td>
</tr>
<tr>
	<td class="list_header_required">��½����</td>
	<td class="list_required" colspan="2"><input type='password' class='form_password_required' name='pwd' value='' style="width:200px;"><font color="#666666">������дĬ��Ϊ���޸ģ�</font></td>
</tr>
<tr>
	<td class="list_header_required">��֯��������֤��</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='companyorgno' value='<%=rsm("companyorgno")%>' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">˰��</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='companytaxno' value='<%=rsm("companytaxno")%>' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��ҵ����</td>
	<td class="list_required" colspan="2"><select class='form_combo_normal' name='companygrade'>
	<%set rsa=conn.execute("select * from companygrade order by companygradeorder")
	if not rsa.eof then
		do while not rsa.eof
		response.write "<option value="&rsa("id")
		if rsm("companygrade")-rsa("id")=0 then response.write " selected"
		response.write ">"&rsa("companygradename")&"</option>"
		rsa.movenext
		loop
	end if
	rsa.close%>
	</select><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">����������</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='companymanager' value='<%=rsm("companymanager")%>' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��ϵ������</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='companycontactman' value='<%=rsm("companycontactman")%>' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��ϵ�绰</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='companycontacttel' value='<%=rsm("companycontacttel")%>' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��˾��ַ</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='companyaddress' value='<%=rsm("companyaddress")%>' style="width:300px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">�����ʼ�</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='companyemail' value='<%=rsm("companyemail")%>' style="width:200px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">��Ӫҵ��</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='companymajor' value='<%=rsm("companymajor")%>' style="width:200px;"><font color="#666666">�����𳬹�20�֣�</font></td>
</tr>
<tr>
	<td class="list_header_required">��ע</td>
	<td class="list_required" colspan="2"><textarea id="companybeizhu" name="companybeizhu" style="width:620px;height:150px;visibility:hidden;"><%=rsm("companybeizhu")%></textarea></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command" colspan="2"><input class='form_submit' type='submit' name='cmd' id='cmd' value=' ȷ�� ' onClick="return checkenter()">
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</form>
</table>
<%end if
rsm.close
else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->