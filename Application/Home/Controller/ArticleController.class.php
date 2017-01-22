<?php

// +----------------------------------------------------------------------

// | OneThink [ WE CAN DO IT JUST THINK IT ]

// +----------------------------------------------------------------------

// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.

// +----------------------------------------------------------------------

// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>

// +----------------------------------------------------------------------



namespace Home\Controller;



/**

 * 文档模型控制器

 * 文档模型列表和详情

 */

class ArticleController extends HomeController {



    /* 文档模型频道页 */

	public function index(){

		/* 分类信息 */

		$category = $this->category();



		//频道页只显示模板，默认不读取任何内容

		//内容可以通过模板标签自行定制



		/* 模板赋值并渲染模板 */

		$this->assign('category', $category);

		$this->display($category['template_index']);

	}



	/* 文档模型列表页 */

	public function lists($p = 1){

		/* 分类信息 */

		

		$category = $this->category();

		//获取最顶级的id

		$catid=getAllFcateIds($category['id']);

		$cateinfo = M('Category')->field('id,name,pid,title,icon')->where("id=".$catid)->find();

		if($category['icon']!=0)

		{

			$cateinfo=$category;

		}

		if($category['meta_title']=='')

		{

			$title=$category['title'].'-'.C('WEB_SITE_TITLE');

		}else

		{

			$title=$category['meta_title'];

		}

		if($category['keywords']=='')

		{

			$keywords=C('WEB_SITE_KEYWORD');

		}else

		{

			$keywords=$category['keywords'];

		}

		

		if($category['description']=='')

		{

			$description=C('WEB_SITE_DESCRIPTION');

		}else

		{

			$description=$category['description'];

		}

		//当前分类下的所有分类id

		$cat_id=getAllChildcateIds($category['id']);

		/* 获取当前分类列表 */

		$Document = D('Document');



		$list = $Document->page($p,$category['list_row'])->lists($cat_id,'level desc,create_time desc');

		if(false === $list){

			$this->error('获取列表数据失败！');

		}

		$aboutinfo=$Document->table(C('DB_PREFIX')."document as a")->join('left join '.C('DB_PREFIX').'document_article as b on a.id=b.id')->where("category_id=".$category['id'].' and a.status=1')->order('create_time desc')->find();

		/* 模板赋值并渲染模板 */

		//分类图片

		$this->assign('catid', $catid);

		$this->assign('cateinfo', $cateinfo);

		//seo优化

		$this->assign('title', $title);

		$this->assign('keywords', $keywords);

		$this->assign('description', $description);

		//分类名称

		//分页使用

		$this->assign('cat_id', $cat_id);

		//当前分类

		$this->assign('cateclass', $category);

		//列表调用

		$this->assign('list', $list);

		//单篇调用

		$this->assign('about', $aboutinfo);

		$this->display($category['template_lists']);

	}



	/* 文档模型详情页 */

	public function detail($id = 0, $p = 1){

		/* 标识正确性检测 */

		if(!($id && is_numeric($id))){

			$this->error('文档ID错误！');

		}



		/* 页码检测 */

		$p = intval($p);

		$p = empty($p) ? 1 : $p;



		/* 获取详细信息 */

		$Document = D('Document');

		$info = $Document->detail($id);

		if(!$info){

			$this->error($Document->getError());

		}



		/* 分类信息 */

		$category = $this->category($info['category_id']);

		$catid=getAllFcateIds($category['id']);

		$cateinfo = M('Category')->field('id,name,pid,title,icon')->where("id=".$catid)->find();

		if($category['icon']!=0)

		{

			$cateinfo=$category;

		}

		/* 获取模板 */

		if(!empty($info['template'])){//已定制模板

			$tmpl = $info['template'];

		} elseif (!empty($category['template_detail'])){ //分类已定制模板

			$tmpl = $category['template_detail'];

		} else { //使用默认模板

			$tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';

		}



		/* 更新浏览数 */

		$map = array('id' => $id);

		$Document->where($map)->setInc('view');



		/* 模板赋值并渲染模板 */

		$this->assign('catid', $catid);

		$this->assign('cateinfo', $cateinfo);

		$this->assign('cateclass', $category);

		$this->assign('info', $info);

		$this->assign('page', $p); //页码

		

		

		if($info['seo_title']=='')

		{

			$title=$info['title'].'-'.C('WEB_SITE_TITLE');

		}else

		{

			$title=$info['seo_title'];

		}

		if($info['seo_keywords']=='')

		{

			$keywords=C('WEB_SITE_KEYWORD');

		}else

		{

			$keywords=$info['seo_keywords'];

		}

		

		if($info['seo_description']=='')

		{

			$description=C('WEB_SITE_DESCRIPTION');

		}else

		{

			$description=$info['seo_description'];

		}

		$this->assign('title', $title);

		$this->assign('keywords', $keywords);

		$this->assign('description', $description);

		

		$this->display($tmpl);

	}



	/* 文档分类检测 */

	private function category($id = 0){

		/* 标识正确性检测 */

		$id = $id ? $id : I('get.category', 0);

		if(empty($id)){

			$this->error('没有指定文档分类！');

		}

		/* 获取分类信息 */

		$category = D('Category')->info($id);

		if($category && 1 == $category['status']){

			switch ($category['display']) {

				case 0:

					$this->error('该分类禁止显示！');

					break;

				//TODO: 更多分类显示状态判断

				default:

					return $category;

			}

		} else {

			$this->error('分类不存在或被禁用！');

		}

	}



}

