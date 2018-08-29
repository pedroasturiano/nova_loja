# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.35)
# Base de Dados: nova_loja
# Tempo de Geração: 2017-10-05 19:08:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;

INSERT INTO `brands` (`id`, `name`)
VALUES
	(1,'LG'),
	(2,'Samsung'),
	(3,'AOC'),
	(4,'Apple');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `sub`, `name`)
VALUES
	(6,NULL,'Monitor'),
	(14,NULL,'Som'),
	(15,14,'Headphones'),
	(16,14,'Microfones'),
	(17,15,'Com Fio'),
	(18,15,'Sem Fio');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `coupon_type` int(11) NOT NULL,
  `coupon_value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;

INSERT INTO `options` (`id`, `name`)
VALUES
	(1,'Cor'),
	(2,'Tamanho'),
	(3,'Memória RAM'),
	(4,'Polegadas');

/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_category` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL,
  `price_from` float NOT NULL,
  `rating` float NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `sale` tinyint(1) NOT NULL,
  `bestseller` tinyint(1) NOT NULL,
  `new_product` tinyint(1) NOT NULL,
  `options` varchar(200) DEFAULT NULL,
  `weight` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `length` float NOT NULL,
  `diameter` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `id_category`, `id_brand`, `name`, `description`, `stock`, `price`, `price_from`, `rating`, `featured`, `sale`, `bestseller`, `new_product`, `options`, `weight`, `width`, `height`, `length`, `diameter`)
VALUES
	(1,6,1,'Monitor 21 polegadas','Alguma descrição do produto.',10,499,599,0,1,1,1,0,'1,2,4',0.9,20,15,20,15),
	(2,6,2,'Monitor 18 polegadas','Alguma outra descrição',10,399,999,2,1,1,1,0,'1,2',0.8,20,15,20,15),
	(3,6,2,'Monitor 19 polegadas','Alguma outra descrição',10,599,699,0,1,0,0,1,'1,2',0.7,20,15,20,15),
	(4,6,3,'Monitor 17 polegadas','Alguma outra descrição',10,3779,900,2,1,0,0,0,'1,4',0.6,20,15,20,15),
	(5,6,1,'Monitor 20 polegadas','Alguma outra descrição',10,299,499,0,1,0,0,1,'1',0.5,20,15,20,15),
	(6,6,3,'Monitor 20 polegadas','Alguma outra descrição',10,699,0,0,1,0,0,0,'1,2,4',0.4,20,15,20,15),
	(7,6,3,'Monitor 19 polegadas','Alguma outra descrição',10,889,999,5,1,1,0,0,'2,4',0.3,20,15,20,15),
	(8,6,1,'Monitor 18 polegadas','Alguma outra descrição',10,599,699,0,1,0,0,0,'4',0.2,20,15,20,15);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela products_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products_images`;

CREATE TABLE `products_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `url` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products_images` WRITE;
/*!40000 ALTER TABLE `products_images` DISABLE KEYS */;

INSERT INTO `products_images` (`id`, `id_product`, `url`)
VALUES
	(1,1,'1.jpg'),
	(2,2,'2.jpg'),
	(3,3,'3.jpg'),
	(4,4,'4.jpg'),
	(5,5,'1.jpg'),
	(6,6,'3.jpg'),
	(7,7,'7.jpg'),
	(8,8,'7.jpg'),
	(9,2,'3.jpg'),
	(10,2,'4.jpg'),
	(11,2,'7.jpg');

/*!40000 ALTER TABLE `products_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela products_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products_options`;

CREATE TABLE `products_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_option` int(11) NOT NULL,
  `p_value` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products_options` WRITE;
/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;

INSERT INTO `products_options` (`id`, `id_product`, `id_option`, `p_value`)
VALUES
	(1,1,1,'Azul'),
	(2,1,2,'23cm'),
	(3,1,4,'21'),
	(4,2,1,'Azul'),
	(5,2,2,'19cm'),
	(6,3,1,'Vermelho'),
	(7,3,2,'19cm');

/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela purchase_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_transactions`;

CREATE TABLE `purchase_transactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_purchase` int(11) NOT NULL,
  `amount` float NOT NULL,
  `transaction_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_coupon` int(11) DEFAULT NULL,
  `total_amount` float NOT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `payment_status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;

INSERT INTO `purchases` (`id`, `id_user`, `id_coupon`, `total_amount`, `payment_type`, `payment_status`)
VALUES
	(1,2,NULL,421.44,'psckttransparente',1),
	(2,2,NULL,421.44,'psckttransparente',1),
	(3,2,NULL,421.44,'psckttransparente',1),
	(4,2,NULL,421.44,'psckttransparente',1),
	(5,2,NULL,421.44,'psckttransparente',1),
	(6,2,NULL,421.44,'psckttransparente',1),
	(7,2,NULL,421.44,'psckttransparente',1),
	(8,2,NULL,421.44,'psckttransparente',1),
	(9,2,NULL,421.44,'psckttransparente',1),
	(10,2,NULL,421.44,'psckttransparente',1),
	(11,2,NULL,421.44,'psckttransparente',1),
	(12,2,NULL,421.44,'psckttransparente',1),
	(13,2,NULL,421.44,'psckttransparente',1),
	(14,2,NULL,421.44,'psckttransparente',1),
	(15,2,NULL,421.44,'psckttransparente',1),
	(16,2,NULL,421.44,'psckttransparente',1),
	(17,2,NULL,421.44,'psckttransparente',1),
	(18,2,NULL,421.44,'psckttransparente',1),
	(19,2,NULL,421.44,'psckttransparente',1),
	(20,2,NULL,421.44,'psckttransparente',1),
	(21,2,NULL,421.44,'psckttransparente',1),
	(22,2,NULL,421.44,'psckttransparente',1),
	(23,2,NULL,421.44,'psckttransparente',1),
	(24,2,NULL,421.44,'psckttransparente',1),
	(25,2,NULL,421.44,'psckttransparente',1),
	(26,2,NULL,421.44,'psckttransparente',1),
	(27,2,NULL,421.44,'psckttransparente',1),
	(28,2,NULL,421.44,'psckttransparente',1),
	(29,2,NULL,421.44,'psckttransparente',1),
	(30,2,NULL,421.44,'psckttransparente',1),
	(31,2,NULL,421.44,'psckttransparente',1),
	(32,2,NULL,421.44,'psckttransparente',1),
	(33,2,NULL,421.44,'psckttransparente',1),
	(34,2,NULL,421.44,'psckttransparente',1),
	(35,2,NULL,421.44,'psckttransparente',1),
	(36,2,NULL,421.44,'psckttransparente',1),
	(37,2,NULL,421.44,'psckttransparente',1),
	(38,2,NULL,421.44,'psckttransparente',1),
	(39,2,NULL,421.44,'psckttransparente',1),
	(40,2,NULL,421.44,'psckttransparente',1),
	(41,2,NULL,421.44,'psckttransparente',1),
	(42,2,NULL,421.44,'psckttransparente',1),
	(43,2,NULL,421.44,'psckttransparente',1),
	(44,2,NULL,421.44,'psckttransparente',1),
	(45,2,NULL,421.44,'psckttransparente',1),
	(46,2,NULL,421.44,'psckttransparente',1),
	(47,2,NULL,421.44,'psckttransparente',1),
	(48,2,NULL,421.44,'psckttransparente',1);

/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela purchases_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchases_products`;

CREATE TABLE `purchases_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_purchase` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchases_products` WRITE;
/*!40000 ALTER TABLE `purchases_products` DISABLE KEYS */;

INSERT INTO `purchases_products` (`id`, `id_purchase`, `id_product`, `quantity`, `product_price`)
VALUES
	(1,1,2,1,399),
	(2,2,2,1,399),
	(3,3,2,1,399),
	(4,4,2,1,399),
	(5,5,2,1,399),
	(6,6,2,1,399),
	(7,7,2,1,399),
	(8,8,2,1,399),
	(9,9,2,1,399),
	(10,10,2,1,399),
	(11,11,2,1,399),
	(12,12,2,1,399),
	(13,13,2,1,399),
	(14,14,2,1,399),
	(15,15,2,1,399),
	(16,16,2,1,399),
	(17,17,2,1,399),
	(18,18,2,1,399),
	(19,19,2,1,399),
	(20,20,2,1,399),
	(21,21,2,1,399),
	(22,22,2,1,399),
	(23,23,2,1,399),
	(24,24,2,1,399),
	(25,25,2,1,399),
	(26,26,2,1,399),
	(27,27,2,1,399),
	(28,28,2,1,399),
	(29,29,2,1,399),
	(30,30,2,1,399),
	(31,31,2,1,399),
	(32,32,2,1,399),
	(33,33,2,1,399),
	(34,34,2,1,399),
	(35,35,2,1,399),
	(36,36,2,1,399),
	(37,37,2,1,399),
	(38,38,2,1,399),
	(39,39,2,1,399),
	(40,40,2,1,399),
	(41,41,2,1,399),
	(42,42,2,1,399),
	(43,43,2,1,399),
	(44,44,2,1,399),
	(45,45,2,1,399),
	(46,46,2,1,399),
	(47,47,2,1,399),
	(48,48,2,1,399);

/*!40000 ALTER TABLE `purchases_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rates`;

CREATE TABLE `rates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_rated` datetime NOT NULL,
  `points` int(11) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;

INSERT INTO `rates` (`id`, `id_product`, `id_user`, `date_rated`, `points`, `comment`)
VALUES
	(1,2,1,'2017-01-01 00:00:00',2,'Produto muito legal.'),
	(2,2,1,'2017-01-02 00:00:00',2,'Produto meio ruim.');

/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `password`, `name`)
VALUES
	(1,'suporte@b7web.com.br','698dc19d489c4e4db73e28a713eab07b','Bonieky Lacerda'),
	(2,'c74502652460089725395@sandbox.pagseguro.com.br','974U1WM32m975041',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
