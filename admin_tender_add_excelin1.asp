<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-99=0 then
call WhereTable("gnome-ccdesktop.png","���뾺����Ϣ��һ������д���ۻ�����Ϣ")

if request("action")="saveadd" then
	addstr=""
	nowtendername=RemoveHTML(ReplaceQM(request("tendername")))
	nowdjh=request("djh")
	nowbasis=request("basis")
	nowtenderclass=request("tenderclass")
	nowneeddate=request("needdate")
	nowstartdate=request("startdate")
	nowstartdatehour=request("startdatehour")
	nowenddate=request("enddate")
	nowenddatehour=request("enddatehour")
	nowdetail=request("detail")
	nowcompanyno=checkifnum(request("companyno"))
	nowminmoney=checkifnum(request("minmoney"))
	nowtendergradeid=checkifnum(request("tendergradeid"))
	if nowtendergradeid<>0 then
		nowtendergrade=shownameint("companygradeorder","companygrade","id",nowtendergradeid)
	else
		nowtendergrade=0
	end if
	
	call warnifdate(nowneeddate,"��������")
	call warnifdate(nowstartdate,"���ۿ�ʼʱ��")
	call warnifdate(nowenddate,"���۽���ʱ��")
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from tender where djh='"&nowdjh&"'"
	rs.open sql,conn,1,3
	if not rs.eof then
		nowdjh=getlastdjhno(date(),IsSqlDataBase)
		addstr=addstr&"\n\n���ڱ���ظ�����������Ϣ��Ÿ���Ϊ"&nowdjh
	end if
	rs.close
	
	set rs=server.createobject("ADODB.RecordSet")
	sql="select * from tender"
	rs.open sql,conn,1,3
	rs.addnew
	rs("tendername")=nowtendername
	rs("djh")=nowdjh
	rs("basis")=nowbasis
	rs("tenderclass")=nowtenderclass
	rs("needdate")=nowneeddate
	rs("startdate")=nowstartdate
	rs("startdatehour")=nowstartdatehour
	rs("enddate")=nowenddate
	rs("enddatehour")=nowenddatehour
	rs("detail")=nowdetail
	rs("tendergrade")=nowtendergrade
	rs("tendergradeid")=nowtendergradeid
	rs("companyno")=nowcompanyno
	rs("minmoney")=nowminmoney
	rs("addman")=session("user_id")
	rs("addtime")=now()
	rs("finalcompany")=0
	rs("statue")=0
	rs("ifzu")=1
	rs("ifdel")=0
	rs.update
	rs.close
	
	call HintAndTurn("���ۻ�����Ϣ��д�ɹ����뵼��ɹ�������Ϣ��"&addstr,"admin_tender_add_excelin2.asp?djh="&nowdjh)
end if
%>
<script type="text/javascript" charset="utf-8" src="edit/kindeditor.js"></script>
<script type="text/javascript">
KE.show({
id : 'detail',
cssPath : 'edit/index.css'
});

function checkenter(){
	if (document.form.tendername.value == ""){
		alert("����д��Ŀ���ƣ�");
		form.tendername.focus();
		return false;
	}
	if (document.form.djh.value == ""){
		alert("����д���۱�ţ�");
		form.djh.focus();
		return false;
	}
	if (document.form.basis.value == ""){
		alert("����д�ɹ����ݣ�");
		form.basis.focus();
		return false;
	}
	if (document.form.needdate.value == ""){
		alert("����д�������ڣ�");
		form.needdate.focus();
		return false;
	}
	if (document.form.startdate.value == ""){
		alert("����д���ۿ�ʼʱ�䣡");
		form.startdate.focus();
		return false;
	}
	if (document.form.enddate.value == ""){
		alert("����д��ֹ��ʼʱ�䣡");
		form.enddate.focus();
		return false;
	}
	if (document.form.detail.value == ""){
		alert("����д����˵����");
		return false;
	}
	if (document.form.companyno.value == ""){
		alert("����д���۳ɹ�����֮������ҵ������");
		form.companyno.focus();
		return false;
	}
	if (document.form.minmoney.value == ""){
		alert("����д���۳ɹ�����֮������߽�");
		form.minmoney.focus();
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
  var p_basis = document.getElementById("basis").value;
  if ((p_basis == null) || (p_basis == "")) return;
  var url = "Checkbasis.asp?basis=" + escape(p_basis);
  xmlHttp.open("GET", url, true);
  xmlHttp.onreadystatechange = updatePage1;
  xmlHttp.send(null);  
}

function updatePage1() {
  if (xmlHttp.readyState < 4) {
    test1.innerHTML="���ڲ�ѯ�òɹ������Ƿ��Ѵ���";
  }
  if (xmlHttp.readyState == 4) {
    var response = xmlHttp.responseText;
    test1.innerHTML=response;
  }
}

function callServer2() {
  var p_tendername = document.getElementById("tendername").value;
  if ((p_tendername == null) || (p_tendername == "")) return;
  var url = "Checktender.asp?tendername=" + escape(p_tendername);
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
}
</script>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form'>
<input type="hidden" name="action" value="saveadd">
<tr>
	<td class="list_header_required">��д����</td>
	<td class="list_required" colspan="3"><input class='form_submit' type='button' name='excelin' id='excelin' value=' ������дҳ�� ' onClick="location.href='admin_tender_add.asp'"></td>
</tr>
<tr>
	<td class="list_header_required">��Ŀ����</td>
	<td class="list_required"><input type='text' class='form_textbox_normal' name='tendername' value='' onKeyUp="callServer2();" style="width:300px;"><font color="#FF0000">*</font></td>
	<td class="list_required"><span id="test2"></span></td>
</tr>
<tr>
	<td class="list_header_required">���۱��</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='djh' id='djh' value='<%=getlastdjhno(date(),IsSqlDataBase)%>' style="width:300px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required" width="15%">�ɹ�����</td>
	<td class="list_required" width="45%"><input type='text' class='form_textbox_normal' name='basis' id='basis' value='' onKeyUp="callServer1();" style="width:300px;"><font color="#FF0000">*</font></td>
	<td class="list_required" width="40%"><span id="test1"></span></td>
</tr>
<tr>
	<td class="list_header_required">��Ŀ����</td>
	<td class="list_required" colspan="2">����<input type="radio" class='form_radio_normal' name="tenderclass" id="tenderclass" value="����" checked> �豸<input type="radio" class='form_radio_normal' name="tenderclass" id="tenderclass" value="�豸"> �ۺ�<input type="radio" class='form_radio_normal' name="tenderclass" id="tenderclass" value="�ۺ�"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">���۵ȼ�</td>
	<td class="list_required" colspan="2"><select class='form_combo_normal' name='tendergradeid'>
	<option value="0">���еȼ�</option>
	<%set rsa=conn.execute("select * from companygrade order by companygradeorder")
	if not rsa.eof then
		do while not rsa.eof
		response.write "<option value="&rsa("id")&">"&rsa("companygradename")&"</option>"
		rsa.movenext
		loop
	end if
	rsa.close%>
	</select><font color="#FF0000">*</font>
	�������<a title=����Ԥ���ܶ�˵�� onMouseOver="window.status='���۵ȼ�˵��';return true;" onMouseOut="window.status='';return true;"  href=javascript:alert("���۵ȼ��趨�󣬵��ڻ��߸�������������ҵ���ɲμӾ��ۡ�")>����</a>���鿴��ϸ˵������</td>
</tr>
<tr>
	<td class="list_header_required">��������</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='needdate' value='' onfocus="calendar()" style="width:100px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">���ۿ�ʼʱ��</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='startdate' value='<%=date()%>' onfocus="calendar()" style="width:100px;">
	<select class='form_combo_normal' name="startdatehour">
	<%for i=0 to 23
		response.write "<option value="&i
		if i-8=0 then response.write " selected"
		response.write ">"&i&"</option>"
	next%>
	</select>��<font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">���۽�ֹʱ��</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='enddate' value='' onfocus="calendar()" style="width:100px;">
	<select class='form_combo_normal' name="enddatehour">
	<%for i=0 to 23
		response.write "<option value="&i
		if i-8=0 then response.write " selected"
		response.write ">"&i&"</option>"
	next%>
	</select>��<font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">����˵��</td>
	<td class="list_required" colspan="2"><textarea id="detail" name="detail" style="width:620px;height:150px;visibility:hidden;"></textarea></td>
</tr>
<tr>
	<td class="list_header_required">���۳ɹ�����</td>
	<td class="list_required" colspan="2">������ҵ�����ﵽ<input type='text' class='form_textbox_normal' name='companyno' value='1' style="width:100px;" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">��<font color="#FF0000">*</font><br>
	������߽��ﵽ<input type='text' class='form_textbox_normal' name='minmoney' value='0' style="width:100px;" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">Ԫ<font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command" colspan="2"><input class='form_submit' type='submit' name='cmd' id='cmd' value=' ��һ�� ' onClick="return checkenter()">
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->