<?php
// +--------------------------------------------------------------------------------------------
// | SiteCms 网站管理系统  
// +--------------------------------------------------------------------------------------------
// | Copyright (c) 2014-2016 http://www.sitemk.com All rights reserved.
// +--------------------------------------------------------------------------------------------
// | 模板编辑器 V0.1
// +--------------------------------------------------------------------------------------------
// | Author: Zhang Tao <121283371@qq.com> QQ交流群：257900348  2015-8-18 下午01:05:43
// +--------------------------------------------------------------------------------------------

/**
 * SiteCms
 * 模板编辑器
 * @author Zhang Tao <121283371@qq.com> QQ交流群：257900348 2015-8-18 下午01:05:43
 */
namespace Admin\Controller;
use Think\Upload;
use OT\File;
class CodeEditorController extends AdminController {
    //获取文件列表
    public function lists($channel = 'View', $module = 'Home', $path = '/'){ 
        $path = '/' . ltrim(think_decrypt($path), '/');
        
        //获得可能拥有的模块
        $modules = $this->getModules($channel);
        
        //定义通道路径
        $base_dir = $this->setChannel($channel, $module);
        $file_dir = $base_dir.$path;
        
        //读取文件列表
        $list = File::get_dirs($file_dir);
        $dir_arr = array();
        foreach ($list['dir'] as $key => $value){
            $info = array();
            if($value != '.' && $value != '..'){
                $info['name']           = iconv("GB2312", "UTF-8", $value);
                $info['size']           = File::get_size($file_dir . '/' . $value);
                $info['create_time']    = filectime($file_dir . '/' . $value);
                $info['update_time']    = filemtime($file_dir . '/' . $value);
                $dir_arr[] = $info;
            }
        }
        $list['dir'] = $dir_arr;
        
        $file_arr = array();
        foreach ($list['file'] as $key => $value) {
            $info = array();
            $info['name']           = iconv("GB2312", "UTF-8", $value);
            $info['extension']      = strtolower(pathinfo($value, PATHINFO_EXTENSION));
            $info['size']           = filesize($file_dir . '/' . $value);
            $info['create_time']    = filectime($file_dir . '/' . $value);
            $info['update_time']    = filemtime($file_dir . '/' . $value);
            $file_arr[] = $info;
        }
        $list['file'] = $file_arr;
        cookie('__forward__', $_SERVER['REQUEST_URI']);

        $this->meta_title = '代码在线编辑器';
        $this->assign('modules', $modules);
        $this->assign('module', $module);
        $this->assign('channel', $channel);
        $this->assign('current_path', $path);
        $this->assign('list', $list);
        $this->display();
    }
    
    //编辑文件
    public function edit($channel, $module, $path){
        $path = '/' . ltrim(think_decrypt($path), '/');
        
        //定义通道路径
        $base_dir = $this->setChannel($channel, $module);        
        $file = $base_dir.$path;
        
        //检测文件类型
        $file_extension = strtolower(pathinfo($file, PATHINFO_EXTENSION));    
        $support_extension = array('html','shtml','htm','css','js','xml','php','asp','aspx','jsp','txt','md');
        if(!in_array($file_extension, $support_extension)){
            $this->error('文件打开失败，不支持' . $file_extension . '类型文件');
        }
        
        if (IS_POST){
            $content = I('content','');
            if(File::write_file($file, $content)){
                $this->success('编辑成功！',cookie('__forward__'));
            }else {
                $this->error('编辑失败！');
            }
        }else{
            $content = '';
            if(file_exists($file)){
                $content = File::read_file($file);
            }else{
                $this->error('您要编辑的文件不存在！');
            }
            $file_extension = strtolower(pathinfo($file, PATHINFO_EXTENSION)); 
            
            //代码类型转换           
            $code_type_arr = array('html'=>'text/html','css'=>'text/css','js'=>'text/javascript', 'php'=>'application/x-httpd-php');
            $code_type = isset($code_type_arr[$file_extension]) ? $code_type_arr[$file_extension] : '';
            
            $this->meta_title = '代码在线编辑器';
            $this->assign('module', $module);
            $this->assign('channel', $channel);
            $this->assign('file_name', basename($file));
            $this->assign('current_path', dirname($path));
            $this->assign('content', $content);
            $this->assign('code_type', $code_type);
            $this->display();
        }  
    }
    
    //删除文件
    public function delete($channel, $module, $path){
        $path = '/' . ltrim(think_decrypt($path), '/');
        //定义通道路径
        $base_dir = $this->setChannel($channel, $module);
        $file = $base_dir.$path;
        
        if(is_dir($file)){
            if(File::del_dir($file)){
                $this->success('文件夹删除成功,', cookie('__forward__'));
            }else{
                $this->error('文件夹删除失败！');
            }
        }elseif(is_file($file)){
            if(unlink($file)){
                $this->success('[' . basename($file) . ']文件删除成功,', cookie('__forward__'));
            }else{
                $this->error('文件删除失败！');
            }
        }else{
            $this->error('删除失败，文件不存在！');
        }
    }
    
    //上传文件
    public function upload($channel, $module, $path){
        $path = trim(think_decrypt($path), '/');
        $path = empty($path) ? '/' : '/' . $path.'/';
        //定义通道路径
        $dirname = trim($dirname);
        $base_dir = $this->setChannel($channel, $module);
        $current_path = $base_dir.$path;
        
        //检测文件是否存在
        if ($_FILES) {
            foreach ($_FILES as $value) {
                $file = $current_path . $value['name'];
                if(is_file($file)){
                    $pathinfo = pathinfo($file);
                    $file_basename = $pathinfo['filename'];
                    $file_extension = $pathinfo['extension'];
                    $file_updatetime = filemtime($file);
                    $file_newname = $current_path . $file_basename . '._back_' . time_format($file_updatetime, 'YmdHis') . '.' . $file_extension;
                    //将原文件重命名备份
                    $rename = rename($file, $file_newname);
                }
            }
        }
        
        $config = array(
            'mimes'    => '', //允许上传的文件MiMe类型
            'maxSize'  => 5*1024*1024, //上传的文件大小限制 (0-不做限制)
            'exts'     => 'jpg,gif,png,jpeg,psd,bmp,html,css,htm,js,mp3,mp4,swf,flv,md,zip,rar,doc,docx,xls,xml,ppt,txt,xml', //允许上传的文件后缀
            'autoSub'  => false, //自动子目录保存文件
            'subName'  => '', //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
            'rootPath' => $current_path, //保存根路径
            'savePath' => '', //保存路径
            'saveName' => '', //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
            'saveExt'  => '', //文件保存后缀，空则使用原后缀
            'replace'  => true, //存在同名是否覆盖
            'hash'     => false, //是否生成hash编码
            'callback' => __NAMESPACE__ . '\CodeEditor::oldFileRename', //检测文件是否存在回调函数，如果存在返回文件信息数组
        );
        
        $Upload = new \Think\Upload($config);

        $info = $Upload->upload();
        if($info){
            $return['status'] = 1;
            $return['info'] = '您上传'.count($info).'个文件';
            $return['url'] = '';
        }else{
            $return['status'] = 0;
            $return['info']   = $Upload->getError();
        }
        
        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }
    
    //创建文件夹
    public function makeDir($channel, $module, $path, $dirname){
        $path = '/' . ltrim(think_decrypt($path), '/');
        //定义通道路径
        $dirname = trim($dirname);
        $base_dir = $this->setChannel($channel, $module);
        $current_path = $base_dir.$path;
        
        empty($dirname) && $this->error('创建失败,文件夹名称不能为空！');
        preg_match("/^[\-\_a-zA-Z0-9]+$/", $dirname) || $this->error('对不起，文件夹名称不能含有特殊字符！');
        is_dir($current_path) || $this->error('对不起,目标目录有误！');
        
        $dir = $current_path . '/' . $dirname;
        is_dir($dir) && $this->error('新建失败，已有同名的文件夹已存在！');
        
        if(mkdir($dir, 0777)){
            $this->success('文件夹创建成功！',cookie('__forward__'));
        }else{
            $this->error('文件夹创建失败！');
        }
    }
    
    //重命名
    public function rename($path, $newname){
        
    }
    
    //上传回调函数
    static public function oldFileRename($params){
        echo $params['name'];
    }
    
    //获取通道可能拥有的模块
    final protected function getModules($channel){
        if (ucfirst($channel) == 'View'){
            $path = APP_PATH;
        }else{
            $path = './Public/';
        }
        $modules = File::get_dirs($path);
        $modules_deny = C('MODULE_DENY_LIST');
        return array_diff($modules['dir'], $modules_deny);
    }
    
    //定义通道路径
    final protected function setChannel($channel, $module){
        empty($channel) && $this->error('不合法操作！');
        empty($module) && $this->error('不合法操作！');
        if (ucfirst($channel) == 'View'){
            $base_dir = APP_PATH . ucfirst($module) . '/' . C('DEFAULT_V_LAYER');
        }else{
            $base_dir = './Public/' . $module;
        }
        return $base_dir;
    }
    
}