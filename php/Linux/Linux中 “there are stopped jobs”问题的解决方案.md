## Linux中 “there are stopped jobs”问题的解决方案

在Linux的shell中输入exit或者logout命令时有时会出现“[there are stopped jobs](http://blog.csdn.net/appleheshuang/article/details/7617304)”，这是由于按下了Ctrl+Z之后使程序或者进程被挂起。可以通过命令输入使之激活或者在后台运行。

在shell中输入命令**jobs**可以查看停止进程列表

输入命令**jobs -l**显示停止进程的详细列表

可以通过如下命令杀死或者激活停止的进程：

**杀死：kill %1**（%1是将要被杀死的job的进程号）

**激活：fg %1**（%1是将要被激活的job的进程号）

fg代表foreground（前台），可以唤醒被suspended（挂起）的进程