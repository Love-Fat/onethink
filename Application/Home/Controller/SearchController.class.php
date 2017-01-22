<?php

namespace Home\Controller;

class SearchController extends HomeController {

    public function index($p = 1) {

        $keyword = I('keyword');

        empty($keyword) && $this->error('关键词不能为空');

        $map['title'] = array('like','%'.$keyword.'%');

		$map['status'] = array('eq',1);

        $Document = D('Document');

        $list = $Document->page($p,15)->where(array($map))->select();

        $count = $Document->where(array($map))->count();

        $Page = new \Think\Page($count,15);

        $listshow = $Page->show();



        $this->assign('keyword',$keyword);

        $this->assign('list',$list);

        $this->assign('page',$listshow);

        $this->display();

    }

}