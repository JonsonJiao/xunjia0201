<style type="text/css"> 
<!-- 
ul,li{ 
padding:0; 
text-align:left; 
} 
body{ 
font:12px "����"; 
text-align:center; 
} 
a:link{ 
color:#00F; 
text-decoration:none; 
} 
a:visited { 
color: #00F; 
text-decoration:none; 
} 
a:hover { 
color: #c00; 
text-decoration:underline; 
} 
ul{ list-style:none;} 
/*ѡ�1*/ 
#Tab1{ 
width:100%; 
margin:0px; 
padding:0px; 
margin:0 auto;} 
/*ѡ�2*/ 
#Tab2{ 
width:100%; 
margin:0px; 
padding:0px; 
margin:0 auto;} 
/*�˵�class*/ 
.Menubox { 
width:100%; 
background:url(./IMAGES/tab1.gif); 
height:28px; 
line-height:28px; 
} 
.Menubox ul{ 
margin:0px; 
padding:0px; 
} 
.Menubox li{ 
float:left; 
display:block; 
cursor:pointer; 
width:97px; 
text-align:center; 
color:#949694; 
font-weight:bold; 
} 
.Menubox li.hover{ 
padding:0px; 
background:#fff; 
width:97px; 
border-left:1px solid #B1D5A7; 
border-top:1px solid #B1D5A7; 
border-right:1px solid #B1D5A7; 
background:url(./IMAGES/tab2.gif); 
color:#739242; 
font-weight:bold; 
height:27px; 
line-height:27px; 
} 
.Contentbox{ 
clear:both; 
margin-top:0px; 
border:1px solid #B1D5A7; 
border-top:none; 
height:110px; 
text-align:center; 
padding-top:8px; 
line-height:20px;
} 
--> 
</style> 
<script> 
<!-- 
/*��һ����ʽonmouseover �ڶ�����ʽonclick ������ʾ��ʽ,��98~101�и�*/ 
function setTab(name,cursel,n){ 
for(i=1;i<=n;i++){ 
var menu=document.getElementById(name+i); 
var con=document.getElementById("con_"+name+"_"+i); 
menu.className=i==cursel?"hover":""; 
con.style.display=i==cursel?"block":"none"; 
} 
} 
//--> 
</script> 

<div id="Tab1"> 
<div class="Menubox"> 
<ul> 
<li id="two1" onmouseover="setTab('two',1,2)" class="hover">�������</li>
<li id="two2" onmouseover="setTab('two',2,2)" >������</li> 
</ul> 
</div> 
<div class="Contentbox"> 
<div id="con_two_1" style="width: 100%;" align="left"><script src="admin_tender_add.asp"></script></div>
<div id="con_two_2" style="width: 100%;display:none"><script src="news.asp?typeid=11&shu=5&time=1&title=100"></script></div>
</div> 
</div> 
