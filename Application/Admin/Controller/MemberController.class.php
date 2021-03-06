<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台用户控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class MemberController extends AdminController {

    /**
     * 用户管理首页
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
        $username       =   I('username');
        if(is_numeric($username)){
            $map['username']    =   array('like', '%'.(string)$username.'%');
        }

        $list   = $this->lists('Users', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '会员列表';
        $this->display();
    }

 
    public function add(){
        if(IS_POST){
            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $users=D('Users');
            if($users->create()){ //注册成功
                if(!$users->add()){
                    $this->error('用户会员失败！');
                } else {
                    $this->success('会员添加成功！',U('index'));
                }
            } else { //注册失败，显示错误信息
                $this->error($users->getError());
            }
        } else {
            $this->meta_title = '新增会员';
            $this->display();
        }
    }
	public function edit(){
        if(IS_POST){
            /* 检测密码 */
            /* 调用注册接口注册用户 */
			$id=I('id');
            $users=M('Users');
            if($users->create()){ //注册成功
                if(!$users->where('id='.$id)->save()){
                    $this->error('用户编辑失败！');
                } else {
                    $this->success('会员编辑成功！',U('index'));
                }
            } else { //注册失败，显示错误信息
                $this->error($users->getError());
            }
        } else {
			$id=I('id');
			$memberlist=M("Users")->where("id=".$id)->find();
			$this->assign('memberlist',$memberlist);
			$catlist=M("Category")->where("pid=23")->select();
			$this->assign('catlist',$catlist);
            $this->meta_title = '编辑会员';
            $this->display();
        }
    }
	public function changeStatus()
	{
		$id       =   I('id');
		$method       =   I('method');
		$users=M('Users');
		if($method=='delUser')
		{
			$data=array(
				'id' => $id,
				'is_status' => 1,
			);
			$users->save($data);
			$this->success('禁用成功！',U('index'));
		}else if($method=='addUser')
		{
			$data=array(
				'id' => $id,
				'is_status' => 0,
			);
			$users->save($data);
			$this->success('启用成功！',U('index'));
		}
	}
	public function del()
	{
		$id       =   I('id');
		$users=M('Users');
		$users->where('id='.$id)->delete();
		$this->success('删除成功！',U('index'));
	}

    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            case -12: $error = '用户名不能使用非法字符！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

}