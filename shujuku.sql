-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 01 月 22 日 11:18
-- 服务器版本: 5.1.69
-- PHP 版本: 5.2.17p1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `xianfoodtours`
--

-- --------------------------------------------------------

--
-- 表的结构 `dade_action`
--

CREATE TABLE IF NOT EXISTS `dade_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `dade_action`
--

INSERT INTO `dade_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 0, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `dade_action_log`
--

CREATE TABLE IF NOT EXISTS `dade_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=1073 ;

--
-- 转存表中的数据 `dade_action_log`
--

INSERT INTO `dade_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(644, 9, 1, 2130706433, 'channel', 19, '操作url：/admin.php?s=/channel/edit.html', 1, 1482377639),
(645, 9, 1, 2130706433, 'channel', 20, '操作url：/admin.php?s=/channel/edit.html', 1, 1482377645),
(646, 9, 1, 2130706433, 'channel', 21, '操作url：/admin.php?s=/channel/edit.html', 1, 1482377651),
(647, 9, 1, 2130706433, 'channel', 22, '操作url：/admin.php?s=/channel/edit.html', 1, 1482377657),
(648, 9, 1, 2130706433, 'channel', 23, '操作url：/admin.php?s=/channel/edit.html', 1, 1482377664),
(649, 9, 1, 2130706433, 'channel', 24, '操作url：/admin.php?s=/channel/edit.html', 1, 1482377670),
(650, 9, 1, 2130706433, 'channel', 25, '操作url：/admin.php?s=/channel/edit.html', 1, 1482377676),
(651, 6, 1, 2130706433, 'config', 0, '操作url：/admin.php?s=/config/del/id/43.html', 1, 1482377807),
(652, 6, 1, 2130706433, 'config', 0, '操作url：/admin.php?s=/config/del/id/44.html', 1, 1482377811),
(653, 6, 1, 2130706433, 'config', 0, '操作url：/admin.php?s=/config/del/id/45.html', 1, 1482377815),
(654, 6, 1, 2130706433, 'config', 0, '操作url：/admin.php?s=/config/del/id/46.html', 1, 1482377827),
(655, 11, 1, 2130706433, 'category', 100, '操作url：/admin.php?s=/category/add.html', 1, 1482378066),
(656, 11, 1, 2130706433, 'category', 101, '操作url：/admin.php?s=/category/add.html', 1, 1482378109),
(657, 11, 1, 2130706433, 'category', 102, '操作url：/admin.php?s=/category/add.html', 1, 1482378125),
(658, 11, 1, 2130706433, 'category', 102, '操作url：/admin.php?s=/category/edit.html', 1, 1482378151),
(659, 11, 1, 2130706433, 'category', 102, '操作url：/admin.php?s=/category/edit.html', 1, 1482378152),
(660, 11, 1, 2130706433, 'category', 95, '操作url：/admin.php?s=/category/edit.html', 1, 1482378178),
(661, 11, 1, 2130706433, 'category', 95, '操作url：/admin.php?s=/category/edit.html', 1, 1482378181),
(662, 11, 1, 2130706433, 'category', 95, '操作url：/admin.php?s=/category/edit.html', 1, 1482378192),
(663, 11, 1, 2130706433, 'category', 90, '操作url：/admin.php?s=/category/remove/id/90.html', 1, 1482386018),
(664, 11, 1, 2130706433, 'category', 89, '操作url：/admin.php?s=/category/remove/id/89.html', 1, 1482386021),
(665, 11, 1, 2130706433, 'category', 53, '操作url：/admin.php?s=/category/remove/id/53.html', 1, 1482386025),
(666, 11, 1, 2130706433, 'category', 52, '操作url：/admin.php?s=/category/remove/id/52.html', 1, 1482386028),
(667, 11, 1, 2130706433, 'category', 103, '操作url：/admin.php?s=/category/add.html', 1, 1482386059),
(668, 11, 1, 2130706433, 'category', 104, '操作url：/admin.php?s=/category/add.html', 1, 1482386084),
(669, 11, 1, 2130706433, 'category', 81, '操作url：/admin.php?s=/category/edit.html', 1, 1482386093),
(670, 11, 1, 2130706433, 'category', 82, '操作url：/admin.php?s=/category/edit.html', 1, 1482386095),
(671, 11, 1, 2130706433, 'category', 105, '操作url：/admin.php?s=/category/add.html', 1, 1482386113),
(672, 11, 1, 2130706433, 'category', 106, '操作url：/admin.php?s=/category/add.html', 1, 1482386134),
(673, 11, 1, 2130706433, 'category', 107, '操作url：/admin.php?s=/category/add.html', 1, 1482386160),
(674, 11, 1, 2130706433, 'category', 108, '操作url：/admin.php?s=/category/add.html', 1, 1482386191),
(675, 11, 1, 2130706433, 'category', 109, '操作url：/admin.php?s=/category/add.html', 1, 1482386214),
(676, 11, 1, 2130706433, 'category', 110, '操作url：/admin.php?s=/category/add.html', 1, 1482386231),
(677, 11, 1, 2130706433, 'category', 111, '操作url：/admin.php?s=/category/add.html', 1, 1482386248),
(678, 11, 1, 2130706433, 'category', 112, '操作url：/admin.php?s=/category/add.html', 1, 1482386278),
(679, 11, 1, 2130706433, 'category', 113, '操作url：/admin.php?s=/category/add.html', 1, 1482386299),
(680, 11, 1, 2130706433, 'category', 114, '操作url：/admin.php?s=/category/add.html', 1, 1482386320),
(681, 11, 1, 2130706433, 'category', 115, '操作url：/admin.php?s=/category/add.html', 1, 1482386340),
(682, 11, 1, 2130706433, 'category', 116, '操作url：/admin.php?s=/category/add.html', 1, 1482386361),
(683, 11, 1, 2130706433, 'category', 117, '操作url：/admin.php?s=/category/add.html', 1, 1482386388),
(684, 11, 1, 2130706433, 'category', 118, '操作url：/admin.php?s=/category/add.html', 1, 1482386425),
(685, 11, 1, 2130706433, 'category', 119, '操作url：/admin.php?s=/category/add.html', 1, 1482386446),
(686, 11, 1, 2130706433, 'category', 120, '操作url：/admin.php?s=/category/add.html', 1, 1482386485),
(687, 11, 1, 2130706433, 'category', 121, '操作url：/admin.php?s=/category/add.html', 1, 1482386518),
(688, 11, 1, 2130706433, 'category', 122, '操作url：/admin.php?s=/category/add.html', 1, 1482386535),
(689, 11, 1, 2130706433, 'category', 123, '操作url：/admin.php?s=/category/add.html', 1, 1482386554),
(690, 11, 1, 2130706433, 'category', 124, '操作url：/admin.php?s=/category/add.html', 1, 1482386570),
(691, 11, 1, 2130706433, 'category', 99, '操作url：/admin.php?s=/category/remove/id/99.html', 1, 1482386576),
(692, 11, 1, 2130706433, 'category', 98, '操作url：/admin.php?s=/category/remove/id/98.html', 1, 1482386579),
(693, 11, 1, 2130706433, 'category', 97, '操作url：/admin.php?s=/category/remove/id/97.html', 1, 1482386581),
(694, 11, 1, 2130706433, 'category', 96, '操作url：/admin.php?s=/category/remove/id/96.html', 1, 1482386584),
(695, 11, 1, 2130706433, 'category', 94, '操作url：/admin.php?s=/category/remove/id/94.html', 1, 1482386586),
(696, 11, 1, 2130706433, 'category', 93, '操作url：/admin.php?s=/category/remove/id/93.html', 1, 1482386589),
(697, 11, 1, 2130706433, 'category', 82, '操作url：/admin.php?s=/category/remove/id/82.html', 1, 1482386591),
(698, 11, 1, 2130706433, 'category', 92, '操作url：/admin.php?s=/category/remove/id/92.html', 1, 1482386594),
(699, 11, 1, 2130706433, 'category', 91, '操作url：/admin.php?s=/category/remove/id/91.html', 1, 1482386596),
(700, 11, 1, 2130706433, 'category', 81, '操作url：/admin.php?s=/category/remove/id/81.html', 1, 1482386599),
(701, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1482386684),
(702, 9, 1, 2130706433, 'channel', 19, '操作url：/admin.php?s=/channel/edit.html', 1, 1482386707),
(703, 9, 1, 2130706433, 'channel', 20, '操作url：/admin.php?s=/channel/edit.html', 1, 1482386713),
(704, 9, 1, 2130706433, 'channel', 21, '操作url：/admin.php?s=/channel/edit.html', 1, 1482386719),
(705, 9, 1, 2130706433, 'channel', 22, '操作url：/admin.php?s=/channel/edit.html', 1, 1482386726),
(706, 9, 1, 2130706433, 'channel', 23, '操作url：/admin.php?s=/channel/edit.html', 1, 1482386733),
(707, 9, 1, 2130706433, 'channel', 24, '操作url：/admin.php?s=/channel/edit.html', 1, 1482386741),
(708, 9, 1, 2130706433, 'channel', 25, '操作url：/admin.php?s=/channel/edit.html', 1, 1482386747),
(709, 11, 1, 2130706433, 'category', 51, '操作url：/admin.php?s=/category/edit.html', 1, 1482386755),
(710, 11, 1, 2130706433, 'category', 105, '操作url：/admin.php?s=/category/edit.html', 1, 1482386768),
(711, 11, 1, 2130706433, 'category', 108, '操作url：/admin.php?s=/category/edit.html', 1, 1482386778),
(712, 11, 1, 2130706433, 'category', 117, '操作url：/admin.php?s=/category/edit.html', 1, 1482386786),
(713, 11, 1, 2130706433, 'category', 120, '操作url：/admin.php?s=/category/edit.html', 1, 1482386801),
(714, 11, 1, 2130706433, 'category', 122, '操作url：/admin.php?s=/category/edit.html', 1, 1482386810),
(715, 11, 1, 2130706433, 'category', 95, '操作url：/admin.php?s=/category/edit.html', 1, 1482387145),
(716, 8, 1, 2130706433, 'attribute', 67, '操作url：/admin.php?s=/attribute/remove/id/67.html', 1, 1482387180),
(717, 8, 1, 2130706433, 'attribute', 69, '操作url：/admin.php?s=/attribute/remove/id/69.html', 1, 1482387185),
(718, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/model/update.html', 1, 1482387201),
(719, 11, 1, 2130706433, 'category', 125, '操作url：/admin.php?s=/category/add.html', 1, 1482389481),
(720, 11, 1, 2130706433, 'category', 109, '操作url：/admin.php?s=/category/edit.html', 1, 1482390345),
(721, 11, 1, 2130706433, 'category', 110, '操作url：/admin.php?s=/category/edit.html', 1, 1482390356),
(722, 11, 1, 2130706433, 'category', 125, '操作url：/admin.php?s=/category/edit.html', 1, 1482391655),
(723, 11, 1, 2130706433, 'category', 125, '操作url：/admin.php?s=/category/edit.html', 1, 1482391710),
(724, 6, 1, 2130706433, 'config', 39, '操作url：/admin.php?s=/config/edit.html', 1, 1482392813),
(725, 10, 1, 2130706433, 'Menu', 0, '操作url：/admin.php?s=/menu/del/id/142.html', 1, 1482393106),
(726, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1482395461),
(727, 11, 1, 2130706433, 'category', 114, '操作url：/admin.php?s=/category/edit.html', 1, 1482398660),
(728, 11, 1, 2130706433, 'category', 116, '操作url：/admin.php?s=/category/edit.html', 1, 1482398661),
(729, 11, 1, 2130706433, 'category', 126, '操作url：/admin.php?s=/category/add.html', 1, 1482399873),
(730, 11, 1, 2130706433, 'category', 127, '操作url：/admin.php?s=/category/add.html', 1, 1482399895),
(731, 11, 1, 2130706433, 'category', 128, '操作url：/admin.php?s=/category/add.html', 1, 1482399927),
(732, 11, 1, 2130706433, 'category', 129, '操作url：/admin.php?s=/category/add.html', 1, 1482399950),
(733, 11, 1, 2130706433, 'category', 130, '操作url：/admin.php?s=/category/add.html', 1, 1482399971),
(734, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1482401322),
(735, 11, 1, 2130706433, 'category', 131, '操作url：/admin.php?s=/category/add.html', 1, 1482401350),
(736, 11, 1, 2130706433, 'category', 108, '操作url：/admin.php?s=/category/edit.html', 1, 1482401594),
(737, 11, 1, 2130706433, 'category', 109, '操作url：/admin.php?s=/category/edit.html', 1, 1482401602),
(738, 11, 1, 2130706433, 'category', 125, '操作url：/admin.php?s=/category/edit.html', 1, 1482401609),
(739, 11, 1, 2130706433, 'category', 110, '操作url：/admin.php?s=/category/edit.html', 1, 1482401629),
(740, 11, 1, 2130706433, 'category', 132, '操作url：/admin.php?s=/category/add.html', 1, 1482401662),
(741, 11, 1, 2130706433, 'category', 133, '操作url：/admin.php?s=/category/add.html', 1, 1482401684),
(742, 11, 1, 2130706433, 'category', 134, '操作url：/admin.php?s=/category/add.html', 1, 1482401780),
(743, 11, 1, 2130706433, 'category', 135, '操作url：/admin.php?s=/category/add.html', 1, 1482401808),
(744, 11, 1, 2130706433, 'category', 136, '操作url：/admin.php?s=/category/add.html', 1, 1482401836),
(745, 11, 1, 2130706433, 'category', 137, '操作url：/admin.php?s=/category/add.html', 1, 1482401867),
(746, 11, 1, 2130706433, 'category', 138, '操作url：/admin.php?s=/category/add.html', 1, 1482402171),
(747, 11, 1, 2130706433, 'category', 139, '操作url：/admin.php?s=/category/add.html', 1, 1482402203),
(748, 11, 1, 2130706433, 'category', 140, '操作url：/admin.php?s=/category/add.html', 1, 1482402338),
(749, 11, 1, 2130706433, 'category', 141, '操作url：/admin.php?s=/category/add.html', 1, 1482402388),
(750, 11, 1, 2130706433, 'category', 142, '操作url：/admin.php?s=/category/add.html', 1, 1482402433),
(751, 11, 1, 2130706433, 'category', 143, '操作url：/admin.php?s=/category/add.html', 1, 1482402497),
(752, 11, 1, 2130706433, 'category', 111, '操作url：/admin.php?s=/category/edit.html', 1, 1482402527),
(753, 11, 1, 2130706433, 'category', 112, '操作url：/admin.php?s=/category/edit.html', 1, 1482402548),
(754, 11, 1, 2130706433, 'category', 113, '操作url：/admin.php?s=/category/edit.html', 1, 1482402558),
(755, 11, 1, 2130706433, 'category', 115, '操作url：/admin.php?s=/category/edit.html', 1, 1482402573),
(756, 11, 1, 2130706433, 'category', 115, '操作url：/admin.php?s=/category/edit.html', 1, 1482402596),
(757, 11, 1, 2130706433, 'category', 114, '操作url：/admin.php?s=/category/edit.html', 1, 1482402597),
(758, 11, 1, 2130706433, 'category', 114, '操作url：/admin.php?s=/category/edit.html', 1, 1482402605),
(759, 11, 1, 2130706433, 'category', 116, '操作url：/admin.php?s=/category/edit.html', 1, 1482402616),
(760, 11, 1, 2130706433, 'category', 144, '操作url：/admin.php?s=/category/add.html', 1, 1482402655),
(761, 11, 1, 2130706433, 'category', 145, '操作url：/admin.php?s=/category/add.html', 1, 1482402687),
(762, 11, 1, 2130706433, 'category', 146, '操作url：/admin.php?s=/category/add.html', 1, 1482402708),
(763, 11, 1, 2130706433, 'category', 147, '操作url：/admin.php?s=/category/add.html', 1, 1482402738),
(764, 11, 1, 2130706433, 'category', 148, '操作url：/admin.php?s=/category/add.html', 1, 1482402766),
(765, 11, 1, 2130706433, 'category', 149, '操作url：/admin.php?s=/category/add.html', 1, 1482402794),
(766, 11, 1, 2130706433, 'category', 150, '操作url：/admin.php?s=/category/add.html', 1, 1482402825),
(767, 11, 1, 2130706433, 'category', 151, '操作url：/admin.php?s=/category/add.html', 1, 1482402864),
(768, 11, 1, 2130706433, 'category', 152, '操作url：/admin.php?s=/category/add.html', 1, 1482402890),
(769, 11, 1, 2130706433, 'category', 153, '操作url：/admin.php?s=/category/add.html', 1, 1482402921),
(770, 11, 1, 2130706433, 'category', 154, '操作url：/admin.php?s=/category/add.html', 1, 1482402956),
(771, 11, 1, 2130706433, 'category', 155, '操作url：/admin.php?s=/category/add.html', 1, 1482402984),
(772, 11, 1, 2130706433, 'category', 156, '操作url：/admin.php?s=/category/add.html', 1, 1482403020),
(773, 11, 1, 2130706433, 'category', 157, '操作url：/admin.php?s=/category/add.html', 1, 1482403053),
(774, 11, 1, 2130706433, 'category', 158, '操作url：/admin.php?s=/category/add.html', 1, 1482403078),
(775, 11, 1, 2130706433, 'category', 159, '操作url：/admin.php?s=/category/add.html', 1, 1482403104),
(776, 11, 1, 2130706433, 'category', 160, '操作url：/admin.php?s=/category/add.html', 1, 1482403128),
(777, 11, 1, 2130706433, 'category', 161, '操作url：/admin.php?s=/category/add.html', 1, 1482403159),
(778, 11, 1, 2130706433, 'category', 162, '操作url：/admin.php?s=/category/add.html', 1, 1482403179),
(779, 11, 1, 2130706433, 'category', 163, '操作url：/admin.php?s=/category/add.html', 1, 1482403209),
(780, 11, 1, 2130706433, 'category', 164, '操作url：/admin.php?s=/category/add.html', 1, 1482403244),
(781, 11, 1, 2130706433, 'category', 165, '操作url：/admin.php?s=/category/add.html', 1, 1482403283),
(782, 7, 1, 2130706433, 'model', 7, '操作url：/admin.php?s=/model/update.html', 1, 1482403932),
(783, 8, 1, 2130706433, 'attribute', 33, '操作url：/admin.php?s=/attribute/update.html', 1, 1482403995),
(784, 11, 1, 2130706433, 'category', 166, '操作url：/admin.php?s=/category/add.html', 1, 1482459412),
(785, 11, 1, 2130706433, 'category', 167, '操作url：/admin.php?s=/category/add.html', 1, 1482459447),
(786, 11, 1, 2130706433, 'category', 168, '操作url：/admin.php?s=/category/add.html', 1, 1482459475),
(787, 11, 1, 2130706433, 'category', 169, '操作url：/admin.php?s=/category/add.html', 1, 1482459498),
(788, 11, 1, 2130706433, 'category', 169, '操作url：/admin.php?s=/category/edit.html', 1, 1482459529),
(789, 11, 1, 2130706433, 'category', 170, '操作url：/admin.php?s=/category/add.html', 1, 1482459544),
(790, 11, 1, 2130706433, 'category', 171, '操作url：/admin.php?s=/category/add.html', 1, 1482459582),
(791, 11, 1, 2130706433, 'category', 172, '操作url：/admin.php?s=/category/add.html', 1, 1482459606),
(792, 11, 1, 2130706433, 'category', 173, '操作url：/admin.php?s=/category/add.html', 1, 1482461833),
(793, 11, 1, 2130706433, 'category', 121, '操作url：/admin.php?s=/category/edit.html', 1, 1482461845),
(794, 11, 1, 2130706433, 'category', 174, '操作url：/admin.php?s=/category/add.html', 1, 1482461883),
(795, 11, 1, 2130706433, 'category', 175, '操作url：/admin.php?s=/category/add.html', 1, 1482461910),
(796, 11, 1, 2130706433, 'category', 176, '操作url：/admin.php?s=/category/add.html', 1, 1482461940),
(797, 11, 1, 2130706433, 'category', 177, '操作url：/admin.php?s=/category/add.html', 1, 1482461964),
(798, 11, 1, 2130706433, 'category', 178, '操作url：/admin.php?s=/category/add.html', 1, 1482461990),
(799, 11, 1, 2130706433, 'category', 179, '操作url：/admin.php?s=/category/add.html', 1, 1482462021),
(800, 11, 1, 2130706433, 'category', 180, '操作url：/admin.php?s=/category/add.html', 1, 1482462046),
(801, 11, 1, 2130706433, 'category', 181, '操作url：/admin.php?s=/category/add.html', 1, 1482462085),
(802, 11, 1, 2130706433, 'category', 182, '操作url：/admin.php?s=/category/add.html', 1, 1482462109),
(803, 11, 1, 2130706433, 'category', 183, '操作url：/admin.php?s=/category/add.html', 1, 1482462132),
(804, 11, 1, 2130706433, 'category', 184, '操作url：/admin.php?s=/category/add.html', 1, 1482462156),
(805, 11, 1, 2130706433, 'category', 185, '操作url：/admin.php?s=/category/add.html', 1, 1482462184),
(806, 11, 1, 2130706433, 'category', 120, '操作url：/admin.php?s=/category/edit.html', 1, 1482462223),
(807, 8, 1, 2130706433, 'attribute', 75, '操作url：/admin.php?s=/attribute/update.html', 1, 1482462289),
(808, 7, 1, 2130706433, 'model', 7, '操作url：/admin.php?s=/model/update.html', 1, 1482462332),
(809, 7, 1, 2130706433, 'model', 7, '操作url：/admin.php?s=/model/update.html', 1, 1482462339),
(810, 11, 1, 2130706433, 'category', 140, '操作url：/admin.php?s=/category/edit.html', 1, 1482462389),
(811, 8, 1, 2130706433, 'attribute', 76, '操作url：/admin.php?s=/attribute/update.html', 1, 1482463218),
(812, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/model/update.html', 1, 1482463230),
(813, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/model/update.html', 1, 1482463238),
(814, 11, 1, 2130706433, 'category', 102, '操作url：/admin.php?s=/category/edit.html', 1, 1482479631),
(815, 11, 1, 2130706433, 'category', 103, '操作url：/admin.php?s=/category/edit.html', 1, 1482479639),
(816, 11, 1, 2130706433, 'category', 104, '操作url：/admin.php?s=/category/edit.html', 1, 1482479660),
(817, 11, 1, 2130706433, 'category', 106, '操作url：/admin.php?s=/category/edit.html', 1, 1482479666),
(818, 11, 1, 2130706433, 'category', 107, '操作url：/admin.php?s=/category/edit.html', 1, 1482479675),
(819, 11, 1, 2130706433, 'category', 124, '操作url：/admin.php?s=/category/edit.html', 1, 1482479706),
(820, 11, 1, 2130706433, 'category', 123, '操作url：/admin.php?s=/category/edit.html', 1, 1482479713),
(821, 7, 1, 2130706433, 'model', 7, '操作url：/admin.php?s=/model/update.html', 1, 1482485098),
(822, 7, 1, 2130706433, 'model', 7, '操作url：/admin.php?s=/model/update.html', 1, 1482485105),
(823, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1482742723),
(824, 11, 1, 2130706433, 'category', 100, '操作url：/admin.php?s=/category/edit.html', 1, 1482742733),
(825, 9, 1, 2130706433, 'channel', 19, '操作url：/admin.php?s=/channel/edit.html', 1, 1482742744),
(826, 7, 1, 2130706433, 'model', 8, '操作url：/admin.php?s=/model/update.html', 1, 1482817183),
(827, 8, 1, 2130706433, 'attribute', 77, '操作url：/admin.php?s=/attribute/update.html', 1, 1482817232),
(828, 7, 1, 2130706433, 'model', 8, '操作url：/admin.php?s=/model/update.html', 1, 1482817313),
(829, 8, 1, 2130706433, 'attribute', 78, '操作url：/admin.php?s=/attribute/update.html', 1, 1482817333),
(830, 7, 1, 2130706433, 'model', 8, '操作url：/admin.php?s=/model/update.html', 1, 1482817340),
(831, 7, 1, 2130706433, 'model', 8, '操作url：/admin.php?s=/model/update.html', 1, 1482817375),
(832, 11, 1, 2130706433, 'category', 126, '操作url：/admin.php?s=/category/edit.html', 1, 1482817389),
(833, 8, 1, 2130706433, 'attribute', 45, '操作url：/admin.php?s=/attribute/update.html', 1, 1482817589),
(834, 8, 1, 2130706433, 'attribute', 45, '操作url：/admin.php?s=/attribute/update.html', 1, 1482817617),
(835, 8, 1, 2130706433, 'attribute', 68, '操作url：/admin.php?s=/attribute/update.html', 1, 1482817710),
(836, 7, 1, 2130706433, 'model', 8, '操作url：/admin.php?s=/model/update.html', 1, 1482817725),
(837, 7, 1, 2130706433, 'model', 8, '操作url：/admin.php?s=/model/update.html', 1, 1482817733),
(838, 8, 1, 2130706433, 'attribute', 78, '操作url：/admin.php?s=/attribute/update.html', 1, 1482818059),
(839, 11, 1, 2130706433, 'category', 104, '操作url：/admin.php?s=/category/edit.html', 1, 1482823125),
(840, 6, 1, 2130706433, 'config', 39, '操作url：/admin.php?s=/config/edit.html', 1, 1482825653),
(841, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1482825673),
(842, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/add.html', 1, 1482825690),
(843, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/category/add.html', 1, 1482825704),
(844, 11, 1, 2130706433, 'category', 3, '操作url：/admin.php?s=/category/add.html', 1, 1482825722),
(845, 11, 1, 2130706433, 'category', 4, '操作url：/admin.php?s=/category/add.html', 1, 1482825761),
(846, 11, 1, 2130706433, 'category', 5, '操作url：/admin.php?s=/category/add.html', 1, 1482825789),
(847, 11, 1, 2130706433, 'category', 6, '操作url：/admin.php?s=/category/add.html', 1, 1482825809),
(848, 11, 1, 2130706433, 'category', 7, '操作url：/admin.php?s=/category/add.html', 1, 1482825832),
(849, 11, 1, 2130706433, 'category', 8, '操作url：/admin.php?s=/category/add.html', 1, 1482825857),
(850, 11, 1, 2130706433, 'category', 9, '操作url：/admin.php?s=/category/add.html', 1, 1482825876),
(851, 11, 1, 2130706433, 'category', 10, '操作url：/admin.php?s=/category/add.html', 1, 1482825890),
(852, 11, 1, 2130706433, 'category', 11, '操作url：/admin.php?s=/category/add.html', 1, 1482825905),
(853, 11, 1, 2130706433, 'category', 12, '操作url：/admin.php?s=/category/add.html', 1, 1482825920),
(854, 11, 1, 2130706433, 'category', 13, '操作url：/admin.php?s=/category/add.html', 1, 1482825937),
(855, 11, 1, 2130706433, 'category', 14, '操作url：/admin.php?s=/category/add.html', 1, 1482825961),
(856, 11, 1, 2130706433, 'category', 15, '操作url：/admin.php?s=/category/add.html', 1, 1482825982),
(857, 11, 1, 2130706433, 'category', 16, '操作url：/admin.php?s=/category/add.html', 1, 1482826010),
(858, 11, 1, 2130706433, 'category', 17, '操作url：/admin.php?s=/category/add.html', 1, 1482826026),
(859, 11, 1, 2130706433, 'category', 18, '操作url：/admin.php?s=/category/add.html', 1, 1482826040),
(860, 11, 1, 2130706433, 'category', 19, '操作url：/admin.php?s=/category/add.html', 1, 1482826061),
(861, 11, 1, 2130706433, 'category', 20, '操作url：/admin.php?s=/category/add.html', 1, 1482826096),
(862, 11, 1, 2130706433, 'category', 21, '操作url：/admin.php?s=/category/add.html', 1, 1482826113),
(863, 11, 1, 2130706433, 'category', 22, '操作url：/admin.php?s=/category/add.html', 1, 1482826128),
(864, 11, 1, 2130706433, 'category', 23, '操作url：/admin.php?s=/category/add.html', 1, 1482826148),
(865, 11, 1, 2130706433, 'category', 24, '操作url：/admin.php?s=/category/add.html', 1, 1482826164),
(866, 11, 1, 2130706433, 'category', 25, '操作url：/admin.php?s=/category/add.html', 1, 1482826185),
(867, 11, 1, 2130706433, 'category', 26, '操作url：/admin.php?s=/category/add.html', 1, 1482826207),
(868, 11, 1, 2130706433, 'category', 27, '操作url：/admin.php?s=/category/add.html', 1, 1482826227),
(869, 9, 1, 2130706433, 'channel', 19, '操作url：/admin.php?s=/channel/edit.html', 1, 1482889624),
(870, 9, 1, 2130706433, 'channel', 20, '操作url：/admin.php?s=/channel/edit.html', 1, 1482889633),
(871, 9, 1, 2130706433, 'channel', 21, '操作url：/admin.php?s=/channel/edit.html', 1, 1482889642),
(872, 9, 1, 2130706433, 'channel', 22, '操作url：/admin.php?s=/channel/edit.html', 1, 1482889674),
(873, 9, 1, 2130706433, 'channel', 23, '操作url：/admin.php?s=/channel/edit.html', 1, 1482889684),
(874, 9, 1, 2130706433, 'channel', 24, '操作url：/admin.php?s=/channel/edit.html', 1, 1482889695),
(875, 9, 1, 2130706433, 'channel', 25, '操作url：/admin.php?s=/channel/edit.html', 1, 1482889704),
(876, 9, 1, 2130706433, 'channel', 40, '操作url：/admin.php?s=/channel/edit.html', 1, 1482890074),
(877, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1482891197),
(878, 11, 1, 2130706433, 'category', 7, '操作url：/admin.php?s=/category/edit.html', 1, 1482891423),
(879, 11, 1, 2130706433, 'category', 6, '操作url：/admin.php?s=/category/edit.html', 1, 1482891876),
(880, 11, 1, 2130706433, 'category', 9, '操作url：/admin.php?s=/category/edit.html', 1, 1482892372),
(881, 8, 1, 2130706433, 'attribute', 68, '操作url：/admin.php?s=/attribute/update.html', 1, 1482892748),
(882, 8, 1, 2130706433, 'attribute', 45, '操作url：/admin.php?s=/attribute/update.html', 1, 1482892761),
(883, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/model/update.html', 1, 1482892817),
(884, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/model/update.html', 1, 1482892840),
(885, 8, 1, 2130706433, 'attribute', 33, '操作url：/admin.php?s=/attribute/update.html', 1, 1482893129),
(886, 8, 1, 2130706433, 'attribute', 79, '操作url：/admin.php?s=/attribute/update.html', 1, 1482893190),
(887, 8, 1, 2130706433, 'attribute', 79, '操作url：/admin.php?s=/attribute/update.html', 1, 1482893218),
(888, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/model/update.html', 1, 1482893226),
(889, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/model/update.html', 1, 1482893235),
(890, 7, 1, 2130706433, 'model', 6, '操作url：/admin.php?s=/model/update.html', 1, 1482893270),
(891, 10, 1, 2130706433, 'Menu', 148, '操作url：/admin.php?s=/menu/add.html', 1, 1482893364),
(892, 8, 1, 2130706433, 'attribute', 80, '操作url：/admin.php?s=/attribute/update.html', 1, 1482893480),
(893, 8, 1, 2130706433, 'attribute', 48, '操作url：/admin.php?s=/attribute/remove/id/48.html', 1, 1482893497),
(894, 8, 1, 2130706433, 'attribute', 52, '操作url：/admin.php?s=/attribute/remove/id/52.html', 1, 1482893505),
(895, 8, 1, 2130706433, 'attribute', 70, '操作url：/admin.php?s=/attribute/remove/id/70.html', 1, 1482893516),
(896, 8, 1, 2130706433, 'attribute', 81, '操作url：/admin.php?s=/attribute/update.html', 1, 1482893537),
(897, 8, 1, 2130706433, 'attribute', 82, '操作url：/admin.php?s=/attribute/update.html', 1, 1482893557),
(898, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1482893574),
(899, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1482893619),
(900, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1482894467),
(901, 11, 1, 2130706433, 'category', 11, '操作url：/admin.php?s=/category/edit.html', 1, 1482895968),
(902, 11, 1, 2130706433, 'category', 6, '操作url：/admin.php?s=/category/edit.html', 1, 1482895999),
(903, 11, 1, 2130706433, 'category', 7, '操作url：/admin.php?s=/category/edit.html', 1, 1482896013),
(904, 11, 1, 2130706433, 'category', 28, '操作url：/admin.php?s=/category/add.html', 1, 1482906970),
(905, 8, 1, 2130706433, 'attribute', 33, '操作url：/admin.php?s=/attribute/update.html', 1, 1482992541),
(906, 8, 1, 2130706433, 'attribute', 10, '操作url：/admin.php?s=/attribute/update.html', 1, 1482992787),
(907, 11, 1, 2130706433, 'category', 29, '操作url：/admin.php?s=/category/add.html', 1, 1483931489),
(908, 11, 1, 2130706433, 'category', 29, '操作url：/admin.php?s=/category/remove/id/29.html', 1, 1483931540),
(909, 10, 1, 2130706433, 'Menu', 149, '操作url：/admin.php?s=/menu/add.html', 1, 1484010116),
(910, 10, 1, 2130706433, 'Menu', 141, '操作url：/admin.php?s=/menu/edit.html', 1, 1484010179),
(911, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484010244),
(912, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/40.html', 1, 1484362413),
(913, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/39.html', 1, 1484362416),
(914, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/38.html', 1, 1484362418),
(915, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/37.html', 1, 1484362419),
(916, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/30.html', 1, 1484362424),
(917, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/29.html', 1, 1484362425),
(918, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/28.html', 1, 1484362425),
(919, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/26.html', 1, 1484362427),
(920, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/27.html', 1, 1484362428),
(921, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/33.html', 1, 1484362435),
(922, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/32.html', 1, 1484362435),
(923, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/31.html', 1, 1484362436),
(924, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/36.html', 1, 1484362440),
(925, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/35.html', 1, 1484362440),
(926, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/34.html', 1, 1484362441),
(927, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/43.html', 1, 1484362448),
(928, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/42.html', 1, 1484362448),
(929, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/41.html', 1, 1484362449),
(930, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/45.html', 1, 1484362453),
(931, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/44.html', 1, 1484362453),
(932, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/25.html', 1, 1484362462),
(933, 9, 1, 2130706433, 'channel', 0, '操作url：/admin.php?s=/channel/del/id/24.html', 1, 1484362463),
(934, 6, 1, 2130706433, 'config', 0, '操作url：/admin.php?s=/config/del/id/47.html', 1, 1484362812),
(935, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484363158),
(936, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484363218),
(937, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484363227),
(938, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/category/edit.html', 1, 1484363257),
(939, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484363262),
(940, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484363265),
(941, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/category/edit.html', 1, 1484363282),
(942, 11, 1, 2130706433, 'category', 3, '操作url：/admin.php?s=/category/edit.html', 1, 1484363297),
(943, 11, 1, 2130706433, 'category', 3, '操作url：/admin.php?s=/category/edit.html', 1, 1484363308),
(944, 11, 1, 2130706433, 'category', 4, '操作url：/admin.php?s=/category/remove/id/4.html', 1, 1484363318),
(945, 11, 1, 2130706433, 'category', 5, '操作url：/admin.php?s=/category/remove/id/5.html', 1, 1484363321),
(946, 11, 1, 2130706433, 'category', 6, '操作url：/admin.php?s=/category/remove/id/6.html', 1, 1484363326),
(947, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1484363399),
(948, 7, 1, 2130706433, 'model', 9, '操作url：/admin.php?s=/model/update.html', 1, 1484363433),
(949, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484363441),
(950, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484363448),
(951, 6, 1, 2130706433, 'config', 39, '操作url：/admin.php?s=/config/edit.html', 1, 1484363471),
(952, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484363477),
(953, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/category/edit.html', 1, 1484363485),
(954, 11, 1, 2130706433, 'category', 3, '操作url：/admin.php?s=/category/edit.html', 1, 1484363492),
(955, 11, 1, 2130706433, 'category', 7, '操作url：/admin.php?s=/category/edit.html', 1, 1484363514),
(956, 11, 1, 2130706433, 'category', 7, '操作url：/admin.php?s=/category/edit.html', 1, 1484363527),
(957, 11, 1, 2130706433, 'category', 30, '操作url：/admin.php?s=/category/add.html', 1, 1484363553),
(958, 11, 1, 2130706433, 'category', 31, '操作url：/admin.php?s=/category/add.html', 1, 1484363584),
(959, 11, 1, 2130706433, 'category', 11, '操作url：/admin.php?s=/category/remove/id/11.html', 1, 1484363598),
(960, 11, 1, 2130706433, 'category', 8, '操作url：/admin.php?s=/category/edit.html', 1, 1484363608),
(961, 11, 1, 2130706433, 'category', 8, '操作url：/admin.php?s=/category/edit.html', 1, 1484363610),
(962, 11, 1, 2130706433, 'category', 8, '操作url：/admin.php?s=/category/edit.html', 1, 1484363627),
(963, 11, 1, 2130706433, 'category', 9, '操作url：/admin.php?s=/category/edit.html', 1, 1484363878),
(964, 11, 1, 2130706433, 'category', 10, '操作url：/admin.php?s=/category/edit.html', 1, 1484363880),
(965, 11, 1, 2130706433, 'category', 9, '操作url：/admin.php?s=/category/edit.html', 1, 1484363889),
(966, 11, 1, 2130706433, 'category', 10, '操作url：/admin.php?s=/category/edit.html', 1, 1484363897),
(967, 11, 1, 2130706433, 'category', 8, '操作url：/admin.php?s=/category/edit.html', 1, 1484363984),
(968, 11, 1, 2130706433, 'category', 9, '操作url：/admin.php?s=/category/edit.html', 1, 1484363993),
(969, 11, 1, 2130706433, 'category', 10, '操作url：/admin.php?s=/category/edit.html', 1, 1484364002),
(970, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1484364021),
(971, 6, 1, 2130706433, 'config', 38, '操作url：/admin.php?s=/config/edit.html', 1, 1484364060),
(972, 11, 1, 2130706433, 'category', 12, '操作url：/admin.php?s=/category/edit.html', 1, 1484364094),
(973, 11, 1, 2130706433, 'category', 12, '操作url：/admin.php?s=/category/edit.html', 1, 1484364099),
(974, 11, 1, 2130706433, 'category', 28, '操作url：/admin.php?s=/category/remove/id/28.html', 1, 1484364104),
(975, 11, 1, 2130706433, 'category', 15, '操作url：/admin.php?s=/category/remove/id/15.html', 1, 1484364105),
(976, 11, 1, 2130706433, 'category', 14, '操作url：/admin.php?s=/category/remove/id/14.html', 1, 1484364107),
(977, 11, 1, 2130706433, 'category', 13, '操作url：/admin.php?s=/category/remove/id/13.html', 1, 1484364109),
(978, 11, 1, 2130706433, 'category', 12, '操作url：/admin.php?s=/category/edit.html', 1, 1484364129),
(979, 11, 1, 2130706433, 'category', 16, '操作url：/admin.php?s=/category/edit.html', 1, 1484364136),
(980, 11, 1, 2130706433, 'category', 16, '操作url：/admin.php?s=/category/edit.html', 1, 1484364140),
(981, 11, 1, 2130706433, 'category', 16, '操作url：/admin.php?s=/category/edit.html', 1, 1484364147),
(982, 11, 1, 2130706433, 'category', 17, '操作url：/admin.php?s=/category/edit.html', 1, 1484364178),
(983, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484364181),
(984, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/category/edit.html', 1, 1484364182),
(985, 11, 1, 2130706433, 'category', 3, '操作url：/admin.php?s=/category/edit.html', 1, 1484364184),
(986, 11, 1, 2130706433, 'category', 7, '操作url：/admin.php?s=/category/edit.html', 1, 1484364185),
(987, 11, 1, 2130706433, 'category', 30, '操作url：/admin.php?s=/category/edit.html', 1, 1484364186),
(988, 11, 1, 2130706433, 'category', 31, '操作url：/admin.php?s=/category/edit.html', 1, 1484364189),
(989, 11, 1, 2130706433, 'category', 8, '操作url：/admin.php?s=/category/edit.html', 1, 1484364190),
(990, 11, 1, 2130706433, 'category', 9, '操作url：/admin.php?s=/category/edit.html', 1, 1484364191),
(991, 11, 1, 2130706433, 'category', 10, '操作url：/admin.php?s=/category/edit.html', 1, 1484364201),
(992, 11, 1, 2130706433, 'category', 17, '操作url：/admin.php?s=/category/edit.html', 1, 1484364207),
(993, 11, 1, 2130706433, 'category', 18, '操作url：/admin.php?s=/category/edit.html', 1, 1484364222),
(994, 11, 1, 2130706433, 'category', 18, '操作url：/admin.php?s=/category/edit.html', 1, 1484364232),
(995, 11, 1, 2130706433, 'category', 19, '操作url：/admin.php?s=/category/remove/id/19.html', 1, 1484364235),
(996, 11, 1, 2130706433, 'category', 20, '操作url：/admin.php?s=/category/remove/id/20.html', 1, 1484364238),
(997, 11, 1, 2130706433, 'category', 17, '操作url：/admin.php?s=/category/edit.html', 1, 1484364245),
(998, 11, 1, 2130706433, 'category', 18, '操作url：/admin.php?s=/category/edit.html', 1, 1484364252),
(999, 11, 1, 2130706433, 'category', 21, '操作url：/admin.php?s=/category/edit.html', 1, 1484364274),
(1000, 11, 1, 2130706433, 'category', 21, '操作url：/admin.php?s=/category/edit.html', 1, 1484364281),
(1001, 11, 1, 2130706433, 'category', 22, '操作url：/admin.php?s=/category/edit.html', 1, 1484364285),
(1002, 11, 1, 2130706433, 'category', 21, '操作url：/admin.php?s=/category/edit.html', 1, 1484364288),
(1003, 11, 1, 2130706433, 'category', 22, '操作url：/admin.php?s=/category/edit.html', 1, 1484364298),
(1004, 11, 1, 2130706433, 'category', 23, '操作url：/admin.php?s=/category/remove/id/23.html', 1, 1484364301),
(1005, 11, 1, 2130706433, 'category', 24, '操作url：/admin.php?s=/category/remove/id/24.html', 1, 1484364305),
(1006, 11, 1, 2130706433, 'category', 22, '操作url：/admin.php?s=/category/edit.html', 1, 1484364312),
(1007, 11, 1, 2130706433, 'category', 21, '操作url：/admin.php?s=/category/edit.html', 1, 1484364320),
(1008, 11, 1, 2130706433, 'category', 25, '操作url：/admin.php?s=/category/edit.html', 1, 1484364356),
(1009, 11, 1, 2130706433, 'category', 25, '操作url：/admin.php?s=/category/edit.html', 1, 1484364361),
(1010, 11, 1, 2130706433, 'category', 26, '操作url：/admin.php?s=/category/remove/id/26.html', 1, 1484364363),
(1011, 11, 1, 2130706433, 'category', 27, '操作url：/admin.php?s=/category/remove/id/27.html', 1, 1484364364),
(1012, 11, 1, 2130706433, 'category', 25, '操作url：/admin.php?s=/category/edit.html', 1, 1484364373),
(1013, 11, 1, 2130706433, 'category', 32, '操作url：/admin.php?s=/category/add.html', 1, 1484364403),
(1014, 11, 1, 2130706433, 'category', 33, '操作url：/admin.php?s=/category/add.html', 1, 1484364439),
(1015, 11, 1, 2130706433, 'category', 34, '操作url：/admin.php?s=/category/add.html', 1, 1484364498),
(1016, 9, 1, 2130706433, 'channel', 19, '操作url：/admin.php?s=/channel/edit.html', 1, 1484364615),
(1017, 9, 1, 2130706433, 'channel', 20, '操作url：/admin.php?s=/channel/edit.html', 1, 1484364623),
(1018, 9, 1, 2130706433, 'channel', 21, '操作url：/admin.php?s=/channel/edit.html', 1, 1484364629),
(1019, 9, 1, 2130706433, 'channel', 22, '操作url：/admin.php?s=/channel/edit.html', 1, 1484364639),
(1020, 9, 1, 2130706433, 'channel', 21, '操作url：/admin.php?s=/channel/edit.html', 1, 1484364651),
(1021, 9, 1, 2130706433, 'channel', 23, '操作url：/admin.php?s=/channel/edit.html', 1, 1484364666),
(1022, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/model/update.html', 1, 1484365650),
(1023, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/model/update.html', 1, 1484365655),
(1024, 8, 1, 2130706433, 'attribute', 33, '操作url：/admin.php?s=/attribute/update.html', 1, 1484365902),
(1025, 11, 1, 2130706433, 'category', 16, '操作url：/admin.php?s=/category/edit.html', 1, 1484366027),
(1026, 11, 1, 2130706433, 'category', 32, '操作url：/admin.php?s=/category/edit.html', 1, 1484366371),
(1027, 8, 1, 2130706433, 'attribute', 83, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376428),
(1028, 8, 1, 2130706433, 'attribute', 84, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376441),
(1029, 8, 1, 2130706433, 'attribute', 85, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376461),
(1030, 8, 1, 2130706433, 'attribute', 86, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376474),
(1031, 8, 1, 2130706433, 'attribute', 87, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376491),
(1032, 8, 1, 2130706433, 'attribute', 88, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376528),
(1033, 8, 1, 2130706433, 'attribute', 89, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376548),
(1034, 8, 1, 2130706433, 'attribute', 90, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376569),
(1035, 8, 1, 2130706433, 'attribute', 91, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376583),
(1036, 7, 1, 2130706433, 'model', 9, '操作url：/admin.php?s=/model/update.html', 1, 1484376698),
(1037, 7, 1, 2130706433, 'model', 9, '操作url：/admin.php?s=/model/update.html', 1, 1484376766),
(1038, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/category/edit.html', 1, 1484376789),
(1039, 11, 1, 2130706433, 'category', 3, '操作url：/admin.php?s=/category/edit.html', 1, 1484376794),
(1040, 11, 1, 2130706433, 'category', 7, '操作url：/admin.php?s=/category/edit.html', 1, 1484376808),
(1041, 8, 1, 2130706433, 'attribute', 92, '操作url：/admin.php?s=/attribute/update.html', 1, 1484376895),
(1042, 7, 1, 2130706433, 'model', 9, '操作url：/admin.php?s=/model/update.html', 1, 1484376906),
(1043, 7, 1, 2130706433, 'model', 9, '操作url：/admin.php?s=/model/update.html', 1, 1484376914),
(1044, 11, 1, 2130706433, 'category', 32, '操作url：/admin.php?s=/category/edit.html', 1, 1484378702),
(1045, 11, 1, 2130706433, 'category', 32, '操作url：/admin.php?s=/category/edit.html', 1, 1484378969),
(1046, 6, 1, 2130706433, 'config', 48, '操作url：/admin.php?s=/config/edit.html', 1, 1484380701),
(1047, 9, 1, 2130706433, 'channel', 23, '操作url：/admin.php?s=/channel/edit.html', 1, 1484528809),
(1048, 8, 1, 2130706433, 'attribute', 46, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529013),
(1049, 8, 1, 2130706433, 'attribute', 47, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529028),
(1050, 8, 1, 2130706433, 'attribute', 71, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529036),
(1051, 8, 1, 2130706433, 'attribute', 82, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529053),
(1052, 8, 1, 2130706433, 'attribute', 80, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529075),
(1053, 8, 1, 2130706433, 'attribute', 81, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529222),
(1054, 8, 1, 2130706433, 'attribute', 50, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529245),
(1055, 8, 1, 2130706433, 'attribute', 93, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529263),
(1056, 8, 1, 2130706433, 'attribute', 94, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529516),
(1057, 8, 1, 2130706433, 'attribute', 95, '操作url：/admin.php?s=/attribute/update.html', 1, 1484529589),
(1058, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1484529646),
(1059, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1484529700),
(1060, 10, 1, 2130706433, 'Menu', 148, '操作url：/admin.php?s=/menu/edit.html', 1, 1484531528),
(1061, 8, 1, 2130706433, 'attribute', 96, '操作url：/admin.php?s=/attribute/update.html', 1, 1484532013),
(1062, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1484532022),
(1063, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1484532033),
(1064, 11, 1, 606636288, 'category', 1, '操作url：/admin.php?s=/category/edit.html', 1, 1484814826),
(1065, 11, 1, 606636288, 'category', 35, '操作url：/admin.php?s=/category/add.html', 1, 1484814908),
(1066, 11, 1, 606636288, 'category', 35, '操作url：/admin.php?s=/category/remove/id/35.html', 1, 1484814917),
(1067, 8, 1, 1905243423, 'attribute', 97, '操作url：/admin.php?s=/attribute/update.html', 1, 1484877924),
(1068, 7, 1, 1905243423, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1484877935),
(1069, 7, 1, 1905243423, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1484877956),
(1070, 10, 1, 1905243423, 'Menu', 0, '操作url：/admin.php?s=/menu/del/id/143.html', 1, 1484877977),
(1071, 7, 1, 1905243423, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1484878593),
(1072, 7, 1, 1905243423, 'model', 5, '操作url：/admin.php?s=/model/update.html', 1, 1484878618);

-- --------------------------------------------------------

--
-- 表的结构 `dade_addons`
--

CREATE TABLE IF NOT EXISTS `dade_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `dade_addons`
--

INSERT INTO `dade_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(20, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1464059964, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(28, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1482112186, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(30, 'Adapter', '自动适配手机和电脑', '自动适配手机和电脑插件', 0, 'null', '刘国强', '1.0', 1483672123, 0),
(32, 'ImageManager', '图片管理', '图片管理，快速选择已上传图片到封面', 1, '{"page_size":"20","delete_switch":"1","delete_mode":"1"}', '凡人', '0.1', 1484365372, 0),
(24, 'UploadImages', '多图上传', '多图上传', 1, 'null', '木梁大囧', '1.2', 1464751759, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dade_attachment`
--

CREATE TABLE IF NOT EXISTS `dade_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dade_attachment`
--


-- --------------------------------------------------------

--
-- 表的结构 `dade_attribute`
--

CREATE TABLE IF NOT EXISTS `dade_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=98 ;

--
-- 转存表中的数据 `dade_attribute`
--

INSERT INTO `dade_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:头条推荐\r\n2:头条下推荐\r\n4:首页推荐', 1, 0, 1, 1482992787, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(33, 'cid', '图片位置', 'char(50) NOT NULL', 'select', '', '', 1, '1:首页头部广告\r\n2:底部广告\r\n3:Find Us In\r\n4:右边广告\r\n5:Review广告', 4, 1, 1, 1484365902, 1463725489, '', 3, '', 'regex', '', 3, 'function'),
(34, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 4, 1, 1, 1463725524, 1463725524, '', 3, '', 'regex', '', 3, 'function'),
(35, 'banner_id', '幻灯图片', 'int(10) UNSIGNED NOT NULL', 'picture', '0', '', 1, '', 4, 0, 1, 1470364812, 1463725568, '', 3, '', 'regex', '', 3, 'function'),
(36, 'url', '链接地址', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1463725614, 1463725614, '', 3, '', 'regex', '', 3, 'function'),
(37, 'create_time', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 4, 0, 1, 1464747818, 1463725658, '', 1, '', 'regex', 'time', 1, 'function'),
(38, 'status', '状态', 'char(10) NOT NULL', 'radio', '1', '', 1, '0:禁用,1:正常,2:待审核', 4, 0, 1, 1463725696, 1463725696, '', 3, '', 'regex', '', 3, 'function'),
(39, 'sort', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '255', '', 1, '', 4, 0, 1, 1463725722, 1463725722, '', 3, '', 'regex', '', 3, 'function'),
(40, 'seo_title', 'SEO标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1463734006, 1463734006, '', 3, '', 'regex', '', 3, 'function'),
(41, 'seo_keywords', 'SEO关键词', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1463734039, 1463734039, '', 3, '', 'regex', '', 3, 'function'),
(42, 'seo_description', 'SEO简介', 'text NOT NULL', 'textarea', '', '', 1, '', 1, 0, 1, 1463734065, 1463734065, '', 3, '', 'regex', '', 3, 'function'),
(45, 'author', '责任编辑', 'varchar(255) NOT NULL', 'string', 'admin', '', 1, '', 1, 0, 1, 1482892761, 1470298830, '', 3, '', 'regex', '', 3, 'function'),
(46, 'name', 'Full Name', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484529013, 1470365793, '', 3, '', 'regex', '', 3, 'function'),
(47, 'phone', 'Cell Phone', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484529028, 1470365814, '', 3, '', 'regex', '', 3, 'function'),
(50, 'content', 'SpecialRequests', 'text NOT NULL', 'textarea', '', '', 1, '', 5, 0, 1, 1484529245, 1470365899, '', 3, '', 'regex', '', 3, 'function'),
(51, 'createtime', '留言时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 5, 0, 1, 1482139754, 1470365923, '', 3, '', 'regex', '', 3, 'function'),
(82, 'title', 'Nationality', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484529053, 1482893557, '', 3, '', 'regex', '', 3, 'function'),
(72, 'ip', 'IP', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1482140653, 1482140653, '', 3, '', 'regex', '', 3, 'function'),
(79, 'cid', '链接位置', 'char(50) NOT NULL', 'select', '', '', 1, '1:核站点\r\n2:中陕核子公司\r\n3:政府站点\r\n4:生活服务', 6, 0, 1, 1482893218, 1482893190, '', 3, '', 'regex', '', 3, 'function'),
(81, 'address', 'Date', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484529222, 1482893537, '', 3, '', 'regex', '', 3, 'function'),
(71, 'email', 'Email', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484529036, 1482139827, '', 3, '', 'regex', '', 3, 'function'),
(56, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 6, 1, 1, 1470622310, 1470622310, '', 3, '', 'regex', '', 3, 'function'),
(57, 'url', '链接', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 6, 1, 1, 1470622330, 1470622330, '', 3, '', 'regex', '', 3, 'function'),
(58, 'img', '图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 6, 0, 1, 1470622349, 1470622349, '', 3, '', 'regex', '', 3, 'function'),
(59, 'sort', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '255', '', 1, '', 6, 0, 1, 1470623035, 1470622424, '', 3, '', 'regex', '', 3, 'function'),
(60, 'createtime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 6, 0, 1, 1470623379, 1470622453, '', 3, '', 'regex', 'time', 3, 'function'),
(62, 'nutrient', '营养成分', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1482115904, 1482115904, '', 3, '', 'regex', '', 3, 'function'),
(63, 'efficacy', '主要功效', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1482115919, 1482115919, '', 3, '', 'regex', '', 3, 'function'),
(64, 'eatit', '食用方法', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1482115939, 1482115939, '', 3, '', 'regex', '', 3, 'function'),
(65, 'specification', '产品规格', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1482115957, 1482115957, '', 3, '', 'regex', '', 3, 'function'),
(83, 'tour_time', 'Time', 'text NOT NULL', 'textarea', '', '', 1, '', 1, 0, 1, 1484376428, 1484376428, '', 3, '', 'regex', '', 3, 'function'),
(68, 'source', '文章来源', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1482892749, 1482116258, '', 3, '', 'regex', '', 3, 'function'),
(75, 'price', '价格', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 1, 0, 1, 1482462289, 1482462289, '', 3, '', 'regex', '', 3, 'function'),
(76, 'link_url', '外链', 'varchar(255) NOT NULL', 'string', '', '如果外链不为空则跳转到外链', 1, '', 1, 0, 1, 1482463218, 1482463218, '', 3, '', 'regex', '', 3, 'function'),
(78, 'meet_time', '会议时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 1, 0, 1, 1482818059, 1482817333, '', 3, '', 'regex', 'time', 3, 'function'),
(84, 'tour_where', 'Where', 'text NOT NULL', 'textarea', '', '', 1, '', 1, 0, 1, 1484376441, 1484376441, '', 3, '', 'regex', '', 3, 'function'),
(80, 'sex', 'party', 'char(10) NOT NULL', 'num', '', '', 1, '', 5, 0, 1, 1484529075, 1482893480, '', 3, '', 'regex', '', 3, 'function'),
(85, 'tour_style', 'Tour Style', 'text NOT NULL', 'textarea', '', '', 1, '', 1, 0, 1, 1484376461, 1484376461, '', 3, '', 'regex', '', 3, 'function'),
(86, 'food_theme', 'Food Theme', 'text NOT NULL', 'textarea', '', '', 1, '', 1, 0, 1, 1484376474, 1484376474, '', 3, '', 'regex', '', 3, 'function'),
(87, 'tour_notes', 'Notes', 'text NOT NULL', 'textarea', '', '', 1, '', 1, 0, 1, 1484376491, 1484376491, '', 3, '', 'regex', '', 3, 'function'),
(88, 'tour_itinerary', 'Itinerary', 'text NOT NULL', 'editor', '', '', 1, '', 9, 0, 1, 1484376528, 1484376528, '', 3, '', 'regex', '', 3, 'function'),
(89, 'tour_price', 'Price', 'text NOT NULL', 'editor', '', '', 1, '', 9, 0, 1, 1484376548, 1484376548, '', 3, '', 'regex', '', 3, 'function'),
(90, 'tour_exclusion', 'Inclusion/Exclusion', 'text NOT NULL', 'editor', '', '', 1, '', 9, 0, 1, 1484376569, 1484376569, '', 3, '', 'regex', '', 3, 'function'),
(91, 'tour_condition', 'Condition', 'text NOT NULL', 'editor', '', '', 1, '', 9, 0, 1, 1484376583, 1484376583, '', 3, '', 'regex', '', 3, 'function'),
(92, 'itemimg', '多图', 'varchar(255) NOT NULL', 'multiple', '', '', 1, '', 9, 0, 1, 1484376895, 1484376895, '', 3, '', 'regex', '', 3, 'function'),
(93, 'dietary', 'Dietary Restrictions', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484529263, 1484529263, '', 3, '', 'regex', '', 3, 'function'),
(94, 'findus', 'How do you find us', 'varchar(100) NOT NULL', 'checkbox', '', '', 1, '1:Google\r\n2:Facebook\r\n3:TripAdvisor\r\n4:Others', 5, 0, 1, 1484529516, 1484529516, '', 3, '', 'regex', '', 3, 'function'),
(95, 'hfindus', 'How do you find us', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484529589, 1484529589, '', 3, '', 'regex', '', 3, 'function'),
(96, 'arc_title', 'Title', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484532013, 1484532013, '', 3, '', 'regex', '', 3, 'function'),
(97, 'tour_code', 'tour code', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 0, 1, 1484877924, 1484877924, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `dade_auth_extend`
--

CREATE TABLE IF NOT EXISTS `dade_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `dade_auth_extend`
--

INSERT INTO `dade_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 2),
(1, 2, 2),
(1, 3, 2),
(1, 48, 1),
(1, 49, 1),
(1, 50, 1),
(1, 51, 1),
(1, 52, 1),
(1, 53, 1),
(1, 54, 1),
(1, 55, 1),
(1, 57, 1),
(1, 58, 1),
(5, 48, 1),
(5, 49, 1),
(5, 50, 1),
(5, 51, 1),
(5, 52, 1),
(5, 53, 1),
(5, 54, 1),
(5, 55, 1),
(5, 76, 1),
(5, 77, 1),
(5, 78, 1),
(5, 79, 1),
(5, 80, 1),
(5, 81, 1),
(5, 82, 1),
(5, 83, 1),
(5, 84, 1),
(5, 85, 1),
(5, 86, 1),
(5, 87, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dade_auth_group`
--

CREATE TABLE IF NOT EXISTS `dade_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dade_auth_group`
--

INSERT INTO `dade_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(5, 'admin', 1, '默认用户组', '默认用户组', 1, '1,2,3,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,52,53,64,65,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,94,95,107,108,109,110,211,215,216,222,225,229,230,231,235,237,242');

-- --------------------------------------------------------

--
-- 表的结构 `dade_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `dade_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dade_auth_group_access`
--

INSERT INTO `dade_auth_group_access` (`uid`, `group_id`) VALUES
(2, 5);

-- --------------------------------------------------------

--
-- 表的结构 `dade_auth_rule`
--

CREATE TABLE IF NOT EXISTS `dade_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=243 ;

--
-- 转存表中的数据 `dade_auth_rule`
--

INSERT INTO `dade_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动1', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', -1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/CodeEditor/lists', '代码编辑器', 1, ''),
(218, 'admin', 1, 'Admin/CodeEditor/delete', '删除', 1, ''),
(219, 'admin', 1, 'Admin/CodeEditor/makeDir', '新建文件夹', 1, ''),
(220, 'admin', 1, 'Admin/CodeEditor/upload', '上传文件', 1, ''),
(221, 'admin', 1, 'Admin/CodeEditor/edit', '编辑文件', 1, ''),
(222, 'admin', 1, 'Admin/Transaction/lists?model=banner', '广告管理', 1, ''),
(223, 'admin', 1, 'Admin/transaction/add?model=4', '新增', -1, ''),
(224, 'admin', 1, 'Admin/transaction/edit/?model=4', '编辑', -1, ''),
(225, 'admin', 2, 'Admin/Transaction/lists?model=banner', '事务', 1, ''),
(226, 'admin', 1, 'Admin/transaction/del?model=4', '删除', -1, ''),
(227, 'admin', 1, 'Admin/transaction/edit?model=4', '编辑', -1, ''),
(228, 'admin', 1, 'Admin/Channel/venuenum', '导航分类', 1, ''),
(229, 'admin', 1, 'Admin/transaction/add', '新增', 1, ''),
(230, 'admin', 1, 'Admin/transaction/del', '删除', 1, ''),
(231, 'admin', 1, 'Admin/transaction/edit', '编辑', 1, ''),
(232, 'admin', 1, 'Admin/111', '111', -1, ''),
(233, 'admin', 1, 'Admin/Category/operate/type/move/', '移动', -1, ''),
(234, 'admin', 1, 'Admin/Category/operate', '移动', -1, ''),
(235, 'admin', 1, 'Admin/Index/clearCache', '清除缓存', 1, ''),
(236, 'admin', 1, 'Admin/Transaction/lists?model=online', 'Book', 1, ''),
(237, 'admin', 1, 'Admin/Transaction/lists?model=links', '友情链接', 1, ''),
(238, 'admin', 1, 'Admin/Member/edit', '查看会员信息', -1, ''),
(239, 'admin', 1, 'Admin/Member/del', '删除会员', -1, ''),
(240, 'admin', 1, 'Admin/Member/changestatus', '会员禁用', -1, ''),
(241, 'admin', 1, 'Admin/Member/index', '会员管理', -1, ''),
(242, 'admin', 1, 'Admin/article/examine', '审核', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `dade_banner`
--

CREATE TABLE IF NOT EXISTS `dade_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cid` char(50) NOT NULL COMMENT '图片位置',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `banner_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '幻灯图片',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` char(10) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(10) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `dade_banner`
--

INSERT INTO `dade_banner` (`id`, `cid`, `title`, `banner_id`, `url`, `create_time`, `status`, `sort`) VALUES
(47, '3', 'Chengdu', 107, '/lists/chengdu-tours.html', 1484380273, '1', 3),
(46, '3', 'Beijing', 107, '/lists/beijing-tours.html', 1484380261, '1', 2),
(45, '3', 'Xi''an', 107, '/lists/xian-tours.html', 1484380247, '1', 1),
(44, '4', 'Video', 101, '/lists/video.html', 1484376314, '1', 2),
(43, '4', 'Gallery', 101, '/lists/gallery.html', 1484376302, '1', 1),
(38, '1', 'Banner图2', 115, '', 1484365432, '1', 2),
(39, '2', '底部广告', 98, '', 1484365929, '1', 1),
(40, '5', 'Gallery', 101, '/lists/gallery.html', 1484374111, '1', 1),
(41, '5', 'Video', 101, '/lists/video.html', 1484374133, '1', 2),
(42, '5', 'News', 101, '/lists/news.html', 1484374146, '1', 3),
(33, '1', 'Banner 图', 114, '', 1482906373, '1', 1),
(48, '1', 'Banner图3', 116, '', 1484904672, '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dade_category`
--

CREATE TABLE IF NOT EXISTS `dade_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '2' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '2' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '1',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `dade_category`
--

INSERT INTO `dade_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, 'xian-tours', 'Xian Tours', 0, 1, 10, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1482825690, 1484814826, 1, 98),
(2, 'xian-food-tours', 'Food Tours', 1, 1, 10, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1482825704, 1484376789, 1, 0),
(3, 'xian-non-food-tours', 'Non Food Tours', 1, 2, 10, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1482825722, 1484376794, 1, 0),
(31, 'beijing-non-food-tours', 'Non Food Tours', 7, 2, 10, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1484363584, 1484364189, 1, 0),
(7, 'beijing-tours', 'Beijing Tours', 0, 3, 9, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1482825832, 1484376808, 1, 0),
(8, 'chengdu-tours', 'Chengdu Tours', 0, 4, 10, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1482825857, 1484364190, 1, 0),
(9, 'chengdu-food-tours', 'Food Tours', 8, 1, 10, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1482825876, 1484364191, 1, 0),
(10, 'chengdu-non-food-tours', 'Non Food Tours', 8, 2, 10, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1482825890, 1484364201, 1, 0),
(12, 'review', 'Review', 0, 5, 10, '', '', '', '', 'review', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1482825920, 1484364129, 1, 0),
(16, 'about', 'About', 0, 7, 10, '', '', '', '', 'about', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1482826010, 1484366027, 1, 98),
(17, 'our-story', 'Our Story', 16, 1, 10, '', '', '', '', 'about', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1482826026, 1484364245, 1, 0),
(18, 'why-choose-us', 'Why Choose us', 16, 2, 10, '', '', '', '', 'about', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1482826040, 1484364252, 1, 0),
(21, 'contact-ust', 'Contact Us', 0, 8, 10, '', '', '', '', 'about', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1482826113, 1484364320, 1, 0),
(22, 'contact-us', 'Contact Us', 21, 1, 10, '', '', '', '', 'about', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1482826128, 1484364312, 1, 0),
(34, 'gallery', 'Gallery', 0, 15, 10, '', '', '', '', 'gallery', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1484364498, 1484364498, 1, 0),
(25, 'faqs', 'FAQS', 0, 10, 10, '', '', '', '', 'faqs', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1482826185, 1484364373, 1, 0),
(33, 'video', 'Video', 0, 13, 10, '', '', '', '', 'video', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1484364439, 1484364439, 1, 0),
(32, 'news', 'News', 0, 11, 12, '', '', '', '', 'lists', 'detail', '', '2', '2', 0, 1, 1, 1, 0, '1', '', 1484364403, 1484378969, 1, 0),
(30, 'beijing-food-tours', 'Food Tours', 7, 1, 10, '', '', '', '', 'tours', 'tourdetail', '', '9', '2', 0, 1, 1, 1, 0, '1', '', 1484363553, 1484364186, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dade_channel`
--

CREATE TABLE IF NOT EXISTS `dade_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `men_id` int(11) DEFAULT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- 转存表中的数据 `dade_channel`
--

INSERT INTO `dade_channel` (`id`, `men_id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(20, 12, 0, 'Review', 'lists/review', 2, 1482116769, 1484364623, 1, 0),
(19, 1, 0, 'Tours', 'lists/xian-tours', 1, 1482116761, 1484364615, 1, 0),
(21, 17, 0, 'About', 'lists/our-story', 3, 1482117111, 1484364651, 1, 0),
(22, 22, 0, 'Contact Us', 'lists/contact-us', 4, 1482117131, 1484364639, 1, 0),
(23, 25, 0, 'Book', 'book/index', 6, 1482117160, 1484528809, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dade_config`
--

CREATE TABLE IF NOT EXISTS `dade_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `dade_config`
--

INSERT INTO `dade_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1482113016, 1, 'xian food tours', 1),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1482113038, 1, 'xian food tours', 4),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1482113086, 1, 'xian food tours', 3),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1482113047, 1, '1', 10),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '热搜关键词', 1, '', '设置在网站搜索下面每个词之间用英文","号隔开', 1378900335, 1482133810, 1, '', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1482113128, 1, 'default_color', 11),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '0', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(38, 'CAT_TEMPLATE', 2, '分类模板', 0, '', '', 1463557981, 1484364060, 1, 'lists:默认新闻模板\r\nabout:单篇文章模板\r\nvideo:视频展示模板\r\ntours:旅游模板\r\nfaqs:问答模板\r\nreview:Review模板\r\ngallery:图片模板', 100),
(39, 'DEAL_TEMPLATE', 1, '详情页模板', 0, '', '', 1463642905, 1484363471, 1, 'detail:默认模板\r\ntourdetail:旅游模板', 101),
(40, 'WEB_COPYRIGHT', 2, '版权', 1, '', '网页底部版权', 1463736621, 1482132024, 1, 'Copyright 2015-2022  Lily Xian Private Tours, professional China travel agency and China tour operator. All rights preserved.', 5),
(42, 'WEB_HOME_TITLE', 1, '首页SEO标题', 1, '', '首页SEO标题', 1482112983, 1482113059, 1, 'xian food tours', 2),
(48, 'WEB_BANNER_TITLE', 2, '广告图下面文字', 1, '', '广告图下面文字', 1484380679, 1484380701, 1, 'What our culinary travellers say What our culinary travellers sayWhat our culinary travellers sayWhat our culinary travellers sayWhat our culinary travellers sayWhat our culinary travellers sayWhat our culinary travellers say What our culinary travellers say What our culinary travellers say What our culinary travellers say What our culinary travellers say What our culinary travellers say', 6);

-- --------------------------------------------------------

--
-- 表的结构 `dade_document`
--

CREATE TABLE IF NOT EXISTS `dade_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键词',
  `seo_description` text NOT NULL COMMENT 'SEO简介',
  `author` varchar(255) NOT NULL COMMENT '责任编辑',
  `nutrient` varchar(255) NOT NULL COMMENT '营养成分',
  `efficacy` varchar(255) NOT NULL COMMENT '主要功效',
  `eatit` varchar(255) NOT NULL COMMENT '食用方法',
  `specification` varchar(255) NOT NULL COMMENT '产品规格',
  `source` varchar(255) NOT NULL DEFAULT '11' COMMENT '文章来源',
  `price` varchar(255) NOT NULL COMMENT '价格',
  `link_url` varchar(255) NOT NULL COMMENT '外链',
  `meet_time` int(10) NOT NULL COMMENT '会议时间',
  `tour_time` text NOT NULL COMMENT 'Time',
  `tour_where` text NOT NULL COMMENT 'Where',
  `tour_style` text NOT NULL COMMENT 'Tour Style',
  `food_theme` text NOT NULL COMMENT 'Food Theme',
  `tour_notes` text NOT NULL COMMENT 'Notes',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `dade_document`
--

INSERT INTO `dade_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `author`, `nutrient`, `efficacy`, `eatit`, `specification`, `source`, `price`, `link_url`, `meet_time`, `tour_time`, `tour_where`, `tour_style`, `food_theme`, `tour_notes`) VALUES
(1, 1, '', 'Experience Real Bangkok Through Taste', 32, '\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok\\''s most savory neighbo', 0, 0, 2, 2, 0, 0, 99, 1, 0, 0, 5, 0, 0, 0, 1484366533, 1484366533, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(2, 1, '', 'May he rest in peace forever', 32, 'Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkoks most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.', 0, 0, 2, 2, 4, 0, 99, 1, 0, 0, 5, 0, 0, 0, 1484366640, 1484367217, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(26, 1, '', 'video', 33, '', 0, 0, 2, 2, 4, 0, 101, 1, 0, 0, 0, 0, 0, 0, 1484818422, 1484818422, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(25, 1, '', 'xianxianxianxianxianxianxianxianxianxianxianxianxianxianxian', 2, 'With more than 10,000 pubs and bars , Bangkok is widely known as one of the world''s best nightlife cities. On this tour, we will bring you to explore Bangkok’s never-to-be-missed nightlife areas to experience 4 most unique and exotic bars. Starting your journey at BTS Thonglor, then start your night with', 0, 0, 9, 2, 0, 0, 108, 1, 0, 0, 15, 0, 0, 0, 1484817300, 1484817660, 1, '', '', '', '', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(6, 1, '', 'FredRo1948, TripAdvisor', 12, '	We tasted Thai dishes I had never heard of and probably can\\''t get in the US unless I prepare them myself. Nonetheles', 0, 0, 2, 2, 0, 0, 102, 1, 0, 0, 0, 0, 0, 0, 1484374260, 1484374350, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(7, 1, '', 'DinhoGeneve, TripAdvisor', 12, '	Did the local food tour around Bangrak on Aug 9. Get ready to eat for 4-5 hours, but the tour takes your to 5-7 diffe', 0, 0, 2, 2, 0, 0, 102, 1, 0, 0, 0, 0, 0, 0, 1484374260, 1484374342, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(8, 1, '', 'Robert M, TripAdvisor', 12, '	My wife and I did the night food tour with Lucy. She was extremely knowledgeable and took us to all the local hot spo', 0, 0, 2, 2, 0, 0, 102, 1, 0, 0, 0, 0, 0, 0, 1484374260, 1484374321, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(9, 1, '', 'May he rest in peace forever', 33, 'Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkoks most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.', 0, 0, 2, 2, 4, 0, 99, 1, 0, 0, 2, 0, 0, 0, 1484811000, 1484818495, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(10, 1, '', 'Experience Real Bangkok Through Taste', 33, '	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok\\''s most savory neighbo', 0, 0, 2, 2, 4, 0, 99, 1, 0, 0, 1, 0, 0, 0, 1484818620, 1484818595, 1, '', '', '', 'admin', '', '', '', '', '11', '', 'http://xianfoodtour.com/book/index.html', 0, '', '', '', '', ''),
(11, 1, '', 'Can I get a refund or reschedule my tickets?', 25, '\r\n	Tickets cannot be refunded as your space is guaranteed on the tour once purchased. Refund is, therefore, not allowed ', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1484375725, 1484375725, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(12, 1, '', 'In case a tour is sold out, can I get on a waiting list?', 25, '\r\n	At this time, we do not provide a waiting list. However, please contact us to let us know what date you are intereste', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1484375745, 1484375745, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(13, 1, '', 'Bangkok Exotic Bar Crawl by Tuk Tuk', 2, 'Bangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk Tuk', 0, 0, 9, 2, 0, 0, 106, 1, 0, 0, 69, 0, 0, 0, 1484377080, 1484377121, 1, '', '', '', '', '', '', '', '', '11', '', '', 0, '7.30 pm - 11.30 pm\r\nEveryday except Monday', 'Meet: BTS Thonglor\r\nEnd: BTS Silom', 'Tuk Tuk + Bar Crawls', 'Bangkok Night Bar', '- Short and slippers is not allowed \r\nto enter the bars'),
(14, 1, '', 'May he rest in peace forever', 32, 'Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkoks most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.', 0, 0, 2, 2, 4, 0, 99, 1, 0, 0, 5, 0, 0, 0, 1484378833, 1484378833, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(15, 1, '', 'Experience Real Bangkok Through Taste', 32, '\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok\\''s most savory neighbo', 0, 0, 2, 2, 0, 0, 99, 1, 0, 0, 3, 0, 0, 0, 1484378833, 1484378833, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(16, 1, '', 'Experience Real Bangkok Through Taste', 32, '\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok\\''s most savory neighbo', 0, 0, 2, 2, 0, 0, 99, 1, 0, 0, 10, 0, 0, 0, 1484378835, 1484378835, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(17, 1, '', 'May he rest in peace forever', 32, 'Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkoks most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.', 0, 0, 2, 2, 4, 0, 99, 1, 0, 0, 9, 0, 0, 0, 1484378835, 1484378835, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(18, 1, '', 'May he rest in peace forever', 32, 'Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkoks most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.', 0, 0, 2, 2, 4, 0, 99, 1, 0, 0, 12, 0, 0, 0, 1484378835, 1484378835, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(19, 1, '', 'Experience Real Bangkok Through Taste', 32, '\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok\\''s most savory neighbo', 0, 0, 2, 2, 0, 0, 99, 1, 0, 0, 2, 0, 0, 0, 1484378835, 1484378835, 1, '', '', '', 'admin', '', '', '', '', '11', '', '', 0, '', '', '', '', ''),
(20, 1, '', 'Bangkok Exotic Bar Crawl by Tuk Tuk', 2, 'Bangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk Tuk', 0, 0, 9, 2, 0, 0, 106, 1, 0, 0, 71, 0, 0, 0, 1484382281, 1484382281, 1, '', '', '', '', '', '', '', '', '11', '', '', 0, '7.30 pm - 11.30 pm\r\nEveryday except Monday', 'Meet: BTS Thonglor\r\nEnd: BTS Silom', 'Tuk Tuk + Bar Crawls', 'Bangkok Night Bar', '- Short and slippers is not allowed \r\nto enter the bars'),
(21, 1, '', 'Bangkok Exotic Bar Crawl by Tuk Tuk', 2, 'Bangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk Tuk', 0, 0, 9, 2, 0, 0, 106, 1, 0, 0, 77, 0, 0, 0, 1484382284, 1484382284, 1, '', '', '', '', '', '', '', '', '11', '', '', 0, '7.30 pm - 11.30 pm\r\nEveryday except Monday', 'Meet: BTS Thonglor\r\nEnd: BTS Silom', 'Tuk Tuk + Bar Crawls', 'Bangkok Night Bar', '- Short and slippers is not allowed \r\nto enter the bars'),
(22, 1, '', 'Bangkok Exotic Bar Crawl by Tuk Tuk', 2, 'Bangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk Tuk', 0, 0, 9, 2, 0, 0, 106, 1, 0, 0, 75, 0, 0, 0, 1484382284, 1484382284, 1, '', '', '', '', '', '', '', '', '11', '', '', 0, '7.30 pm - 11.30 pm\r\nEveryday except Monday', 'Meet: BTS Thonglor\r\nEnd: BTS Silom', 'Tuk Tuk + Bar Crawls', 'Bangkok Night Bar', '- Short and slippers is not allowed \r\nto enter the bars'),
(23, 1, '', 'Bangkok Exotic Bar Crawl by Tuk Tuk', 3, 'Bangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk Tuk', 0, 0, 9, 2, 0, 0, 106, 1, 0, 0, 102, 0, 0, 0, 1484386943, 1484386943, 1, '', '', '', '', '', '', '', '', '11', '', '', 0, '7.30 pm - 11.30 pm\r\nEveryday except Monday', 'Meet: BTS Thonglor\r\nEnd: BTS Silom', 'Tuk Tuk + Bar Crawls', 'Bangkok Night Bar', '- Short and slippers is not allowed \r\nto enter the bars'),
(24, 1, '', 'Bangkok Exotic Bar Crawl by Tuk Tuk', 3, 'Bangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk TukBangkok Exotic Bar Crawl by Tuk Tuk', 0, 0, 9, 2, 0, 0, 106, 1, 0, 0, 108, 0, 0, 0, 1484386943, 1484386943, 1, '', '', '', '', '', '', '', '', '11', '', '', 0, '7.30 pm - 11.30 pm\r\nEveryday except Monday', 'Meet: BTS Thonglor\r\nEnd: BTS Silom', 'Tuk Tuk + Bar Crawls', 'Bangkok Night Bar', '- Short and slippers is not allowed \r\nto enter the bars');

-- --------------------------------------------------------

--
-- 表的结构 `dade_document_article`
--

CREATE TABLE IF NOT EXISTS `dade_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `dade_document_article`
--

INSERT INTO `dade_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(1, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(2, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(26, 0, '', '', 0),
(6, 0, '<p>\r\n	We tasted Thai dishes I had never heard of and probably can''t get in the US unless I prepare them myself. Nonetheless, everything and every place she took me was excellent. With a running commentary in fluent English on the regional nature of the cuisines I was sampling, Tiny also filled in lots of details about Thai culture, both around food and other aspects of life. Overall, this was one of the best food tours I''ve taken, and Tiny''s caring and attentive guidance made it all possible. A must do activity in Bangkok!\r\n</p>', '', 0),
(7, 0, '<p>\r\n	Did the local food tour around Bangrak on Aug 9. Get ready to eat for 4-5 hours, but the tour takes your to 5-7 different places and even across the river. Everything is well paced so you have a short walk in between every tasting, yet manageable in the Bangkok heat.\r\n</p>', '', 0),
(8, 0, '<p>\r\n	My wife and I did the night food tour with Lucy. She was extremely knowledgeable and took us to all the local hot spots in China town. Most places we went to had a table ready for us which was nice. Lucy also took much care of us when crossing the street as she would always step out first.\r\n</p>', '', 0),
(9, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(10, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(11, 0, '<p>\r\n	Tickets cannot be refunded as your space is guaranteed on the tour once purchased. Refund is, therefore, not allowed for no shows, or late arrivals and each tour is scheduled to depart on time. However, reschedule is possible in case your new requested tour is still available.\r\n</p>', '', 0),
(12, 0, '<p>\r\n	At this time, we do not provide a waiting list. However, please contact us to let us know what date you are interested in (and do not see any availability). If possible, we can add an additional tour on that day.\r\n</p>', '', 0),
(14, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(15, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(16, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(17, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(18, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0),
(19, 0, '<p>\r\n	Discover why Bangkok is often dubbed a food capital of the world. Eat your way through Bangkok''s most savory neighborhoods as our knowledgeable culinary guides unveil true stories behind local eateries and their famous recipes. Along the way, you’ll also learn about history, culture, and tradition.\r\n</p>\r\n<p>\r\n	All food tours include a variety of mouth-watering food tastings (enough for lunch and dinner), from Thai and ethnic specialty eateries, renowned street food stalls, to historic fine dining restaurants.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With so many foods to try and it''s difficult to get started, let us guide you to best dishes and connect you to best local chefs in town. We plan, you explore, eat, and enjoy! It''s a foodie dream come true.\r\n</p>', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dade_document_tours`
--

CREATE TABLE IF NOT EXISTS `dade_document_tours` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tour_itinerary` text NOT NULL COMMENT 'Itinerary',
  `tour_price` text NOT NULL COMMENT 'Price',
  `tour_exclusion` text NOT NULL COMMENT 'Inclusion/Exclusion',
  `tour_condition` text NOT NULL COMMENT 'Condition',
  `itemimg` varchar(255) NOT NULL COMMENT '多图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `dade_document_tours`
--

INSERT INTO `dade_document_tours` (`id`, `tour_itinerary`, `tour_price`, `tour_exclusion`, `tour_condition`, `itemimg`) VALUES
(13, '<p>\r\n	angkok Exotic Bar Crawl by Tuk Tuk\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With more than 10,000 pubs and bars , Bangkok is widely known as one of the world''s best nightlife cities. On this tour, we will bring you to explore Bangkok’s never-to-be-missed nightlife areas to experience 4 most unique and exotic bars. Starting your journey at BTS Thonglor, then start your night with the first bar specializing on Thai-style Tequila (known to locals as Ya Dong) with amazingly fun environment. While the night is still young, beat up your night with cool modern-traditional Thai music bar. Here, you will experience how traditional Thai music is perfectly paired with liquor. Then, the Tuk Tuk will take you to the secret underground bar decorating in oriental style. This third bar is very famous for jazz. The tour will be ended at the fourth bar, which you can see Muay Thai (Thai kickboxing) while zipping your cool beer or cocktail. It’s probably the only bar in the world that has Muay Thai stage inside.\r\n</p>', '<p>\r\n	This tour is also available as a private option\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	The itinerary of the Bangkok Exotic Bar Crawl by Tuk Tuk is identical to that of the Join-in one. However, in the private option, it will be more exclusive (just you and the guide)and the tour starting time is more flexible. On this private tour, you can decide your own starting time ranging from 7.30 pm – 8.00 pm. We can’t start the tour later than 8.00 pm.\r\n</p>', '<p>\r\n	ooking condition\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1. An automated receipt of payment from Paypal\r\n</p>\r\n<p>\r\n	2. An automated booking confirmation containing a guideline to the meeting place and meeting time of each tour. The guideline will help you on the direction to meet us at the meeting place.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	In case, you don''t see any of these 2 emails within 2 hours after booking, please check your junk mail inbox. If you still can''t find it, please simply contact us at "info@bangkokfoodtours.com"\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	Cancellation Policy\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>', '103,104,105'),
(20, '<p>\r\n	angkok Exotic Bar Crawl by Tuk Tuk\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With more than 10,000 pubs and bars , Bangkok is widely known as one of the world''s best nightlife cities. On this tour, we will bring you to explore Bangkok’s never-to-be-missed nightlife areas to experience 4 most unique and exotic bars. Starting your journey at BTS Thonglor, then start your night with the first bar specializing on Thai-style Tequila (known to locals as Ya Dong) with amazingly fun environment. While the night is still young, beat up your night with cool modern-traditional Thai music bar. Here, you will experience how traditional Thai music is perfectly paired with liquor. Then, the Tuk Tuk will take you to the secret underground bar decorating in oriental style. This third bar is very famous for jazz. The tour will be ended at the fourth bar, which you can see Muay Thai (Thai kickboxing) while zipping your cool beer or cocktail. It’s probably the only bar in the world that has Muay Thai stage inside.\r\n</p>', '<p>\r\n	This tour is also available as a private option\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	The itinerary of the Bangkok Exotic Bar Crawl by Tuk Tuk is identical to that of the Join-in one. However, in the private option, it will be more exclusive (just you and the guide)and the tour starting time is more flexible. On this private tour, you can decide your own starting time ranging from 7.30 pm – 8.00 pm. We can’t start the tour later than 8.00 pm.\r\n</p>', '<p>\r\n	ooking condition\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1. An automated receipt of payment from Paypal\r\n</p>\r\n<p>\r\n	2. An automated booking confirmation containing a guideline to the meeting place and meeting time of each tour. The guideline will help you on the direction to meet us at the meeting place.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	In case, you don''t see any of these 2 emails within 2 hours after booking, please check your junk mail inbox. If you still can''t find it, please simply contact us at "info@bangkokfoodtours.com"\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	Cancellation Policy\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>', '103,104,105'),
(21, '<p>\r\n	angkok Exotic Bar Crawl by Tuk Tuk\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With more than 10,000 pubs and bars , Bangkok is widely known as one of the world''s best nightlife cities. On this tour, we will bring you to explore Bangkok’s never-to-be-missed nightlife areas to experience 4 most unique and exotic bars. Starting your journey at BTS Thonglor, then start your night with the first bar specializing on Thai-style Tequila (known to locals as Ya Dong) with amazingly fun environment. While the night is still young, beat up your night with cool modern-traditional Thai music bar. Here, you will experience how traditional Thai music is perfectly paired with liquor. Then, the Tuk Tuk will take you to the secret underground bar decorating in oriental style. This third bar is very famous for jazz. The tour will be ended at the fourth bar, which you can see Muay Thai (Thai kickboxing) while zipping your cool beer or cocktail. It’s probably the only bar in the world that has Muay Thai stage inside.\r\n</p>', '<p>\r\n	This tour is also available as a private option\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	The itinerary of the Bangkok Exotic Bar Crawl by Tuk Tuk is identical to that of the Join-in one. However, in the private option, it will be more exclusive (just you and the guide)and the tour starting time is more flexible. On this private tour, you can decide your own starting time ranging from 7.30 pm – 8.00 pm. We can’t start the tour later than 8.00 pm.\r\n</p>', '<p>\r\n	ooking condition\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1. An automated receipt of payment from Paypal\r\n</p>\r\n<p>\r\n	2. An automated booking confirmation containing a guideline to the meeting place and meeting time of each tour. The guideline will help you on the direction to meet us at the meeting place.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	In case, you don''t see any of these 2 emails within 2 hours after booking, please check your junk mail inbox. If you still can''t find it, please simply contact us at "info@bangkokfoodtours.com"\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	Cancellation Policy\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>', '103,104,105'),
(22, '<p>\r\n	angkok Exotic Bar Crawl by Tuk Tuk\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With more than 10,000 pubs and bars , Bangkok is widely known as one of the world''s best nightlife cities. On this tour, we will bring you to explore Bangkok’s never-to-be-missed nightlife areas to experience 4 most unique and exotic bars. Starting your journey at BTS Thonglor, then start your night with the first bar specializing on Thai-style Tequila (known to locals as Ya Dong) with amazingly fun environment. While the night is still young, beat up your night with cool modern-traditional Thai music bar. Here, you will experience how traditional Thai music is perfectly paired with liquor. Then, the Tuk Tuk will take you to the secret underground bar decorating in oriental style. This third bar is very famous for jazz. The tour will be ended at the fourth bar, which you can see Muay Thai (Thai kickboxing) while zipping your cool beer or cocktail. It’s probably the only bar in the world that has Muay Thai stage inside.\r\n</p>', '<p>\r\n	This tour is also available as a private option\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	The itinerary of the Bangkok Exotic Bar Crawl by Tuk Tuk is identical to that of the Join-in one. However, in the private option, it will be more exclusive (just you and the guide)and the tour starting time is more flexible. On this private tour, you can decide your own starting time ranging from 7.30 pm – 8.00 pm. We can’t start the tour later than 8.00 pm.\r\n</p>', '<p>\r\n	ooking condition\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1. An automated receipt of payment from Paypal\r\n</p>\r\n<p>\r\n	2. An automated booking confirmation containing a guideline to the meeting place and meeting time of each tour. The guideline will help you on the direction to meet us at the meeting place.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	In case, you don''t see any of these 2 emails within 2 hours after booking, please check your junk mail inbox. If you still can''t find it, please simply contact us at "info@bangkokfoodtours.com"\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	Cancellation Policy\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>', '103,104,105'),
(23, '<p>\r\n	angkok Exotic Bar Crawl by Tuk Tuk\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With more than 10,000 pubs and bars , Bangkok is widely known as one of the world''s best nightlife cities. On this tour, we will bring you to explore Bangkok’s never-to-be-missed nightlife areas to experience 4 most unique and exotic bars. Starting your journey at BTS Thonglor, then start your night with the first bar specializing on Thai-style Tequila (known to locals as Ya Dong) with amazingly fun environment. While the night is still young, beat up your night with cool modern-traditional Thai music bar. Here, you will experience how traditional Thai music is perfectly paired with liquor. Then, the Tuk Tuk will take you to the secret underground bar decorating in oriental style. This third bar is very famous for jazz. The tour will be ended at the fourth bar, which you can see Muay Thai (Thai kickboxing) while zipping your cool beer or cocktail. It’s probably the only bar in the world that has Muay Thai stage inside.\r\n</p>', '<p>\r\n	This tour is also available as a private option\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	The itinerary of the Bangkok Exotic Bar Crawl by Tuk Tuk is identical to that of the Join-in one. However, in the private option, it will be more exclusive (just you and the guide)and the tour starting time is more flexible. On this private tour, you can decide your own starting time ranging from 7.30 pm – 8.00 pm. We can’t start the tour later than 8.00 pm.\r\n</p>', '<p>\r\n	ooking condition\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1. An automated receipt of payment from Paypal\r\n</p>\r\n<p>\r\n	2. An automated booking confirmation containing a guideline to the meeting place and meeting time of each tour. The guideline will help you on the direction to meet us at the meeting place.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	In case, you don''t see any of these 2 emails within 2 hours after booking, please check your junk mail inbox. If you still can''t find it, please simply contact us at "info@bangkokfoodtours.com"\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	Cancellation Policy\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>', '103,104,105'),
(24, '<p>\r\n	angkok Exotic Bar Crawl by Tuk Tuk\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	With more than 10,000 pubs and bars , Bangkok is widely known as one of the world''s best nightlife cities. On this tour, we will bring you to explore Bangkok’s never-to-be-missed nightlife areas to experience 4 most unique and exotic bars. Starting your journey at BTS Thonglor, then start your night with the first bar specializing on Thai-style Tequila (known to locals as Ya Dong) with amazingly fun environment. While the night is still young, beat up your night with cool modern-traditional Thai music bar. Here, you will experience how traditional Thai music is perfectly paired with liquor. Then, the Tuk Tuk will take you to the secret underground bar decorating in oriental style. This third bar is very famous for jazz. The tour will be ended at the fourth bar, which you can see Muay Thai (Thai kickboxing) while zipping your cool beer or cocktail. It’s probably the only bar in the world that has Muay Thai stage inside.\r\n</p>', '<p>\r\n	This tour is also available as a private option\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	The itinerary of the Bangkok Exotic Bar Crawl by Tuk Tuk is identical to that of the Join-in one. However, in the private option, it will be more exclusive (just you and the guide)and the tour starting time is more flexible. On this private tour, you can decide your own starting time ranging from 7.30 pm – 8.00 pm. We can’t start the tour later than 8.00 pm.\r\n</p>', '<p>\r\n	ooking condition\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1. An automated receipt of payment from Paypal\r\n</p>\r\n<p>\r\n	2. An automated booking confirmation containing a guideline to the meeting place and meeting time of each tour. The guideline will help you on the direction to meet us at the meeting place.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	In case, you don''t see any of these 2 emails within 2 hours after booking, please check your junk mail inbox. If you still can''t find it, please simply contact us at "info@bangkokfoodtours.com"\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	Cancellation Policy\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	What happens after my online booking?\r\n</p>\r\n<p>\r\n	After completing your booking on our website, you will receive 2 confirmation emails below.\r\n</p>', '103,104,105'),
(25, '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `dade_file`
--

CREATE TABLE IF NOT EXISTS `dade_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `dade_file`
--

INSERT INTO `dade_file` (`id`, `name`, `savename`, `savepath`, `ext`, `mime`, `size`, `md5`, `sha1`, `location`, `create_time`) VALUES
(2, '1458892334989.jpg', '573bda2f69273.jpg', '2016-05-18/', 'jpg', 'application/octet-stream', 45444, 'e9e02dea60adb0366246facad9a23705', '37f38f3b9433cafd4a4ea5f9ef453f494c9d56a2', 0, 1463540271),
(3, '6.png', '573d5c73f2cb1.png', '2016-05-19/', 'png', 'application/octet-stream', 128781, '01c5dc97a850de9a07f17f77c47391cf', '1ff1f5af088b0ae74c109ecf098b54456913ff8d', 0, 1463639155);

-- --------------------------------------------------------

--
-- 表的结构 `dade_hooks`
--

CREATE TABLE IF NOT EXISTS `dade_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `dade_hooks`
--

INSERT INTO `dade_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam'),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, ''),
(19, 'home_begin', '前台自动识别手机和电脑', 1, 1471918223, 'Adapter'),
(18, 'UploadImages', '上传图片插件挂载点', 1, 1464743406, 'UploadImages'),
(20, 'AdminPageFooter', '后台钩子', 1, 1484365372, 'ImageManager');

-- --------------------------------------------------------

--
-- 表的结构 `dade_links`
--

CREATE TABLE IF NOT EXISTS `dade_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `img` int(10) unsigned NOT NULL COMMENT '图片',
  `sort` int(10) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `cid` char(50) NOT NULL COMMENT '链接位置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `dade_links`
--


-- --------------------------------------------------------

--
-- 表的结构 `dade_member`
--

CREATE TABLE IF NOT EXISTS `dade_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dade_member`
--

INSERT INTO `dade_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, '管理员', 0, '0000-00-00', '', 180, 82, 0, 1463391910, 22063462, 1484902028, 1),
(2, 'admin', 0, '0000-00-00', '', 50, 25, 0, 0, 2130706433, 1477971700, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dade_menu`
--

CREATE TABLE IF NOT EXISTS `dade_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

--
-- 转存表中的数据 `dade_menu`
--

INSERT INTO `dade_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0),
(2, '内容', 0, 5, 'Article/mydocument', 0, '', '', 0),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0),
(16, '用户', 0, 6, 'User/index', 0, '', '', 0),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0),
(43, '扩展', 0, 8, 'Addons/index', 0, '', '', 0),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0),
(68, '系统', 0, 7, 'Config/group', 0, '', '', 0),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '站长工具', 0),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '站长工具', 0),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0),
(93, '事务', 0, 4, 'Transaction/lists?model=banner', 0, '', '', 0),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0),
(104, '下载管理', 102, 0, 'Think/lists?model=download', 0, '', '', 0),
(105, '配置管理', 102, 0, 'Think/lists?model=config', 0, '', '', 0),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0),
(119, '排序', 70, 0, 'Config/sort', 0, '', '', 0),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0),
(122, '代码编辑器', 68, 0, 'CodeEditor/lists', 0, '代码编辑器', '站长工具', 0),
(123, '编辑文件', 122, 1, 'CodeEditor/edit', 0, '', '', 1),
(124, '删除', 122, 0, 'CodeEditor/delete', 0, '', '', 1),
(125, '新建文件夹', 122, 0, 'CodeEditor/makeDir', 0, '', '', 1),
(126, '上传文件', 122, 0, 'CodeEditor/upload', 0, '', '', 1),
(127, '广告管理', 93, 0, 'Transaction/lists?model=banner', 0, '', '企业资料', 0),
(128, '新增', 127, 0, 'transaction/add', 0, '', '', 0),
(129, '删除', 127, 0, 'transaction/del', 0, '', '', 0),
(130, '编辑', 127, 0, 'transaction/edit', 0, '', '', 0),
(131, '导航分类', 76, 0, 'Channel/venuenum', 0, '', '', 0),
(132, '保存', 69, 0, 'config/save', 0, '', '', 0),
(141, '清除缓存', 1, 0, 'Index/clearCache', 1, '', '', 0),
(148, 'Book', 93, 5, 'Transaction/lists?model=online', 0, '', '企业资料', 0),
(149, '审核', 3, 0, 'article/examine', 1, '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dade_model`
--

CREATE TABLE IF NOT EXISTS `dade_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `dade_model`
--

INSERT INTO `dade_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["40","45","42","41","2","3","5","9","10","11","12","13","14","16","17","19","20"]}', '1:基础,2:高级', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]&cate_id=[category_id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\ncreate_time|time_format:创建时间\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1477970176, 1, 'MyISAM'),
(4, 'banner', '幻灯管理', 0, '', 1, '{"1":["34","33","35","36","38","39"]}', '1:基础', '34,33,35,36,38,39', '', '', '', 'id:编号\r\ntitle:标题\r\ncid:位置\r\ncreate_time:创建时间\r\nstatus:状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1463725424, 1470364642, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","12","5","45","24","19","10","20","76"],"2":["40","41","42"]}', '1:基础,2:高级', '40,3,41,12,5,42,45,24,19,10,20,76', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]', 0, '', '', 1383891243, 1484365655, 1, 'MyISAM'),
(5, 'online', '在线留言', 0, '', 1, '{"1":["46","82","71","47","80","81","97","93","50","94","95"]}', '1:基础', '46,82,71,47,80,81,97,93,50,94,95', '', '', '', 'id:编号\r\nname:Full Name\r\nphone:Cell Phone\r\ntitle:Nationality\r\nemail:Email\r\nid:操作:[EDIT]|查看,[DELETE]|删除', 10, '', '', 1470365770, 1484878618, 1, 'MyISAM'),
(6, 'links', '友情链接', 0, '', 1, '{"1":["56","79","57","58","59"]}', '1:基础', '56,79,57,58,59', '', '', '', 'id:编号\r\ntitle:标题\r\ncid:分类\r\nurl:链接\r\ncreatetime:创建时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1470622274, 1482893270, 1, 'MyISAM'),
(9, 'tours', '旅游', 1, '', 1, '{"1":["3","12","92","5","83","84","85","86","87","19","10","20"],"2":["40","41","42"],"3":["88"],"4":["89"],"5":["90"],"6":["91"]}', '1:基础,2:SEO,3:Itinerary,4:Price,5:Inclusion/Exclusion,6:Condition', '40,88,92,3,89,90,91,12,41,5,42,83,84,85,86,87,19,10,20', '', '', '', '', 10, '', '', 1484363433, 1484376914, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `dade_online`
--

CREATE TABLE IF NOT EXISTS `dade_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT 'Full Name',
  `phone` varchar(255) NOT NULL COMMENT 'Cell Phone',
  `content` text NOT NULL COMMENT 'SpecialRequests',
  `createtime` int(10) NOT NULL COMMENT '留言时间',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `ip` varchar(255) NOT NULL COMMENT 'IP',
  `sex` char(10) NOT NULL COMMENT 'party',
  `address` varchar(255) NOT NULL COMMENT 'Date',
  `title` varchar(255) NOT NULL COMMENT 'Nationality',
  `dietary` varchar(255) NOT NULL COMMENT 'Dietary Restrictions',
  `findus` varchar(100) NOT NULL COMMENT 'How do you find us',
  `hfindus` varchar(255) NOT NULL COMMENT 'How do you find us',
  `arc_title` varchar(255) NOT NULL COMMENT 'Title',
  `tour_code` varchar(255) NOT NULL COMMENT 'tour code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `dade_online`
--

INSERT INTO `dade_online` (`id`, `name`, `phone`, `content`, `createtime`, `email`, `ip`, `sex`, `address`, `title`, `dietary`, `findus`, `hfindus`, `arc_title`, `tour_code`) VALUES
(15, 'xian', '18700187617', 'Show us your special requests, and we could serve your trip better!', 1484818801, '2250820532@qq.com', '36.40.137.0', '4', 'Fri Jan 20 2017', 'china', '', '4', '', '', ''),
(16, '记大过，', '18629295068', 'ug.lbgkbj', 1484882990, 'lilychinatours@hotmail.com', '1.80.171.132', '2', 'Fri Jan 27 2017', '。jgkl', 'kg.vvk', '3', 'jhf.f', 'xianxianxianxianxianxianxianxianxianxianxianxianxianxianxian', 'jkgl');

-- --------------------------------------------------------

--
-- 表的结构 `dade_picture`
--

CREATE TABLE IF NOT EXISTS `dade_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

--
-- 转存表中的数据 `dade_picture`
--

INSERT INTO `dade_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(107, '/Uploads/Picture/2017-01-14/5879d850f1637.jpg', '', '3609311a3654f69027eb3bf6d43cc865', '8858f96820e9f8cd0c1201fa1fd2b9f418c59d73', 1, 1484380240),
(97, '/Uploads/Picture/2017-01-14/58799e684d19c.jpg', '', '6ac204fe116e0860e6dfbfa531bec44d', '640dc85f63056c7fb47399061a9d5daf71c88734', 1, 1484365416),
(98, '/Uploads/Picture/2017-01-14/5879a065bc767.JPG', '', 'b0f8a814cb65dcee1652b4117d76944c', 'e728087c7e522a067c6b56d622372560bbdffe9e', 1, 1484365925),
(99, '/Uploads/Picture/2017-01-14/5879a2c31d30f.jpg', '', '8607e5e004496c70356dcaff9a59e36f', '0e23fd9abb8dd24d0b2803216c2e19a5b86abbf2', 1, 1484366531),
(101, '/Uploads/Picture/2017-01-14/5879c05bdc717.jpg', '', 'c611489dd9f53c6bb365e33527bc1013', 'a8a30c31db29e13783f768ea5e8828da88b268cd', 1, 1484374107),
(102, '/Uploads/Picture/2017-01-14/5879c130207d1.jpg', '', 'be5d692f265cb41b2382ca55836fe3d2', '2f5248aca4e707cef2a40a9ef832ccd871efe27f', 1, 1484374320),
(103, '/Uploads/Picture/2017-01-14/5879cb8a51370.JPG', '', '1413718a2c6e2092f8734e1d630a7fad', '4618ec2bd0667ece7eeadca50dc7e2007446956a', 1, 1484376970),
(104, '/Uploads/Picture/2017-01-14/5879cb8a6d4af.jpg', '', 'cce53dbc75f051f6c30e0c0aa87079c5', '412323eddb273dcf3d24309a8147c1d42dac2abd', 1, 1484376970),
(105, '/Uploads/Picture/2017-01-14/5879cb8a80563.JPG', '', '64c615f486961bb91ca47e55026b8258', 'f16d53a485c94987df493c1ab0043574d2c7a223', 1, 1484376970),
(106, '/Uploads/Picture/2017-01-14/5879cbf711cac.jpg', '', 'e565c815a63ab44c08e607a485d0d7b2', '60b1e6365abf5f43ffcaefa92b5ed47537b42596', 1, 1484377079),
(108, '/Uploads/Picture/2017-01-19/588083c16cdab.jpg', '', '0b7f1511a55fd6517c56d4bca8c41f89', 'a467f48ed145e336744f12c0fc8c37cbb49b21e3', 1, 1484817345),
(109, '/Uploads/Picture/2017-01-19/58808a224f564.jpg', '', '33430de7b762365e68821ebf64853fbd', '2c2e27fa20a386008ca26f5e6762ff2f8567f70d', 1, 1484818977),
(110, '/Uploads/Picture/2017-01-20/58817d85e665b.jpg', '', 'd04bf8f00d8c5d0f24113557b5d183f4', 'a8913a694329694f2636f1827565a02c263a5dfd', 1, 1484881285),
(111, '/Uploads/Picture/2017-01-20/58818febe4a50.jpg', '', '0f56a5cf60ded8fc7d5c118acbb56a2a', '89a65b2e9851765ff4c0309e8fe77b91d71857b8', 1, 1484885923),
(113, '/Uploads/Picture/2017-01-20/5881d22f15189.jpg', '', '4caf44fa760656a773066c6ae73f26b2', '81d9e7e02633a36a636a71719c5413debd055fb9', 1, 1484902955),
(114, '/Uploads/Picture/2017-01-20/5881d85446237.jpg', '', 'f2d59f3181cd296bc45c85c66ca63147', 'fd2a5c7e662a105fc18ebf5a076bd9cf068e336d', 1, 1484904516),
(115, '/Uploads/Picture/2017-01-20/5881d88c26bf6.jpg', '', '522817d8747f4bcab094ea44646b46a0', '17b527350744530de764976e3e1a37fdcab4b7d3', 1, 1484904557),
(116, '/Uploads/Picture/2017-01-20/5881d8dd5a7a2.jpg', '', 'ef70e9b3714aedc2a9c7e999dd671005', 'fc1a79daaa06c6445d00243cd1781d133f081afa', 1, 1484904667);

-- --------------------------------------------------------

--
-- 表的结构 `dade_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `dade_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dade_ucenter_admin`
--


-- --------------------------------------------------------

--
-- 表的结构 `dade_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `dade_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dade_ucenter_app`
--


-- --------------------------------------------------------

--
-- 表的结构 `dade_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `dade_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dade_ucenter_member`
--

INSERT INTO `dade_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'xadade', '66b3fcfcd965ff715733497f74d141be', '173066315@qq.com', '', 1463391910, 2130706433, 1484902028, 22063462, 1463391910, 1),
(2, 'admin', '98f659375d2447b90b4808ac493170ce', '123456@qq.com', '', 1464142705, 2130706433, 1477971700, 2130706433, 1464142705, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dade_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `dade_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dade_ucenter_setting`
--


-- --------------------------------------------------------

--
-- 表的结构 `dade_url`
--

CREATE TABLE IF NOT EXISTS `dade_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `dade_url`
--


-- --------------------------------------------------------

--
-- 表的结构 `dade_userdata`
--

CREATE TABLE IF NOT EXISTS `dade_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dade_userdata`
--


-- --------------------------------------------------------

--
-- 表的结构 `dade_users`
--

CREATE TABLE IF NOT EXISTS `dade_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `cove_img` int(11) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` int(11) NOT NULL DEFAULT '1' COMMENT '性别，1男 2女',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `address` varchar(500) DEFAULT NULL,
  `is_status` int(11) NOT NULL DEFAULT '0' COMMENT '是否允许登录 0允许，1 不允许',
  `createtime` int(11) NOT NULL,
  `last_login_ip` varchar(50) NOT NULL,
  `last_login_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `dade_users`
--

INSERT INTO `dade_users` (`id`, `username`, `password`, `cove_img`, `uname`, `sex`, `email`, `phone`, `address`, `is_status`, `createtime`, `last_login_ip`, `last_login_time`) VALUES
(7, '1730663151@qq.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, '刘强', 2, '1730663151@qq.com', '15109221888', '陕西省西安市玫瑰大楼', 0, 1466234876, '127.0.0.1', 1466234179),
(8, '173066315@qq.com', '4297f44b13955235245b2497399d7a93', 34, '11', 1, '173066315@qq.com', '', '', 0, 1466235399, '127.0.0.1', 1466389574);

-- --------------------------------------------------------

--
-- 表的结构 `wkcx_class`
--

CREATE TABLE IF NOT EXISTS `wkcx_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) DEFAULT NULL,
  `class_order` int(11) DEFAULT '255',
  `pid` int(11) DEFAULT '0',
  `display` int(1) DEFAULT '1',
  `cover_pic` varchar(100) DEFAULT NULL,
  `ps_time` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `leixing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=726 ;

--
-- 转存表中的数据 `wkcx_class`
--

INSERT INTO `wkcx_class` (`id`, `class_name`, `class_order`, `pid`, `display`, `cover_pic`, `ps_time`, `type`, `leixing`) VALUES
(2, '新闻中心', 4, 0, 0, '', '', 'news', NULL),
(1, '视频管理', 2, 0, 1, NULL, NULL, 'goods', NULL),
(573, '企业简介', 255, 555, 0, NULL, NULL, 'com', NULL),
(562, '轮播管理', 255, 0, 0, NULL, NULL, 'lunbo', NULL),
(572, '公司理念', 255, 555, 0, NULL, NULL, 'com', NULL),
(563, '首页图片', 255, 562, 0, NULL, NULL, 'lunbo', NULL),
(564, '内页的图片', 255, 564, 0, NULL, NULL, 'lunbo', 'cont'),
(565, '尾部图片', 255, 562, 0, NULL, NULL, 'lunbo', NULL),
(583, '行业信息', 4, 2, 0, NULL, NULL, 'news', NULL),
(556, '品牌诠释', 255, 555, 0, NULL, NULL, 'com', NULL),
(580, '留言管理', 255, 579, 0, NULL, NULL, '', NULL),
(579, '留言管理', 255, 0, 0, NULL, NULL, '', NULL),
(578, '综合新闻资讯', 1, 1, 0, NULL, NULL, 'goods', NULL),
(589, '总经理致辞', 255, 555, 0, NULL, NULL, 'com', NULL),
(577, '友情链接', 1, 576, 0, NULL, NULL, 'friend', NULL),
(576, '友情链接', 255, 0, 0, NULL, NULL, 'friend', NULL),
(602, '党建工作', 1, 599, 0, NULL, NULL, 'goodspx', NULL),
(601, '文化建设', 10, 0, 0, NULL, NULL, 'goodsjiameng', NULL),
(600, '安全生产', 7, 0, 0, NULL, NULL, 'goodslm', NULL),
(599, '党群专栏', 6, 0, 0, NULL, NULL, 'goodspx', NULL),
(588, '总经理简介', 255, 555, 0, NULL, NULL, 'com', NULL),
(704, '用人理念', 1, 700, 1, NULL, NULL, 'lianhehz', NULL),
(593, '综合新闻', 2, 2, 0, NULL, NULL, 'news', NULL),
(603, '安全法规', 2, 706, 0, NULL, NULL, 'xxyuandi111', 'cont'),
(605, '公司殊荣', 255, 555, 0, NULL, NULL, 'com', NULL),
(607, '文化娱乐活动', 2, 1, 0, NULL, NULL, 'goods', NULL),
(608, '思想政治宣传', 3, 1, 0, NULL, NULL, 'goods', NULL),
(609, '核能知识普及', 4, 1, 0, NULL, NULL, 'goods', NULL),
(611, '地勘采选技术', 255, 1, 0, NULL, NULL, 'goods', NULL),
(612, '工会工作', 2, 599, 0, NULL, NULL, 'goodspx', NULL),
(613, '纪检监察工作', 3, 599, 0, NULL, NULL, 'goodspx', NULL),
(614, '内部规章', 2, 600, 0, NULL, NULL, 'goodslm', NULL),
(615, '安全教育', 3, 600, 0, NULL, NULL, 'goodslm', NULL),
(616, '人文历史', 5, 601, 0, NULL, NULL, 'goodsjiameng', 'cont'),
(619, '地学科普', 6, 601, 0, NULL, NULL, 'goodsjiameng', 'cont'),
(620, '经营实体', 15, 0, 1, NULL, NULL, 'notice', 'cont'),
(621, '地质勘查院', 4, 620, 0, NULL, NULL, 'notice', 'cont'),
(622, '公司概况', 1, 0, 0, NULL, NULL, 'com', 'cont'),
(623, '公司简介', 1, 622, 0, NULL, NULL, 'com', 'cont'),
(624, '荣誉展示', 4, 622, 0, NULL, NULL, 'com', 'typezz'),
(625, '组织机构', 3, 622, 0, NULL, NULL, 'com', NULL),
(715, '地质资料', 1, 676, 0, NULL, NULL, 'xxyuandi', NULL),
(629, '首页栏目', 255, 0, 0, NULL, NULL, 'anli', NULL),
(630, '公司资质', 1, 629, 0, NULL, NULL, 'anli', NULL),
(634, '企业公告', 255, 0, 0, NULL, NULL, 'tese', NULL),
(635, '企业公告', 255, 634, 0, NULL, NULL, 'tese', NULL),
(695, '钻探公司', 7, 620, 0, NULL, NULL, 'notice', 'cont'),
(694, '中天核鑫公司', 5, 620, 0, NULL, NULL, 'notice', 'cont'),
(724, '首页中部图片', 255, 562, 0, NULL, NULL, 'lunbo', 'cont'),
(692, '物探测绘院', 6, 620, 0, NULL, NULL, 'notice', 'cont'),
(701, '联系我们', 256, 700, 1, NULL, NULL, 'lianhehz', NULL),
(700, '人力资源', 13, 0, 0, NULL, NULL, 'lianhehz', NULL),
(699, '友情链接3', 255, 576, 0, NULL, NULL, 'friend', NULL),
(698, '友情链接2', 2, 576, 0, NULL, NULL, 'friend', NULL),
(696, '陕西庞家河金矿', 2, 620, 0, NULL, NULL, 'notice', 'cont'),
(720, '企业文化', 1, 601, 0, NULL, NULL, 'goodsjiameng', NULL),
(719, '联系我们', 256, 622, 0, NULL, NULL, 'com', NULL),
(673, '业务领域', 255, 622, 0, NULL, NULL, 'com', NULL),
(674, '内部期刊', 4, 601, 0, NULL, NULL, 'goodsjiameng', 'cont'),
(703, '人才招聘', 2, 700, 1, NULL, NULL, 'lianhehz', NULL),
(676, '学习园地', 12, 0, 0, NULL, NULL, 'xxyuandi', NULL),
(706, '政策法规', 255, 0, 0, NULL, NULL, 'xxyuandi111', NULL),
(678, '文件发布', 5, 2, 0, NULL, NULL, 'news', NULL),
(679, '通知公告', 1, 2, 0, NULL, NULL, 'news', NULL),
(680, '团委工作', 4, 599, 0, NULL, NULL, 'goodspx', NULL),
(681, '日常管理', 4, 600, 0, NULL, NULL, 'goodslm', NULL),
(682, '事故警示', 5, 600, 0, NULL, NULL, 'goodslm', NULL),
(683, '学习专刊', 2, 674, 0, NULL, NULL, 'goodsjiameng', NULL),
(684, '纪监审工作专刊', 3, 674, 1, NULL, NULL, 'goodsjiameng', NULL),
(685, '工会工作专刊', 4, 674, 0, NULL, NULL, 'goodsjiameng', NULL),
(686, '创先争优专刊', 5, 674, 0, NULL, NULL, 'goodsjiameng', NULL),
(687, '队庆六十周年征文选刊', 6, 674, 0, NULL, NULL, 'goodsjiameng', 'cont'),
(688, '两学一做教育专栏', 1, 599, 0, NULL, NULL, 'goodspx', 'newscont'),
(689, '党建资讯', 2, 602, 0, NULL, NULL, 'goodspx', 'cont'),
(690, '党的群众路线专栏', 3, 602, 0, NULL, NULL, 'goodspx', NULL),
(702, '激情211', 3, 2, 1, NULL, NULL, 'news', NULL),
(707, '政策法规', 255, 706, 0, NULL, NULL, 'xxyuandi111', NULL),
(708, '领导讲话', 255, 602, 0, NULL, NULL, 'goodspx', NULL),
(710, '数据科技公司', 3, 620, 0, NULL, NULL, 'notice', 'cont'),
(711, '六五普法专栏', 3, 706, 0, NULL, NULL, 'xxyuandi111', 'cont'),
(712, '二一一矿业集团公司', 1, 620, 0, NULL, NULL, 'notice', 'cont'),
(713, '领导集体', 2, 622, 0, NULL, NULL, 'com', NULL),
(714, '员工风采', 3, 601, 0, NULL, NULL, 'goodsjiameng', 'cont'),
(716, '标准规范', 2, 676, 0, NULL, NULL, 'xxyuandi', NULL),
(717, '软件教程', 3, 676, 0, NULL, NULL, 'xxyuandi', NULL),
(718, '地质图件', 4, 676, 0, NULL, NULL, 'xxyuandi', NULL),
(721, '网站声明', 255, 622, 0, NULL, NULL, 'com', NULL),
(722, '三严三实', 2, 602, 0, NULL, NULL, 'goodspx', 'cont'),
(723, '队庆60周年', 2, 601, 0, NULL, NULL, 'goodsjiameng', 'newscont'),
(725, '全面从严治企', 1, 706, 0, NULL, NULL, 'xxyuandi111', 'cont');
