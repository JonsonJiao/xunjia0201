<!--#include file="Index_top.asp" -->
<!--#include file="inc/Md5.asp" -->
<%
if session("iflogin")=0 and session("statue")=0 then
call WhereTable("identity.png","�޸���ҵ��һ�����޸Ļ�����Ϣ")

if request("action")="saveedit" then
	nowcompanyclass=request.form("companyclass")
	nowcompanytype=request.form("companytype")
	nowstatue=request.form("statue")
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
	sql="select * from company where companyname='"&nowcompanyname&"' and id<>"&request.form("id")
	rs.open sql,conn,1,3
	if not rs.eof then
		call HintAndBack("���������ҵ���ƻ��¼�û����Ѿ�����,���������룡",1)
	end if
	rs.close
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from company where id="&request.form("id")&""
	rs.open sql,conn,1,3
	rs("companytype")=nowcompanytype
	rs("companyname")=nowcompanyname
	if nowpwd<>"" then
		rs("pwd")=md5(nowpwd)
	end if
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
	rs.update
	rs.close
	
	call HintAndTurn("������Ϣ�޸ĳɹ�����һ���ϴ���ҵ���ʲ��ϣ�","company_edit_second.asp?id="&request.form("id")&"&companyrealname="&nowcompanyrealname&"&"&gourl)
end if
%>
<script type="text/javascript" charset="utf-8" src="edit/kindeditor.js"></script>
<script type="text/javascript">
KE.show({
id : 'companybeizhu',
cssPath : 'edit/index.css'
});

function checkenter(){
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
<%set rsm=conn.execute("select * from company where id="&session("user_id")&"")
if not rsm.eof then%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form' method="post">
<input type="hidden" name="action" value="saveedit">
<input type="hidden" name="id" value="<%=session("user_id")%>">
<input type="hidden" name="companyrealname" value="<%=rsm("companyrealname")%>">
<tr>
	<td class="list_header_required">��ҵ����</td>
	<td class="list_required" colspan="2"><%=rsm("companyrealname")%></td>
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
	<td class="list_header_required" width="15%">��½�û���</td>
	<td class="list_required" width="45%"><input type='text' class='form_textbox_normal' name='companyname' id='companyname' value='<%=rsm("companyname")%>' onKeyUp="callServer2();" style="width:200px;"><font color="#FF0000">*</font></td>
	<td class="list_required" width="40%"><span id="test2"></span></td>
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
rsm.close%>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->