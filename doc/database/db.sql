create database pontusim;
use pontusim;

DROP TABLE IF EXISTS  `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` nvarchar(255) NOT NULL COMMENT "系统分配的用户ID，唯一标识",
  `mobile` nvarchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` nvarchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT 0 COMMENT "状态码，0:系统添加，未激活，1:用户自己注册,2:系统冻洁",
  `created_at` timestamp NOT NULL DEFAULT '2019-02-04 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '2019-02-04 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS  `user_auth`;
CREATE TABLE `user_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` nvarchar(255) NOT NULL COMMENT "系统分配的用户ID，唯一标识",
  `password` nvarchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` nvarchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '2019-02-04 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '2019-02-04 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- table conversation
DROP TABLE IF EXISTS  `conversation`;
CREATE TABLE `conversation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` nvarchar(255) NOT NULL COMMENT "会话所属的用户ID",
  `cid` nvarchar(255) NOT NULL COMMENT "系统分配的会话ID，唯一标识",
  `unread_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT "未读数",
  `is_top` tinyint NOT NULL DEFAULT 0 COMMENT "是否置顶",
  `has_remark` tinyint NOT NULL DEFAULT 0 COMMENT "基于当前的readseq，会话内是否有@",
  `readed_mid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT "已读消息的ID",
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- chat table, 单聊消息 或 公号
DROP TABLE IF EXISTS  `message_chat`;
CREATE TABLE `message_chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT "系统分配的消息ID，Guid -> Hash Id",
  `uid` nvarchar(255) NOT NULL DEFAULT '' COMMENT "系统分配的用户ID，唯一标识",
  `cid` nvarchar(255) NOT NULL COMMENT "会话ID，可以为单聊的ID，群聊的ID，账号的ID;由系统生成。规则见相关文档",
  `sender_uid` nvarchar(255) NOT NULL COMMENT "用户ID",
  `mtype` int not null DEFAULT 0 COMMENT "消息类型，0：文本；1...",
  `state` int not null DEFAULT 0 COMMENT "消息状态，0：正常状态；1：撤回，双方均不可见；",
  `created_at` timestamp NOT NULL DEFAULT '2019-02-04 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '2019-02-04 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- group chat table
DROP TABLE IF EXISTS  `message_group`;
CREATE TABLE `message_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT "系统分配的消息ID，Guid -> Hash Id",
  `uid` nvarchar(255) NOT NULL DEFAULT '' COMMENT "系统分配的用户ID，唯一标识",
  `cid` nvarchar(255) NOT NULL COMMENT "会话ID，可以为单聊的ID，群聊的ID，账号的ID;由系统生成。规则见相关文档",
  `sender_uid` nvarchar(255) NOT NULL COMMENT "用户ID",
  `remark` int not null DEFAULT 0 COMMENT "是否@全体成员",
  `remark_list` text COMMENT "用户ID列表，以;分隔",
  `mtype` int not null DEFAULT 0 COMMENT "消息类型，0：文本；1：...",
  `state` int not null DEFAULT 0 COMMENT "消息状态，0：正常状态；1：撤回，双方均不可见；",
  `created_at` timestamp NOT NULL DEFAULT '2019-02-04 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '2019-02-04 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS  `message_data_a`;
CREATE TABLE `message_data_a` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int NOT NULL DEFAULT 0 COMMENT "系统分配的消息ID，唯一标识",
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS  `message_data_b`;
CREATE TABLE `message_data_b` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int NOT NULL DEFAULT 0 COMMENT "系统分配的消息ID，唯一标识",
  `media_uri` nvarchar(255) NOT NULL DEFAULT '' COMMENT "图片资源URI，由IM服务解释与定义，S3负责存储",
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

