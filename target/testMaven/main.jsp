<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8">

    <title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/echarts/china.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/chinaMap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/echarts/vintage.js"></script>
    <link href="${pageContext.request.contextPath}/article/wangEditor.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/article/wangEditor.min.js"></script>
    <script type="text/javascript" src="https://www.echartsjs.com/gallery/vendors/echarts/map/js/china.js?_v_=1548453451319"></script> 
    <script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
    
</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px">
        持名法州后台管理系统
    </div>
    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">
        欢迎您:${sessionScope.loginAdmin.name} &nbsp;
        <a id="modifyAdmin" href="#" class="easyui-linkbutton"
                   data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;
        <a	id="signout"
            href=""
            class="easyui-linkbutton"
            data-options="iconCls:'icon-01'"
            onclick="signout()"
            >退出系统</a>
    </div>
</div>
<div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">

</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true">

    </div>
</div>
<div data-options="region:'center'">
    <div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',"
             style="background-image:url(./img/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
    </div>
</div>
<a id="snd" class="easyui-linkbutton" data-options="text:''"></a>

<div id="dial"></div>




</body>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/menu/findFirst",
            dataType: 'json',
            success: function (ms) {
            
				            	/* 遍历处理data，可以是数组、DOM、json等，取决于直接给定或者ajax返回的类型
								function (index, value)中index是当前元素的位置，value是值。 */
                $.each(ms, function (i, obj) {
                    var con = "";
                    $.ajax({
                        url: '${pageContext.request.contextPath}/menu/findSecond',
                        dataType: 'json',
                        data: {code: ms[i].id},
                        success: function (mus) {
                            $.each(mus, function (index, menu) {
                            	//循环遍历覆盖了之前的值，所以需要+=
                                con += "<a class=\"easyui-linkbutton\" onClick=\"addTab(this,'" + menu.href + "')\" data-options=\"width:200,plain:true,text:'" + menu.title + "'\"></a><br/>"
			      	// console.log(con)
                            });
                            
                            $("#aa").accordion('add', {
                                title: obj.title,
                                content: con,
                                iconCls: obj.iconCls
                            })
                            $.parser.parse($('#aa').parent());
                        }
                    })
                })

            }
        })
        // 注册accordion的单击事件

    })

    function addTab(dom, url) {
        var title = $(dom).text();
        // console.log(title);
        /* console.log(url) */
        // 判断指定title的tab栏是否存在，
        var isExists = $("#tt").tabs("exists", dom.title);
        if (!isExists) {
            $("#tt").tabs("add", {
                title: title,
                selected: true,
                closable: true,
                href: "${pageContext.request.contextPath}/" + url,
            })
        } else {
            $("#tt").tabs("select", dom.title);
        }
    }
    
    
 //=====================================================================================================
 
 			$("#modifyAdmin").bind("click",function() {
				
					$("#dial").dialog({
							title : '修改管理员密码',
							width : 400,
							height : 250,
							closed : false,
							cache : true,
							href : '${pageContext.request.contextPath}/admin/adminPassword.jsp',
							modal : true,
							onLoad : function() {
								/* $('#fileForm').form('load',rowdatas); */
								$("#sub").linkbutton({
										text : '管理员密码修改',
										onClick : function() {
											$("#passwordForm").form('submit',
												{
													url : '${pageContext.request.contextPath}/admin/modifyAdmin',
													onSubmit : function() {
														return true;
													},
													success : function(data) {
														$("#dial").dialog('close');
														$.messager.alert('Message',data,'info');
														window.location.href = "${pageContext.request.contextPath}/main.jsp";
													}
												})
													}
												})
							},
							resizable : true,
						});
		}); 
		
//======================================================================================================================

		var signout = function(){
				$.ajax({
					url:'${pageContext.request.contextPath}/admin/signout',
					type:'GET',
					success:function(result){
						window.location.href="${pageContext.request.contextPath}/login.jsp"
					},
					error:function(){alert("系統繁忙，推出失敗");}
				});
			
				
			} 

		  
</script>
</html>