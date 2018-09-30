## 数组去重的函数 ##
    function unique(arr){
    	var res = [];
    	var obj = {};
    	for(var i=0; i<arr.length; i++){
    		if( !obj[arr[i]] ){
    		obj[arr[i]] = 1;
    		res.push(arr[i]);
   			 }
   		 }
    	return res;
    }

## Js多选框判断是否选中 ##
	$('input[type="checkbox"]').on('click',function(){
		   if (this.checked==true){
			   ids.push(this.value);
		   }

	 })

## 删除数组中的指定某一个 ##
	Array.prototype.remove = function(val) {
       var index = this.indexOf(val);
       if (index > -1) {
           this.splice(index, 1);
       }
   	};
	这样就构造了这样一个函数，比如我有有一个数组：
	
	var emp = ['abs','dsf','sdf','fd']
	假如我们要删除其中的 'fd' ,就可以使用：
	
	emp.remove('fd');
	//点击全选
	<input type="checkbox" name="" id="all" value="22" onclick="iselect()">
	<input type="checkbox" name="ids" id="" value="{{ item.id }}" />
	function iselect(){
	   var idss = document.getElementsByName("ids");
	   var id = document.getElementById("all");
	   for(var i=0;i<idss.length;i++){
	       if (id.checked) {
	           // console.log(idss[i].value);
               ids.push(idss[i].getAttribute('value'));
		   }else{
               ids.remove(idss[i].value);
		   }
	   }
   	}

#多选中只能选择一个 #
	
	<form id="test">
	    <input name="check1" type="checkbox" />check1
	    <input name="check2" type="checkbox" />check2
	    <input name="check3" type="checkbox" />check3
	</form>
	 
	<script>
	$(document).ready(function(){
	    $('#test').find('input[type=checkbox]').bind('click', function(){
	        $('#test').find('input[type=checkbox]').not(this).attr("checked", false);
	    });
	});
	</script>
