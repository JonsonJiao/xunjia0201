<!--#include file="Index_top.asp" -->
<%
if session("iflogin")-99=0 then
if (request.form("action")="del2") then
	if request.form("selectdel")<>"" then
		For i = 1 To Request.Form("selectdel").Count
			SelectTable=Request.Form("selectdel")(i)
			select case SelectTable
			'��ʼ�������
			case "gonggao" conn.execute "delete from gonggao"
			'��ʼ��������
			case "yijian" conn.execute "delete from yijian"
			'��ʼ��������
			case "rizi" conn.execute "delete from rizi"
			'��ʼ��С����
			case "companygrade" conn.execute "delete from companygrade"
			'��ʼ��ר���
			case "companytype" conn.execute "delete from companytype"
			'��ʼ�����±�
			case "company"
			set rs2=conn.execute("select * from company")
			if not rs2.eof then
				do while not rs2.EOF
				companyfile=rs2("companyfile")
				companycontract=rs2("companycontract")
				
				if companyfile<>"" then
					companyfiles=split(companyfile,",")
					for ii=0 to ubound(companyfiles)
						Set fso=Server.CreateObject("Scripting.FileSystemObject")
						If fso.FileExists(Server.Mappath("Uploadfile/companyfile/"&companyfiles(ii)))=true Then
							fso.DeleteFile Server.Mappath("Uploadfile/companyfile/"&companyfiles(ii))
						End If
						Set fso=Nothing
					next
				end if
				
				if companycontract<>"" then
					companycontracts=split(companycontract,",")
					for ii=0 to ubound(companycontracts)
						Set fso=Server.CreateObject("Scripting.FileSystemObject")
						If fso.FileExists(Server.Mappath("Uploadfile/companycontract/"&companycontracts(ii)))=true Then
							fso.DeleteFile Server.Mappath("Uploadfile/companycontract/"&companycontracts(ii))
						End If
						Set fso=Nothing
					next
				end if
				rs2.movenext
				loop
			end if
			rs2.close
			set rs2=nothing
			
			conn.execute "delete from company"
			'��ʼ����ʱ��
			case "tender" conn.execute "delete from tender"
			'��ʼ���ϴ���ʱ��
			case "competitive" conn.execute "delete from competitive"
			end select
		Next
				
		call HintAndTurn("�������ɾ���ɹ���","New.asp")
		response.end
	end if
end if

if (request.form("action")="del1") then
	conn.execute "delete from gonggao"
	conn.execute "delete from yijian"
	conn.execute "delete from rizi"
	conn.execute "delete from companygrade"
	conn.execute "delete from companytype"
			
	set rs2=conn.execute("select * from company")
	if not rs2.eof then
		do while not rs2.EOF
		companyfile=rs2("companyfile")
		companycontract=rs2("companycontract")
				
		if companyfile<>"" then
			companyfiles=split(companyfile,",")
			for ii=0 to ubound(companyfiles)
				Set fso=Server.CreateObject("Scripting.FileSystemObject")
				If fso.FileExists(Server.Mappath("uploadfile/companyfile/"&companyfiles(ii)))=true Then
					fso.DeleteFile Server.Mappath("uploadfile/companyfile/"&companyfiles(ii))
				End If
				Set fso=Nothing
			next
		end if
				
		if companycontract<>"" then
			companycontracts=split(companycontract,",")
			for ii=0 to ubound(companycontracts)
				Set fso=Server.CreateObject("Scripting.FileSystemObject")
				If fso.FileExists(Server.Mappath("uploadfile/companycontract/"&companycontracts(ii)))=true Then
					fso.DeleteFile Server.Mappath("uploadfile/companycontract/"&companycontracts(ii))
				End If
				Set fso=Nothing
			next
		end if
		rs2.movenext
		loop
	end if
	rs2.close
	set rs2=nothing
			
	conn.execute "delete from company"
	conn.execute "delete from tender"
	conn.execute "delete from competitive"
				
	call HintAndTurn("��������ɾ���ɹ���","New.asp")
	response.end
end if

else
response.redirect "erro.asp"
response.end
end if%>
<!--#include file="Index_bottom.asp" -->