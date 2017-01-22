<?php





namespace Home\Model;


use Think\Model;


class OnlineModel extends Model {


    protected $_validate = array(
		array('name', 'require', 'Full Name cannot be empty！', self::EXISTS_VALIDATE),
		array('title', 'require', 'Nationality cannot be empty！', self::EXISTS_VALIDATE),
        array('email','email','Email Invalid format'),
		array('phone', '/^(1[3584]\d{9})$/', 'Please enter the correct phone number', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
		array('address', 'require', 'Date cannot be empty！', self::EXISTS_VALIDATE),
    );


    


    protected $_auto = array(

        array('createtime', NOW_TIME ,self::MODEL_INSERT),
		array('ip', 'getip', self::MODEL_INSERT, 'callback'),

    );
	
	protected function getip(){
		$ip=get_client_ip();
        return $ip;
    }

}