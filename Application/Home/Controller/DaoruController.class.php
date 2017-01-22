<?php

// +----------------------------------------------------------------------

// | OneThink [ WE CAN DO IT JUST THINK IT ]

// +----------------------------------------------------------------------

// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.

// +----------------------------------------------------------------------

// | Author: 刘国强 <415199201@qq.com> <http://www.lovezhuan.com>

// +----------------------------------------------------------------------



namespace Home\Controller;

use OT\DataDictionary;



/**

 * 前台首页控制器

 * 主要获取首页聚合数据

 */

class DaoruController extends HomeController {



	//系统首页

    public function index(){

		
		$Document=M('Document');
		$arct=M('DocumentArticle');
		echo "11111";
		exit;
		$resultlist=M('Content')->where("cat_id='583'")->select();
		foreach($resultlist as $row)
		{
			unset($data);
			unset($datac);
			$data['id']=$row['id'];
			$data['uid']=1;
			$data['title']=$row['news_title'];
			$data['category_id']=28;
			$data['model_id']=2;
			$data['type']=2;
			$data['level']=0;
			$data['create_time']=strtotime($row['add_time']);
			$data['update_time']=strtotime($row['add_time']);
			$data['status']=1;
			$data['author']='管理员';
			$data['source']='中陕核工业集团二一一大队有限公司';
			$Document->add($data);
			$datac['id']=$row['id'];
			$datac['content']=$row['news_content'];
			$arct->add($datac);
			
		}
		echo "导入完成！";
    }



}