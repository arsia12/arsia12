<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Shop</title>
</head>
<body>
<div>
	<form method="POST" action="joinEnd" name="jf">
		<input type="text" id="id" name="id" placeholder="아이디">
		<input type="button" id="idCheck" onclick="checkId()" value="중복확인"><br>
		<input type="hidden" id="useId" vlaue="false">
		<input type="password" id="pwd" name="pwd" placeholder="비밀번호"><br>
		<input type="password" id="pwd2" name="pwd2" placeholder="비밀번호확인"><br>
		<input type="text" id="name" name="name" placeholder="이름"><br>
		<input type="text" id="hp" name="hp" placeholder="연락처 ex)01012341234"><br>
		<input type="text" id="email" name="email" placeholder="이메일"><br>
		<input type="text" id="postcode" name="postcode" readonly="readonly" placeholder="우편번호">
		<input type="button" onclick="addrSearch()" value="우편번호 찾기"><br>
		<input type="text" id="addr1" name="addr1" readonly="readonly" placeholder="주소"><br>
		<input type="text" id="addr2" name="addr2" placeholder="상세주소"><br>
		<input type="button" id="joinBtn" onclick="join()" value="회원가입">
	</form>
</div>


<script>
    function addrSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
               
                var fullAddr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    fullAddr = data.roadAddress;

                } else { 
                    fullAddr = data.jibunAddress;
                }

              
                if(data.userSelectedType === 'R'){
                  
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                   
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                   
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('addr1').value = fullAddr;

                document.getElementById('addr2').focus();
            }
        }).open();
    }
    
    var checkId=function(){
    	var id=$("#id").val();
    	var vdata='id='+id;
    	$.ajax({
    		type:'POST',
    		url:'idCheck',
    		data:vdata,
    		success:function(res){
    			var n=res;
    			if(parseInt(n)>0){
    				alert('사용가능한 아이디입니다.')
    				$('#useId').val('true');
    			}else{
    				alert('이미 사용중인 아이디입니다');
    				$('#useId').val('false');
    			}
    		},
    		error:function(e){
    			alert("error : "+e.status);
    		}
    	});
    }
    
    var join=function(){
    	if(!jf.id.value){
    		alert("아이디를 입력하세요");
    		jf.id.focus();
    		return;
    	}
    	if(!jf.pwd.value){
    		alert("비밀번호를 입력하세요");
    		jf.pwd.focuse();
    		return;
    	}
    	if(jf.pwd.value !== jf.pwd2.value){
    		alert("비밀번호를 확인해주세요");
    		jf.pwd.focus();
    		return;
    	}
    	if(!jf.name.value){
    		alert("이름을 입력하세요");
    		jf.name.focus();
    		return;
    	}
    	if(!jf.hp.value){
    		alert("핸드폰번호를 입력하세요");
    		jf.hp.focus();
    		return;
    	}
    	if(!jf.email.value){
    		alert("이메일을 입력하세요")
    		jf.email.focus();
    		return;
    	}
    	if(!jf.postcode.value || !jf.addr1.value || !jf.addr2.value){
    		alert("주소를 입력하세요")
    		jf.addr2.focus();
    		return;
    	}
    	if(!isEmail(jf.email)){
    		alert("이메일을 확인해주세요");
    		jf.email.focus();
    		return;
    	}
    	if(!isHp(jf.hp)){
    		alert("핸드폰번호를 확인해주세요")
    		jf.hp.focus();
    		return;
    	}
    	if(jf.useId.value=='false'){
    		alert('아이디를 확인해주세요');
    		jf.id.focus();
    		return;
    	}
    	jf.submit();	
    }
    
    
    var isEmail=function(email){
    	var pattern=new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
		var result=pattern.test(email.value);
		return result;
    }
    
    var isHp=function(hp){
		var pattern=new RegExp(/\b\d{11}\b/);
		var result=pattern.test(hp.value);
		return result;
	}
</script>
</body>
</html>