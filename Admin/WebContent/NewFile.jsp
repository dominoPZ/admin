<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>http://www.blueb.co.kr</title>
<script type="text/javascript" src="/data/201011/IJ12901579242621/jquery-1.4.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$('.editable .field').focus(function() {
		$(this).addClass('focused');
	}).blur(function(){
		$(this).removeClass('focused');
	});
});
</script>
<style media="screen" type="text/css">
body {
	margin:0;
	padding:0;
	background:#e1e1e1;
	font:80% Trebuchet MS, Arial, Helvetica, sans-serif;
	color:#555;
	line-height:180%;
}
a{color:#3c70d0;}
img{border:none;}
pre{
	display:block;
	font:12px "Courier New", Courier, monospace;
	padding:10px;
	border:1px solid #bae2f0;
	background:#e3f4f9;	
	margin:.5em 0;
	width:500px;
	}	
	
#container{
	margin:0 auto;
	text-align:left;
	width:600px;
	background:#fff;
	padding:0 50px;
	}
/* */	

/*폼에디터 스타일*/
	form.editable div{margin:.5em 0;clear:both;}
	form.editable label{
		float:left;
		width:150px;
		}
	form.editable fieldset{
		border:2px solid #dfdfdf;
		padding:1em 2em;
		margin:0 0 1.5em 0;
		}
	legend{padding:2px .5em;}	
	.editable .field{
		border:none;
		background:transparent url(/data/201011/IJ12901579242621/ico_edit.gif) no-repeat 0 50%;
		padding:7px 0 7px 20px;
		width:300px;
		line-height:1em;
		margin:0;
		font-weight:bold;
		}
	.editable .field:focus, .editable .focused{
		border:2px solid #dfdfdf;
		padding:5px;
		background:#fff url(/data/201011/IJ12901579242621/bg_input.gif) repeat-x;
		width:300px;
		line-height:1em;
		margin:0;
		outline:none;
		}	
	.editable button{
		color:#fff;
		border:none;
		cursor:pointer;
		height:30px;
		line-height:30px;
		font-weight:bold;
		padding:0 15px;
		background:url(/data/201011/IJ12901579242621/bg_btn.gif) repeat-x;
		text-transform:uppercase;
		}		
		
</style>
</head>

<body>

<div id="container">	
	
	<form id="" action="/" method="post" class="editable">	
	
		<fieldset>
		<legend>개인정보 샘플</legend>

		<div>
			<label for="name">이름</label> 
			<input name="name" id="name" size="30" class="field" type="text" value="블루비" />
		</div>
		<div>
			<label for="email">이메일</label>
			<input name="email" id="email" size="30" class="field" type="text" value="blueb@blueb.co.kr" />
		</div>	
		<div>
			<label for="web">홈페이지</label>
			<input name="web" id="web" size="30" class="field" type="text" value="http://www.blueb.co.kr" />
		</div>	
		<div>
			<label for="twitter">닉네임</label>
			<input name="twitter" id="twitter" size="30" class="field" type="text" value="블루비관리자" />
		</div>	
		</fieldset>
	
		<div class="submit"><button type="submit">Edit</button></div>		
	
	</form>	


</div>

</body>
</html>