# 安装 #
	-1- composer require --dev doctrine/doctrine-fixtures-bundle

	-2-// app/AppKernel.php
	
	// ...
	// registerBundles()
	if (in_array($this->getEnvironment(), ['dev', 'test'], true)) {
	    // ...
	    $bundles[] = new Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle();
	}

# Loading Fixtures #
	$ php bin/console doctrine:fixtures:load
# 网址 #
	https://symfony.com/doc/current/bundles/DoctrineFixturesBundle/index.html
#DataFixture/PowersTypeFixtures.php
		<?php
	namespace AdministrationBundle\DataFixtures;
	
	use Doctrine\Bundle\FixturesBundle\Fixture;
	use Doctrine\Common\Persistence\ObjectManager;
	use AdministrationBundle\Entity\PowersType;

	class PowersTypeFixtures extends Fixture
	{
	
	    public function getDependencies()
	    {}
	
	    /**
	     *
	     * {@inheritdoc}
	     *
	     * @see \Doctrine\Common\DataFixtures\FixtureInterface::load()
	     */
	    public function load(ObjectManager $manager)
	    {
			//截断表
			  $result = $this->truncateTable($manager);
	        if($result['code'] == 0){
	            echo $result['msg'];
	            return false;
	        }
	        /**
	         *
	         * @var \AdministrationBundle\Repository\PowersTypeRepository $repo
	         */
	        $repo = $manager->getRepository('AdministrationBundle:PowersType');
	        foreach ($this->getPowersType() as $val) {
	            $powerstype = $repo->findOneBy([
	                'code' => $val['code']
	            ]);
	            if (empty($powerstype)) {
	                $powerstype = new PowersType();
	            }
	            $powerstype->setName($val['name']);
	            $powerstype->setCode($val['code']);
	            $manager->persist($powerstype);
	            $manager->flush();
	        }
	    }
		
		private function truncateTable($em)
    {
        $classMetaData = $em->getClassMetadata(Menu::class);
        $connection = $em->getConnection();
        $dbPlatform = $connection->getDatabasePlatform();
        $connection->beginTransaction();
        try {
            $connection->query('SET FOREIGN_KEY_CHECKS=0');
            $q = $dbPlatform->getTruncateTableSql($classMetaData->getTableName());
            $connection->executeUpdate($q);
            $connection->query('SET FOREIGN_KEY_CHECKS=1');
            $connection->commit();
            return [
                'code' => 1,
                'msg' => '执行成功'
            ];
        }catch (\Exception $e) {
            $connection->rollback();
            return [
                'code' => 0,
                'msg' => '执行失败'
            ];
        }
    }
	

	    private function getPowersType()
	    {
	        $powerstype = [
	            [
	                'name'=>'行政许可',
	                'code'=>'01'
	            ],
	            [
	                'name'=>'行政处罚',
	                'code'=>'02'
	            ],
	            [
	                'name'=>'行政强制',
	                'code'=>'03'
	            ],
	            [
	                'name'=>'行政征收',
	                'code'=>'04'
	            ],
	            [
	                'name'=>'行政给付',
	                'code'=>'05'
	            ],
	            [
	                'name'=>'行政裁决',
	                'code'=>'06'
	            ],
	            [
	                'name'=>'行政确认',
	                'code'=>'07'
	            ],
	            [
	                'name'=>'行政奖励',
	                'code'=>'08'
	            ],
	            [
	                'name'=>'行政监督',
	                'code'=>'09'
	            ],
	            [
	                'name'=>'其他行政权力',
	                'code'=>'10'
	            ]
	        ];
	        return $powerstype;
	    }
	}
# resources/services.yml #
	services:
	#    administration.example:
	#        class: AdministrationBundle\Example
	#        arguments: ["@service_id", "plain_value", "%parameter%"]
	  administration.powerstype_datafixtures:
	    class: AdministrationBundle\DataFixtures\PowersTypeFixtures
	    tags: ['doctrine.fixture.orm']
		