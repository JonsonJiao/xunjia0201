<%nowneedtime1=request("needtime1")
nowneedtime2=request("needtime2")
nowneedtime3=request("needtime3")
nowneedtime4=request("needtime4")
nowstart_date=request("start_date") 
nowstart_date=request("start_date") 
if nowstart_date="" then
  nowstart_date=date()-day(date()-1)
end if
nowend_date=request("end_date") 
if nowend_date="" then
  nowend_date=date()
end if

call warnifdate(nowstart_date,"��ʼʱ��")
call warnifdate(nowend_date,"����ʱ��")

nowtender_class = request("tender_class")
nowcheckgrade = request("checkgrade")
nowcheckstyle = request("checkstyle")
nowcheckcondition = request("checkcondition")
nowcheckstatue = request("checkstatue")
nowkeyword1 = RemoveHTML(ReplaceQM(request("keyword1")))

gourl="needtime1="&nowneedtime1&"&needtime2="&nowneedtime2&"&needtime3="&nowneedtime3&"&needtime4="&nowneedtime4&"&start_date="&nowstart_date&"&end_date="&nowend_date&"&tender_class="&nowtender_class&"&checkstyle="&nowcheckstyle&"&checkgrade="&nowcheckgrade&"&checkcondition="&nowcheckcondition&"&checkstatue="&nowcheckstatue&"&keyword1="&nowkeyword1&""%>
<table class='grid_search' cellpadding='0' cellspacing='1' border='0'>
<form name="form2">
<tr class='grid_header'>
	<td>ʱ��ѡ��</td>
	<td>��ѯ����</td>
	<td>�ؼ���</td>
	<td>��ѯ</td>
	<td>���</td>
</tr>
<tr class="grid_odd" align="center">
	<td class="grid_cell">
	��ʼ����<input type="checkbox" name="needtime1" value="yes"<%if nowneedtime1="yes" then%> checked<%end if%>>
	��ֹ����<input type="checkbox" name="needtime2" value="yes"<%if nowneedtime2="yes" then%> checked<%end if%>>
	��������<input type="checkbox" name="needtime3" value="yes"<%if nowneedtime3="yes" then%> checked<%end if%>>
	��������<input type="checkbox" name="needtime4" value="yes"<%if nowneedtime4="yes" then%> checked<%end if%>>
	<input name="start_date" value="<%=nowstart_date%>" onFocus="calendar()" style="width:100px">
	��
	<input name="end_date" value="<%=nowend_date%>" onFocus="calendar()" style="width:100px">
	</td>
	<td class="grid_cell">
	<select name="checkcondition" class='form_combo_normal' onChange="form2.submit();">
	<option value="">��ѯ����</option>
	<option value="1"<%if nowcheckcondition="1" then%> selected="selected"<%end if%>>����Ŀ����</option>
	<option value="2"<%if nowcheckcondition="2" then%> selected="selected"<%end if%>>�����۱��</option>
	<option value="3"<%if nowcheckcondition="3" then%> selected="selected"<%end if%>>���ɹ�����</option>
	<option value="4"<%if nowcheckcondition="4" then%> selected="selected"<%end if%>>������˵��</option>
	<option value="5"<%if nowcheckcondition="5" then%> selected="selected"<%end if%>>����������</option>
	<option value="6"<%if nowcheckcondition="6" then%> selected="selected"<%end if%>>��������</option>
	</select>
	<select name="checkstyle" class='form_combo_normal' onChange="form2.submit();">
	<option value="mohu"<%if nowcheckstyle="mohu" then%> selected="selected"<%end if%>>ģ��</option>
	<option value="jing"<%if nowcheckstyle="jing" then%> selected="selected"<%end if%>>��ȷ</option>
	</select></td>
	<td class="grid_cell"><input type='text' class='form_textbox_normal' name='keyword1' value='<%=nowkeyword1%>' size='15' ></td>
	<td class="grid_cell"><input type='submit' value='��ѯ' class='form_button'></td>
	<td class="grid_cell"><input type='button' value='���' class='form_button' onClick="window.location.href='?'"></td>
</tr>
</form>
</table>