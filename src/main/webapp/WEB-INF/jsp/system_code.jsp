<?xml version="1.0" encoding="ISO-8859-1" ?>
 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	
	<title>System - Customer</title>

	<link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/toastr.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/font-awesome/css/font-awesome.min.css' />" rel="stylesheet"></link>
	
	<script src="<c:url value='/js/jquery.js' />"></script>
	<script src="<c:url value='/lib/bootstrap/js/bootstrap.js' />"></script>
	<script src="<c:url value='/js/jquery.validate.js' />"></script>
	<script src="<c:url value='/js/toastr.js' />"></script>
	
	<script src="<c:url value='/js/date.js' />"></script>
	
	<script src="<c:url value='/wijmo/controls/wijmo.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.input.min.js' />"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.grid.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.chart.min.js' />"></script>
	
	<link href="<c:url value='/wijmo/styles/wijmo.min.css' />" rel="stylesheet" />
</head>
<body class="bodytopindent">

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top topnav" role="navigation">
    <div class="container topnav">
        <!-- Brand and toggle get grouped for better mobile display -->
       <div class="navbar-header">
           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
           </button>
           <a class="navbar-brand topnav" href="${pageContext.request.contextPath}/">Web Reservation</a>
        </div>
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Schedule <span class="caret"></span></a>
                        <ul class="dropdown-menu">
				            <li><a href="/webreservation/software/"><b>Schedule</b></a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/software/email/">Email</a></li>
				            <li><a href="/webreservation/software/charging/">Charging</a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/software/userPassword/">Password</a></li>     
				         </ul>
                    </li>
   
                    <li class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">User <span class="caret"></span></a>
                        <ul class="dropdown-menu">
				            <li><a href="/webreservation/user/"><b>User Dashboard</b></a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/user/user/">User Information</a></li>
				            <li><a href="/webreservation/user/activity">Activity</a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/user/userReport/">User Report</a></li>
				            <li><a href="/webreservation/user/reservationReport/">Reservation Report</a></li>
				            <li><a href="/webreservation/user/chargingReport/">Charging Report</a></li>    
				         </ul>
                     </li>     
                         		
        			<li class="dropdown active">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">System <span class="caret"></span></a>
                        <ul class="dropdown-menu">
				            <li><a href="/webreservation/system/"><b>System Dashboard</b></a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/system/calendar/">Calendar</a></li>
				            <li><a href="/webreservation/system/time/">Time</a></li>
				            <li><a href="/webreservation/system/userPassword/">Password</a></li>
				            <li><a href="/webreservation/system/customer/">Customer</a></li>
				            <li><a href="/webreservation/system/message/">Message</a></li>
				            <li><a href="/webreservation/system/charge/">Charge</a></li>
				            <li><a href="/webreservation/system/code/">Code</a></li>      
				         </ul>
                    </li>		                    
                </ul>
            </div>   
    </div>
</nav>

<!-- Code List -->
<div class="container"> 
<section id="codeList">
	<div class="row">
	    <div class="col-lg-12">
	        <h4>Code List</h4>
	    </div>
	</div>
	<div class="row">
	    <div class="col-lg-4">
	        <div class="input-group">
	            <span class="input-group-btn">
	                <button class="btn btn-default btn-extend-padding btn-form-custom" type="button" readonly>
	                <i class="fa fa-search"></i>
	                </button>
	            </span>
	            <input type="text" class="form-control input-form-custom" id="InputFilter" placeholder="Search...">
	        </div>
	    </div>
	    <div class="col-lg-8">
	        <button id="cmdAddCode" type="submit" class="btn btn-primary pull-right btn-form-custom" onclick="cmdCodeAdd_OnClick()">Add</button>
	    </div>
	</div>
	<br />
	<div class="row table-form-custom">
	    <div class="col-lg-12 table-form-custom">
	        <div id="codeGrid" class="grid table-form-custom"></div>
	    </div>
	</div>
	
	<br />
	
	<div class="row">
	    <div class="btn-group col-md-7" id="naviagtionPageGrid">
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToFirstPageGrid">
	            <span class="glyphicon glyphicon-fast-backward"></span>
	        </button>
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToPreviousPageGrid">
	            <span class="glyphicon glyphicon-step-backward"></span>
	        </button>
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" disabled style="width:100px" id="btnCurrentPageGrid"></button>
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToNextPageGrid">
	            <span class="glyphicon glyphicon-step-forward"></span>
	        </button>
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToLastPageGrid">
	            <span class="glyphicon glyphicon-fast-forward"></span>
	        </button>
	    </div>
	</div>
</section>
</div>

<!-- Loading -->
<div class="modal fade" id="loading" tabindex="-1" role="dialog" aria-labelledby="Loading..." aria-hidden="true">
    <div class="modal-dialog" style="width: 220px;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Loading...</h4>
            </div>
            <div class="modal-body">
                <img src="<c:url value='/img/progress_bar.gif' />"></img>
            </div>
        </div>
    </div>
</div>

<!-- Code Edit Detail -->
<div class="modal fade" id="codeEdit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Code Edit</h4>
            </div>
            <div class="modal-body">
                <form id="messageForm">
                    <dl class="dl-horizontal">
                        <dt>Code</dt>
                        <dd>
                            <input class="form-control" id="EDIT_CODE_ID" type="hidden" />
                            <input class="form-control" id="EDIT_CODE_KIND_CODE" name="EDIT_CODE_KIND_CODE" type="text" required />
                        </dd>
                        <dt>Code Value</dt>
                        <dd>
                            <input class="form-control" id="EDIT_CODE_CODE_VALUE" name="EDIT_CODE_CODE_VALUE" type="text" required />
                        </dd>
                        <dt>Note</dt>
                        <dd>
							<input class="form-control" id="EDIT_CODE_NOTE" name="EDIT_CODE_NOTE" type="text" required /> 
                        </dd>
                        <dt>Text</dt>
                        <dd>
							<input class="form-control" id="EDIT_CODE_TEXT" name="EDIT_CODE_TEXT" type="text" required /> 
                        </dd>                        
                        <dt>Is displayed?</dt>
                        <dd>
							<input class="form-control" id="EDIT_CODE_ISDISPLAY" name="EDIT_CODE_ISDISPLAY" type="text" required /> 
                        </dd>                       
                    </dl>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"  id="cmdCodeEditOk" onclick="cmdCodeEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger" id="cmdCodeEditCancel" onclick="cmdCodeEditCancel_OnClick()">
                    Cancel
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
// ================
// Global variables
// ================
var codes;
var codeGrid;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

// ===================
// Edit Button Clicked
// ===================
function cmdCodeEdit_OnClick() {
    codes.editItem(codes.currentItem);

    $('#codeEdit').modal({
        show: true,
        backdrop: false
    });

    var code = codes.currentEditItem;
    
    document.getElementById('EDIT_CODE_ID').value = code.CODE_ID !== null && typeof (code.CODE_ID) != 'undefined' ? wijmo.Globalize.format(code.CODE_ID) : 0;
    document.getElementById('EDIT_CODE_KIND_CODE').value = code.CODE_KIND_CODE ? code.CODE_KIND_CODE : '';
    document.getElementById('EDIT_CODE_CODE_VALUE').value = code.CODE_CODE_VALUE ? code.CODE_CODE_VALUE : '';
    document.getElementById('EDIT_CODE_NOTE').value = code.CODE_NOTE ? code.CODE_NOTE : '';
    document.getElementById('EDIT_CODE_TEXT').value = code.CODE_TEXT ? code.CODE_TEXT : '';
    document.getElementById('EDIT_CODE_ISDISPLAY').value = code.CODE_ISDISPLAY ? code.CODE_ISDISPLAY : 1;        
} 

// ==================
// Add Button Clicked
// ==================   
function cmdCodeAdd_OnClick() {
    $('#codeEdit').modal({
        show: true,
        backdrop: false
    });
    
    document.getElementById('EDIT_CODE_ID').value = 0;
    document.getElementById('EDIT_CODE_KIND_CODE').value = '';
    document.getElementById('EDIT_CODE_CODE_VALUE').value = '';
    document.getElementById('EDIT_CODE_NOTE').value = '';
    document.getElementById('EDIT_CODE_TEXT').value = '';
    document.getElementById('EDIT_CODE_ISDISPLAY').value = 1;          
}

// =====================
// Delete Button Clicked
// =====================   
function cmdCodeDelete_OnClick() {
    codes.editItem(codes.currentItem);
    
    var id = codes.currentEditItem.CODE_ID;
    var codeKindCode = codes.currentEditItem.CODE_KIND_CODE;

    if (confirm("Delete " + codeKindCode + "?") == true) {
        $.ajax({
            type: "DELETE",
            url: '${pageContext.request.contextPath}/api/code/delete/' + id,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            statusCode: {
                200: function () {
                    toastr.success('Successfully Deleted.');
                    window.setTimeout(function () { location.reload() }, 1000);
                },
                404: function () {
                    toastr.error("Not found.");
                },
                400: function () {
                    toastr.error("Bad request.");
                }
            }
        });
    }
}

// =================================
// Edit Detail Cancel Button Clicked
// =================================     
function cmdCodeEditCancel_OnClick() {
	$('#codeEdit').modal('hide');    	
} 

// =============================
// Edit Detail OK Button Clicked
// =============================     
function cmdCodeEditOk_OnClick() {
	var codeObject = new Object();

 	codeObject.CODE_ID = parseInt(document.getElementById('EDIT_CODE_ID').value);
 	codeObject.CODE_KIND_CODE = document.getElementById('EDIT_CODE_KIND_CODE').value;
 	codeObject.CODE_CODE_VALUE = document.getElementById('EDIT_CODE_CODE_VALUE').value;
 	codeObject.CODE_NOTE = document.getElementById('EDIT_CODE_NOTE').value;
 	codeObject.CODE_TEXT = document.getElementById('EDIT_CODE_TEXT').value;
 	codeObject.CODE_ISDISPLAY = parseInt(document.getElementById('EDIT_CODE_ISDISPLAY').value); 

 	var data = JSON.stringify(codeObject);

    $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/api/code/update',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        success: function (data) {
            if (data.CODE_ID > 0) {
                toastr.success('Successfully updated.');
                window.setTimeout(function () { location.reload() }, 1000);
            } else {
                toastr.error("Not updated.");
            }
        }
    });
} 

// ==============
// Get Codes Data
// ==============   
function getCodes() {
    var codes = new wijmo.collections.ObservableArray();
    $('#loading').modal('show');
    $.ajax({
        url: '${pageContext.request.contextPath}/api/code/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {},
        success: function (Results) {
            $('#loading').modal('hide');
            if (Results.length > 0) {
                for (i = 0; i < Results.length; i++) {
                    codes.push({
                        EditId: "<button class='btn btn-primary btn-xs btn-form-custom' data-toggle='modal' id='cmdEditCode' onclick='cmdCodeEdit_OnClick()'>Edit</button>",
                        DeleteId: "<button class='btn btn-danger btn-xs btn-form-custom' data-toggle='modal' id='cmdDeleteCode' onclick='cmdCodeDelete_OnClick()'>Delete</button>",
                        CODE_ID: Results[i]["CODE_ID"],
                        CODE_KIND_CODE: Results[i]["CODE_KIND_CODE"],
                        CODE_CODE_VALUE: Results[i]["CODE_CODE_VALUE"],
                        CODE_NOTE: Results[i]["CODE_NOTE"],
                        CODE_TEXT: Results[i]["CODE_TEXT"],
                        CODE_ISDISPLAY: Results[i]["CODE_ISDISPLAY"]
                    });
                }
            } else {
                alert("No data.");
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );
    return codes;
}

// ==================
// Navigation Buttons
// ==================   
 function updateNavigateButtonsCode() {
    if (codes.pageSize <= 0) {
        document.getElementById('naviagtionPageGrid').style.display = 'none';
        return;
    }
    document.getElementById('naviagtionPageGrid').style.display = 'block';
    if (codes.pageIndex === 0) {
        btnFirstPageGrid.setAttribute('disabled', 'disabled');
        btnPreviousPageGrid.setAttribute('disabled', 'disabled');
        btnNextPageGrid.removeAttribute('disabled');
        btnLastPageGrid.removeAttribute('disabled');
    }
    else if (codes.pageIndex === (codes.pageCount - 1)) {
        btnFirstPageGrid.removeAttribute('disabled');
        btnPreviousPageGrid.removeAttribute('disabled');
        btnLastPageGrid.setAttribute('disabled', 'disabled');
        btnNextPageGrid.setAttribute('disabled', 'disabled');
    }
    else {
        btnFirstPageGrid.removeAttribute('disabled');
        btnPreviousPageGrid.removeAttribute('disabled');
        btnNextPageGrid.removeAttribute('disabled');
        btnLastPageGrid.removeAttribute('disabled');
    }
    btnCurrentPageGrid.innerHTML = (codes.pageIndex + 1) + ' / ' + codes.pageCount;
} 

// =====================
// Detail Edit Validator
// =====================     
function FormValidate() {
    var validator = $('form').validate({
        submitHandler: function (form) {
            form.submit();
        }
    });
    var x = validator.form();
    console.log(x);
    return x;
} 

// ==============================
// Detail Edit Validator Defaults
// ==============================    
 $.validator.setDefaults({
    errorPlacement: function (error, element) {
        $(element).attr({ "title": error.append() });
    },
    highlight: function (element) {
        $(element).removeClass("textinput");
        $(element).addClass("errorHighlight");
    },
    unhighlight: function (element) {
        $(element).removeClass("errorHighlight");
        $(element).addClass("textinput");
    }
}); 

// ============
// On Page Load
// ============
$(document).ready(function () {

 // Validation
    $('#cmdCodeEditOk').click(function () {
        if (FormValidate() == true) {
            cmdCodeEditOkFunction();
            $('#codeEdit').modal('hide');
        }
        else {
            toastr.error("Fill the required field!");
        }
    });

    $('#cmdCodeEditCancel, .close').click(function () {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#codeEdit').modal('hide');
    });

    $('.close-btn').hide();

    // Collection View
    codes = new wijmo.collections.CollectionView(getCodes());
    codes.canFilter = true;
    codes.pageSize  = 15;
    
    var filterText = '';
    $('#InputFilter').keyup(function () {
        filterText = this.value.toLowerCase();
        codes.refresh();
    });
    codes.filter = function (item) {
        return !filterText || (item.CODE_KIND_CODE.toLowerCase().indexOf(filterText) > -1);
    }
    
    codes.collectionChanged.addHandler(function (sender, args) {
        updateNavigateButtonsCode();
    });
    
    // Flex Grid
    codeGrid = new wijmo.grid.FlexGrid('#codeGrid');
    codeGrid.initialize({
        columns: [
                    {
                        "header": "Edit",
                        "binding": "EditId",
                        "width": 60,
                        "allowSorting": false,
                        "isContentHtml": true
                    },
                    {
                        "header": "Delete",
                        "binding": "DeleteId",
                        "width": 60,
                        "allowSorting": false,
                        "isContentHtml": true
                    }         ,
                    {
                        "header": "Code",
                        "binding": "CODE_KIND_CODE",
                        "allowSorting": true,
                        "width": 100
                    },
                    {
                        "header": "Value",
                        "binding": "CODE_CODE_VALUE",
                        "allowSorting": true,
                        "width": 100
                    },                        
                    {
                        "header": "Note",
                        "binding": "CODE_NOTE",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Text",
                        "binding": "CODE_TEXT",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Display",
                        "binding": "CODE_ISDISPLAY",
                        "allowSorting": true,
                        "width": 60
                    }                
        ],
        autoGenerateColumns: false,
        itemsSource: codes,
        isReadOnly: true,
        selectionMode: wijmo.grid.SelectionMode.Row
    });
    codeGrid.trackChanges = true;

    // Navigation button
    btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
    btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
    btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
    btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
    btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

    updateNavigateButtonsCode();

    btnFirstPageGrid.addEventListener('click', function () {
        codes.moveToFirstPage();
        updateNavigateButtonsCode();
    });
    btnPreviousPageGrid.addEventListener('click', function () {
        codes.moveToPreviousPage();
        updateNavigateButtonsCode();
    });
    btnNextPageGrid.addEventListener('click', function () {
        codes.moveToNextPage();
        updateNavigateButtonsCode();
    });
    btnLastPageGrid.addEventListener('click', function () {
        codes.moveToLastPage();
        updateNavigateButtonsCode();
    }); 
});
</script>

</body>
</html>