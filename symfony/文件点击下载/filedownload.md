 # a链接点击下载 #
		
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