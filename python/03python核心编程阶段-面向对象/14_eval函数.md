<style> @media print{ .hljs{overflow: visible; word-wrap: break-word !important;} }</style></head><body><div class="markdown-body">
<h1 id="toc_0"><code>eval</code> 函数</h1>

<p><code>eval()</code> 函数十分强大 —— <strong>将字符串</strong> 当成 <strong>有效的表达式</strong> 来求值 并 <strong>返回计算结果</strong></p>

<pre><code class="language-python"># 基本的数学计算
In [1]: eval(&quot;1 + 1&quot;)
Out[1]: 2

# 字符串重复
In [2]: eval(&quot;&#39;*&#39; * 10&quot;)
Out[2]: &#39;**********&#39;

# 将字符串转换成列表
In [3]: type(eval(&quot;[1, 2, 3, 4, 5]&quot;))
Out[3]: list

# 将字符串转换成字典
In [4]: type(eval(&quot;{&#39;name&#39;: &#39;xiaoming&#39;, &#39;age&#39;: 18}&quot;))
Out[4]: dict
</code></pre>

<h2 id="toc_1">案例 - 计算器</h2>

<p><strong>需求</strong></p>

<ol>
<li>提示用户输入一个 <strong>加减乘除混合运算</strong></li>
<li>返回计算结果</li>
</ol>

<pre><code class="language-python">input_str = input(&quot;请输入一个算术题：&quot;)

print(eval(input_str))

</code></pre>

<h2 id="toc_2">不要滥用 <code>eval</code></h2>

<blockquote>
<p>在开发时千万不要使用 <code>eval</code> 直接转换 <code>input</code> 的结果</p>
</blockquote>

<pre><code class="language-python">__import__(&#39;os&#39;).system(&#39;ls&#39;)
</code></pre>

<ul>
<li>等价代码</li>
</ul>

<pre><code class="language-python">import os

os.system(&quot;终端命令&quot;)
</code></pre>

<ul>
<li>执行成功，返回 0</li>
<li>执行失败，返回错误信息</li>
</ul>

</div></body>

</html>
