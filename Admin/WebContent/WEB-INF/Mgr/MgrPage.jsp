<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
 <!--
    <link rel="icon" href="../../favicon.ico">
   -->



    <title>Pijava</title>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
 


	 
    

	
  </head>

  <body role="document">

       	  
	

 <div>
	<!--  top  --> 
	<jsp:include page="/temp/Mgrtop.jsp" />
 </div>
    
       	  <script charset='UTF=8' >
       	  
       	  var upno = "";
       	  var uppo = "";
       	  
       	  
       		var title;
       	  	$(function(){
       	  		
       	  	/* 	function tog(){
	       	  	$("tbody").slideUp(0);
       	  		$("thead").click(function(){	//기존에 펼쳐진게 있다면 숨기기
       				$("tbody").slideUp(0);
       				//다른 제목 클릭시
       				if(title != this.title){
       					//해당 클릭한 제목의 내용 보이기
       					$(this).next().slideDown(0);
       					//title을 클릭한 제목으로 다시 설정
       					title = this.title;
       				}
       				else{//title과 같은 제목 클릭시
       					title="";
       					$(this).next().slideUp(0);
       				}			
       			});
       	  		
       	  		
       	  		$("button").click(function(){
       	  			if($(this).html()=="주문 승인"){
       	  			if(confirm("주문 승인 하시겠습니까?")){
       	  				alert("주문 승인 완료되었습니다.")
       	  				$(this).html("배달 출발");
       	  				var id = this.id;
       	  				$("."+id).html("주문 상태 - 승인");
       	  			}else{alert("취소되었습니다.")}
       	  			}
       	  			
       	  			else if($(this).html()=="배달 출발"){
           	  			if(confirm("배달 출발 상태로 변경하시겠습니까?")){
           	  				alert("배달 출발 상태로 변경 완료되었습니다.")
           	  				$(this).html("주문 종료");
           	  				var id = this.id;
           	  				$("."+id).html("주문 상태 - 배달출발");
           	  			}else{alert("취소되었습니다.")}
           	  			}
       	  			
       	  			else if($(this).html()=="주문 종료"){
           	  			if(confirm("주문 종료 처리 하시겠습니까?")){
           	  				alert("주문이 종료되었습니다.")
           	  				$(this).html("주문 종료");
           	  				var id = this.id;
           	  				$("."+id+"1").remove();
           	  			}else{alert("취소되었습니다.")}
           	  			}
       	  		});
       	  	} */
       	  	});
       	  	
       	  	
       	  	
       	 var tjax = function(){
 			
 			$.ajax(
 					{url:"<c:url value='/MgrPage.pz'/>",
 					 dataType:"json",
 					 success:call,//함수명(함수포인터)
 				     error:function(request,status,error){
 				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 				       }
 				     }
	
 				  );//.ajax
 			
 		}//tjax
       	 


      	 var update = function(no,up){
  			
  			$.ajax(
  					{url:"<c:url value='/MgrPageUp.pz'/>",
  					 dataType:"text",
  					 data:
  					"no="+no+"&po="+up,
  				     error:function(request,status,error){
  				        alert("실패!!ㅠㅠ");
  				       }
  				     }
 	
  				  );//.ajax
  			
  		}//tjax
 	
 		
 		
 		
 		function call(data){
			
			

			var tableString='';
 			 tableString ='<table class="table table-striped" >';
 			$.each(data,function(index,rec){
 				
 				
 			tableString+='<div><thead style=" vertical-align: middle; background-color: #EEEEEE" title="'+index+'" class="'+index+'">';
 			tableString+='<tr>';
 			tableString+='</tr><th style="width:20%; vertical-align: middle; " >'+rec.name+'('+rec.tel+')</th><th id="'+index+'tb"  class="'+index+'head" style="width: 65%; vertical-align: middle;" >주소: '+rec.addr+'</th><th style="width:15%;  text-align:center; "><span style="color:blue;font-size:0.8em">'+rec.date+'<br/>['+rec.sum+'원]</span></td><th style=" vertical-align:middle;"><span title="'+index+'" class="label label-danger" id="'+index+'" onclick="clicks(this);" style="cursor:pointer;" >'+rec.pro+'</span></th></tr></thead>';
 				tableString+='<tbody class="'+index+'"  >';
 				tableString+='<input type="hidden" id="'+index+'no" value='+rec.no+'>';
 				$.each(rec.menu,function(index2,rec2){
 				tableString+='<tr><td style="border-top:solid;">메뉴</td><td style="border-top:solid;">'+rec2.pname+" "+rec2.size+" "+rec2.dname+'('+rec2.qty+')</td><td style="border-top:solid";></td><td style="border-top:solid";>가격:'+rec2.price+'</td></tr><tr><td>추가토핑</td><td>'+rec2.topping+'</td><td> </td></tr>';
 				});
 					tableString+='</tbody>'
 			});
 						tableString+='</table></div>'
 			$(".col-md-10").html(tableString);
 			
 		}
 		
 		
 		

 		
 		
 		
 		function clicks(test){
 					var id = test.title+"no";
	  				var no = document.getElementById(id);
	  				var up = 0;
 				if(test.innerHTML=="주문 상태 - 미승인"){
	  			if(confirm("주문 승인 처리 하시겠습니까?")){
	  				alert("주문 승인 완료되었습니다.");
	  				test.innerHTML="주문 상태 - 승인";
	  				no = no.value;
	  				up = 1;
	  				update(no,up);
	  			}else{alert("취소되었습니다.")}
	  			}
	  			
	  			else if(test.innerHTML=="주문 상태 - 승인"){
    	  			if(confirm("배달 출발 상태로 변경하시겠습니까?")){
    	  				alert("배달 출발 상태로 변경 완료되었습니다.");
    	  				var id = test.title+"no";
    	  				no = no.value;
	  					up = 2;
	  					update(no,up);
    	  				test.innerHTML="주문 상태 - 배달중";
    	  			}else{alert("취소되었습니다.")}
    	  			}
	  			
	  			else if(test.innerHTML=="주문 상태 - 배달중"){
    	  			if(confirm("주문 종료 처리 하시겠습니까?")){
    	  				alert("주문이 종료되었습니다.");
    	  				no = no.value;
	  					up = 3;
	  					update(no,up);
    	  				var id = test.title;
    	  				$("."+id).remove();
    	  				location.href="#";
    	  			}else{alert("취소되었습니다.")}
    	  			}
	  			else if(test.id.search("tb")){
	  				$("#"+test.id)
	  				
	  			
	  			}
		};
 		
 		
 		$(function(){
 			
 			$.ajax(
 					{url:"<c:url value='/MgrPage.pz'/>",
 					 type:"get",
 					 dataType:"json",
 					 success:call,//함수명(함수포인터)
 					 error:function(data){
 						 alert("에러당ㅋㅋ");
 							console.log("에러:"+data);
 						   }			
 					}
 					
 				  );//.ajax

 				
/* 
 	   	  		$("thead").click(function(){	//기존에 펼쳐진게 있다면 숨기기
 	   	  			
 	   				$("tbody").slideUp(0);
 	   				//다른 제목 클릭시
 	   				if(title != this.title){
 	   					//해당 클릭한 제목의 내용 보이기
 	   					$(this).next().slideDown(0);
 	   					//title을 클릭한 제목으로 다시 설정
 	   					title = this.title;
 	   				}
 	   				else{//title과 같은 제목 클릭시
 	   					title="";
 	   					$(this).next().slideUp(0);
 	   				}			
 	   			});
 	   	  		 */
 	   	  	
 			
 			setInterval(function(){
 				tjax();
 			},5000);
 			
 		});
       	  	
       	  	
       	  
       	  </script>
	
    <div class="container theme-showcase" role="main">
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	      
	      
	  				<h1>${Sname}</h1>
	  				
	  				
	      </div>
		
		
			<!--  실제 내용의 제목 표시 -->
	      <div class="page-header">
	        <h1><span class="label label-primary">주문 내역</span></h1>
	      </div>
	      <div>
	      <!--  실재 내용 표시  -->
	              
	              
	    
	     
       	  <div class="col-md-10">
        
          <span class="test"></span>
        	
        </div>
        
      </div>  
	
          
	      </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
    
   

    
  </body>
</html>
    
    