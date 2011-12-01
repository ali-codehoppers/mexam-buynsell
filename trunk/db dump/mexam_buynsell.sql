/*
Navicat MySQL Data Transfer

Source Server         : MariaDB
Source Server Version : 50209
Source Host           : localhost:3306
Source Database       : mexam_buynsell

Target Server Type    : MYSQL
Target Server Version : 50209
File Encoding         : 65001

Date: 2011-12-01 18:10:46
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `accessories`
-- ----------------------------
DROP TABLE IF EXISTS `accessories`;
CREATE TABLE `accessories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `partNo` varchar(45) DEFAULT NULL,
  `manufacturerPartNo` varchar(45) DEFAULT NULL,
  `showInfo` binary(1) DEFAULT NULL,
  `infoText` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accessories
-- ----------------------------

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'Access Control', null);
INSERT INTO `categories` VALUES ('2', 'Actuators and Dampers', null);
INSERT INTO `categories` VALUES ('3', 'Alarms and Indication', null);
INSERT INTO `categories` VALUES ('4', 'Control Valves', null);
INSERT INTO `categories` VALUES ('5', 'Electrical Wiring Materials', null);
INSERT INTO `categories` VALUES ('6', 'Enclosures', null);
INSERT INTO `categories` VALUES ('7', 'Flow', null);
INSERT INTO `categories` VALUES ('8', 'Gas and Specialty Sensors', null);
INSERT INTO `categories` VALUES ('9', 'Hazardous Locations', null);
INSERT INTO `categories` VALUES ('10', 'Humidity', null);
INSERT INTO `categories` VALUES ('11', 'Level', null);
INSERT INTO `categories` VALUES ('12', 'Lighting Controls', null);
INSERT INTO `categories` VALUES ('13', 'Motor Controls', null);

-- ----------------------------
-- Table structure for `companies`
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `phoneNo` varchar(45) DEFAULT NULL,
  `faxNo` varchar(45) DEFAULT NULL,
  `webAddress` varchar(45) DEFAULT NULL,
  `companyCategory` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKABC9E1DB7E101206` (`stateId`),
  CONSTRAINT `FKABC9E1DB7E101206` FOREIGN KEY (`stateId`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES ('1', 'Code Hoppers', 'asdasd', 'asdasd', null, null, '123', '123', 'www.abc.com', null);
INSERT INTO `companies` VALUES ('2', 'Code Hoppers', 'asdasd', 'asdasd', null, null, '123', '123', 'www.abc.com', null);
INSERT INTO `companies` VALUES ('3', 'Code Hoppers', 'adas', 'Lahore', null, null, '123', '123', 'www.abc.com', null);
INSERT INTO `companies` VALUES ('4', 'Code Hoppers', 'asdf', 'Lahore', '2', null, '12312', '123', 'www.abc.com', null);
INSERT INTO `companies` VALUES ('5', 'Amier Haider', 'asdfasdf', 'asdasd', '7', '123', '12312', '123', 'www.abc.com', '5');
INSERT INTO `companies` VALUES ('6', 'Amier Haider', 'asdfasd', 'asdfa', '1', '123', '12312', '123', 'www.abc.com', '1');
INSERT INTO `companies` VALUES ('7', 'Amier Haider', 'asd', 'Lahore', '1', '123', '123', '123', 'www.abc.com', '1');
INSERT INTO `companies` VALUES ('8', 'Amier Haider', 'ad', 'Lahore', '1', '123', '123', '123', 'www.abc.com', '2');

-- ----------------------------
-- Table structure for `conditions`
-- ----------------------------
DROP TABLE IF EXISTS `conditions`;
CREATE TABLE `conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of conditions
-- ----------------------------

-- ----------------------------
-- Table structure for `countries`
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'United States');

-- ----------------------------
-- Table structure for `documents`
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_product` (`productId`),
  CONSTRAINT `fk_document_product` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of documents
-- ----------------------------

-- ----------------------------
-- Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `contentType` varchar(45) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `orgFileName` varchar(100) DEFAULT NULL,
  `extension` varchar(45) DEFAULT NULL,
  `orgPath` varchar(150) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_product_image` (`partId`),
  KEY `fk_part_image` (`partId`),
  KEY `FKB95A8278A3162318` (`partId`),
  KEY `FKB95A82789FB93D14` (`productId`),
  KEY `FKB95A8278D68EA502` (`productId`),
  CONSTRAINT `FKB95A82789FB93D14` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  CONSTRAINT `FKB95A8278A3162318` FOREIGN KEY (`partId`) REFERENCES `products` (`id`),
  CONSTRAINT `FKB95A8278D68EA502` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_part_image` FOREIGN KEY (`partId`) REFERENCES `parts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images
-- ----------------------------

-- ----------------------------
-- Table structure for `inventories`
-- ----------------------------
DROP TABLE IF EXISTS `inventories`;
CREATE TABLE `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partNo` varchar(45) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `cond` varchar(5) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` mediumtext,
  `companyId` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updateDate` timestamp NULL DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_inventory_company` (`companyId`),
  KEY `fk_inventory_createdBy` (`createdBy`),
  KEY `fk_inventory_updatedBy` (`updatedBy`),
  CONSTRAINT `fk_inventory_company` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of inventories
-- ----------------------------
INSERT INTO `inventories` VALUES ('1', '1510 Series', 'Trion', 'New', '13', '14', 'None.', '5', '1', null, '1', '2011-11-28 13:08:37');
INSERT INTO `inventories` VALUES ('2', 'KSEC Series', 'Trion', null, '11', '12', 'None.', '5', '1', null, '1', '2011-11-28 13:08:35');
INSERT INTO `inventories` VALUES ('3', '1510 Series', 'Manufacturer', '3', '15', '10', 'None.', '5', '1', null, '1', '2011-11-28 13:08:33');
INSERT INTO `inventories` VALUES ('4', 'KSEC Series', 'Trion', '5', '10', '15', 'Desc', '5', '1', null, '1', '2011-11-28 13:08:07');
INSERT INTO `inventories` VALUES ('5', '1510 Series', 'Manufacturer', '7', '0', '1', 'No desc.', '6', '1', null, '2', '2011-11-25 19:07:36');

-- ----------------------------
-- Table structure for `lookup`
-- ----------------------------
DROP TABLE IF EXISTS `lookup`;
CREATE TABLE `lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lookup
-- ----------------------------
INSERT INTO `lookup` VALUES ('1', 'COMPANY_CATEGORY', '1', 'Reseller');
INSERT INTO `lookup` VALUES ('2', 'COMPANY_CATEGORY', '2', 'Distributor');
INSERT INTO `lookup` VALUES ('3', 'COMPANY_CATEGORY', '3', 'Service Center');
INSERT INTO `lookup` VALUES ('4', 'COMPANY_CATEGORY', '4', 'Integrator');
INSERT INTO `lookup` VALUES ('5', 'COMPANY_CATEGORY', '5', 'Broker');
INSERT INTO `lookup` VALUES ('6', 'COMPANY_CATEGORY', '6', 'VAR');
INSERT INTO `lookup` VALUES ('7', 'COMPANY_CATEGORY', '7', 'Mfg');
INSERT INTO `lookup` VALUES ('8', 'COMPANY_CATEGORY', '8', 'Retail');
INSERT INTO `lookup` VALUES ('9', 'INVENTORY_CONDITION', '1', 'F/S');
INSERT INTO `lookup` VALUES ('10', 'INVENTORY_CONDITION', '2', 'NOB');
INSERT INTO `lookup` VALUES ('11', 'INVENTORY_CONDITION', '3', 'NEW');
INSERT INTO `lookup` VALUES ('12', 'INVENTORY_CONDITION', '4', 'REF');
INSERT INTO `lookup` VALUES ('13', 'INVENTORY_CONDITION', '5', 'USED');
INSERT INTO `lookup` VALUES ('14', 'INVENTORY_CONDITION', '6', 'ASIS');
INSERT INTO `lookup` VALUES ('15', 'INVENTORY_CONDITION', '7', 'EXC');
INSERT INTO `lookup` VALUES ('16', 'INVENTORY_CONDITION', '8', 'REP');

-- ----------------------------
-- Table structure for `manufacturers`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `contactNo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of manufacturers
-- ----------------------------
INSERT INTO `manufacturers` VALUES ('1', 'HTC', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `models`
-- ----------------------------
DROP TABLE IF EXISTS `models`;
CREATE TABLE `models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `part_no` varchar(45) DEFAULT NULL,
  `manufacturerPartNo` varchar(45) DEFAULT NULL,
  `showInfo` binary(1) DEFAULT NULL,
  `infoText` varchar(45) DEFAULT NULL,
  `image` blob,
  `weight` varchar(45) DEFAULT NULL,
  `dimensions` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_model` (`productId`),
  CONSTRAINT `fk_product_model` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of models
-- ----------------------------

-- ----------------------------
-- Table structure for `parts`
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partNo` varchar(45) NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `model` varchar(150) DEFAULT NULL,
  `overview` mediumtext,
  `features` longtext,
  `specifications` longtext,
  `subcategoryId` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_part_subcategory` (`subcategoryId`),
  CONSTRAINT `fk_part_subcategory` FOREIGN KEY (`subcategoryId`) REFERENCES `subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parts
-- ----------------------------
INSERT INTO `parts` VALUES ('1', '1510 Series', 'Manufacturer', 'SDC 1650 lb Modular Magnetic Lock', 'The 1510 Series is an ANSI grade 1 modular magnetic lock, with 1650 lb holding force. They are field upgradeable and can be serviced without removing from the door frame. The 1510 Series is used to hold doors with 1650 lb of electromagnetic force. When power is removed the holding force is released.', ' 1650 lb Holding Force ', 'Power:12/24 VDC', '1', 'SDC 1650 lb Modular Magnetic Lock', null);
INSERT INTO `parts` VALUES ('2', 'KSEC Series', 'Trion', 'Trion Access Control System', 'Trion is an open web-based access control system that allows you to manage and monitor your facility anytime, anywhere. Built on NiagaraAX Framework®, Trion integrates with building automation systems enabling you to control lighting, HVAC equipment, and other building systems in response to access events and alarm conditions.', null, null, '1', 'Trion Access Control System', null);

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `manufacturerId` int(11) NOT NULL,
  `subcategoryId` int(11) NOT NULL,
  `features` longtext,
  `specifications` longtext,
  `image` blob,
  `detailDescription` longtext,
  `manufacturer` varchar(255) DEFAULT NULL,
  `overview` varchar(255) DEFAULT NULL,
  `partNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_manufacturer` (`manufacturerId`),
  KEY `fk_product_category` (`subcategoryId`),
  KEY `fk_product_subcategory` (`subcategoryId`),
  CONSTRAINT `fk_product_manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_subcategory` FOREIGN KEY (`subcategoryId`) REFERENCES `subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'Test Product', 'sdfasd', '1', '3', 'card', 'spec', null, null, null, null, null);
INSERT INTO `products` VALUES ('2', 'Test Product 2', 'No Desc', '1', '18', 'no feat', 'no spec', null, null, null, null, null);
INSERT INTO `products` VALUES ('3', '1510 Series', 'SDC 1650 lb Modular Magnetic Lock', '1', '1', ' 1650 lb Holding Force \r\n Autosensing 12/24 VDC Voltage Input \r\n Choice of 9 anodized & plated finishes \r\n ANSI/BHMA Grade 1 Compliant \r\n BHMA Certified Holding Force \r\n Quick Mount Assembly', 'Power:12/24 VDC\r\nSingle Current:350 mA @ 24 VDC; 670 mA @ 12 VDC  \r\nDimensions:2.75 H x 11 L x 1.562 D (6.99 x 27.94 x 3.97 cm)\r\nWeight:11 lb\r\nDouble Current:700 mA @ 24 VDC; 1.34 A @ 12 VDC \r\nDimensions:2.75\" H x 22\" L x 1.562\" D (6.99 x 55.88 x 3.97 cm)\r\nWeight:27 lb\r\nAgency Approvals:UL, CSFM (3774-0324:100), MEA Listed (61-95-E) \r\nWarranty:1 Year', null, 'The 1510 Series is an ANSI grade 1 modular magnetic lock, with 1650 lb holding force. They are field upgradeable and can be serviced without removing from the door frame. The 1510 Series is used to hold doors with 1650 lb of electromagnetic force. When power is removed the holding force is released.', null, null, null);
INSERT INTO `products` VALUES ('4', '1570 Series', 'SDC 1200 lb Magnetic Lock', '1', '1', ' 1200 lb holding force \r\n Autosensing 12/24 VDC voltage input \r\n Choice of 9 anodized & plated finishes \r\n ANSI/BHMA Grade 1 compliant \r\n BHMA certified holding force \r\n Quick-mount assembly', 'Power:12/24 VDC\r\nSingle Current:125 mA @ 24 VDC; 250 mA @ 12 VDC\r\nDimensions:2.75H x 11L x 1.56 D (6.99 x 27.94 x 3.97 cm)\r\nWeight:11 lb\r\nDouble Current:250 mA @ 24 VDC; 500 mA @ 12 VDC \r\nDimensions:2.75\"H x 22\"L x 1.56\" D (6.99 x 55.88 x 3.97 cm)\r\nWeight:27 lb\r\nAgency Approvals:UL, CSFM (3774-0324:100), MEA Listed (61-95-E)\r\nWarranty:1 Year', null, 'The 1570 Series is an ANSI grade 1 modular magnetic lock with 1200 lb Holding Force. They are field upgradeable and can be serviced without removing from the door frame. The 1570 Series is used to hold doors with 1200 lb of electromagnetic force. When power is removed the holding force is released.', null, null, null);
INSERT INTO `products` VALUES ('5', 'K-SEC Series', 'Trion Access Control System', '1', '6', '', '', null, 'Trion is an open web-based access control system that allows you to manage and monitor your facility anytime, anywhere. Built on NiagaraAX Framework®, Trion integrates with building automation systems enabling you to control lighting, HVAC equipment, and other building systems in response to access events and alarm conditions.', null, null, null);
INSERT INTO `products` VALUES ('10', 'GCA, GMA Series', 'Siemens Direct Coupled Actuators Spring Return\r\n', '1', '18', 'asdas', 'asdas', null, null, null, null, null);
INSERT INTO `products` VALUES ('11', 'GK Series', 'Belimo Fail-safe 360 in-lb actuator', '1', '3', 'asdas', 'asdasd', null, null, null, null, null);
INSERT INTO `products` VALUES ('17', '1570 Series', 'asdfas', '1', '14', 'asdfs', 'asdfasd', null, null, null, null, null);
INSERT INTO `products` VALUES ('18', '1570 Series', 'asdfs', '1', '9', 'asdfdf', 'sdafasd', null, null, null, null, null);
INSERT INTO `products` VALUES ('19', '446U', 'asdasd', '1', '8', 'asdf', 'sfsdaf', null, null, null, null, null);
INSERT INTO `products` VALUES ('20', '125STR, 89STR, 869STR, 869, 868STR, 868', 'Strobes & Horns', '1', '15', '<ul style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; list-style-type: none; list-style-position: initial; list-style-image: initial; line-height: 15px; text-align: left; background-color: rgb(255, 255, 255); \"><li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 3px; padding-right: 0px; padding-bottom: 4px; padding-left: 8px; vertical-align: baseline; font-family: inherit; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; list-style-type: square; background-image: none; list-style-position: inside; text-decoration: none; line-height: 14px; \">Indoor and outdoor applications</li><li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 3px; padding-right: 0px; padding-bottom: 4px; padding-left: 8px; vertical-align: baseline; font-family: inherit; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; list-style-type: square; background-image: none; list-style-position: inside; text-decoration: none; line-height: 14px; \">Amber, blue, clear, green, and red colors</li><li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 3px; padding-right: 0px; padding-bottom: 4px; padding-left: 8px; vertical-align: baseline; font-family: inherit; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; list-style-type: square; background-image: none; list-style-position: inside; text-decoration: none; line-height: 14px; \">24 VAC, 24 VDC, and 120 VAC</li><li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 3px; padding-right: 0px; padding-bottom: 4px; padding-left: 8px; vertical-align: baseline; font-family: inherit; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; list-style-type: square; background-image: none; list-style-position: inside; text-decoration: none; line-height: 14px; \">Surface and panel mount</li></ul>', '<p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">125STR:</strong></p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Supply voltage:</strong>120 VAC</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Current:</strong>120 mA</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Candella:</strong>300,000 cd</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Strobe tube life:</strong>3000 hrs</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Mounting:</strong>Double-threaded nipple or .5\" conduit mounting</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Enclosure:</strong>NEMA 4X</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Approvals:</strong>UL 1638 listed, cUL</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Dimensions:</strong>3-7/8\" H x 3-1/4\" Dia.&nbsp;(9.8 x 8.3 cm)</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">868, 869, 89STR, 868STR, 869STR:</strong></p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Supply voltage:</strong>&nbsp;24 VDC, 24 VAC, 120 VAC; -20% to +10% of nominal voltage</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Current, horn/strobe:</strong>&nbsp;24 VDC, 22 mA/390 mA; 24 VAC, 72 mA/390 mA; 120 VAC, 24 mA/87 mA</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Candella:</strong>&nbsp;Clear, 150 cd; Amber 90 cd; Green, 70 cd; Red, 21 cd; Blue, 20 cd</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Strobe tube life:</strong>1000 hrs</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Operating humidity:</strong>868/868STR, 95% RH @ 86F (30C); 869, 89STR, 869STR, 85% RH @ 86F (30C)</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Operating temperature:</strong>868/868STR, -31F to 150F (-35C to 66C); 869, 89STR, 869STR, 32F to 120F (0C to 49C)</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Horn decibel level:</strong>90 dba @ 10\'</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Mounting:</strong>869, 4\" sq x 1.5\" electrical box w/ 1.5\" extension ring; 868, Weatherproof surface box supplied - no NEMA rating</p><p style=\"text-align: left;margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">Dimensions:</strong>89STR, 3-3/8\" W x 5\" H (8.6 x 12.7 cm); 869, 868, 5-1/2\" W x 5-1/2\" H (14 x 14 cm)</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">Warranty:</strong>2 years</p>', null, 'These signal strobes and horns from Edwards offer traditional wall-mount and panel-mount configurations in a variety of colors and voltages. Model 125STR is a 120 VAC panel-mount strobe in NEMA 4X enclosure. Model 89STR mounts on a single-gang box and is a single, indoor, flush-mount strobe. Model 869STR is an indoor, flush-mount horn and strobe combination. Model 869 is an indoor, flush-mount horn only. Model 868 STR is an outdoor, surface-mount horn and strobe combination. Model 868 is an outdoor, surface-mount horn. All of the Edwards horns and strobes on this page are available in amber, blue, clear, green, and red and in 24 VAC/DC (except Model 125STR) and 120 VAC. ', null, null, null);
INSERT INTO `products` VALUES ('21', '522 Series', 'Ultraflo Resilient Seated Butterfly Valves', '1', '22', '<p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \">High pressure rack and pinion pneumatic actuators available in double acting and spring return designs</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \">High torque industrial grade electric actuators available in modulating or on/off configurations and are NEMA 4 rated with standard heaters</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \">Hand polished and spherically machined valve discs</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \">Unique tongue and groove seat design to seal with slip on or weld neck flanges</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \">Bonded in seat design totally encases the valve interior to isolate the body from line media</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \">Corrosion resistant, heavy duty acetal bushings absorb side thrusts</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \">Stem packing gland is self-adjusting double U cup design and give positive seatin in both directions preventing external substances from entering the stem bore</p>', '<p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">Valve:</strong></p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Body:</strong>Polyester coated cast iron, A126 Class B</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Seat:</strong>EPDM bonded in for dead end service</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Shaft/Taper pin:</strong>Type 419/14-4 ph</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Disc:</strong>Aluminum Bronze</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Weather seal:</strong>Buna-N</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Bearings:</strong>Acetol</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Static pressure:</strong>200 psig</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Media:</strong>&nbsp;Water,&nbsp;ethyline glycol&nbsp;</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp;Fluid temperature:</strong></p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp; Minimum:</strong>-40F (-40C)</p><p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 6px; padding-left: 0px; vertical-align: baseline; font-family: Arial, Verdana, sans-serif; font-size: 13px; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; background-color: rgb(255, 255, 255); line-height: 15px; text-align: left; \"><strong style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; vertical-align: baseline; font-family: inherit; font-weight: bold; font-style: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; \">&nbsp; Maximum:</strong>250F (121C)</p>', null, 'The 522 Series resilient seated butterfly valves are available in 2\"-20\" sizes.  Economical and designed to meet today\'s HVAC and industrial process requirements, they come standard with full lugged bodies, aluminum bronze discs, 416 stainless steel stems, and EPDM seats.  The valves come assembled with electric, pneumatic, or manual operators and are ready to install.\r\n', null, null, null);

-- ----------------------------
-- Table structure for `product_accessories`
-- ----------------------------
DROP TABLE IF EXISTS `product_accessories`;
CREATE TABLE `product_accessories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `accessoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_accessory` (`productId`),
  KEY `fk_accessory_product` (`accessoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_accessories
-- ----------------------------

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `question` varchar(105) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_user` (`userId`),
  KEY `fk_question_product` (`productId`),
  CONSTRAINT `fk_question_product` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of questions
-- ----------------------------

-- ----------------------------
-- Table structure for `reviews`
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `rating1` int(11) DEFAULT NULL,
  `rating2` int(11) DEFAULT NULL,
  `rating3` int(11) DEFAULT NULL,
  `review` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`productId`),
  KEY `fk_review_user` (`userId`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reviews
-- ----------------------------

-- ----------------------------
-- Table structure for `states`
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `countryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_state_country` (`countryId`),
  CONSTRAINT `fk_state_country` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of states
-- ----------------------------
INSERT INTO `states` VALUES ('1', 'Alabama', '1');
INSERT INTO `states` VALUES ('2', 'Alaska', '1');
INSERT INTO `states` VALUES ('3', 'American Samoa', '1');
INSERT INTO `states` VALUES ('4', 'Arizona', '1');
INSERT INTO `states` VALUES ('5', 'Arkansas', '1');
INSERT INTO `states` VALUES ('6', 'California', '1');
INSERT INTO `states` VALUES ('7', 'Colorado', '1');
INSERT INTO `states` VALUES ('8', 'Connecticut', '1');
INSERT INTO `states` VALUES ('9', 'Delaware', '1');
INSERT INTO `states` VALUES ('10', 'District of Columbia', '1');
INSERT INTO `states` VALUES ('11', 'Florida', '1');
INSERT INTO `states` VALUES ('12', 'Georgia', '1');
INSERT INTO `states` VALUES ('13', 'Guam', '1');
INSERT INTO `states` VALUES ('14', 'Hawaii', '1');
INSERT INTO `states` VALUES ('15', 'Idaho', '1');
INSERT INTO `states` VALUES ('16', 'Illinois', '1');
INSERT INTO `states` VALUES ('17', 'Indiana', '1');
INSERT INTO `states` VALUES ('18', 'Iowa', '1');
INSERT INTO `states` VALUES ('19', 'Kansas', '1');
INSERT INTO `states` VALUES ('20', 'Kentucky', '1');
INSERT INTO `states` VALUES ('21', 'Louisiana', '1');
INSERT INTO `states` VALUES ('22', 'Maine', '1');
INSERT INTO `states` VALUES ('23', 'Maryland', '1');
INSERT INTO `states` VALUES ('24', 'Massachusetts', '1');
INSERT INTO `states` VALUES ('25', 'Michigan', '1');
INSERT INTO `states` VALUES ('26', 'Minnesota', '1');
INSERT INTO `states` VALUES ('27', 'Mississippi', '1');
INSERT INTO `states` VALUES ('28', 'Missouri', '1');
INSERT INTO `states` VALUES ('29', 'Montana', '1');
INSERT INTO `states` VALUES ('30', 'Nebraska', '1');
INSERT INTO `states` VALUES ('31', 'Nevada', '1');
INSERT INTO `states` VALUES ('32', 'New Hampshire', '1');
INSERT INTO `states` VALUES ('33', 'New Jersey', '1');
INSERT INTO `states` VALUES ('34', 'New Mexico', '1');
INSERT INTO `states` VALUES ('35', 'New York', '1');
INSERT INTO `states` VALUES ('36', 'North Carolina', '1');
INSERT INTO `states` VALUES ('37', 'North Dakota', '1');
INSERT INTO `states` VALUES ('38', 'Northern Marianas Islands', '1');
INSERT INTO `states` VALUES ('39', 'Ohio', '1');
INSERT INTO `states` VALUES ('40', 'Oklahoma', '1');
INSERT INTO `states` VALUES ('41', 'Oregon', '1');
INSERT INTO `states` VALUES ('42', 'Pennsylvania', '1');
INSERT INTO `states` VALUES ('43', 'Puerto Rico', '1');
INSERT INTO `states` VALUES ('44', 'Rhode Island', '1');
INSERT INTO `states` VALUES ('45', 'South Carolina', '1');
INSERT INTO `states` VALUES ('46', 'South Dakota', '1');
INSERT INTO `states` VALUES ('47', 'Tennessee', '1');
INSERT INTO `states` VALUES ('48', 'Texas', '1');
INSERT INTO `states` VALUES ('49', 'Utah', '1');
INSERT INTO `states` VALUES ('50', 'Vermont', '1');
INSERT INTO `states` VALUES ('51', 'Virginia', '1');
INSERT INTO `states` VALUES ('52', 'Virgin Islands', '1');
INSERT INTO `states` VALUES ('53', 'Washington', '1');
INSERT INTO `states` VALUES ('54', 'West Virginia', '1');
INSERT INTO `states` VALUES ('55', 'Wisconsin', '1');
INSERT INTO `states` VALUES ('56', 'Wyoming', '1');

-- ----------------------------
-- Table structure for `stocks`
-- ----------------------------
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemNo` int(11) DEFAULT NULL,
  `conditionId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_condition` (`conditionId`),
  KEY `fk_stock_user` (`userId`),
  CONSTRAINT `fk_stock_condition` FOREIGN KEY (`conditionId`) REFERENCES `conditions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stocks
-- ----------------------------

-- ----------------------------
-- Table structure for `subcategories`
-- ----------------------------
DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subcategory_category` (`categoryId`),
  CONSTRAINT `fk_subcategory_category` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of subcategories
-- ----------------------------
INSERT INTO `subcategories` VALUES ('1', 'Door Hardware', '1');
INSERT INTO `subcategories` VALUES ('2', 'Cameras', '1');
INSERT INTO `subcategories` VALUES ('3', 'Card Readers', '1');
INSERT INTO `subcategories` VALUES ('4', 'Video Recorders', '1');
INSERT INTO `subcategories` VALUES ('5', 'Accessories', '1');
INSERT INTO `subcategories` VALUES ('6', 'Controllers', '1');
INSERT INTO `subcategories` VALUES ('7', 'Intercoms', '1');
INSERT INTO `subcategories` VALUES ('8', 'Spring Return', '2');
INSERT INTO `subcategories` VALUES ('9', 'Non Spring Return', '2');
INSERT INTO `subcategories` VALUES ('10', 'Fire and Smoke', '2');
INSERT INTO `subcategories` VALUES ('11', 'Accessories', '2');
INSERT INTO `subcategories` VALUES ('12', 'Loop-Powered Indicators', '3');
INSERT INTO `subcategories` VALUES ('13', 'Tower Lights', '3');
INSERT INTO `subcategories` VALUES ('14', 'Alarm Indication Stations', '3');
INSERT INTO `subcategories` VALUES ('15', 'Strobes and Horns', '3');
INSERT INTO `subcategories` VALUES ('16', 'Emergency Operator Stations', '3');
INSERT INTO `subcategories` VALUES ('17', 'Run Time Accumulator', '3');
INSERT INTO `subcategories` VALUES ('18', 'Zone', '4');
INSERT INTO `subcategories` VALUES ('19', 'Ball', '4');
INSERT INTO `subcategories` VALUES ('20', 'Solenoid', '4');
INSERT INTO `subcategories` VALUES ('21', 'Globe', '4');
INSERT INTO `subcategories` VALUES ('22', 'Butterfly', '4');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `contactNo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  `contactNo2` varchar(45) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  `company` tinyblob,
  PRIMARY KEY (`id`),
  KEY `fk_user_company` (`companyId`),
  CONSTRAINT `fk_user_company` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Amier Haider', null, 'None', 'Sargodha', '123456', 'a@a.com', 'amier', 'haider', '123456', '5', null);
INSERT INTO `users` VALUES ('2', 'Asad Usman', null, 'None ', 'Lahore', '123456789', 'b@b.com', 'asad.usman', 'asad', '123456789', '6', null);
INSERT INTO `users` VALUES ('3', 'amier', 'haider', null, null, null, 'amier.haider@gmail.com', 'amier2', 'haider', null, null, null);
INSERT INTO `users` VALUES ('4', 'amier', 'haider', null, null, null, 'amier.haider@gmail.com', 'amier3', 'haider', null, null, null);
INSERT INTO `users` VALUES ('5', 'amier', 'haider', null, null, null, 'a@a.com', 'amier4', 'haider', null, null, null);
