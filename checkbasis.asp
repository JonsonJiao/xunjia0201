<!--#include file="conn.asp"-->
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"   
response.charset="gb2312"           

basis=request("basis")
Set rs=conn.execute("Select * from [tender] where basis='"&basis&"'")
if not rs.eof then
    response.write("<img src='images/err.gif' border='0' width='18' height='18'> <font color='#ff0000'>�ɹ����� "&basis&" �ľ�����Ϣ�Ѿ�δ�����������ʵ��</font>")
else
    response.write("<img src='images/succ.gif' border='0' width='18' height='18'> <font color='#0000ff'>�òɹ����ݵľ�����Ϣ��δ��������</font>")
end if
rs.close
set rs=nothing
conn.close
Set conn=nothing
%>
