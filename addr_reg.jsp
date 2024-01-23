<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 주소검색 API (다음제공) -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	function find_addr() {
	
		//Daum API 주소 받아서 넣는 방법
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	//data = {"address", "경기 성남시 분당구 판교역로 166"...}
	        	//alert(data.address);
	        	$("#location").val(data.address);
	
	        }
	    }).open();
	}//end:find_addr()

</script>
</head>
<body>

</body>
</html>