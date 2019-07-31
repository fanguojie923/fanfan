# 表格验证 #
> NotBlank
	验证值不为空，定义为不等于空字符串且也不等于null

	use Symfony\Component\Validator\Constraints as Assert;
	/**
     * @Assert\NotBlank()
     */
> NOTNULL验证值不严格等于null

	 / ** 
     * @Assert \ NotNull（）
     * /

>  Range验证给定数字是否在某个最小和最大数字之间。

	/ ** 
	     * @Assert \ Range（
	     * min = 120，
	     * max = 180，
	     * minMessage =“你必须至少{{limit}}厘米高才能输入”，
	     * maxMessage =“你不能更高比{{limit}} cm输入“ 
	     *）
	     * / 
	     protected  $ height ; 