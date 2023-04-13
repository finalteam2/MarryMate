<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
body {
	width:500px;
	margin: 0 auto;
}
</style>
</head>
<body>
<div class="dropdown">
  <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
    Notifications <span class="badge text-bg-secondary">${cnt }</span>
  </button>
  <ul class="dropdown-menu">
  <c:forEach var="dto" items="${arr }">
  <c:if test="${dto.checked == 0 }">
    <li><a style="font: bold;" class="dropdown-item" href="goNoti.do?nidx=${dto.nidx }&page=${dto.page}">${dto.nidx }, ${dto.cidx }, ${dto.midx }, ${dto.recv }, ${dto.page }, ${dto.title }, ${dto.content }, ${dto.nkind }, ${dto.sentdate }, ${dto.checked }</a></li>
  </c:if>
  <c:if test="${dto.checked == 1 }">
    <li><a style="opacity: 50%" class="dropdown-item" href="goNoti.do?nidx=${dto.nidx }&page=${dto.page}">${dto.nidx }, ${dto.cidx }, ${dto.midx }, ${dto.recv }, ${dto.page }, ${dto.title }, ${dto.content }, ${dto.nkind }, ${dto.sentdate }, ${dto.checked }</a></li>
  </c:if>
  </c:forEach>
  </ul>
</div>
<hr>
<form action="addNoti.do" method="post">
	<div class="input-group mb-3"><span class="input-group-text" id="basic-addon1">cidx</span>
	<input name="cidx" type="text" class="form-control" placeholder="cidx" aria-describedby="basic-addon1"></div>
	<div class="input-group mb-3"><span class="input-group-text" id="basic-addon1">midx</span>
	<input name="midx" type="text" class="form-control" placeholder="midx" aria-describedby="basic-addon1"></div>
	<div class="input-group mb-3"><span class="input-group-text" id="basic-addon1">recv</span>
	<input name="recv" type="text" class="form-control" placeholder="recv" aria-describedby="basic-addon1"></div>
	<div class="input-group mb-3"><span class="input-group-text" id="basic-addon1">page</span>
	<input name="page" type="text" class="form-control" placeholder="page" aria-describedby="basic-addon1"></div>
	<div class="input-group mb-3"><span class="input-group-text" id="basic-addon1">title</span>
	<input name="title" type="text" class="form-control" placeholder="title" aria-describedby="basic-addon1"></div>
	<div class="input-group mb-3"><span class="input-group-text" id="basic-addon1">content</span>
	<input name="content" type="text" class="form-control" placeholder="content" aria-describedby="basic-addon1"></div>
	<div class="input-group mb-3"><span class="input-group-text" id="basic-addon1">nkind</span>
	<input name="nkind" type="text" class="form-control" placeholder="nkind" aria-describedby="basic-addon1"></div>
<button type="submit" class="btn btn-primary">addNoti</button>
</form>
<hr>
<form action="checkNoti.do" method="post">
	<div class="input-group mb-3"><span class="input-group-text" id="basic-addon1">cidx</span>
	<input name="cidx" type="text" class="form-control" placeholder="cidx" aria-describedby="basic-addon1"></div>
<button type="submit" class="btn btn-primary">checkNoti.do</button>
</form>
<hr>

</body>
</html>