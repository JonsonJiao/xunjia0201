<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-99=0 then
call WhereTable("identity.png","��������")

Dim ZC_DATABASE_PATH
'���ݿ�·��
ZC_DATABASE_PATH="shujuku/#jingbiaodata#.mdb"

data_array= Split(ZC_DATABASE_PATH,"/")

Dim action
action=trim(request("action"))
Dim dbpath,bkfolder,bkdbname,fso,fso1

Select Case action
Case ""
Call chushihua()
Case "CompressData" 'ѹ������
Dim tmprs
dim allarticle
dim Maxid
dim topic,username,dateandtime,body
call CompressData()
case "BackupData" '��������
if request("act")="Backup" Then
call updata()
else
call BackupData()
end If
case "RestoreData" '��ԭ����
dim backpath
if request("act")="Restore" Then
Dbpath=request.form("Dbpath")
backpath=request.form("backpath")
if dbpath="" Then
response.write "Please input your database whole Name" 
else
Dbpath=server.mappath(Dbpath)
end If
backpath=server.mappath(backpath)

Set Fso=server.CreateObject("scripting.filesystemobject")
if fso.fileexists(dbpath) Then 
fso.copyfile Dbpath,Backpath
response.write "���ݿ⻹ԭ�ɹ���<br><br><a href=""data_s.asp"">����</a>"
  
else
response.write "û���ҵ�����������ݿ⣡" 
response.write "<br>����·��������ȷ�Ϻ��������룡<br><br><a href=""data_s.asp"">����</a>"
end If
else
call RestoreData()
end If
Case "SpaceSize" 'ϵͳ�ռ�ռ��
call SpaceSize()
Case "deletebackup"
Dim dbname
dbpath=Request.QueryString("dbpath")
dbname=Request.QueryString("dbname")
dbpath=Server.MapPath(dbpath)
dbpath=dbpath &"\"&dbname
set fso = CreateObject("Scripting.FileSystemObject")
If fso.FileExists(dbPath) Then
fso.DeleteFile(DBPath)
Set fso = nothing
response.write "<br>�����ݵ����ݿ��Ѿ�" & dbpath &"���ɹ�ɾ��<br><br><a href=""data_s.asp"">����</a>"
Else
response.write dbpath 
response.write "<br>����·��������ȷ�Ϻ��������룡<br><br><a href=""data_s.asp"">����</a>"
End If
Case Else
End Select

%>
</div>
<%

Sub chushihua()
%>
<div align=center>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td height="25" colspan="4">��������</td>
</tr>
<form id="edit">
<tr height="25" align="center" class="grid_odd">
	<td><a href="?action=CompressData"><b>[ѹ�����ݿ�]</b></a></td>
	<td><a href="?action=BackupData"><b>[�������ݿ�]</b></a></td>
	<td><a href="?action=RestoreData"><b>[��ԭ���ݿ�]</b></a></td>
	<td><a href="?action=SpaceSize"><b>[ϵͳռ�ÿռ�]</b></a></td>
</tr>
</form>
</table>
</div>
<%end sub%>

<%
'====================ϵͳ�ռ�ռ��=======================
Sub SpaceSize()
On Error Resume Next
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td height="25" colspan="4">ϵͳ�ռ�쿴</td>
</tr>
<form id="edit">
<tr height="25" align="center" class="grid_odd">
	<td><b>���ݿ⣺<%showSpaceinfo("../"&data_array(1)&"")%></b></td>
</tr>
<tr height="25" align="center" class="grid_odd">
	<td><b>�������ݿ⣺<%showSpaceinfo("databackup")%></b></td>
</tr>
<tr height="25" align="center" class="grid_odd">
	<td><b>ϵͳ���ƣ�<%showSpaceinfo("/")%></b></td>
</tr>
<tr height="25" align="center" class="grid_odd">
	<td><input class='form_submit' type="button" name="back" value=" ���� " onClick="window.location.href='data_s.asp'"></td>
</tr>
</form>
</table>
<%
End Sub

Sub ShowSpaceInfo(drvpath)
dim fso,d,size,showsize
set fso=server.CreateObject("scripting.filesystemobject") 
drvpath=server.mappath(drvpath) 
set d=fso.getfolder(drvpath) 
size=d.size
showsize=size & " Byte" 
if size>1024 Then
size=(Size/1024)
showsize=size & " KB"
end If
if size>1024 Then
size=(size/1024)
showsize=formatnumber(size,2) & " MB" 
end If
if size>1024 Then
size=(size/1024)
showsize=formatnumber(size,2) & " GB" 
end If 
response.write "<font face=verdana>" & showsize & "</font>"
End Sub 

Sub RestoreData()
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td height="25" colspan="4">��ԭ���ݿ�</td>
</tr>
<form id="edit" method="post" action="?action=RestoreData&act=Restore">
<tr height="25" class="grid_odd">
	<td width="50%" align="right"><b>��ԭ��·�������·������</b></td>
	<td width="50%" align="left"><input type="text" size="30" name="DBpath" value="DataBackup\<%=replace(Date(),"/","-")%>_Bak.mdb"></td>
</tr>
<tr height="25" class="grid_odd">
	<td align="right"><b>��ԭ���·�������·������</b></td>
	<td align="left"><input type="text" size="30" name="backpath" value="<%=ZC_DATABASE_PATH%>"></td>
</tr>
<tr height="25" class="grid_odd" align="center">
	<td colspan="2"><input type="submit" value="��ʼ��ԭ" class="form_button"></td>
</tr>
<tr height="25" align="center" class="grid_odd">
	<td colspan="2"><input class='form_submit' type="button" name="back" value=" ���� " onClick="window.location.href='data_s.asp'"></td>
</tr>
</form>
</table>
<%
End Sub

Sub updata()
Dbpath=request.form("Dbpath")
Dbpath=server.mappath(Dbpath)
bkfolder=request.form("bkfolder")
bkdbname=request.form("bkdbname")
Set Fso=server.CreateObject("scripting.filesystemobject")
if fso.fileexists(dbpath) Then
	If CheckDir(bkfolder) = True Then
		fso.copyfile dbpath,bkfolder& "\"& bkdbname
	else
		MakeNewsDir bkfolder
		fso.copyfile dbpath,bkfolder& "\"& bkdbname
	end If
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td height="25" colspan="4">�������ݿ�</td>
</tr>
<tr height="25" class="grid_odd">
	<td width="50%" align="center"><b>�Ѿ��ɹ����ݣ��������ݿ�·����<%=bkfolder%>\<%=bkdbname%></b></td>
</tr>
<%response.write "<tr height='25' class='grid_odd'>"
response.write "<td align='center'><b>"
response.write "����˴��������ݿ⣺<font color=red><a href="""& ZC_BLOG_HOST & request.form("bkfolder") & "/" & bkdbname &""">" & ZC_BLOG_HOST & request.form("bkfolder") & "/" & bkdbname
response.write "</font></td></tr>"
response.write "<tr height='25' class='grid_odd'>"
response.write "<td align='center'><b>"
response.write "<a href=""data_s.asp?action=deletebackup&dbpath="&request.form("bkfolder") &"&dbname=" & bkdbname &""">����������Ϻ�ɵ���˴�ɾ���������ݿ⣡</a>"
response.write "</td></tr>"
response.write "<tr height='25' class='grid_odd'>"
response.write "<td align='center'><b>"
response.write "<input class='form_submit' type='button' name='back' value=' ���� ' onClick='window.location.href=""data_s.asp"";'></td></tr>"
%>
</table>
<%Else
	response.write "Error ,�Ҳ����ļ�<br>"
End If
Set fso = nothing
End Sub
'------------------���ĳһĿ¼�Ƿ����-------------------
Function CheckDir(FolderPath)
folderpath=Server.MapPath(".")&"\"&folderpath
Set fso1 = CreateObject("Scripting.FileSystemObject")
If fso1.FolderExists(FolderPath) Then
'����
CheckDir = True
Else
'������
CheckDir = False
End If
Set fso1 = nothing
End Function
'-------------����ָ����������Ŀ¼-----------------------
Function MakeNewsDir(foldername)
dim f
Set fso1 = CreateObject("Scripting.FileSystemObject")
Set f = fso1.CreateFolder(foldername)
MakeNewsDir = True
Set fso1 = nothing
End Function
Sub BackupData()
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td height="25" colspan="4">�������ݿ�</td>
</tr>
<form id="edit" method="post" action="?action=BackupData&act=Backup">
<tr height="25" class="grid_odd">
	<td width="50%" align="right"><b>��ǰ���ݿ�·�������·������</b></td>
	<td width="50%" align="left"><input type="text" size="15" name="DBpath" value="<%=ZC_DATABASE_PATH%>"></td>
</tr>
<tr height="25" class="grid_odd">
	<td align="right"><b>�������ݿ�·�������·������</b></td>
	<td align="left"><input type="text" size="15" name="bkfolder" value="Databackup">��Ŀ¼�������ڣ�ϵͳ���Զ�����</td>
</tr>
<tr height="25" class="grid_odd">
	<td align="right"><b>���ݺ����ݿ�����</b></td>
	<td align="left"><input type="text" size="20" name="bkDBname" value="<%=replace(Date(),"/","-")%>_bak.mdb">�������Զ�����</td>
</tr>
<tr height="25" class="grid_odd">
	<td align="center" colspan="2"><b>��������ļ������ڽ�������������ڽ�����</b></td>
</tr>
<tr height="25" class="grid_odd">
	<td align="center" colspan="2"><input type="submit" value="��ʼ����" class="form_button"></td>
</tr>
<tr height="25" align="center" class="grid_odd">
	<td colspan="2"><input class='form_submit' type="button" name="back" value=" ���� " onClick="window.location.href='data_s.asp'"></td>
</tr>
</form>
</table>
<%
End Sub

Sub CompressData()
%>
<table class='list_table' width='100%' cellpadding='0' cellspacing='1' border='0'>
<tr class='grid_header'>
	<td height="25" colspan="4">ѹ�����ݿ�</td>
</tr>
<form id="edit" action="?action=CompressData" method="post">
<tr height="25" class="grid_odd">
	<td width="50%" align="right"><b>ѹ�����ݿ��·����</b></td>
	<td width="50%" align="left"><input type="text" name="dbpath" value="<%=ZC_DATABASE_PATH%>"></td>
</tr>
<tr height="25" class="grid_odd">
	<td align="center" colspan="2"><input type="submit" value="��ʼѹ��" class="form_button"></td>
</tr>
<tr height="25" align="center" class="grid_odd">
	<td colspan="2"><input class='form_submit' type="button" name="back" value=" ���� " onClick="window.location.href='data_s.asp'"></td>
</tr>
</form>
</table>
<%
Dim dbpath,boolIs97
dbpath = request("dbpath")
boolIs97 = request("boolIs97")

If dbpath <> "" Then
dbpath = server.mappath(dbpath)
response.write(CompactDB(dbpath,boolIs97))
End If

End Sub

'=====================ѹ������=========================
Function CompactDB(dbPath, boolIs97)
Dim fso, Engine, strDBPath,JET_3X
strDBPath = Left(dbPath,InStrRev(DBPath,"\"))
'response.write strDBPath
'response.end
Set fso = CreateObject("Scripting.FileSystemObject")

If fso.FileExists(dbPath) Then
fso.CopyFile dbpath,strDBPath & "temp.mdb"
Set Engine = CreateObject("JRO.JetEngine")

If boolIs97 = "True" Then
Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb;User ID=admin;Password=;Jet OLEDB:Database Password=;", _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;User ID=admin;Password=;Jet OLEDB:Database Password=;" _
& "Jet OLEDB:Engine Type=" & JET_3X
Else
Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb;User ID=admin;Password=;Jet OLEDB:Database Password=;", _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp1.mdb;User ID=admin;Password=;Jet OLEDB:Database Password=;"
End If

fso.CopyFile strDBPath & "temp1.mdb",dbpath
fso.DeleteFile(strDBPath & "temp.mdb")
fso.DeleteFile(strDBPath & "temp1.mdb")
Set fso = nothing
Set Engine = nothing

CompactDB = "�������ݿ�" & dbpath & "�Ѿ��ɹ���ѹ����" & vbCrLf

  
Else
CompactDB = "<br>�������·��������ȷ�Ϻ��������룡" & vbCrLf
End If

End Function

'////////////////////end////////////////////////

else
response.redirect "erro.asp"
response.end
end if%>