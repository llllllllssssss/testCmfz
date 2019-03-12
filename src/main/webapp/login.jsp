<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <



    <div class="login">
        <form id="loginForm" action="${pageContext.request.contextPath}/AdminController/loginAdmin.do" method="post">

            <table>
                <tbody>
                <tr>
                    <td width="190" rowspan="2" align="center" valign="bottom">

                    </td>
                    <th>
                        用户名:
                    </th>
                    <td>
                        <input  name="name" data-options="required:true" value="">
                    </td>
                </tr>
                <tr>
                    <th>
                        密&nbsp;&nbsp;&nbsp;码:
                    </th>
                    <td>
                        <input c name="password" data-options="required:true,showEye:true">
                    </td>
                </tr>
                <%--<tr>
                    <td>&nbsp;</td>
                    <th>验证码:</th>
                    <td>
                        <a class="easyui-textbox" name="captcha" data-options="required:true" style="width:100px;" value=""/>
                    </td>
                    <td><img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/admin//generateCaptcha.do"
                             onClick="this.src='${pageContext.request.contextPath}/admin//generateCaptcha.do?i='+Math.random()"
                             title="点击更换验证码"/></td>
                </tr>--%>
                <%--<tr>
                    <td>
                        &nbsp;
                    </td>
                    <th>
                        &nbsp;
                    </th>
                   &lt;%&ndash; <td>
                        <label>
                            <input type="checkbox" name="rememberMe" value="true"/> 记住用户名
                        </label>
                    </td>&ndash;%&gt;

                </tr>
                <tr>--%>
                    <td>&nbsp;</td>
                    <th>&nbsp;</th>
                    <td>
                        <input type="button" class="homeButton" value=""/>
                        <a id="btn-submit"/>
                        <label id="tip"></label>

                        <a id="addAdmin" href="${pageContext.request.contextPath}/index.jsp"
                           class="easyui-linkbutton" data-options="iconCls:'icon-add'"

                        >注册</a>
                    </td>
                </tr>
                </tbody>
            </table>

        </form>
    </div>


</head>
<body>


</body>
</html>