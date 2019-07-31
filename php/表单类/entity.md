# 创建时间和更新时间自动更新 #
	@ORM\HasLifecycleCallbacks()

	/**
     * @ORM\PrePersist()
     */
    public function PrePersist()
    {
        if($this->getCreateAt() == null){
            $this->setCreateAt(new \DateTime());
        }
        $this->setUpdateAt(new \DateTime());
    }

    /**
     * @ORM\PreUpdate()
     */
    public function PreUpdate()
    {
        $this->setUpdateAt(new \DateTime());
    }
