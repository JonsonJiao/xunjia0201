<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-99=0 then
call WhereTable("gnome-ccdesktop.png","����������Ϣ")

if request.form("action")="saveadd" then
	addstr=""
	nowtendername=RemoveHTML(ReplaceQM(request.form("tendername")))
	nowdjh=request.form("djh")
	nowbasis=request.form("basis")
	nowtenderclass=request.form("tenderclass")
	nowneeddate=request.form("needdate")
	nowstartdate=request.form("startdate")
	nowstartdatehour=request.form("startdatehour")
	nowenddate=request.form("enddate")
	nowenddatehour=request.form("enddatehour")
	nowdetail=request.form("detail")
	nowcompanyno=checkifnum(request.form("companyno"))
	nowminmoney=checkifnum(request.form("minmoney"))
	nowtendergradeid=checkifnum(request.form("tendergradeid"))
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
	
	for x=1 to maxsubtender
	nowmaterial=request.form("material"&x)
	nowmaterial_guige=request.form("material_guige"&x)
	nowmaterial_caizhi=request.form("material_caizhi"&x)
	nowmaterial_danwei=request.form("material_danwei"&x)
	nowmaterial_shuliang=checkifnum(request.form("material_shuliang"&x))
	if nowmaterial<>"" then
		if nowmaterial_shuliang<=0 then
			addstr=addstr&"\n\n��"&x&"�����ʣ�����������Ϊ0����С���㣬���ʵ��"
		else
			set rs=server.createobject("ADODB.RecordSet")
			sql="select * from [tender]"
			rs.open sql,conn,1,3
			rs.addnew
			rs("djh")=nowdjh
			rs("material")=nowmaterial
			rs("material_guige")=nowmaterial_guige
			rs("material_caizhi")=nowmaterial_caizhi
			rs("material_danwei")=nowmaterial_danwei
			rs("material_shuliang")=nowmaterial_shuliang
			rs("addman")=session("user_id")
			rs("addtime")=now()
			rs("finalcompany")=0
			rs("statue")=0
			rs("ifzu")=0
			rs("ifdel")=0
			rs.update
			rs.close
		end if
	end if
	next
	
	if request.form("fromurl")<>"" then
		call HintAndTurn("������Ϣ�����ɹ���"&addstr,request.form("fromurl")&".asp")
	else
		call HintAndTurn("������Ϣ�����ɹ���"&addstr,"admin_tender_add.asp")
	end if
end if
%>
<script type="text/javascript" charset="utf-8" src="edit/kindeditor.js"></script>
<script type="text/javascript">
KE.show({
id : 'detail',
cssPath : 'edit/index.css'
});

function checkenter(){
	var ifmaterial;
	ifmaterial="no";
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
	
	for (i=1;i<=<%=maxsubtender%>;i++)
	{
	if (eval("document.form.material"+ i +".value != ''")){
		ifmaterial="yes";
		if (eval("document.form.material_shuliang"+ i +".value == '' || document.form.material_shuliang"+ i +".value<=0"))
		{
			eval("alert('�������"+ i +"�����ʲɹ����������ұ�������㣡')");
			eval("form.material_shuliang"+ i +".focus()");
			return false;
		}
	}
	}
	
	if (ifmaterial == "no"){
		alert("����д����һ������ʣ�");
		form.material1.focus();
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

function firm(firmtxt,firmno){
if(confirm(firmtxt)){
	eval("document.form.material"+ firmno +".value=''");
	eval("document.form.material_guige"+ firmno +".value=''");
	eval("document.form.material_caizhi"+ firmno +".value=''");
	eval("document.form.material_danwei"+ firmno +".value=''");
	eval("document.form.material_shuliang"+ firmno +".value=''");
	eval("document.all.shenqing"+ firmno +".style.display='none';");
}
}
</script>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<form name='form' method="post">
<input type="hidden" name="action" value="saveadd">
<input type="hidden" name="fromurl" value="<%=request("fromurl")%>">
<tr>
	<td class="list_header_required">ֱ�ӵ���</td>
	<td class="list_required" colspan="2"><input class='form_submit' type='button' name='excelin' id='excelin' value=' ���뵼��ҳ�� ' onClick="location.href='admin_tender_add_excelin1.asp'"></td>
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
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='needdate' value='' onFocus="calendar()" style="width:100px;"><font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_required">���ۿ�ʼʱ��</td>
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='startdate' value='<%=date()%>' onFocus="calendar()" style="width:100px;">
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
	<td class="list_required" colspan="2"><input type='text' class='form_textbox_normal' name='enddate' value='' onFocus="calendar()" style="width:100px;">
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
<%for x=1 to maxsubtender%>
<tr id="shenqing<%=x%>"<%if x<>1 then%> style="display:none;"<%end if%>>
	<td class="list_header_required">����<%=x%></td>
	<td class="list_required">
		<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
		<tr>
			<td class="list_required">���ƣ�<input type='text' class='form_textbox_normal' name='material<%=x%>' id='material<%=x%>' value='' style="width:300px;"></td>
		</tr>
		<tr>
			<td class="list_required">���<input type='text' class='form_textbox_normal' name='material_guige<%=x%>' id='material_guige<%=x%>' value='' style="width:300px;"></td>
		</tr>
		<tr>
			<td class="list_required">���ʣ�<input type='text' class='form_textbox_normal' name='material_caizhi<%=x%>' id='material_caizhi<%=x%>' value='' style="width:300px;"></td>
		</tr>
		<tr>
			<td class="list_required">��λ��<input type='text' class='form_textbox_normal' name='material_danwei<%=x%>' id='material_danwei<%=x%>' value='' style="width:300px;"></td>
		</tr>
		<tr>
			<td class="list_required">������<input type='text' class='form_textbox_normal' name='material_shuliang<%=x%>' id='material_shuliang<%=x%>' value='' style="width:300px;" onKeyUp="value=value.replace(/[^\d.]/g,'');" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"></td>
		</tr>
		</table>
	</td>
	<td class="list_required">
	<%if x<>maxsubtender then%><input type="button" value="��һ��" onClick="shenqing<%=(x+1)%>.style.display='';" class='form_button'>&nbsp;&nbsp;<%end if%>
	<%if x<>1 then%><input type="button" value="���" onClick="firm('ȷ������� <%=x%> ��ô��',<%=x%>);" class='form_submit'><%end if%>
	</td>
</tr>		
<%next%>
<tr>
	<td class="list_header_required">���۳ɹ�����</td>
	<td class="list_required" colspan="2">������ҵ�����ﵽ<input type='text' class='form_textbox_normal' name='companyno' value='1' style="width:100px;" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">��<font color="#FF0000">*</font><br>
	������߽��ﵽ<input type='text' class='form_textbox_normal' name='minmoney' value='0' style="width:100px;" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">Ԫ<font color="#FF0000">*</font></td>
</tr>
<tr>
	<td class="list_header_command">ָ��</td>
	<td class="list_command" colspan="2"><input class='form_submit' type='submit' name='cmd' id='cmd' value=' ��� ' onClick="return checkenter()">
	<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->