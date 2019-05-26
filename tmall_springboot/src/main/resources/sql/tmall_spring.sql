-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2019-05-26 07:38:31
-- 服务器版本： 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tmall_springboot`
--
--drop  database if exists `tmall_springboot`
--create database `tmall_springboot`
-- --------------------------------------------------------

--
-- 表的结构 `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

-- --------------------------------------------------------

--
-- 表的结构 `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE IF NOT EXISTS `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '产品id',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `number` int(11) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_user` (`uid`),
  KEY `fk_orderitem_product` (`pid`),
  KEY `fk_orderitem_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单项表';

-- --------------------------------------------------------

--
-- 表的结构 `order_`
--

DROP TABLE IF EXISTS `order_`;
CREATE TABLE IF NOT EXISTS `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) DEFAULT NULL COMMENT '订单号',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `post` varchar(255) DEFAULT NULL COMMENT '邮编',
  `receiver` varchar(255) DEFAULT NULL COMMENT '收货人信息',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `userMessage` varchar(255) DEFAULT NULL COMMENT '用户备注信息',
  `createDate` datetime DEFAULT NULL COMMENT '订单创建日期',
  `payDate` datetime DEFAULT NULL COMMENT '支付日期',
  `deliveryDate` datetime DEFAULT NULL COMMENT '发货日期',
  `confirmDate` datetime DEFAULT NULL COMMENT '确认收货日期',
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `subTitle` varchar(255) DEFAULT NULL COMMENT '小标题',
  `originalPrice` float DEFAULT NULL COMMENT '原始价格',
  `promotePrice` float DEFAULT NULL COMMENT '优惠价格',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `cid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- --------------------------------------------------------

--
-- 表的结构 `productimage`
--

DROP TABLE IF EXISTS `productimage`;
CREATE TABLE IF NOT EXISTS `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '产品id',
  `type` varchar(255) DEFAULT NULL COMMENT '类型：单个、详情',
  PRIMARY KEY (`id`),
  KEY `fk_productimage_product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品图片表';

-- --------------------------------------------------------

--
-- 表的结构 `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL COMMENT '分类id',
  `name` varchar(255) DEFAULT NULL COMMENT '属性名',
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性表';

-- --------------------------------------------------------

--
-- 表的结构 `propertyvalue`
--

DROP TABLE IF EXISTS `propertyvalue`;
CREATE TABLE IF NOT EXISTS `propertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '产品id',
  `ptid` int(11) DEFAULT NULL COMMENT '属性id',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propertyvalue_property` (`ptid`),
  KEY `fk_propertyvalue_product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性值表';

-- --------------------------------------------------------

--
-- 表的结构 `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `pid` int(11) DEFAULT NULL COMMENT '产品id',
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`pid`),
  KEY `fk_review_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价表';

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐，与shiro结合加密',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 限制导出的表
--

--
-- 限制表 `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`),
  ADD CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_orderitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- 限制表 `order_`
--
ALTER TABLE `order_`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);

--
-- 限制表 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`);

--
-- 限制表 `productimage`
--
ALTER TABLE `productimage`
  ADD CONSTRAINT `fk_productimage_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`);

--
-- 限制表 `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`);

--
-- 限制表 `propertyvalue`
--
ALTER TABLE `propertyvalue`
  ADD CONSTRAINT `fk_propertyvalue_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_propertyvalue_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`);

--
-- 限制表 `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_review_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
