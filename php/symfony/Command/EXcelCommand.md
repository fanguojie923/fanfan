> Excle

	- $ composer require liuggio/excelbundle
> app/AppKernel.php

   	$bundles = array(
        // ...
        new Liuggio\ExcelBundle\LiuggioExcelBundle(),
    );


 
> 例子 AddSysUsersCommand文件名与类名相同
	
	<?php

	namespace AdministrationBundle\Command;

	use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
	use Symfony\Component\Console\Output\OutputInterface;
	use Symfony\Component\Console\Input\InputInterface;
	use AdministrationBundle\Entity\SysUsers;

	class AddSysUsersCommand extends ContainerAwareCommand
	{
    protected function configure()
    {
        $this
            ->setName('system:add:sysusers')
            ->setDescription('add SysUsers information.') // 提示
            ->setHelp("This command for add SysUsers information....");
    }

    protected function execute(InputInterface $input,OutputInterface $output)
    {
        // 开始提示
        $output->writeln([
            'Start export data',
            '---------------'
        ]);
        $file = './web/doc/sysusers.xlsx';
        $objReader = \PHPExcel_IOFactory::createReader('Excel2007');/*Excel5 for 2003 excel2007 for 2007*/
        $objPHPExcel = $objReader->load($file); //Excel 路径
        $objWorksheet = $objPHPExcel->getActiveSheet();
        $highestRow = $objWorksheet->getHighestRow();   // 取得总行数
        $highestColumn = $objWorksheet->getHighestColumn();
        $highestColumnIndex = \PHPExcel_Cell::columnIndexFromString($highestColumn);//总列数
        for ($row = 2;$row <= $highestRow;$row++){
            $data = array();
            //注意highestColumnIndex的列数索引从0开始
            for ($col = 0;$col < $highestColumnIndex-1;$col++){
                $str = $objWorksheet->getCellByColumnAndRow($col, $row)->getValue();
                if(is_object($str))  $str= $str->__toString();
                $data[$col] = $str;

            }

            $res = $this->add($data, $output);
            if($res){
                $output->writeln([
                    ''.$row.'ROW SUCCESS'
                ]);
            }
        }
        // 结束提示
        $output->writeln([
            '---------',
            'End flush'
        ]);
    }

    private function add($row,OutputInterface $output)
    {
        $doctrine = $this->getContainer()->get('doctrine');
        $em = $doctrine->getManager();
        set_time_limit(0);

        if(isset($row[0]) && $row[0] != null ){
            $codee = substr($row[17],0,6);
            $em = $doctrine->getManager();
            $repo = $em ->getRepository('AdministrationBundle:Area');
            if (!empty($repo->findOneBy(['areacode'=>$codee]))){
                $name = $repo->findOneBy(['areacode'=>$codee])->getAreaname();
                $parentcode = $repo->findOneBy(['areacode'=>$codee])->getParentid();
                if ($parentcode=='0'){
                    $code='山西省';
                }else{
                    $parentname = $repo->findOneBy(['areacode'=>$parentcode])->getAreaname();
                    $code = $parentname.$name;
                }
            }else{
                $code = '';
            }
            $SysUsers = new SysUsers();
            $SysUsers->setSYSUSERID($row[0]);
            $SysUsers->setUSERID($row[1]);
            $SysUsers->setUSERNAME($row[2]);
            $SysUsers->setPASSWORD($row[3]);
            $SysUsers->setUSERIMG($row[4]);
            $SysUsers->setUSERDUTY($row[5]);
            $SysUsers->setUSERTEL($row[10]);
            $SysUsers->setUSEREMAIL($row[11]);
            $SysUsers->setAREACODE($row[17]);
            $SysUsers->setUSERDISTRICTLEVEL($row[6]);
            $SysUsers->setIDCARD($row[25]);
            $SysUsers->setSYSROLEID($row[7]);
            $SysUsers->setSYSDEPARTMENTID($row[8]);
            $SysUsers->setUSERTYPE($row[19]);
            $SysUsers->setISACTIVE($row[12]);
            $SysUsers->setISEVENTPROCESSEXPERT($row[20]);
            $SysUsers->setISINFOREPORTEXPERT($row[21]);
            $SysUsers->setISINFOAUDITEXPERT($row[22]);
            $SysUsers->setISREGISTACTIVE($row[23]);
            if (!empty($row[24])){
                $SysUsers->setREGISTACTIVETIME(gmdate('Y-m-d H:i:s', round($row[24] - 25569) * 86400));
            }else{
                $SysUsers->setREGISTACTIVETIME($row[24]);
            }

            $SysUsers->setLOGINCOUNT($row[13]);
            $SysUsers->setFONT($row[18]);
            $SysUsers->setUSERORDERBY($row[26]);
            if (!empty($row[14])){
                $SysUsers->setCREATETIME(gmdate('Y-m-d H:i:s', round($row[14] - 25569) * 86400));
            }else{
                $SysUsers->setCREATETIME($row[14]);
            }
            if (!empty($row[15])){
                $SysUsers->setCHANGETIME(gmdate('Y-m-d H:i:s', round($row[15] - 25569) * 86400));
            }else{
                $SysUsers->setCHANGETIME($row[15]);
            }
            if (!empty($row[16])){
                $SysUsers->setLOGINTIME(gmdate('Y-m-d H:i:s', round($row[16] - 25569) * 86400));
            }else{
                $SysUsers->setLOGINTIME($row[16]);
            }
            $SysUsers->setAREANAME($code);
            $em->persist($SysUsers);
            $em->flush();
            return true;
        }
        return false;
    }
	}

> 例子2

	<?php

	namespace ApplyBundle\Command;
	
	use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
	use Symfony\Component\Console\Output\OutputInterface;
	use Symfony\Component\Console\Input\InputInterface;
	use ApplyBundle\Entity\JudicialCate;
	
	class JudicialCateCommand extends ContainerAwareCommand
	{
    protected function configure()
    {
        $this
            ->setName('system:add:judicialcate')
            ->setDescription('add judicialcate information.')// 提示
            ->setHelp("This command for add judicialcate information....");
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
	// 开始提示
        $output->writeln([
            'Start export data',
            '---------------'
        ]);
        $file = './web/doc/judicial.xlsx';
        $objReader = \PHPExcel_IOFactory::createReader('Excel2007');/*Excel5 for 2003 excel2007 for 2007*/
        $objPHPExcel = $objReader->load($file); //Excel 路径
        $objWorksheet = $objPHPExcel->getActiveSheet();
        $highestRow = $objWorksheet->getHighestRow();   // 取得总行数
        $highestColumn = $objWorksheet->getHighestColumn();
        $highestColumnIndex = \PHPExcel_Cell::columnIndexFromString($highestColumn);//总列数
        for ($row = 2; $row <= $highestRow; $row++) {
            $data = array();
	//注意highestColumnIndex的列数索引从0开始
            for ($col = 0; $col <= $highestColumnIndex - 1; $col++) {
                $str = $objWorksheet->getCellByColumnAndRow($col, $row)->getValue();
                if (is_object($str)) $str = $str->__toString();
                $data[$col] = $str;

            }

            $res = $this->add($data, $output);
            if ($res) {
                $output->writeln([
                    '' . $row . 'ROW SUCCESS'
                ]);
            }
        }
	// 结束提示
        $output->writeln([
            '---------',
            'End flush'
        ]);
    }

    private function add($row, OutputInterface $output)
    {
        $doctrine = $this->getContainer()->get('doctrine');
        $em = $doctrine->getManager();
        set_time_limit(0);

        if (isset($row[0]) && $row[0] != null) {
            $em = $doctrine->getManager();
            $repo = $em->getRepository('ApplyBundle:JudicialCate');
            $judicialCate = new JudicialCate();
            $judicialCate->setName($row[0]);
            $judicialCate->setCode($row[1]);
            $judicialCate->setParentCode($row[2]);
            $judicialCate->setLevel($row[3]);
            $judicialCate->setCreateAt(new \DateTime());
            $judicialCate->setUpdateAt(new \DateTime());
            $em->persist($judicialCate);
            $em->flush();
            return true;
        }
        return false;
    }
	}