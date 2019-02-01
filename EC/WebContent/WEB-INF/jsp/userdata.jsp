<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">ユーザー情報</h5>
		</div>
		<div class="row">
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<form action="UserDataUpdateConfirm" method="POST">
							<c:if test="${validationMessage != null}">
								<p class="red-text center-align">${validationMessage}</p>
							</c:if>
							<br> <br>
							<div class="row">
								<div class="input-field col s6">
									<input type="text" name="user_name" value="${udb.name}"> <label>名前</label>
								</div>
								<div class="input-field col s6">
									<input type="text" name="login_id" value="${udb.loginId}"> <label>ログインID</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input type="text" name="user_address" value="${udb.address}"> <label>住所</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12">
									<button class="btn  waves-effect waves-light  col s4 offset-s4" type="submit" name="action">更新</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--  購入履歴 -->
		<div class="row">
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table class="bordered">
							<thead>
								<tr>
									<th style="width: 10%"></th>
									<th class="center">購入日時</th>
									<th class="center">配送方法</th>
									<th class="center">購入金額</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bdb" items="${userBuyHistory}" >
									<tr>
										<td class="center">
											<form action="UserBuyHistoryDetail?buy_id=${bdb.id}"method="post">
												<input type="hidden" name="buyDate" value=${bdb.time}>
												<input type="hidden" name="deliveryMethodName" value=${bdb.deliveryMethodName}>
												<input type="hidden" name="totalPrice" value=${bdb.totalPrice}>
												<input type="hidden" name="buyId" value=${bdb.id}>
												<div class="btn-floating btn waves-effect waves-light ">
												<i class="material-icons">
												<input type="submit" value=details>
												</i>
												</div>
											</form>
										</td>
										<td class="center">${bdb.time}</td>
										<td class="center">${bdb.deliveryMethodName}</td>
										<td class="center">${bdb.totalPrice}円</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>