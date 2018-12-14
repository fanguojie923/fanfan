<style> @media print{ .hljs{overflow: visible; word-wrap: break-word !important;} }</style></head><body><div class="markdown-body">
<h1 id="toc_0">Linux 终端命令格式</h1>

<h2 id="toc_1">目标</h2>

<ul>
<li>了解终端命令格式</li>
<li>知道如何查阅终端命令帮助信息</li>
</ul>

<h2 id="toc_2">01. 终端命令格式</h2>

<pre><code class="language-bash">command [-options] [parameter]
</code></pre>

<p>说明：</p>

<ul>
<li><code>command</code>：命令名，相应功能的英文单词或单词的缩写</li>
<li><code>[-options]</code>：选项，可用来对命令进行控制，也可以省略</li>
<li><code>parameter</code>：传给命令的参数，可以是 <strong>零个</strong>、<strong>一个</strong> 或者 <strong>多个</strong></li>
</ul>

<blockquote>
<p><code>[]</code> 代表可选 </p>
</blockquote>

<h2 id="toc_3">02. 查阅命令帮助信息（知道）</h2>

<blockquote>
<p>提示</p>

<ul>
<li>现阶段只需要 <strong>知道</strong> 通过以下两种方式可以查询命令的帮助信息</li>
<li>先学习<strong>常用命令</strong>及<strong>常用选项</strong>的使用即可，工作中如果遇到问题可以借助 <strong>网络搜索</strong></li>
</ul>
</blockquote>

<h3 id="toc_4">2.1 <code>--help</code></h3>

<pre><code class="language-bash">command --help
</code></pre>

<p>说明：</p>

<ul>
<li>显示 <code>command</code> 命令的帮助信息</li>
</ul>

<h3 id="toc_5">2.2 man</h3>

<pre><code class="language-bash">man command
</code></pre>

<p>说明：</p>

<ul>
<li>查阅 <code>command</code> 命令的使用手册</li>
</ul>

<blockquote>
<p><code>man</code> 是 <strong>manual</strong> 的缩写，是 Linux 提供的一个 <strong>手册</strong>，包含了绝大部分的命令、函数的详细使用说明</p>
</blockquote>

<p>使用 <code>man</code> 时的操作键：</p>

<table>
<thead>
<tr>
<th>操作键</th>
<th>功能</th>
</tr>
</thead>

<tbody>
<tr>
<td>空格键</td>
<td>显示手册页的下一屏</td>
</tr>
<tr>
<td>Enter 键</td>
<td>一次滚动手册页的一行</td>
</tr>
<tr>
<td>b</td>
<td>回滚一屏</td>
</tr>
<tr>
<td>f</td>
<td>前滚一屏</td>
</tr>
<tr>
<td>q</td>
<td>退出</td>
</tr>
<tr>
<td>/word</td>
<td>搜索 <strong>word</strong> 字符串</td>
</tr>
</tbody>
</table>

</div></body>

</html>
