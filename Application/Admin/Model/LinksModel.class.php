<?php

// +----------------------------------------------------------------------

// | OneThink [ WE CAN DO IT JUST THINK IT ]

// +----------------------------------------------------------------------

// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.

// +----------------------------------------------------------------------

// | Author: huajie <banhuajie@163.com>

// +----------------------------------------------------------------------



namespace Admin\Model;

use Think\Model;

/**

 * 文档基础模型

 */

class LinksModel extends Model{

 protected $_auto = array(
        array('createtime', NOW_TIME ,self::MODEL_INSERT),
    );


}

