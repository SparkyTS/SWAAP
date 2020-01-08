<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Add Offer</title>

	<!-- Main Styles -->
	<link rel="stylesheet" href="adminResources/css/style.css">
	<link rel="stylesheet" href="adminResources/css/custom.css">

	<!-- mCustomScrollbar -->
	<link rel="stylesheet" href="adminResources/css/jquery.mCustomScrollbar.min.css">

	<!-- Waves Effect -->
	<link rel="stylesheet" href="adminResources/css/waves.min.css">

	<!-- Sweet Alert -->
	<link rel="stylesheet" href="adminResources/css/sweetalert.css">
	
	<!-- Data Tables -->
	<link rel="stylesheet" href="adminResources/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="adminResources/css/responsive.bootstrap.min.css">

	<!-- Color Picker -->
	<link rel="stylesheet" href="adminResources/css/color-switcher.min.css">
</head>

<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<!-- /.main-menu -->

	<jsp:include page="header.jsp"></jsp:include>
	<!-- /.fixed-navbar -->

	<div id="color-switcher">
		<div id="color-switcher-button" class="btn-switcher">
			<div class="inside waves-effect waves-circle waves-light">
				<i class="ico fas fa-cog"></i>
			</div>
			<!-- .inside waves-effect waves-circle -->
		</div>
		<!-- .btn-switcher -->
		<div id="color-switcher-content" class="content">
			<a href="#" data-color="red" class="item js__change_color"><span class="color" style="background-color: #f44336;"></span><span class="text">Red</span></a>
			<a href="#" data-color="violet" class="item js__change_color"><span class="color" style="background-color: #673ab7;"></span><span class="text">Violet</span></a>
			<a href="#" data-color="dark-blue" class="item js__change_color"><span class="color" style="background-color: #3f51b5;"></span><span class="text">Dark Blue</span></a>
			<a href="#" data-color="blue" class="item js__change_color active"><span class="color" style="background-color: #304ffe;"></span><span class="text">Blue</span></a>
			<a href="#" data-color="light-blue" class="item js__change_color"><span class="color" style="background-color: #2196f3;"></span><span class="text">Light Blue</span></a>
			<a href="#" data-color="green" class="item js__change_color"><span class="color" style="background-color: #4caf50;"></span><span class="text">Green</span></a>
			<a href="#" data-color="yellow" class="item js__change_color"><span class="color" style="background-color: #ffc107;"></span><span class="text">Yellow</span></a>
			<a href="#" data-color="orange" class="item js__change_color"><span class="color" style="background-color: #ff5722;"></span><span class="text">Orange</span></a>
			<a href="#" data-color="chocolate" class="item js__change_color"><span class="color" style="background-color: #795548;"></span><span class="text">Chocolate</span></a>
			<a href="#" data-color="dark-green" class="item js__change_color"><span class="color" style="background-color: #263238;"></span><span class="text">Dark Green</span></a>
			<span id="color-reset" class="btn-restore-default js__restore_default">Reset</span>
		</div>
		<!-- /.content -->
	</div>
	<!-- #color-switcher -->
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

	<div id="wrapper">
		<div class="main-content">
			<div class="row small-spacing">
				<div class="col-12">
					<div class="box-content">
					<f:form data-toggle="validator" modelAttribute="offerVO" method="post" action="saveOffer">
						<h4 class="box-title">Add Offer</h4>
						<div class="form-group">
								<label for="inp-type-1" class=" control-label">Select Type</label>
								<input type="radio" name="offerType" id="underwear1" required="true">
								<label for="underwear1">Category</label>&nbsp&nbsp
								<input type="radio" name="offerType" id="underwear1" required="true">
								<label for="underwear1">Sub-Category</label>&nbsp&nbsp
								<input type="radio" name="offerType" id="underwear1" required="true">
								<label for="underwear1">Product</label>
						</div>
						<div class="form-group">
							<f:hidden path="id"/>
							<label for="subCategoryName" class="control-label">Offer Name</label>
							<f:input path="offerName" name="offnme" class="form-control" id="inputName" placeholder="Enter Offer Name" required="true"/>
						</div>
						<!-- /.box-title -->
						<div class="dropdown js__drop_down">
							<a href="#" class="dropdown-icon fas fa-ellipsis-v js__drop_down_button"></a>
							<ul class="sub-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else there</a></li>
								<li class="split"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
							<!-- /.sub-menu -->
						</div>
						<!-- /.dropdown js__dropdown -->
						
					<div class="form-group">
						<label for="subCategoryName" name="scatnme" class="control-label">Category</label>
						<div class="form-group margin-bottom-20">
								<f:select class="form-control" path="categoryVO.id" placeholder="Select Category">
									<c:forEach items="${categoryList}" var="categoryVariable">
										<f:option value="${categoryVariable.id}">${categoryVariable.categoryName }</f:option>
									</c:forEach>
								</f:select>									
						</div>
					</div>
					<div class="form-group">
						<label for="subCategoryName" name="scatnme" class="control-label">Sub-Category</label>
						<div class="form-group margin-bottom-20">
								<f:select class="form-control" path="subCategoryVO.id" placeholder="Select Sub-Category">
									<c:forEach items="${subCategoryList}" var="subCategoryVariable">
										<f:option value="${subCategoryVariable.id}">${subCategoryVariable.subCategoryName }</f:option>
									</c:forEach>
								</f:select>									
						</div>
					</div>
					<div class="form-group">
						<label for="productName" name="pdtnme" class="control-label">Product</label>
						<div class="form-group margin-bottom-20">
								<f:select class="form-control" path="productVO.id" placeholder="Select Product">
									<c:forEach items="${productList}" var="productVariable">
										<f:option value="${productVariable.id}">${productVariable.productName }</f:option>
									</c:forEach>
								</f:select>									
						</div>
					</div>
						
						<div class="form-group">
								<label for="inp-type-1" class=" control-label">Discount %</label>
								<f:input path="discountPercent" type="text" name="dis" class="form-control" id="inp-type-1" placeholder="Enter Discount value"/>
						</div>
						<div class="form-group">
										<label for="inp-type-1" class=" control-label">Valid from</label>
											<div class="input-group">
												<f:input path="offerValidFrom" type="text" name="from" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose"/>
												<span class="input-group-addon bg-primary text-white"><i class="fa fa-calendar"></i></span>
											</div>
											<!-- /.input-group -->
										</div>
						<div class="form-group">
										<label for="inp-type-1" class=" control-label">Valid till</label>
											<div class="input-group">
												<f:input path="offerValidTill" type="text" name="till" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose"/>
												<span class="input-group-addon bg-primary text-white"><i class="fa fa-calendar"></i></span>
											</div>
											<!-- /.input-group -->
										</div>
										<div class="form-group">
							<button type="submit" class="btn btn-primary waves-effect waves-light">Add Offer</button>
						</div>
						</f:form>
					</div>
					
					<!-- /.box-content -->
				</div>
				
				</div>
				<!-- /.col-12 -->
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
			<!-- /.row small-spacing -->		
		</div>
		<!-- /.main-content -->
	</div><!--/#wrapper -->
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="adminResources/js/html5shiv.min.js"></script>
		<script src="adminResources/js/respond.min.js"></script>
	<![endif]-->
	<!-- 
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="adminResources/js/jquery.min.js"></script>
		<script src="adminResources/js/modernizr.min.js"></script>
		<script src="adminResources/js/popper.min"></script>
		<script src="adminResources/js/bootstrap.min.js"></script>
		<script src="adminResources/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="adminResources/js/nprogress.js"></script>
		<script src="adminResources/js/sweetalert.min.js"></script>
		<script src="adminResources/js/waves.min.js"></script>
		<!-- Full Screen Plugin -->
		<script src="adminResources/js/jquery.fullscreen-min.js"></script>

		<!-- Data Tables -->
		<script src="adminResources/js/jquery.dataTables.min.js"></script>
		<script src="adminResources/js/dataTables.bootstrap4.min.js"></script>
		<script src="adminResources/js/dataTables.responsive.min.js"></script>
		<script src="adminResources/js/responsive.bootstrap.min.js"></script>
		<script src="adminResources/js/datatables.demo.min.js"></script>

		<script src="adminResources/js/main.min.js"></script>
<script src="adminResources/js/mycommon.js"></script>
		<script src="adminResources/js/color-switcher.min.js"></script>
	</body>
	</html>