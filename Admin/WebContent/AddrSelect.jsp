<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="euc-kr">
<title>도미노피자</title>
<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css">
<script type="text/javascript" src="/resources/js/jquery1.11.1.js"></script>
<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
<script type="text/javascript" src="/resources/js/d2CommonUtil.js"></script>
</head>
<body>
<form id="searchFrm" name="searchFrm" id="searchFrm" action="/" method="get" onsubmit="return searchBranch();">
<input type="hidden" name="xdot" id="xdot" value="" />
<input type="hidden" name="ydot" id="ydot" value="" />
<input type="hidden" name="zip2" id="zip2" value=""/>
<input type="hidden" name="zip3" id="zip3" value=""/>
<input type="hidden" name="zip3_r" id="zip3_r" value=""/>
<input type="hidden" name="zip4_r" id="zip4_r" value=""/>
<input type="hidden" name="zip3_sub" id="zip3_sub" value=""/>
	<div class="pop_content adr_add_frame"><!-- 프레임html영역클래스구별 : adr_add_frame -->
		<div class="tab tab_type2">
			<ul class="btn_tab">
				<li class="active" data-val="R"><a href="#">도로명 주소</a></li>
				<li class="" data-val="C"><a href="#">건물/상호</a></li>
				<li class="" data-val="A"><a href="#">지번주소</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="adr_form">
						<ul id="typeR">
							<li class="form_area">
								<strong>지역선택</strong>
								<div class="form_group">
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_R1" id="zip_code_R1" class="input1" title="시/도">
												<option value="">선택</option>
											<option value="11">서울특별시</option>
											<option value="26">부산광역시</option>
											<option value="27">대구광역시</option>
											<option value="28">인천광역시</option>
											<option value="29">광주광역시</option>
											<option value="30">대전광역시</option>
											<option value="31">울산광역시</option>
											<option value="36">세종특별자치시</option>
											<option value="41">경기도</option>
											<option value="42">강원도</option>
											<option value="43">충청북도</option>
											<option value="44">충청남도</option>
											<option value="45">전라북도</option>
											<option value="46">전라남도</option>
											<option value="47">경상북도</option>
											<option value="48">경상남도</option>
											<option value="50">제주특별자치도</option>
											</select>
										</div>
									</div>
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_R2" id="zip_code_R2" class="input2" title="구/군">
												<option value="">선택</option>
											</select>
										</div>
									</div>
								</div>
							</li>
							<li class="form_street">
								<strong>도로명</strong>
								<div class="form_group">
									<div class="form_field">
										<div class="sel_box">
											<select name="chosung" id="chosung" class="input3" title="도로명 초성">
												<option value="">선택</option>
											</select>
										</div>
									</div>
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_R3" id="zip_code_R3" class="input4" title="도로명">
												<option value="">전체</option>
											</select>
										</div>
									</div>
								</div>
							</li>

							<li class="form_adr_srch">
								<label for="adr_srch">건물번호</label>
								<div class="form_group">
									<div class="form_field">
										<div class="form_item">
											<input type="text" name="keyword_R" id="keyword_R" class="i_text input5" onkeypress="if(event.keyCode==13){ searchBranch();return false; }" title="건물번호">
										</div>
									</div>
									<div class="form_field">
										<div class="form_item">
											<a href="javascript:searchBranch();" class="btn"><span class="btn_txt">검색하기</span></a>
										</div>
									</div>
								</div>

							</li>

						</ul>
					</div>
				</div>
				<div class="tab_content">
					<div class="adr_form">
						<ul id="typeC">
							<li class="form_area v2">
								<strong>지역선택</strong>
								<div class="form_group">
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_C1" id="zip_code_C1" class="input1" title="시">
												<option value="">선택</option>
											<option value="11">서울특별시</option>
											<option value="26">부산광역시</option>
											<option value="27">대구광역시</option>
											<option value="28">인천광역시</option>
											<option value="29">광주광역시</option>
											<option value="30">대전광역시</option>
											<option value="31">울산광역시</option>
											<option value="36">세종특별자치시</option>
											<option value="41">경기도</option>
											<option value="42">강원도</option>
											<option value="43">충청북도</option>
											<option value="44">충청남도</option>
											<option value="45">전라북도</option>
											<option value="46">전라남도</option>
											<option value="47">경상북도</option>
											<option value="48">경상남도</option>
											<option value="50">제주특별자치도</option>
											</select>
										</div>
									</div>
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_C2" id="zip_code_C2"  class="input2" title="구">
												<option value="">선택</option>
											</select>
										</div>
									</div>
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_C3" id="zip_code_C3" class="input3" title="군">
												<option value="">전체</option>
											</select>
										</div>
									</div>
								</div>
							</li>
							<li class="form_adr_srch">
								<label for="adr_srch2">건물상호</label>
								<div class="form_group">
									<div class="form_field">
										<div class="form_item">
											<input type="text" name="keyword_C" id="keyword_C" maxlength="10" class="i_text input5" onkeypress="if(event.keyCode==13){ searchBranch();return false; }" title="건물상호">
										</div>
									</div>
									<div class="form_field">
										<div class="form_item">
											<a href="javascript:searchBranch();" class="btn"><span class="btn_txt">검색하기</span></a>
										</div>
									</div>
								</div>

							</li>

						</ul>
					</div>
				</div>
				<div class="tab_content">
					<div class="adr_form">
						<ul id="typeA">
							<li class="form_area v2">
								<strong>지역선택</strong>
								<div class="form_group">
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_A1" id="zip_code_A1" class="input1" title="시">
												<option value="">선택</option>
											<option value="11">서울특별시</option>
											<option value="26">부산광역시</option>
											<option value="27">대구광역시</option>
											<option value="28">인천광역시</option>
											<option value="29">광주광역시</option>
											<option value="30">대전광역시</option>
											<option value="31">울산광역시</option>
											<option value="36">세종특별자치시</option>
											<option value="41">경기도</option>
											<option value="42">강원도</option>
											<option value="43">충청북도</option>
											<option value="44">충청남도</option>
											<option value="45">전라북도</option>
											<option value="46">전라남도</option>
											<option value="47">경상북도</option>
											<option value="48">경상남도</option>
											<option value="50">제주특별자치도</option>
											</select>
										</div>
									</div>
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_A2" id="zip_code_A2" class="select input2" title="구">
												<option value="">선택</option>
											</select>
										</div>
									</div>
									<div class="form_field">
										<div class="sel_box">
											<select name="zip_code_A3" id="zip_code_A3" class="select input3" title="동">
												<option value="">전체</option>
											</select>
										</div>
									</div>
								</div>
							</li>
							<li class="form_adr_srch">
								<label for="adr_srch3">번지검색</label>
								<div class="form_group">
									<div class="form_field">
										<div class="form_item">
											<input type="text" name="keyword_A" id="keyword_A" maxlength="10" class="i_text input5" onkeypress="if(event.keyCode==13){ searchBranch('A');return false; }" title="번지 검색">
										</div>
									</div>
									<div class="form_field">
										<div class="form_item">
											<a href="javascript:searchBranch();" class="btn"><span class="btn_txt">검색하기</span></a>
										</div>
									</div>
								</div>

							</li>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="adr_form">
			<ul>


				<li class="form_adr_srch">
					<div class="lst_adr">
						<div class="lst_adr_wrap">
							<ul id="addrList"><li>검색 결과가 없습니다.</li></ul>
						</div>
						<p>※ 시/군/구, 동/면/읍, 번지/건물명이 없는 경우는 배달이 불가능한<br>지역입니다. 이러한 경우에는 주소를 입력하지 않아도 회원가입이<br>정상적으로 이뤄집니다.<br></p>
					</div>
				</li>
				<li class="form_adr_detail">
					<label for="ip_adr_detail">상세주소</label>
					<div class="form_group">
						<div class="form_field">
							<div class="form_item">
								<input type="text" name="zip_code_4" id="zip_code_4"  class="i_text" readonly  title="주소 입력"/>
							</div>
						</div>
					</div>
					<div class="form_group">
						<div class="form_field">
							<div class="form_item">
								<input type="text" name="detail_address" id="detail_address" value="" maxlength="50" onkeypress="if(event.keyCode==13){ addDelivery();return false; }" class="i_text" placeholder="한글 25자까지 입력 가능"  title="상세 주소" />
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>

		<div class="btn_wrap">
			<div class="btn_fix_center">
				<a href="javascript:addDelivery();" class="btn btn_red btn_mdle btn_block"><span class="btn_txt">등록하기</span></a>
			</div>
		</div>
	</div>
</form>
</body>

<script>
var param = {};
$(document).ready(function() {
	$('.tab > .btn_tab>li>a').click(function(e){
		e.preventDefault();
		var idx = $(this).parent().index();
		var tcw = $(this).closest('.btn_tab').next('.tab_content_wrap');

		$(this).parent().addClass('active').siblings().removeClass('active');
		tcw.children().eq(idx).addClass('active').siblings().removeClass('active');

		$("#zip_code_4").val("");
		$("#detail_address").val("");

		$('#addrList').html("<li>검색결과가 없습니다.</li>");

	});

	$(".input1").change(function() {
		var addrType = $(".btn_tab li.active").data("val");

		$("#type"+addrType+" .input2 option:gt(0)").remove();
		$("#type"+addrType+" .input3 option:gt(0)").remove();
		$("#type"+addrType+" .input4 option:gt(0)").remove();
		$("#type"+addrType+" .input5").val("");


		getAddrList(1, $("#zip_code_"+addrType+"2"), $(this).val(), '', '', '', '', addrType, '');
	});

	$(".input2").change(function() {
		var addrType = $(".btn_tab li.active").data("val");

		$("#type"+addrType+" .input3 option:gt(0)").remove();
		$("#type"+addrType+" .input4 option:gt(0)").remove();
		$("#type"+addrType+" .input5").val("");

		var obj = $("#zip_code_"+addrType+"3");
		if(addrType == "R") obj = $("#chosung");

		getAddrList(2, obj, $("#zip_code_"+addrType+"1").val(), $(this).val(), '', '', '', addrType, '');

	});

	$("#chosung").change(function()  {
		var addrType = $(".btn_tab li.active").data("val");

		$("#type"+addrType+" .input4 option:gt(0)").remove();
		$("#type"+addrType+" .input5").val("");

		var obj = $("#zip_code_R3");


		getAddrList(3, obj, $("#zip_code_"+addrType+"1").val(), $("#zip_code_R2").val(), '', $(this).val(), '', addrType, '');
	});

});

function getAddrList(step, obj, zip1, zip2, zip3, chosung, keyword, addr_type, dong_type) {
	$.ajax({
		type: "GET",
		url: "/delivery/getAddrAjax",
		data: {
			zip_code1 : zip1,
			zip_code2 : zip2,
			zip_code3 : zip3,
			chosung : encodeURIComponent(chosung),
			keyword : encodeURIComponent(keyword),
			addr_type : addr_type,
			dong_type : dong_type
		},
		success:function(data) {
			if(data.resultData) {
				$.each(data.resultData.result, function(i, v) {
					if(addr_type != 'R' && step == 2)
						obj.append("<option value='"+v.code+"|"+v.subdong+"'>"+v.addr+"</option>");
					else
						obj.append("<option value='"+v.code+"'>"+v.addr+"</option>");
				});
			}

		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
}


function searchBranch(){
	var addr_type = $(".btn_tab li.active").data("val");

	if($('#zip_code_' + addr_type + '1').val().isBlank()) { alert('시/군/구을 선택해주세요.'); return;}
	if($('#zip_code_' + addr_type + '2').val().isBlank()) { alert('시/군/구을 선택해주세요.'); return;}

	if(addr_type == "R") {
		if($('#chosung').val().isBlank()) { alert('초성을 선택해주세요.'); return; }
	}

	if(addr_type == "A") {
		if($('#zip_code_' + addr_type + '3').val().isBlank()) { alert('동/면/읍까지 선택후 검색 가능합니다.'); return; }
	}
	else if(addr_type == "R") {
		if($('#zip_code_' + addr_type + '3').val().isBlank()) { alert('도로명까지 선택후 검색 가능합니다.'); return; }
	}

	if(addr_type != "R") {
		if(addr_type == "C") {
			if($('#keyword_' + addr_type).val().isBlank()) { alert('검색할 건물상호를 입력해주세요.'); return; }
		}
		else {
			if($('#keyword_' + addr_type).val().isBlank()) { alert('검색할 번지를 입력해주세요.'); return; }
		}
	}

	// 건물상호, 지번 검색시 행정동, 법정동 구분 값
	var dong_type = "";
	var zip3 = "";
	if(addr_type != "R") {
		var dArr = $('#zip_code_' + addr_type + '3').val().split("|");
		zip3 = dArr[0];
		if(dArr[1] != null) dong_type = dArr[1];
	}
	else {
		zip3 = $('#zip_code_' + addr_type + '3').val();
	}

	$('#addrList').html("<li>조회중입니다...</li>");
	$.ajax({
		type: "GET",
		url: "/delivery/getAddrAjax",
		data: {
			zip_code1 : $('#zip_code_' + addr_type + '1').val(),
			zip_code2 : $('#zip_code_' + addr_type + '2').val(),
			zip_code3 : zip3,
			chosung : encodeURIComponent($('#chosung').val()),
			keyword : encodeURIComponent($('#keyword_' + addr_type).val()),
			addr_type : addr_type,
			dong_type : dong_type
		},
		success:function(data) {
			$('#zip_code_4').val('');
			$('#addrList').html("");
			if(data.resultData.result.length > 0) {
				$.each(data.resultData.result, function(i, v) {
					$('#addrList').append('<li><a href="javascript:zipcode4Click(\''+v.addr+'\', \''+v.addrSub+'\', \''+v.xdot+'\', \''+v.ydot+'\', \''+v.subdong+'\');">'+v.addr+'</a></li>');

				});
			} else {
				$('#addrList').html("<li>검색결과가 없습니다.</li>");
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});

}

function zipcode4Click(obj, obj_sub, xdot, ydot, subdong){
	if(obj_sub == "null") obj_sub = "";
	if(xdot == "null") xdot = "";
	if(ydot == "null") ydot = "";
	if(subdong == "null") subdong = "";



	var addr_type = $(".btn_tab li.active").data("val");

	if(addr_type == "A") { // 지번검색
		var zip1 = $('#zip_code_' + addr_type + '1  option:selected').text();
		var zip2 = $('#zip_code_' + addr_type + '2  option:selected').text();
		var zip3 = $('#zip_code_' + addr_type + '3  option:selected').text();
		var resultZip = zip1 + " " + zip2 + " " + zip3 + " " + obj;
	}
	else {
		var objStr = obj;
		var arr = objStr.split(" ");
		$('#zip2').val(arr[1]);
		$('#zip3').val(arr[2]);
	}
	$('#zip_code_4').val(obj);

	// 매칭되는 도로명 & 지번 & 건물 처리
	if(obj_sub != "" && obj_sub != "undefined") {
		var obj_sub_arr = obj_sub.split("|");
		var zip3_r = obj_sub_arr[0];
		var zip4_r = obj_sub_arr[1];
		$('#zip3_r').val(zip3_r);
		$('#zip4_r').val(zip4_r);
	}

	// 도로명 주소 검색시 읍/면 정보 추가
	if(subdong != "" && subdong != "undefined") {
		$('#zip3_sub').val(subdong);
	}else{
		$('#zip3_sub').val("");
	}

	$('#xdot').val(xdot);
	$('#ydot').val(ydot);
	$('#detail_address').focus();
}

var proc = false;

function addDelivery(addr_type){
	var addr_type = $(".btn_tab li.active").data("val");

	if(!checkSpace($('#zip_code_' + addr_type + '1'),"시/도를 선택해주세요")) return;

	var alert_txt = "";
	if(addr_type == "A") {
		if(!checkSpace($('#zip_code_' + addr_type + '2'),"시/군/구를 선택해주세요")) return;
		if(!checkSpace($('#zip_code_' + addr_type + '3'),"동/면/읍을 선택해주세요")) return;
		alert_txt = "번지검색 후";
	}
	else if(addr_type == "R") {
		if(!checkSpace($('#chosung'),"도로 초성을 선택해주세요")) return;
		if(!checkSpace($('#zip_code_' + addr_type + '3'),"도로명을 선택해주세요")) return;
		alert_txt = "건물번호 검색 후";
	}
	else {
		if(!checkSpace($('#zip_code_' + addr_type + '2'),"시/군/구를 선택해주세요")) return;
		alert_txt = "건물상호 검색 후";
	}

	if(!checkSpace($('#zip_code_4'), alert_txt + " 해당되는 주소를 클릭해주세요.")) return;



	var zip1 = $('#zip_code_' + addr_type + '1  option:selected').text();
	var chosung = $('#chosung').val();
	var zip2, zip3, zip4;

	if(addr_type == "A" || addr_type == "R") {
		zip2 = $('#zip_code_' + addr_type + '2  option:selected').text();
		zip3 = $('#zip_code_' + addr_type + '3  option:selected').text();
		zip4 = $('#zip_code_4').val();
	}
	else {
		zip2 = $('#zip_code_' + addr_type + '2  option:selected').text();
		zip3 = "";
		var zip3Arr = $('#zip_code_4').val().split(' ');
		if($('#zip_code_' + addr_type + '3  option:selected').text() == "전체") {
			zip3 = zip3Arr[2];
			if(zip3Arr.length > 4) {
				var tmp="";
				$.each(zip3Arr, function(i, resultVal) {
					if(i > 2) {
						if(i == 3)
							tmp = tmp + resultVal;
						else if(i > 3)
							tmp = tmp + " " + resultVal;
					}
				});
				zip4 = tmp;
			}
			else {
				zip4 = zip3Arr[3];
			}
		}
		else {
			zip3 = $('#zip_code_' + addr_type + '3  option:selected').text();
			if(zip3Arr.length > 4) {
				var tmp="";
				jQuery.each(zip3Arr, function(i, resultVal) {
					if(i > 2) {
						if(i == 3)
							tmp = tmp + resultVal;
						else if(i > 3)
							tmp = tmp + " " + resultVal;
					}
				});
				zip4 = tmp;
			}
			else {
				zip4 = zip3Arr[3];
			}
		}
	}
	// 현재 등록하는 주소지에 따라 road_yn, seek_gbn을 세팅해준다.
	var road_yn = '';
	var seek_gbn = '';
	if(addr_type == "C"){ // 건물상호
		road_yn = 'N';
		seek_gbn = '2';
	}else if(addr_type == "A"){ // 지번
		road_yn = 'N';
		seek_gbn = '3';
	}else{ // 도로명
		road_yn = 'Y';
		seek_gbn = '1';
	}

	if($('#zip3_sub').val() != "") zip3 = $('#zip3_sub').val() + ' ' + zip3;

	var detail = $('#detail_address').val();

	if(proc) {
		alert("배달지 등록중입니다.");
		return;
	}

	proc = true;
	$.ajax({
		type: "POST",
		url: "/delivery/procAjax",
		data: {
			order_gubun : "O",
			address_gubun : "1",
			zip_code1 : encodeURIComponent(zip1),
			zip_code2 : encodeURIComponent(zip2),
			zip_code3 : encodeURIComponent(zip3),
			zip_code4 : encodeURIComponent(zip4),
			chosung : encodeURIComponent(chosung),
			detail_address : encodeURIComponent(detail),
			xdot : $('#xdot').val(),
			ydot : $('#ydot').val(),
			road_yn : road_yn,
			seek_gbn : seek_gbn,
			zip_code3_r : encodeURIComponent($('#zip3_r').val()),
			zip_code4_r : encodeURIComponent($('#zip4_r').val())
		},
		success:function(data) {
			if(data.resultData.result == "success") {
				parent.addDeliveryComplete(data.resultData.delivery);
			} else if(data.resultData.result == "maxDelivery") {
				proc = false;
				alert("배달지는 최대 5개까지 등록 가능합니다.\n추가로 등록하시려면 리스트에서 불필요한 배달지를 삭제 해 주세요.");
				parent.closeLayer();
			} else if(data.resultData.result == "noDelivery") {
				proc = false;
		 		alert("해당 지역은 배달이 불가능한 지역입니다.\n전화(1577-3082) 또는 주변매장에 직접 방문하여 주문해주시기 바랍니다.");
		 		return;
		 	} else {
				proc = false;
				alert("다시 시도해주세요.");
			}

		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});

}
</script>
</html>