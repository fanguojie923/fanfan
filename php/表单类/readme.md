	{{  form_start ( form ,  { 'action' :  path ( 'target_route' ),  'method' :  'GET' })  }}
# 表单类  # 
	->add('remark', null, [
	        'label' => '备注',
	        'required'=>false //此字段不是必填设置
	    ])

# 拿部门的信息 #

	// use Symfony\Bridge\Doctrine\Form\Type\EntityType;
	->add('dname', EntityType::class, [
	        'label' => '部门名称',
	        'class' => 'RbacBundle:Department',  //bundle名称:repo名
	        'query_builder' => function (DepartmentRepository $repo) {
	            return $repo->createQueryBuilder('a');
	        },//条件
	        'choice_label' => 'name',  //返回要查询字段列表
	         'choice_value' => 'code',//选中value 设置 字段名name的值
	         'choice_label' => function ($choiceValue, $key, $value) {//$choiceValue选中的值//$key字段名//value字段值
	         
	                if ($value == $choiceValue) {
	                    return 'Definitely!';
	                }
	        		return strtoupper($key);
	    	},
	    ])

# 单选 #
	// use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
	->add('retentionPeriod', ChoiceType::class, [
	        'choices' => [
	            '永久' => '1',
	            '定期十年' => '2',
	            '定期三十年' => '3'
	        ],
	        'label' => '保管期限',
			'empty_data'   =>  null,
			'required'     =>  false,
```
		'multiple'   =>  true,允许用户选择多个值
         'placeholder' => 'Choose your gender',//占位符
         'expanded' => true, //设置为单选按钮，false或不设置为select选择框
          'data' => $options['data_status'],//默认选中checked
        ])
         /**
          *
          * {@inheritdoc}
          *
          */
         public function configureOptions(OptionsResolver $resolver)
         {
             $resolver->setDefaults(array(
                 'data_class' => 'DispatchBundle\Entity\CanalCategory',
                 'data_status' => 1 //默认选中 1
             ));
         }
```




# 正常string字段 #
	$builder->add('projectName', null, [
	            'label' => '项目名称',
	            'attr' => [
	                'class' => 'input',
	                'placeholder' =>'请填写'
	            ]
	        ])
# 文本域 #
	 ->add('remarks', TextareaType::class, [
	        'label' => '备注',
	        'attr' => [
	            'class' => 'input jy',
	            'rows' => 4,
	            'placeholder' =>'请填写备注'
	        ],
# 前台页面写法 #
	 {{ form_start(form, {'attr': {'novalidate': 'novalidate', 'class': 'form-x', 'id': 'form'}}) }}


```
{{ form_widget(form.fileNumber,{'attr':{'class':'input border_bottom','placeholder':'请填写'}}) }}
{{ form_end(form) }}
```



#表单数据的修改
	$form -> get ( 'dueDate' ) -> getData ();
	$form -> get ( 'dueDate' ) -> setData ( new  \DateTime ());

# 将表单定义为Service #
	# src/AppBundle/Resources/config/services.yml 
	services : 
	acme_demo.form.type.task : 
	    class :  AppBundle\Form\Type\TaskType 
	    tags : 
	        -  {  name :  form.type ,  alias :  task  }
# 表单提交处理 #
	if  ( $form -> isValid ())  { 
	    $em  =  $this -> getDoctrine () -> getManager (); 
	    $em -> persist ( $task ); 
	    $em -> flush ();
	
	    return  $this -> redirectToRoute ( 'task_success' ); 
	}
	$task  =  $form -> getData ();
# 表单主题 #
	Twig
	{# app/Resources/views/form/fields.html.twig #} 
	{%  block  form_row  %} 
	{%  spaceless  %} 
	    <div  class= "form_row" > 
	        {{  form_label ( form )  }} 
	        {{  form_errors ( form )  }} 
	        {{  form_widget ( form )  }} 
	    </div> 
	{%  endspaceless  %} 
	{%  endblock  form_row  %}
	
	Twig
	{# app/Resources/views/default/new.html.twig #} 
	{%  form_theme  form  'form/fields.html.twig'  %}
	
	{%  form_theme  form  'form/fields.html.twig'  'form/fields2.html.twig'  %}
	
	{# ... render the form #}
# 表单函数命名规则 #
		label	
	（比如form_label）
	
	显示表单的label
	
	widget	
	（比如form_widget）
	
	显示表单字段的HTML
	
	errors	
	（比如form_errors）
	
	显示字段错误信息
	
	row	
	（比如form_row）
	
	显示表单字段的row（包括label, widget 已经errors）
# 全局表单主题 #
	YAML
	# app/config/config.yml 
	twig : 
	    form_themes : 
	        -  'form/fields.html.twig' 
	    # ...
# 在单个Twig文件里自定义表单输出 #
	{%  extends  'base.html.twig'  %}
	
	{# import "_self" as the form theme #} 
	{%  form_theme  form  _ self  %}
	
	{# make the form fragment customization #} 
	{%  block  form_row  %} 
	    {# custom field row output #} 
	{%  endblock  form_row  %}
	
	{%  block  content  %} 
	    {# ... #}
	
	    {{  form_row ( form.task )  }} 
	{%  endblock  %}
# 	自定义 #
		{# src/AppBundle/Resources/views/Form/fields.html.twig #}
	{% block gender_widget %}
	    {% spaceless %}
	        {% if expanded %}
	            <ul {{ block('widget_container_attributes') }}>
	            {% for child in form %}
	                <li>
	                    {{ form_widget(child) }}
	                    {{ form_label(child) }}
	                </li>
	            {% endfor %}
	            </ul>
	        {% else %}
	            {# just let the choice widget render the select tag #}
	            {{ block('choice_widget') }}
	        {% endif %}
	    {% endspaceless %}
	{% endblock %}