<!--#include file="conn.asp" -->
<!--#include file="const1.asp" -->
<!--#include file="Inc/Function.asp" -->
<%call tendergotorightstatue

'response.write session("user_id")
'response.end%>
<html>
<head>
<LINK REL=STYLESHEET TYPE="text/css" HREF="css/menu.css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
p {font-family: "Arial, Helvetica, sans-serif"; font-size: 11pt}
td {font-family: "Arial, Helvetica, sans-serif"; font-size: 11pt ; line-height:normal; }
A{font-family: "Arial, Helvetica, sans-serif";text-transform: none; text-decoration: none; font-size: 11pt}
select{font-family: "Arial, Helvetica, sans-serif";font-size: 11pt;}
input{font-family: "Arial, Helvetica, sans-serif";font-size: 11pt;}
a:hover {font-family: "Arial, Helvetica, sans-serif";text-decoration:underline; color: #FFFFFF; font-size: 11pt}
body {font-family: "Arial, Helvetica, sans-serif";font-size: 11pt}
div {font-family: "Arial, Helvetica, sans-serif"; font-size: 11pt}
-->
</style>
<title>ѡ��</title>
<base target="main">
</head>
<body ID="Body" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onSelectStart='return false;' bgcolor="#CCCCCC">
<script language="JavaScript1.2" src="js/menu.js"></script>
<script>
document.oncontextmenu=new Function("event.returnValue=false;"); //��ֹ�Ҽ�����,�����Ҽ������κη�Ӧ 

var aData = new Array (0);
gsBodyId = "Body";
gsWorkFrame = "main";
gsIcon_Path = "images/";
gsIcon_Open = "images/dir_open.png";
gsIcon_Close = "images/dir_close.png";
<%
dim menuI
menuI = -1

if session("iflogin")=0 and session("statue")=1 then
%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"����","menu_gonggao","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�鿴����","gonggao.asp","filenew.png");

aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"������Ϣ","menu_addmubiao","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�Ƽ�����<%=getcompanycompetitiveinfo(session("user_id"),1)%>","tender_recommend.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"���ھ���<%=getcompanycompetitiveinfo(session("user_id"),2)%>","tender_doing.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��δ�б�<%=getcompanycompetitiveinfo(session("user_id"),3)%>","tender_did.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�б���Ŀ<%=getcompanycompetitiveinfo(session("user_id"),4)%>","tender_get.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��������<%=getcompanycompetitiveinfo(session("user_id"),5)%>","tender_future.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�ҵ��ղ�<%=getcompanycompetitiveinfo(session("user_id"),6)%>","tender_mycollection.asp","filenew.png");

aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"������Ϣ","menu_userinfo","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�鿴����","company_main_less.asp?id=<%=session("user_id")%>","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�޸�����","changepassword.asp","filenew.png");
<%
elseif session("iflogin")=0 and session("statue")=0 then
%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"����","menu_gonggao","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�鿴����","gonggao.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"������Ϣ","menu_userinfo","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�鿴����","company_main_less.asp?id=<%=session("user_id")%>","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�޸�����","company_edit_first.asp","filenew.png");
<%
elseif session("iflogin")>0 then
	if session("iflogin")-1=0 or session("iflogin")-3=0 or session("iflogin")-99=0 then
%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"���۹���","menu_checkmubiao","filenew.png");
		<%if session("iflogin")-1=0 or session("iflogin")-99=0 then%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��������","admin_tender_add.asp","filenew.png");
		<%end if%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"���о���","admin_tender_check.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��δ��ʼ<%=getallcompetitiveinfo(1)%>","admin_tender_future.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"���ھ���<%=getallcompetitiveinfo(2)%>","admin_tender_doing.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�ȴ�����<%=getallcompetitiveinfo(3)%>","admin_tender_decide.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��ɾ���<%=getallcompetitiveinfo(4)%>","admin_tender_did.asp","filenew.png");

aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"�������","menu_checkaoping","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"������Ŀ<%=getallcompetitiveinfo(5)%>","admin_tender_float.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"ɾ������<%=getallcompetitiveinfo(6)%>","admin_tender_float_del.asp","filenew.png");

aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"ͳ�Ʒ���","menu_checkaoping","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��������ͼ","admin_zhexian_year.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�������ͼ","admin_zhexian_money.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"������״ͼ","admin_bing_year.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"����״ͼ","admin_bing_money.asp","filenew.png");
	<%end if%>

aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"������Ϣ","menu_userinfo","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�������","changepassword.asp","filenew.png");
	<%if session("iflogin")-99=0 then%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"��������","menu_userinfo","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��ҵ����","admin_companytype.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"���ʼ���","admin_companygrade.asp","filenew.png");
	<%end if
	if session("iflogin")-1=0 or session("iflogin")-2=0 or session("iflogin")-3=0 or session("iflogin")-99=0 then%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (1,"ϵͳ����","menu_checkmubiao","filenew.png");
		<%if session("iflogin")-99=0 then%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"ϵͳ����","admin_config.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"ע���ʽ","admin_fileprepare.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"ע����֪","admin_shouldknow.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�������","admin_gonggao.asp","filenew.png");
		<%end if%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��Ӧ�̹���","admin_company.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��Ӧ�����","admin_company_shen.asp","filenew.png");
		<%if session("iflogin")-99=0 then%>
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�� �� Ա","admin_login.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�������","admin_yijian.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��־����","admin_rizi.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"��������","data_s.asp","filenew.png");
aData [<%menuI=menuI+1:response.write(menuI)%>] = new Array (2,"�� ʼ ��","new.asp","filenew.png");
		<%end if
	end if
end if
%>
CreateMenu (aData);
document.body.onload = ResetWidth;
document.body.onresize = ResetWidth;
window.onresize = ResetWidth;
</script>
</body>
</html>