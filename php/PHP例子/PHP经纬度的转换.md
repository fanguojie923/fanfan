```
113°7′16‘’ =>113.444729

//经纬度转换
function parseDegree($s) {
    $s = str_replace(['˚', '´'], ['D', ''], $s);
    if (preg_match('/^(\d+)D(\d+(?:\.\d+))$/', $s, $m)){
        return $m[1] + $m[2] / 60.0;
    }

    return false;
}
```