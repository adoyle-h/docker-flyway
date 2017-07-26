DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name__group_name` (`name`,`group_name`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member` (
  `project_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `privilege` int(10) unsigned NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  UNIQUE KEY `uk_project_id__uid` (`project_id`,`uid`),
  KEY `idx_project_id__privilege` (`project_id`,`privilege`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
