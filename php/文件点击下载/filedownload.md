 # a链接点击下载 #

```
<a href="{{ path('archive_file_download',{'id':file.id}) }}">文件名</a>

 public function downloadAction(Request $request)
{
    $id = $request->query->get('id');
    if (empty($id)){
        return $this->msgResponse(0, '出错啦1', '请求出错啦', 'archive_file_index');
    }
    $doc = $this->getDoctrine()->getRepository('ArchiveBundle:File')
        ->find($id);
    if (empty($doc)){
        return $this->msgResponse(0, '出错啦2', '请求出错啦', 'archive_file_index');
    }

    $docPath =trim($doc->getAttachment(),'/');;
    if (!file_exists($docPath)){
        return $this->msgResponse(0, '出错啦3', '请求出错啦', 'archive_file_index');
    }
    return $this->file($docPath,$doc->getAttachmentFilename());
}

2.
public function downloadAction(Request $request)
    {
        $routeName = $request->query->get('routeName');
        $id = $request->query->getInt('id');
        if(empty($id)){
            return $this->msgResponse(2, '出错啦', '请求出错啦', $routeName);
        }
        $doc = $this->getDoctrine()->getRepository('MessageBundle:MsgAttachment')->find($id);
        if(empty($doc)){
            return $this->msgResponse(2, '出错啦', '数据不存在', $routeName);
        }
//        $docPath = 'uploads' . $doc->getDocPath();
        $docPath =$doc->getFileUri();
        $docPath=substr($docPath,strpos($docPath,'uploads')-1);
        $root = $this->get('kernel')->getProjectDir();
        $docPath=$root.'\web'.$docPath;
        if(!file_exists($docPath)){
            return $this->msgResponse(2, '出错啦', '文件不存在或已被删除', $routeName);
        }
        return $this->file($docPath, $doc->getFileName()); // 如果是pdf之类，直接显示而不是下载，需要设置第三个参数ResponseHeaderBag::DISPOSITION_INLINE
        // 还可以直接接受一个File或者UploadedFile实例
        //$samplePdf = new File('/sample.pdf');
        //return $this->file($samplePdf);
    }
```

