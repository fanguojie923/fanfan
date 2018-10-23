# 调用服务器 #
	 $uuid = $this->get('base.uuid_service')->generate();
        if ($uuid['code']==1){
            $loaningNumber = $uuid['data'];
        }