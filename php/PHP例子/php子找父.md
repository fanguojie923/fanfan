   

```php
// $src = '[{"id":"1","name":"媒体(白名单)","pid":"0"},{"id":"2","name":"党媒公共平台","pid":"0"},{"id":"3","name":"政府机构","pid":"0"},{"id":"4","name":"其他","pid":"0"},{"id":"5","name":"中央媒体","pid":"1"},{"id":"6","name":"地方媒体","pid":"1"},{"id":"7","name":"门户媒体","pid":"4"},{"id":"8","name":"综合媒体","pid":"4"},{"id":"9","name":"专业媒体","pid":"4"},{"id":"11","name":"河北省","pid":"6"},{"id":"12","name":"山东省","pid":"6"},{"id":"13","name":"辽宁省","pid":"6"},{"id":"34","name":"北京","pid":"6"},{"id":"45","name":"视频","pid":"9"},{"id":"46","name":"教育","pid":"9"},{"id":"79","name":"法律","pid":"9"},{"id":"80","name":"其他","pid":"9"},{"id":"81","name":"文学","pid":"9"}]';
 
 $src = '[{"catalogue_id":"1000","parent_id":"0","name":"\u9646\u519b\u8fb9\u6d77\u9632\u5b66\u9662","book_id":"15579767149327","level":0,"str":"","has_son":1},{"catalogue_id":"1001","parent_id":"1000","name":"\u9662\u672c\u90e8","book_id":"15579767149327","level":1,"str":"|--","has_son":1},{"catalogue_id":"15579767149327","parent_id":"1001","name":"\u9662\u9996\u957f","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579767299484","parent_id":"1001","name":"\u9662\u529e\u516c\u5ba4","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579769933710","parent_id":"1001","name":"\u6559\u52a1\u5904","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579770075954","parent_id":"1001","name":"\u6559\u4fdd\u5904","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579770284853","parent_id":"1001","name":"\u79d1\u7814\u5b66\u672f\u5904","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579770565206","parent_id":"1001","name":"\u653f\u6cbb\u5de5\u4f5c\u5904","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579770746926","parent_id":"1001","name":"\u7eaa\u68c0\u76d1\u5bdf\u5904","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579770900592","parent_id":"1001","name":"\u5b89\u5168\u7ba1\u7406\u5904","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579771738719","parent_id":"1001","name":"\u4f9b\u5e94\u4fdd\u969c\u5904","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579771822961","parent_id":"1001","name":"\u57fa\u7840\u90e8","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579772387544","parent_id":"1001","name":"\u5de5\u7a0b\u57fa\u7840\u7cfb","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579772781198","parent_id":"1001","name":"\u6f14\u8bad\u90e8","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579773537585","parent_id":"1001","name":"\u804c\u4e1a\u6559\u80b2\u4e2d\u5fc3","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579774266023","parent_id":"1001","name":"\u56fd\u5bb6\u8fb9\u6d77\u9632\u5de5\u4f5c\u8c03\u7814\u5ba4","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579774494172","parent_id":"1001","name":"\u5b66\u5458\u5927\u961f","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579774658687","parent_id":"1001","name":"\u6c11\u65cf\u4e2d\u5b66","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579774968708","parent_id":"1001","name":"\u5de5\u7a0b\u5efa\u8bbe\u6307\u6325\u90e8","book_id":"15579767149327","level":2,"str":"|----","has_son":0},{"catalogue_id":"15579773244656","parent_id":"1001","name":"\u6559\u5b66\u8003\u8bc4\u4e2d\u5fc3","book_id":"15579767149327","level":2,"str":"|----","has_son":0}]';
$result = json_decode($src, true);
$map = array_combine(array_column($result, 'catalogue_id'), array_column($result, 'parent_id'));

print_r(getIdAndPid($map, ['15579773244656']));
 
/**
 * 查出ids中的id以及其父id以及其父id的父id......
 * @param $map 以id为键, pid为值的 所有数据 的map
 * @param $ids 要查找的ids
 * @return array
 */
function getIdAndPid(&$map, $ids){
    $res = [];
    foreach($ids as $id){
        joinPid($map, $id, $res);
    }
    return array_values(array_unique($res));
}
 
function joinPid(&$map, $id, &$res){
    // 如果其pid不为0, 则继续查找
    if(isset($map[$id]) && $map[$id] != 0){
        joinPid($map, $map[$id], $res);
    }
    $res[] = $id;
}
```

