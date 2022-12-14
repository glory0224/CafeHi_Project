<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>

  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CAFEHi</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>

	<header>
  <nav class="navbar navbar-expand-md navbar fixed-top bg-white">
    <div class="container-fluid">
      <a class="navbar-brand" href="/cafeHi/"><img alt="" src="/cafeHi/img/cafehi_logo2.png" style="width: 50px; height: 50px; margin-right: 20px;" >CAFE Hi</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class=" collapse navbar-collapse " id="navbarCollapse">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link p-30" aria-current="page" href="Introduce.do">CAFE Hi</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Menu.do">MENU</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Membership.do">MEMBERSHIP</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Event.do">EVENT</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Place.do">STORE</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="QnAList.do?">QnA</a>
          </li>
        </ul>
      </div>
    </div>

<sec:authorize access="isAnonymous()">
	<div class="d-flex justify-content-end">
          <a href="login.do"><button type="button" class="btn btn-outline-success me-2">Login</button></a>
        </div>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<div class="d-flex justify-content-end">
 <div class=" collapse navbar-collapse " id="navbarCollapse">
        <ul class="navbar-nav">
        <li class="nav-item"><b><sec:authentication property="principal.member.member_id"/></b>??? ???????????????.</li>        
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="myPage.do">???????????????</a>
          </li>
          <li class="nav-item">
          	<form action="logout.do" method="post">
          	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
            <input class="nav-link" type="submit" value="????????????" style="border:none; background-color: white">
          	</form>
          </li>          
		</ul>
	</div>
	</div>
</sec:authorize>


  </nav>
</header>		





