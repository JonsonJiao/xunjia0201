<!--#include file="conn.asp"-->
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "No-Cache"   
response.charset="gb2312"           

companyname=request("companyname")
Set rs=conn.execute("Select * from [company] where companyname='"&companyname&"'")
if not rs.eof then
    response.write("<img src='images/err.gif' border='0' width='18' height='18'> <font color='#ff0000'>�õ�¼�û����Ѿ�ע�ᣬ�����ظ�ע�ᣡ</font>")
else
    response.write("<img src='images/succ.gif' border='0' width='18' height='18'> <font color='#0000ff'>�õ�¼�û�����δע�ᣬ�������</font>")
end if
rs.close
set rs=nothing
conn.close
Set conn=nothing
%>
