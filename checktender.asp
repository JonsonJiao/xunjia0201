<!--#include file="conn.asp"-->
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"   
response.charset="gb2312"           

tendername=request("tendername")
Set rs=conn.execute("Select * from [tender] where tendername='"&tendername&"'")
if rs.eof then
    response.write("<img src='images/succ.gif' border='0' width='18' height='18'> <font color='#0000ff'>����Ŀ�ľ�����Ϣ��δ��������</font>")
else
    response.write("<img src='images/err.gif' border='0' width='18' height='18'> <font color='#ff0000'>����Ŀ�ľ�����Ϣ�Ѿ�δ�����������ʵ��</font>")
end if
rs.close
set rs=nothing
conn.close
Set conn=nothing
%>
