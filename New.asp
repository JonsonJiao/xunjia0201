<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-99=0 then
call WhereTable("todo.png","ϵͳ��ʼ��")
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
<tr>
	<td class="grid_header" colspan="4"><strong>ϵͳ��ʼ��ȷ��</strong></td>
</tr>
<form action="New_submit.asp" method="post">
<tr>
	<td align="center" class="list_required">
		<strong>��   �棡</strong><br><br>
		<strong>��ʼ��һ����ϵͳ��һ�ΰ�װʱ���У�</strong><br>
		<strong>��ϵͳ���������ڼ��ʼ�������ܶ�ʧ���ݡ�</strong><br><br>
ϵͳ������ʼ������ɾ�����ݿ��е�������Ϣ�����Իᱣ�����ݿ�ṹ��ȷ��Ҫ��ϵͳ��<font color=red>��ȫ��ʼ��</font>�������밴��ȷ�����������밴��ȡ������
	</td>
</tr>
<tr>
	<td width="100%" align="center" class="list_command"> 
		<input type="hidden" name="action" value='del1'>
		<input type="submit" class='form_submit' value="ȷ��" name="alert_button">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class='form_submit' value="ȡ��" name="cancel" onClick="javascript:history.go(-1)">
	</td>
</tr>
</form>
</table>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
<tr>
	<td colspan="4">&nbsp;</td>
</tr>
</table>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0' style="word-break: break-all;">
<form action="New_submit.asp" method="post">
<tr>
	<td class="grid_header" colspan="4"><strong>��Ҳ����ѡ��<font color=red>������ʼ��</font>ϵͳ�Ĳ���</strong></td>
</tr>
<tr align="center">
	<td width="25%" class="list_required"><input type="checkbox" class='form_textbox_normal' value="gonggao" name="selectdel">ϵͳ����</td>
	<td width="25%" class="list_required"><input type="checkbox" class='form_textbox_normal' value="yijian" name="selectdel">�������</td>
	<td width="25%" class="list_required"><input type="checkbox" class='form_textbox_normal' value="rizi" name="selectdel">ϵͳ��־</td>
	<td width="25%" class="list_required"><input type="checkbox" class='form_textbox_normal' value="companygrade" name="selectdel">���ʼ���</td>
</tr>
<tr align="center">
	<td class="list_required"><input type="checkbox" class='form_textbox_normal' value="companytype" name="selectdel">��˾����</td>
	<td class="list_required"><input type="checkbox" class='form_textbox_normal' value="company" name="selectdel">�� Ӧ ��</td>
	<td class="list_required"><input type="checkbox" class='form_textbox_normal' value="tender" name="selectdel">������Ϣ</td>
	<td class="list_required"><input type="checkbox" class='form_textbox_normal' value="competitive" name="selectdel">��������</td>
</tr>
<tr>
<td colspan="4"  height="25" align="center" class="list_command">
	<input type="hidden" name="action" value='del2'>
	<input type="checkbox" name="chkall" class='form_textbox_normal' value="on" onclick="CheckAll(this.form)">ȫѡ&nbsp;&nbsp;
	<input type="submit" name="action1" class='form_submit' onclick="{if(confirm('��ʼ��ѡ������Ŀ��')){this.document.check;return true;}return false;}" value="��ʼ��">
</td>
</tr>
</form>
</table>
<%else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->