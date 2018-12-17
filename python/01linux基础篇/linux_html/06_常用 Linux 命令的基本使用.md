
<style> @media print{ .hljs{overflow: visible; word-wrap: break-word !important;} }</style></head><body><div class="markdown-body">
<h1 id="toc_0">常用 Linux 命令的基本使用</h1>

<h2 id="toc_1">目标</h2>

<ul>
<li>理解学习 Linux 终端命令的原因</li>
<li>常用 Linux 命令体验</li>
</ul>

<h2 id="toc_2">01. 学习 Linux 终端命令的原因</h2>

<ul>
<li>Linux 刚面世时并没有图形界面，所有的操作全靠命令完成，如 <strong>磁盘操作</strong>、<strong>文件存取</strong>、<strong>目录操作</strong>、<strong>进程管理</strong>、<strong>文件权限</strong> 设定等</li>
<li>在职场中，大量的 <strong>服务器维护工作</strong> 都是在 <strong>远程</strong> 通过 <strong>SSH 客户端</strong> 来完成的，并没有图形界面，所有的维护工作都需要通过命令来完成</li>
<li>在职场中，作为后端程序员，必须要或多或少的掌握一些 Linux 常用的终端命令</li>
<li>Linux 发行版本的命令大概有 200 多个，但是常用的命令只有 10 多个而已</li>
</ul>

<blockquote>
<p>学习终端命令的技巧：</p>

<ul>
<li>不需要死记硬背，对于常用命令，用的多了，自然就记住了</li>
<li>不要尝试一次学会所有的命令，有些命令是非常不常用的，临时遇到，临时百度就可以</li>
</ul>
</blockquote>

<h2 id="toc_3">02. 常用 Linux 命令的基本使用</h2>

<table>
<thead>
<tr>
<th>序号</th>
<th>命令</th>
<th>对应英文</th>
<th>作用</th>
</tr>
</thead>

<tbody>
<tr>
<td>01</td>
<td>ls</td>
<td>list</td>
<td>查看当前文件夹下的内容</td>
</tr>
<tr>
<td>02</td>
<td>pwd</td>
<td>print wrok directory</td>
<td>查看当前所在文件夹</td>
</tr>
<tr>
<td>03</td>
<td>cd [目录名]</td>
<td>change directory</td>
<td>切换文件夹</td>
</tr>
<tr>
<td>04</td>
<td>touch [文件名]</td>
<td>touch</td>
<td>如果文件不存在，新建文件</td>
</tr>
<tr>
<td>05</td>
<td>mkdir [目录名]</td>
<td>make directory</td>
<td>创建目录</td>
</tr>
<tr>
<td>06</td>
<td>rm [文件名]</td>
<td>remove</td>
<td>删除指定的文件名</td>
</tr>
<tr>
<td>07</td>
<td>clear</td>
<td>clear</td>
<td>清屏</td>
</tr>
</tbody>
</table>

<blockquote>
<p>小技巧</p>

<ul>
<li><code>ctrl + shift + =</code> <strong>放大</strong>终端窗口的字体显示</li>
<li><code>ctrl + -</code> <strong>缩小</strong>终端窗口的字体显示</li>
</ul>
</blockquote>

<h3 id="toc_4">03. 自动补全</h3>

<ul>
<li>在敲出 <code>文件</code>／<code>目录</code>／<code>命令</code> 的前几个字母之后，按下 <code>tab</code> 键

<ul>
<li>如果输入的没有歧义，系统会自动补全</li>
<li>如果还存在其他 <code>文件</code>／<code>目录</code>／<code>命令</code>，再按一下 <code>tab</code> 键，系统会提示可能存在的命令</li>
</ul></li>
</ul>

<blockquote>
<p>小技巧</p>

<ul>
<li>按 <code>上</code>／<code>下</code> 光标键可以在曾经使用过的命令之间来回切换</li>
<li>如果想要退出选择，并且不想执行当前选中的命令，可以按 <code>ctrl + c</code></li>
</ul>
</blockquote>

</div></body>

</html>
