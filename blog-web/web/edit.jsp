<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href='${pageContext.request.contextPath}/dist/layui/css/layui.css'/>
<head>
    <title>完整demo</title>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->

</head>
<script src="${pageContext.request.contextPath}/dist/ckeditor/ckeditor.js"></script>
<script>
    window.onload = function()
    {
        CKEDITOR.replace( 'description');
    };
</script>
</head>
<body>
<form method="post" action="/blog/add">
    招聘岗位：<input type="text" name="position" id="position"/>
    招聘人数：<input type="text" name="quantity" id="quantity"/>
    学历要求：<input type="text" name="education" id="education"/>
    薪资：<input type="text" name="salary" id="salary"/>
    联系人：<input type="text" name="contact" id="contact"/>
    联系电话：<input type="text" name="telephone" id="telephone"/>
    描述：<textarea name="blogText" id="description"/></textarea>
    <input type="submit"/>

</form>
</body>

</html>