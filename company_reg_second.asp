<!--#include file="Index_top_nologin.asp" -->
<title><%=sysname%> - ��ҵע��ڶ���</title>
<!--#include file="inc/Md5.asp" -->
<%
call WhereTable("identity.png","��ҵע��ڶ������Ķ�ע����֪")
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all">
<form name='form'>
<tr>
	<td class="list_required"><%=shouldknow%></td>
</tr>
<tr>
	<td class="list_command" align="center"><input class='form_submit' type='button' name='cmd' id='cmd' value=' ��ͬ�� ' onClick="window.location.href='company_reg_third.asp'">
	&nbsp;&nbsp;&nbsp;&nbsp;<input class='form_submit' type="button" name="back" value=" ���� " onClick="history.go(-1);"></td>
</tr>
</form>
</table>
<!--#include file="Index_bottom.asp" -->