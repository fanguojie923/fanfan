# php几种根据生日计算年龄的方法

方法一： 

```

/**
     * @uses 根据生日计算年龄，年龄的格式是：2016-09-23
     * @param string $birthday
     * @return string|number
     */
    public function calcAge($birthday) {
    	$iage = 0;
    	if (!empty($birthday)) {
    		$year = date('Y',strtotime($birthday));
    		$month = date('m',strtotime($birthday));
    		$day = date('d',strtotime($birthday));
    		
    		$now_year = date('Y');
    		$now_month = date('m');
    		$now_day = date('d');
    
    		if ($now_year > $year) {
    			$iage = $now_year - $year - 1;
    			if ($now_month > $month) {
    				$iage++;
    			} else if ($now_month == $month) {
    				if ($now_day >= $day) {
    					$iage++;
    				}
    			}
    		}
    	}
    	return $iage;
    }
```

方法二： 

```
public function calcAge($birthday) {
    	$age = 0;
    	if(!empty($birthday)){
    		$age = strtotime($birthday);
    		if($age === false){
    			return 0;
    		}
    		
    		list($y1,$m1,$d1) = explode("-",date("Y-m-d", $age));
    		
    		list($y2,$m2,$d2) = explode("-",date("Y-m-d"), time());
    		
    		$age = $y2 - $y1;
    		if((int)($m2.$d2) < (int)($m1.$d1)){
    			$age -= 1;
    		}
    	}
    	return $age;
    }
```

