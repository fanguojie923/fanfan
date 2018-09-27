# 表单类  # 
	->add('remark', null, [
            'label' => '备注',
            'required'=>false //此字段不是必填设置
        ])

# 拿部门的信息 #

	->add('dname', EntityType::class, [
            'label' => '部门名称',
            'class' => 'RbacBundle:Department',  //bundle名称:repo名
            'query_builder' => function (DepartmentRepository $repo) {
                return $repo->createQueryBuilder('a');
            },
            'choice_label' => 'name',  //返回要查询字段列表
        ])

# 单选 #
	 ->add('retentionPeriod', ChoiceType::class, [
            'choices' => [
                '永久' => '1',
                '定期十年' => '2',
                '定期三十年' => '3'
            ],
            'label' => '保管期限',
            'expanded' => true, //设置为单选按钮，false或不设置为select选择框
        ])