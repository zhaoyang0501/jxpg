<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-default open-hover" role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/weather">HOME邯郸学院教学评估</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      <ul class="nav navbar-nav">
      <!-- 
                <li ><a href="${pageContext.request.contextPath}/friend">我的好友</a></li>
                 -->
                <li><a href="${pageContext.request.contextPath}/score">在线评估</a></li>
                 <li><a href="${pageContext.request.contextPath}/fee">公告查询</a></li>
                 <li><a href="${pageContext.request.contextPath}/notice">留言</a></li>
                 <li><a href="${pageContext.request.contextPath}/plan">课程安排</a></li>
                 <li><a href="${pageContext.request.contextPath}/msgbox">留言讨论</a></li>
                <li><a href="${pageContext.request.contextPath}/register">注册</a></li>
               <li><a href= "${pageContext.request.contextPath}/about">关于</a></li>
      </ul>
      
      <c:if test="${sessionScope.user==null}">
	      <ul class="nav navbar-nav navbar-right">
	     	 <li><a href="${pageContext.request.contextPath}/login">登录</a></li>
	      </ul>
      </c:if>
      
      <c:if test="${sessionScope.user!=null }">
      
			<ul class="nav navbar-nav navbar-right">
								<li class="dropdown">
								  <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.user.username } <b class="caret"></b></a>
								  <ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath}/loginout">退出</a></li>
								  </ul>
								</li>
			 </ul>
		</c:if>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>