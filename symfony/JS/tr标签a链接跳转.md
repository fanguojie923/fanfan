#### tr标签外加 < a > < /a >
	//css
	 <style>
        .table .wdzx_wcl{
            cursor: pointer;
        }
    </style>

	//html
	<table class="table">
 	<tr class="wdzx_wcl" data-href="{{ path('web_member_detail',{'id':item.id,'tb':table}) }}">
	
	//js
	 <script>
        /**
         * tr点击跳转
         */
        $(".table .wdzx_wcl").on("click",fun_href)
        function fun_href() {
            var str_href=$(this).attr("data-href");
            location.href=str_href;
        }
    </script>