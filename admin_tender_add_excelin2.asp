<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-1=0 or session("iflogin")-99=0 then
call WhereTable("gnome-ccdesktop.png","���뾺����Ϣ�ڶ���������������Ϣ")%>

<script language="JavaScript" type="text/JavaScript">
function chk()
{
  if (document.form1.ExName.value=="")
  {
    alert("Excel�ļ����Ʋ���Ϊ�գ�");
    document.form1.ExName.focus();
    return false;
  }
      if (document.form1.ExTname.value=="")
  {
    alert("Excel���ݱ��ļ����Ʋ���Ϊ�գ�");
    document.form1.ExTname.focus();
    return false;
  }
}
</script>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td colspan="4">����˵��</td>
</tr>
<tr class="grid_odd">
	<td colspan="4">
	<b>��������ע������</b><p>
	1:������Ӧ�����ϵͳ���������á��и��������Ļ������ù�����<p>
	2:�������ϵͳ���ݿ����Ѿ��в������ݣ���������<a href="data_s.asp?action=BackupData"><font color="#FF0000">�������ݿ�</font></a>��<p>
	3:��ȷ�������Excel�ļ������ֶ��뵼�����ݿ���ֶ���ͬ��<p>
	4:��ȷ�������Excel�ļ��ı�����ȷ �� Sheet1��Ĭ�ϣ���<p>
	5:�����ϸ���ģ��ĸ�ʽ�������������Excel�������ģ�壺<a href="mother.xls" target="_blank"><font color="#FF0000">����</font></a><p>
	6:����в����ף�������Ҫ���Ե��빦�ܣ������ط���Excelģ�壬�˽�������ȷ��д�������Excel��<a href="example.xls" target="_blank"><font color="#FF0000">����</font></a><p>
	<b>�������ݲ�������</b><p>
	1:����������ѡ�д������Excel��Ȼ�������ϴ�����<p>
	2:��ʾ"Excel file uploads successful!"�󣬵�����������ݡ���ѡ�С��������ݿ���������Ϣ�����԰����ݿ������е����ݸ��³ɵ����Excel�������Ϣ��<p>
	</td>
</tr>
		
<form method="post" action="upfilepro.asp" name="form2">
<tr>
	<td width="15%" height="29" align="center" class="list_header_required"><strong>��һ��</strong></td>
	<td align="left" width="30%" class="list_required">&nbsp;�ϴ���Ҫ�����Excel����</td>
	<td colspan="2" align="left" class="list_required">
	<IFRAME src="upfilepro.asp" frameBorder=0 width="100%" height="29" scrolling=no align="top"></IFRAME>
	</td>
</tr>
</form>
<form name="form1" method="post" action="admin_tender_add_excelsave.asp" onSubmit="return chk(this)">
<input type="hidden" name="djh" id="djh" value="<%=request("djh")%>">
<tr>
	<td rowspan="2" align="center" class="list_header_required"><strong>�ڶ���</strong></td>
	<td height="29" class="list_required">&nbsp;Excel����</td>
	<td width="30%" class="list_required">&nbsp;��Ҫ�����Excel���ݱ��� (��:Sheet1)</td>
	<td rowspan="2" class="list_command" >&nbsp;<input type="submit" value="��������" class='form_submit'></td>
</tr>
<tr>
	<td height="29" class="list_required">&nbsp;<input type="text" name="ExName" id="ExName" value="" style="width:200px;" class='form_textbox_normal'></td>
	<td class="list_required">&nbsp;<input type="text" name="ExTname" id="ExTname" value="Sheet1" style="width:200px;" class='form_textbox_normal'></td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->