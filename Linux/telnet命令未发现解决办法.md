# 提示-bash: telnet: command not found的解决方法 #
	[root@localhost ~]# telnet 127.0.0.1
	-bash: telnet: command not found

# 解决方法: 安装telnet服务 #

	yum list telnet*              列出telnet相关的安装包
    yum install telnet-server          安装telnet服务
    yum install telnet.*           安装telnet客户端

	
> [root@localhost ~]# yum list telnet* 
> 
	Loaded plugins: fastestmirror, refresh-packagekit, security
	Loading mirror speeds from cached hostfile
	 * base: mirrors.cn99.com
	 * extras: mirrors.shu.edu.cn
	 * updates: mirrors.cn99.com
	Available Packages
	telnet.x86_64                            1:0.17-48.el6                      base
	telnet-server.x86_64                     1:0.17-48.el6                      base


	
	
> [root@localhost ~]# yum install telnet-server

	Loaded plugins: fastestmirror, refresh-packagekit, security
	Loading mirror speeds from cached hostfile
	 * base: mirrors.cn99.com
	 * extras: mirrors.shu.edu.cn
	 * updates: mirrors.cn99.com
	Setting up Install Process
	Resolving Dependencies
	--> Running transaction check
	---> Package telnet-server.x86_64 1:0.17-48.el6 will be installed
	--> Finished Dependency Resolution
		Dependencies Resolved
		================================================================================
		 Package               Arch           Version                Repository    Size
		================================================================================
		Installing:
		 telnet-server         x86_64         1:0.17-48.el6          base          37 k
		
		Transaction Summary
		======================================================	==========================
		Install       1 Package(s)
		
		Total download size: 37 k
		Installed size: 54 k
		Is this ok [y/N]: y
		Downloading Packages:
		telnet-server-0.17-48.el6.x86_64.rpm                     |  37 kB     00:00     
		Running rpm_check_debug
		Running Transaction Test
		Transaction Test Succeeded
		Running Transaction
		Warning: RPMDB altered outside of yum.
		  Installing : 1:telnet-server-0.17-48.el6.x86_64                           1/1 
		  Verifying  : 1:telnet-server-0.17-48.el6.x86_64                           1/1 
		
		Installed:
		  telnet-server.x86_64 1:0.17-48.el6                                            
		
		Complete!
		[root@localhost ~]#


	
> [root@localhost ~]# yum install telnet.*

	Loaded plugins: fastestmirror, refresh-packagekit, security
	Loading mirror speeds from cached hostfile
	 * base: mirrors.cn99.com
	 * extras: mirrors.shu.edu.cn
	 * updates: mirrors.cn99.com
	Setting up Install Process
	Resolving Dependencies
	--> Running transaction check
	---> Package telnet.x86_64 1:0.17-48.el6 will be installed
	--> Finished Dependency Resolution
	
	Dependencies Resolved
	
	====================================================================================================================================
	 Package                       Arch                          Version                              Repository                   Size
	====================================================================================================================================
	Installing:
	 telnet                        x86_64                        1:0.17-48.el6                        base                         58 k
	
	Transaction Summary
	====================================================================================================================================
	Install       1 Package(s)
	
	Total download size: 58 k
	Installed size: 109 k
	Is this ok [y/N]: y
	Downloading Packages:
	telnet-0.17-48.el6.x86_64.rpm                                                                                |  58 kB     00:00     
	Running rpm_check_debug
	Running Transaction Test
	Transaction Test Succeeded
	Running Transaction
	  Installing : 1:telnet-0.17-48.el6.x86_64                                                                                      1/1 
	  Verifying  : 1:telnet-0.17-48.el6.x86_64                                                                                      1/1 
	
	Installed:
	  telnet.x86_64 1:0.17-48.el6                                                                                                       
	
	Complete!
	[root@localhost ~]#