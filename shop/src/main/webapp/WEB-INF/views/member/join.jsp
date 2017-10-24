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
		<input type="text" id="id" name="id" placeholder="���̵�">
		<input type="button" id="idCheck" onclick="checkId()" value="�ߺ�Ȯ��"><br>
		<input type="hidden" id="useId" vlaue="false">
		<input type="password" id="pwd" name="pwd" placeholder="��й�ȣ"><br>
		<input type="password" id="pwd2" name="pwd2" placeholder="��й�ȣȮ��"><br>
		<input type="text" id="name" name="name" placeholder="�̸�"><br>
		<input type="text" id="hp" name="hp" placeholder="����ó ex)01012341234"><br>
		<input type="text" id="email" name="email" placeholder="�̸���"><br>
		<input type="text" id="postcode" name="postcode" readonly="readonly" placeholder="�����ȣ">
		<input type="button" onclick="addrSearch()" value="�����ȣ ã��"><br>
		<input type="text" id="addr1" name="addr1" readonly="readonly" placeholder="�ּ�"><br>
		<input type="text" id="addr2" name="addr2" placeholder="���ּ�"><br>
		<input type="button" id="joinBtn" onclick="join()" value="ȸ������">
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
    				alert('��밡���� ���̵��Դϴ�.')
    				$('#useId').val('true');
    			}else{
    				alert('�̹� ������� ���̵��Դϴ�');
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
    		alert("���̵� �Է��ϼ���");
    		jf.id.focus();
    		return;
    	}
    	if(!jf.pwd.value){
    		alert("��й�ȣ�� �Է��ϼ���");
    		jf.pwd.focuse();
    		return;
    	}
    	if(jf.pwd.value !== jf.pwd2.value){
    		alert("��й�ȣ�� Ȯ�����ּ���");
    		jf.pwd.focus();
    		return;
    	}
    	if(!jf.name.value){
    		alert("�̸��� �Է��ϼ���");
    		jf.name.focus();
    		return;
    	}
    	if(!jf.hp.value){
    		alert("�ڵ�����ȣ�� �Է��ϼ���");
    		jf.hp.focus();
    		return;
    	}
    	if(!jf.email.value){
    		alert("�̸����� �Է��ϼ���")
    		jf.email.focus();
    		return;
    	}
    	if(!jf.postcode.value || !jf.addr1.value || !jf.addr2.value){
    		alert("�ּҸ� �Է��ϼ���")
    		jf.addr2.focus();
    		return;
    	}
    	if(!isEmail(jf.email)){
    		alert("�̸����� Ȯ�����ּ���");
    		jf.email.focus();
    		return;
    	}
    	if(!isHp(jf.hp)){
    		alert("�ڵ�����ȣ�� Ȯ�����ּ���")
    		jf.hp.focus();
    		return;
    	}
    	if(jf.useId.value=='false'){
    		alert('���̵� Ȯ�����ּ���');
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