<%
'ǿ����������·��ʷ���������ҳ�棬�����Ǵӻ����ȡҳ��
Response.Buffer = True
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"
%>
<!-- #include file="conn.asp" -->
<!-- #include file="const1.asp" -->
<!-- #include file="inc/function.asp" -->
<!-- #include file="inc/md5.asp" -->
<%
if request("action")="" then
%>
<head><title><%=sysname%> - ����Ա��½</title>
<meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
<link rel=stylesheet type=text/css href='inc/Style.css'>
<link rel="shortcut icon" href="favicon.ico">
<link rel="Bookmark" href="favicon.ico">
<SCRIPT language=JavaScript type=text/JavaScript>
function document.onreadystatechange()
{  var app=navigator.appName;
  var verstr=navigator.appVersion;
  if(app.indexOf('Netscape') != -1) {
    alert('������ʾ��\n    ��ʹ�õ���Netscape����������ܻᵼ���޷�ʹ�ú�̨�Ĳ��ֹ��ܡ�������ʹ�� IE6.0 �����ϰ汾��');
  } else if(app.indexOf('Microsoft') != -1) {
    if (verstr.indexOf('MSIE 3.0')!=-1 || verstr.indexOf('MSIE 4.0') != -1 || verstr.indexOf('MSIE 5.0') != -1 || verstr.indexOf('MSIE 5.1') != -1)
      alert('������ʾ��\n    ����������汾̫�ͣ����ܻᵼ���޷�ʹ�ú�̨�Ĳ��ֹ��ܡ�������ʹ�� IE6.0 �����ϰ汾��');
  }
  document.loginform.username.focus();
}
function checkform() {
  if(loginform.username.value == '') {
    alert('����������˺ţ�');
    loginform.username.focus();
    return false;
  }
  if(loginform.pwd.value == '') {
    alert('���������룡');
    loginform.pwd.focus();
    return false;
  }
  if (loginform.verifycode.value == '') {
    alert ('��������֤�룡');
    loginform.verifycode.focus();
    return false;
  }
}

nereidFadeObjects = new Object();
nereidFadeTimers = new Object();
function nereidFade(object, destOp, rate, delta){
if (!document.all)
	return
	if (object != "[object]"){ 
		setTimeout("nereidFade("+object+","+destOp+","+rate+","+delta+")",0);
		return;
	}
	clearTimeout(nereidFadeTimers[object.sourceIndex]);
	diff = destOp-object.filters.alpha.opacity;
	direction = 1;
	if (object.filters.alpha.opacity > destOp){
		direction = -1;
	}
	delta=Math.min(direction*diff,delta);
	object.filters.alpha.opacity+=direction*delta;
	if (object.filters.alpha.opacity != destOp){
		nereidFadeObjects[object.sourceIndex]=object;
		nereidFadeTimers[object.sourceIndex]=setTimeout("nereidFade(nereidFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
	}
}
</SCRIPT>
<script language="JavaScript1.2" src="js/Function.js"></script>
<STYLE>
body {font-family: "����";font-size: 12px;text-decoration: none;}
td {font-size: 12px;color: #666666;text-decoration: none;line-height: 18px;font-family: "����";}
.S1{
font-family: "����"; 
font-weight: bold; 
color: #ffffff; 
font-size:16px;
text-decoration: none}
.STYLE5 {font-size: 13px}
</STYLE>
</head>
<body bgcolor=3A6EA5><div style='height:100px;'></div>
<table width="761"  border="0" cellspacing="0" cellpadding="0" align=center>
<tr>
	<td width="761" height="122" background="IMAGES/LoginTop.gif"></td>
</tr>
<tr>
	<td height="170" background="IMAGES/LoginMiddle.gif">&nbsp;</td>
</tr>
<tr>
	<td height="145" background="IMAGES/LoginBottom_admin.gif" valign="top">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="37%" height="45">&nbsp;</td>
			<td width="58%" align="right" onClick="doCheckDetail('gonggao_main.asp',1024,768)" onMouseOver="this.style.cursor='pointer'">
			<%
			strgo=""
			set rsg=conn.execute("select top 5 title from gonggao order by addtime desc")
			if not rsg.eof then
				i=0
				do while not rsg.eof
				i=i+1
				strgo=strgo&"<font color='#ffffff' style='font-size:14px;'>"&i&".</font><font color='#FFffff' style='font-size:14px;'>"&rsg(0)&"</font>&nbsp;&nbsp;&nbsp;&nbsp;"
				rsg.movenext
				loop
			end if
			rsg.close%>
			<marquee direction="left" onMouseOver="this.stop();this.style.cursor='pointer';" onMouseOut="this.start();" width="330" scrollamount="2"><%=strgo%></marquee>
			</td>
		</tr>
		<tr>
			<td height="50">&nbsp;</td>
			<td>
				<table width="100%"  border="0" cellspacing="3" cellpadding="0" class=fontWhite>
				<form name="loginform" method="post" action="?action=login" onSubmit="return checkform();">
				<tr>
					<td width="10%" height="32"><font color="#FFFFFF">�û���</font></td>
					<td width="23%"><input name="username" type="text" class="bdlogin" value="" size="15" maxlength="16"></td>
					<td width="10%" align=right><font color="#FFFFFF">�� ��</font></td>
					<td width="23%"><input name="pwd" type="password" class="bdlogin" value="" size="15" maxlength="16"></td>
					<td width="10%" align=right><font color="#FFFFFF">��֤��</font></td>
					<td width="10%"><input type=text name="verifycode" class="bdlogin" maxLength=6 size="6"></td>
					<td align="right" width="10%"><IMG src="inc/verifycode.asp" alt="�������?����ˢ��" onclick="this.src=this.src+'?'+Math.random();" style="CURSOR:hand;" align="absmiddle" height="15" width="60"></td>
					<td width="2%">&nbsp;</td>
					</tr>
					<tr>
					<td colspan="7" align="center"><input type="submit" name="Submit" value=" �� ¼ " class="bdlogin">
					<input type="reset" name="reset" value=" �� �� " class="bdlogin"></td>
				</tr>
				</form>
				</table>
			</td>
		</tr>
		<tr>
			<td height="32">&nbsp;</td>
			<td colspan="2" valign=bottom align=right><font color="#FFFFFF">CopyRight (c) <%=sysuser%> All Rights Reserved</font>&nbsp;&nbsp;&nbsp;&nbsp;<br><br></td>
		</tr>
		</table>
	</td>
</tr>
</table>
<TABLE height="30" cellSpacing="0" cellPadding="0" width="761" align="center" bgColor="#66B3FF" border="0">
<TBODY>
<TR>
	<TD width="98%"><DIV align="center" class="STYLE5"><font color="#FFFFFF"> <%=sysuser%> <%=sysname%></font></DIV></TD>
</TR>
 </TBODY>
 </TABLE>   
</body></html>   
<%
else
	nowusername=request.form("username")
	nowpwd=request.form("pwd")
	if Trim(Request.Form("Verifycode"))<>Trim(Session("CheckCode")) then 
		response.write "<script language='javascript'>alert('������ĺ�̨������֤�벻�ԣ����������룡');"
		response.write "history.go(-1);</script>"
		response.end
	end if

	sql="select * from login where username='"&nowusername&"' and pwd='"&md5(nowpwd)&"'"
	set rs=conn.execute(sql)
	if rs.eof then
		conn.execute("insert into rizi(username,class,address) values('"&nowusername&"','��½ʧ��','"&userip&"')")
		response.write "<script language='javascript'>alert('��¼���ơ�������½ѡ�����');"
		response.write "history.go(-1);</script>"
		response.end
	else
		session("loginas")=showadmingrade(rs("usergrade"))
		session("userrealname")=rs("userrealname")
		session("username")=rs("username")
		session("user_id")=rs("id")
		session("iflogin")=rs("usergrade")
		session("statue")=1
		session.Timeout=1000
		
		conn.execute("insert into rizi(username,class,address) values('"&nowusername&"','��½�ɹ�','"&userip&"')")
			
		response.redirect "main.asp"
	end if
	rs.close
end if%>