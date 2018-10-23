# 第1个问题: 解决GIT代码仓库不同步



> 今天在执行git pull时出现: #

		[root@gitserver /data/work/www/rest/lib/Business/Inventory]# git pull  
	Enter passphrase for key '/root/.ssh/id_rsa':  
	Updating 70e8b93..a0f1a6c  
	error: Your local changes to the following files would be overwritten by merge:  
	        rest/lib/business/inventory/productstatus.php  
	please, commit your changes or stash them before you can merge.  
	aborting 

## 解决办法 ##
	执行git checkout -f，然后再执行git pull重新checkout
	再执行git pull时就可以了:

#第2个问题: git pull的默认地址问题. #
	
	1.git处于master这个branch下时，默认的remote就是origin；
	2.当在master这个brach下使用指定remote和merge的git pull时，使用默认的remote和merge。
	 
	但是对于自己建的项目，并用push到远程服务器上，并没有这块内容，需要自己配置。
	如果直接运行git pull，会得到如此结果：

#当执行git pull之后的提示:#

	$ git pull  
	Password:  
	You asked me to pull without telling me which branch you  
	want to merge with, and 'branch.master.merge' in 
	your configuration file does not tell me, either. Please  
	specify which branch you want to use on the command line and 
	try again (e.g. 'git pull <repository> <refspec>').  
	See git-pull(1) for details.  
	   
	If you often merge with the same branch, you may want to 
	use something like the following in your configuration file:  
	   
	[branch "master"]  
	 remote = <nickname>  
	 merge = <remote-ref>  
	   
	[remote "<nickname>"]  
	 url = <url>  
	 fetch = <refspec>  
	   
	See git-config(1) for details. 



> 解决方法, 通过git config进行如下配置.
	
	git remote add -f origin git@192.168.21.44:rest.git  
	git config branch.master.remote origin  
	git config branch.master.merge refs/heads/master 