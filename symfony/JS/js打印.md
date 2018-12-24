```
<div class="wepper bg_main">
		<!-- 筛选 -->
		<div class="table-responsive bg_white">
			<table class="table table-bordered screen_box border_change" >
				<tr>
				<td width="76" class="text-center">筛选</td>
				<td colspan="20">
					<form action="{{ path('serve_monitoring_index') }}" method="get">
						<label class="screen_label" for="phone">
							<span>资源名称</span>
							<input type="text" class="input" name="name" id="phone" value="{{ app.request.get('name') }}" />
						</label>
						<label class="screen_label" for="name">
							<span>路由名称</span>
							<input type="text" class="input" name="route_name" id="name" value="{{ app.request.get('route_name') }}" />
						</label>
						<input type="submit" class="button-small" value="搜索"/>
						<input type="reset" class="button-small" value="重置"/>
						
						<button class="button bg-blue button-small fr margin-small-left" type="button" onclick="btn_print('parint')">打印</button>
						
						<button class="button bg-blue button-small fr margin-small-left" type="button">导出</button>
					</form>

				</td>
				</tr>
			</table>
		</div>
		
```

1=>引入

```
function btn_print(data) {
   var _data = data;
   $("." + _data).find(".no_print").css("display", "none");
   $(".title." + _data).css({
      "fontSize": "30px",
      "fontWeight": "bold",
      "textAlign": "center",
      "display": "block",
      "marginBottom": "15px"
   });
   $("." + _data).jqprint();
   $("." + _data).find(".no_print").css("display", "table-cell");
   $(".title." + _data).css({
      "fontSize": "30px",
      "fontWeight": "bold",
      "textAlign": "left",
      "display": "inline",
      "marginBottom": "0px"
   });
}
```

2=>引入

```
(function($){var opt;$.fn.jqprint=function(options){opt=$.extend({},$.fn.jqprint.defaults,options);var $element=(this instanceof jQuery)?this:$(this);if(opt.operaSupport&&$.browser.opera)
{var tab=window.open("","jqPrint-preview");tab.document.open();var doc=tab.document;}
else
{var $iframe=$("<iframe  />");if(!opt.debug){$iframe.css({position:"absolute",width:"0px",height:"0px",left:"-600px",top:"-600px"});}
$iframe.appendTo("body");var doc=$iframe[0].contentWindow.document;}
if(opt.importCSS)
{if($("link[media=print]").length>0)
{$("link[media=print]").each(function(){doc.write("<link type='text/css' rel='stylesheet' href='"+$(this).attr("href")+"' media='print' />");});}
else
{$("link").each(function(){doc.write("<link type='text/css' rel='stylesheet' href='"+$(this).attr("href")+"' />");});}}
if(opt.printContainer){doc.write($element.outer());}
else{$element.each(function(){doc.write($(this).html());});}
doc.close();(opt.operaSupport&&$.browser.opera?tab:$iframe[0].contentWindow).focus();setTimeout(function(){(opt.operaSupport&&$.browser.opera?tab:$iframe[0].contentWindow).print();if(tab){tab.close();}},1000);}
$.fn.jqprint.defaults={debug:false,importCSS:true,printContainer:true,operaSupport:true};jQuery.fn.outer=function(){return $($('<div></div>').html(this.clone())).html();}})(jQuery);
```