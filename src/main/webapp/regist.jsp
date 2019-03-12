<%@ page pageEncoding="UTF-8"%>



<html>
<head>

	<div>
		<form action="${pageContext.request.contextPath}/AdminController/addAdmin.do"
			  class="easyui-form" enctype="multipart/form-data" method="post">
			<table>
				<tr>
					<td>用户名:</td>
					<td><input id="name" type='text' name='name'  class='easyui-validatebox'
									 data-options="required:true,validType:['length[1,20]']"

				/></td>
				</tr>

				<tr>
					<td>密码:</td>
					<td><input type='text' name='password'class='easyui-validatebox'
							   data-options="required:true,validType:['length[1,20]']" /></td>
				</tr>
				<tr>
					<td>性別</td>
					<td>
						<select id="cc" class="easyui-combobox" name="sex">
							<option value="male" selected>男性</option>
							<option value="female">女性</option>
						</select><br/>
					</td>
				<tr>
					<td><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</form>
	</div>

	</head>

	<body>

	</body>

</html>
