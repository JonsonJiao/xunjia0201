<!--#include file="upload_5xsoft.inc"-->
<!--#include file="conn.asp"-->
<!--#include file="const1.asp"-->
<!--#include file="inc/function.asp"-->
<!--#include file="inc/uploadcontrol.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
gourl=""
addstr=""
set upload=new upload_5xsoft
id=upload.form("id")
gotourl=upload.form("gotourl")
companyrealname=upload.form("companyrealname")

actiondetail=upload.form("actiondetail")
havecompanycontract=""
i=0
h=0
if actiondetail="saveedit" then
	if gotourl="admin_company" then
		gourl="?company_class="&upload.form("company_class")&"&company_type="&upload.form("company_type")&"&checkstatue="&upload.form("checkstatue")&"&checkcondition="&upload.form("checkcondition")&"&checkstyle="&upload.form("checkstyle")&"&keyword1="&upload.form("keyword1")&"&page="&upload.form("page")
	end if
	picno=upload.form("picno")
	if picno>=1 then
		for nnn=1 to picno
		if upload.form("havecompanycontract"&nnn)<>"" then
			havecompanycontract=havecompanycontract&upload.form("havecompanycontract"&nnn)&","
			i=i+1
			h=h+1
		end if
		next
	end if
end if

if upload.form("action")="uploadfile" then
	filepath="uploadfile\companycontract\"
	if instr(filepath,"*")>0 or instr(filepath,"?")>0 or instr(filepath,"'")>0 or instr(filepath,chr(34))>0 then
		msg="�Բ���û����д·����·���к��зǷ��ַ�<br><br>"
		HX_GoBack msg,Url
	end if
	if right(filepath,1)<>"\" then
		filepath=filepath&"\"
		filepath=PathReplace(filepath)
	end if
	'response.write filepath
	'response.end
	basepath=server.MapPath(trim(filepath))
	set fso=server.createobject("scripting.filesystemobject")
	if not fso.folderexists(basepath) then
		set fso=nothing
		set upload=nothing
		call HintAndBack("�Բ���Ŀ¼�����ڣ����ȴ�����Ŀ¼��",1)
	end if
	
	for each formName in upload.objFile
		set file=upload.objFile(formName)
		if file.filename<>"" and isnull(file.filename)=false then
			if file.FileSize>uploadlimit*1024*10240 then
				call HintAndBack("�Բ����ļ���С�����Գ���"&uploadlimit&"M��",1)
				exit for
			end if
		end if
		set file=nothing
	next
	
	uploadflag="no"
	for each formName in upload.objFile
		set file=upload.objFile(formName)
		if file.filename<>"" and isnull(file.filename)=false then
		uploadflag="yes"
		exit for
		end if
		set file=nothing
	next
	'response.end
	if uploadflag="no" and actiondetail<>"saveedit" then
		call HintAndBack("��ѡ������ѡ��һ���ϴ����ļ���",1)
		response.end
	end if
		
	allpicstr=""
	for each formName in upload.objFile
		set file=upload.objFile(formName)
		if file.filename<>"" and isnull(file.filename)=false then
			filename=companyrealname&"_"&file.FileName
			filesize=file.FileSize
			fileExt=trim(lcase(filename))
			fileExt=split(fileExt,".")(ubound(split(fileExt,".")))
			uploadsuc=false
			for ii=0 to ubound(Forumupload)
				if fileEXT=trim(Forumupload(ii)) then
					uploadsuc=true
					exit for
					'call HintAndBack("�ļ���ʽ����ȷ,�����ϴ���",1)
				'else
					'uploadsuc=false
				end if
			next
			if uploadsuc=false then
				call HintAndBack("�ļ���ʽ����ȷ,�����ϴ���",1)
			end if
			FileSeverPath = basepath&"\"&FileReplace(filename)
				
			'response.write FileSeverPath
			'response.end
			Set fso = Server.CreateObject("Scripting.FileSystemObject")
			if fso.FileExists(FileSeverPath) then
				'����ȥ����׺��
				nohouzhui=""
				houzhui=""
				if instr(FileReplace(filename),".")>0 then   '����к�׺��
					nohouzhuis=split(FileReplace(filename),".")
					for ii=0 to ubound(nohouzhuis)-1
						nohouzhui=nohouzhui&nohouzhuis(ii)&"."
					next
					nohouzhui=left(nohouzhui,len(nohouzhui)-1)
					houzhui="."&nohouzhuis(ubound(nohouzhuis))
				else
					nohouzhui=filename
				end if
					
				for ii=1 to 99
					filename=nohouzhui&"����"&ii&houzhui
					FileSeverPath = basepath&"\"&FileReplace(filename)
					if not fso.FileExists(FileSeverPath) then
					exit for
					end if
				next
			end if	
			set fso=nothing
			if filesize>0 then
				file.SaveAs FileSeverPath
				'call WS_S.DirFileUpdateEx (prefolder,FileReplace(filename),filesize,now(),nowusername,uploadman,filetype)
				'call writetxt (session("admin_realname")&"��"&session("admin_name")&"��","�ϴ����ļ�",FileSeverPath)
				allpicstr=allpicstr&FileReplace(filename)&","
				i=i+1
			end if
			if ScanFile(FileSeverPath) then
				CheckFile FileSeverPath,True 
				call HintAndBack("�Բ���,���ϴ����ļ��к���ľ�����,���Բ����ϴ���",1)
			end if
		end if
		set file=nothing
	next
	'response.end
	'response.write i
	'response.end
	if i<1 then
		call HintAndBack("�ϴ���ͬ��������1�ݣ�",1)
		response.end
	else
		allpicstr=havecompanycontract&allpicstr
		if allpicstr<>"" and right(allpicstr,1)="," then
			allpicstr=left(allpicstr,len(allpicstr)-1)
			
			set rs=server.createobject("ADODB.RecordSet")
			sql="select * from company where id="&id
			'response.write sql&"--"&allpicstr
			'response.end
			rs.open sql,conn,1,3
			rs("companycontract")=allpicstr
			if rs("regstatue")<=3 then
				rs("regstatue")=3
			end if
			rs.update
			rs.close
		end if
			
		if usercheck=1 then
			addstr="ע��ɹ��������ڿ���ǰ����ҳ��½�ˣ�"
		else
			addstr="ע��ɹ��������ȴ�����Ա��ˡ�\n\n�����Բ�����ϵ�绰��"&syscontactphone&"����ѯ��˽��ȡ�"
		end if
		if actiondetail="saveedit" then
			addstr="�޸ĳɹ���"
		end if
		if gotourl="admin_company" and actiondetail<>"saveedit" then
			addstr="�����ҵ�ɹ����������"
		end if
		call HintAndTurn("��"&i&"���ļ��ϴ��ɹ���"&addstr,gotourl&".asp"&gourl)
	end if
	set upload=nothing
else
	set upload=nothing
	call HintAndBack("�Ƿ�������",1)
end if%>
