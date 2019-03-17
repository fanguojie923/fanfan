##### ajax 处理表单数据提交

​	

```php
表单：
<form enctype="multipart/form-data" method="post" >
     <div class="form-group dashed" style="margin-bottom: 5px">
            <div class="label">
                <label for="TargetAmount"><font class="text-red">*</font> 报价项目：</label>
            </div>
            <div class="button-group border-main checkbox" id="project">
                {volist name="$cates" id="cate"}
                <label class="button">
                    <input name="cates[]" value="{$cate.id}" type="checkbox" data-validate="required:请选择,length#>=1:至少选择1项">{$cate.cate_name}
                </label>
                 {/volist}
            </div>
        </div>
<div class="form-group dashed" style="margin-bottom: 5px">
        <div class="label">
            <label for="file"><font class="text-red">*</font> 附件上传：</label>
        </div>
        <div class="field">
            <div class="input-group" style="display: block">
                <input type="file" id="file"  name="file" width="100%" placeholder="" data-validate="required:必填" style="border-radius: 4px;"/>
            </div>
        </div>
    </div>
    <div class="button_xyb_btn">
            <button class="button layui-default" lay-filter="add" lay-submit="" type="button" id="submit">提交</button>
        <font>*</font>提交后，产品经理将在1个月工作日内与你联系，如需加急，请联系产品经理--张知宇</span>
    </div>
</form>
```

> JS处理

```php
 $('#submit').click(function() {
        var from = new FormData();
        var name = $('#TargetAmount').val();
        var contact = $('#contact').val();
        var phone = $('#phone').val();
        var text = $('#text').val();
        var file = $('#file').get(0).files[0];//文件不用插件处理这样接收
        var vals = new Array();//多选的处理
        $("input:checkbox[name='cates[]']:checked").each(function(i) {
            vals[i] = $(this).val();
        });
         var cates = vals.join(",");
     
            from.append("cates", cates);
            from.append("name", name);
            from.append("contact", contact);
            from.append("phone", phone);
            from.append("text", text);
            from.append("file", file);

            $.ajax({
                type: 'post',
                url: "{:url('index/Index/index')}",
                data: from,
                dataType: 'json',
                contentType: false,// 不要设置Content-Type请求头
                processData: false,// 不要处理发送的数据
                success: function (msg) {
                    if (msg.code == 1){
                        layer.msg(msg.msg, {icon: 1});
                        window.setTimeout(function () {
                            //关闭当前frame
                            location.href="{:url('Index/index')}";
                            window.parent.location.reload();
                        },2000)
                    }else{
                        layer.msg(msg.msg, {icon: 5});

                    }
                }
            });

        return false;
    });
</script>
```

> 控制器处理

```php
if (request()->isPost()){
            $file = request()->file('file');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->validate(['size'=>204800])->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
//                $domain = request()->domain();
//                $filename = $domain.DS.'uploads'.DS.$info->getSaveName();
                $filename =str_replace("\\","/", $info->getSaveName());
            }else{
                // 上传失败获取错误信息
                return json(['code'=>2,'msg'=>'附件上传问题，请检查附件']);
                return $this->error('附件上传问题，请检查附件');
            }
            $data = input('post.');
            $offer = [];
            $offer['name'] = $data['name'];
            $offer['contact'] = $data['contact'];
            $offer['phone'] = $data['phone'];
            $offer['text'] = $data['text'];
//            $offer['cates'] = implode(',',$data['cates']);
            $offer['cates'] = $data['cates'];
            $offer['path'] = $filename;
            $offer['create_time'] = time();
            $offer['update_time'] = time();
            $offer['uid'] = session('webUser')['id'];
            $res =  Db::table('mini_offer')->insert($offer);
            if ($res){
                return json(['code'=>1,'msg'=>'提交成功']);
//                return $this->success('提交成功','Index/index');
            }else{
                return json(['code'=>2,'msg'=>'提交失败']);
//                return $this->fail('提交失败');
            }
```