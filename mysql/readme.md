# 	groupBy分组查询 #

	public function getGroupArr()
		    {
		        return $this->createQueryBuilder('a')
		            ->select('count(a.id) num','a.mark')
		            ->groupBy('a.mark')
		            ->getQuery()
		            ->getResult();
		    }

# 俩表联查 #
	/**
     * 查询关联文件
     * @param $id
     * @return array
     */
    public function searchRelatedFile($id)
    {
        return $this->createQueryBuilder('a')
            ->select('f.id','f.title','f.fileNumber','f.retentionPeriod','f.creater','f.year')
            ->join('ArchiveBundle\Entity\File', 'f','WITH','f.recordId = a.id')
            ->where('a.id = :id')
            ->setParameters(['id' => $id])
            ->orderBy('f.id','DESC')
            ->getQuery()
            ->getResult();
    }
#     where in #
	/**
     * 获取选中的资产信息
     * @param unknown $idsArr
     */
    public function getSelectInfo($idsArr)
    {
        return $this->createQueryBuilder('t')
        ->select('t.id','t.category','t.name','t.model','t.barCode','t.snNumber','t.unit','t.user','t.useDepartment','t.status','t.place','t.suborfinateUnits')
        ->where('t.id in ( :idsArr)')
        ->setParameter('idsArr', $idsArr)
        ->getQuery()
        ->getArrayResult();
    }

# 统计 #
	控制器
	  $arr =[
            '0'=>[
                'name'=>'全部',
                'num'=>0
            ],
            '1'=>[
                'name'=>'已归档',
                'num'=>0
            ],
            '2'=>[
                'name'=>'未归档',
                'num'=>0
            ]
        ];
		 foreach ($groupArr as $v)
        {
            $arr[$v['mark']+1]['num'] = $v['num'];
            $arr[0]['num'] += $v['num'];
        }

	repo
	   public function getGroupArr()
    {
        return $this->createQueryBuilder('a')
            ->select('count(a.id) num','a.mark')
            ->groupBy('a.mark')
            ->getQuery()
            ->getResult();
    }