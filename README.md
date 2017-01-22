# onethink
自己完善的onethink管理系统

数据库配置文件：
1：Application/Common/Conf/config.php

   /* 数据库配置 */

   'DB_TYPE'   => 'mysql', // 数据库类型

   'DB_HOST'   => '127.0.0.1', // 服务器地址

   'DB_NAME'   => 'xinlvyou', // 数据库名

   'DB_USER'   => 'root', // 用户名

   'DB_PWD'    => '123456',  // 密码

   'DB_PORT'   => '3306', // 端口

   'DB_PREFIX' => 'dade_', // 数据库表前缀
2: Application/User/Conf/config.php

   define('UC_DB_DSN', 'mysql://root:123456@127.0.0.1:3306/xinlvyou'); // 数据库连接，使用Model方式调用API必须配置此项
