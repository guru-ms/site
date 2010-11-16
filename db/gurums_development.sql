-- phpMyAdmin SQL Dump
-- version 3.3.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2010 at 05:14 PM
-- Server version: 5.1.48
-- PHP Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gurums_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `config`
--


-- --------------------------------------------------------

--
-- Table structure for table `extension_meta`
--

CREATE TABLE IF NOT EXISTS `extension_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `schema_version` int(11) DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `extension_meta`
--


-- --------------------------------------------------------

--
-- Table structure for table `layouts`
--

CREATE TABLE IF NOT EXISTS `layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `content_type` varchar(40) DEFAULT NULL,
  `lock_version` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `layouts`
--

INSERT INTO `layouts` (`id`, `name`, `content`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`, `content_type`, `lock_version`) VALUES
(1, 'Default', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"\r\n	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r\n<html lang="en-us" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us">\r\n	<head>\r\n		<meta charset="utf-8" />\r\n		<title>\r\n			GURU-MS .: Grupo de UsuÃ¡rios Ruby do Mato Grosso do Sul\r\n		</title>\r\n		<link rel="stylesheet" href="/stylesheets/default.css" media="screen" type="text/css" />\r\n		<link rel="stylesheet" href="/stylesheets/admin/overrides.css" media="screen" type="text/css" />\r\n	</head>\r\n	<body class="reversed">\r\n		<div id="page">\r\n			<div id="logo"><img src="/images/logo-guru.png" /></div>\r\n			<div id="header">\r\n				<ul id="navigation">\r\n					<li class="<r:if_url matches="^/$">current</r:if_url>"><a href="/">InÃ­cio</a></li>\r\n				<r:find url="/">\r\n					<r:children:each by="published_at">\r\n					<li class="<r:if_self>current</r:if_self>">\r\n						<r:link />\r\n					</li>\r\n					</r:children:each>\r\n				</r:find>\r\n				</ul>\r\n				<div id="header_bottom"></div>\r\n			</div>\r\n			<div id="main">\r\n				<div id="content">\r\n					<h1><r:title/></h1>\r\n					<r:content/>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</body>\r\n</html>\r\n', '2010-11-15 21:41:12', '2010-11-15 23:51:26', 1, 1, '', 34);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `breadcrumb` varchar(160) DEFAULT NULL,
  `class_name` varchar(25) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `virtual` tinyint(1) NOT NULL DEFAULT '0',
  `lock_version` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_class_name` (`class_name`),
  KEY `pages_parent_id` (`parent_id`),
  KEY `pages_child_slug` (`slug`,`parent_id`),
  KEY `pages_published` (`virtual`,`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `breadcrumb`, `class_name`, `status_id`, `parent_id`, `layout_id`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `virtual`, `lock_version`, `description`, `keywords`) VALUES
(1, 'Seja Bem Vindo ao GURU-MS', '/', 'Seja Bem Vindo ao GURU-MS', '', 100, NULL, 1, '2010-11-15 21:39:47', '2010-11-15 21:41:19', '2010-11-15 00:00:00', 1, 1, 0, 2, '', ''),
(2, 'Blog', 'blog', 'Blog', 'ArchivePage', 100, 1, NULL, '2010-11-15 21:40:03', '2010-11-15 22:16:59', '2010-11-15 00:00:00', 1, 1, 0, 2, '', ''),
(3, 'Eventos', 'eventos', 'Eventos', '', 100, 1, NULL, '2010-11-15 21:40:11', '2010-11-15 23:49:28', '2010-11-15 20:49:28', 1, 1, 0, 1, '', ''),
(4, 'Como comeÃ§ar com Ruby?', 'como-comecar-com-ruby', 'Como comeÃ§ar com Ruby?', '', 100, 2, NULL, '2010-11-15 22:15:38', '2010-11-15 22:20:27', '2010-11-15 00:00:00', 1, 1, 0, 2, '', ''),
(5, 'GURU-MS no RubyConf 2010', 'guru-ms-no-rubyconf-2010', 'GURU-MS no RubyConf 2010', '', 100, 2, NULL, '2010-11-15 22:48:50', '2010-11-15 22:48:55', '2010-11-15 19:48:55', 1, 1, 0, 1, '', ''),
(6, 'Contato', 'contato', 'Contato', '', 100, 1, NULL, '2010-11-15 23:49:55', '2010-11-15 23:49:55', '2010-11-15 20:49:55', 1, NULL, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `page_parts`
--

CREATE TABLE IF NOT EXISTS `page_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `filter_id` varchar(25) DEFAULT NULL,
  `content` text,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parts_by_page` (`page_id`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `page_parts`
--

INSERT INTO `page_parts` (`id`, `name`, `filter_id`, `content`, `page_id`) VALUES
(1, 'body', 'Markdown', 'Muitas pessoas me perguntam por onde devem comeÃ§ar a estudar Ruby e este post visa relacionar as principais formas de obter informaÃ§Ãµes sobre a linguagem e os principais frameworks que vocÃª pode usar.\r\n\r\n### ReferÃªncias da linguagem\r\n\r\n* RubyLang (http://www.ruby-lang.org/pt/): Ã© o primeiro lugar a ser acessado. LÃ¡ vocÃª vai encontrar o pacote para instalaÃ§Ã£o dos executÃ¡veis de cÃ³digo Ruby, documentaÃ§Ã£o bÃ¡sica, API da linguagem, entre outros. ', 4),
(2, 'body', '', '<div id="tab_control">\r\n<div id="pages" class="pages">\r\n  <r:find url="/blog/">\r\n    <r:children:each order="desc" by="published_at" limit="5">\r\n       <!--Display your entire first post here-->\r\n       <div class="page">\r\n          <h2><r:link /></h2>\r\n          <div class="post_content"><r:content /></div>\r\n          <r:if_content part="extended"><r:link anchor="extended">ler mais &#8230;</r:link></r:if_content>\r\n          <p class="info">Por <r:author /> em <r:date format="%d/%m/%Y" /></p>\r\n       </div>\r\n    </r:children:each>\r\n  </r:find>\r\n</div>\r\n</div>', 2),
(3, 'body', '', 'OlÃ!', 1),
(4, 'body', '', 'Estivemos no mÃªs passado no RubyConf 2010 com a presenÃ§a de Saulo Arruda, Rodrigo Toledo, Kristopher Murata, Leandro Maia e Thiago Moretto.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('1'),
('10'),
('11'),
('12'),
('13'),
('14'),
('15'),
('16'),
('17'),
('18'),
('19'),
('2'),
('20'),
('20081203140407'),
('20090226140109'),
('20090929164633'),
('20091003095744'),
('21'),
('3'),
('4'),
('5'),
('6'),
('7'),
('8'),
('9');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `data` text,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `snippets`
--

CREATE TABLE IF NOT EXISTS `snippets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `filter_id` varchar(25) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `lock_version` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `snippets`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `designer` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text,
  `lock_version` int(11) DEFAULT '0',
  `salt` varchar(255) DEFAULT NULL,
  `session_token` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `login`, `password`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`, `admin`, `designer`, `notes`, `lock_version`, `salt`, `session_token`, `locale`) VALUES
(1, 'Saulo Arruda', NULL, 'sauloarruda', '389e913ba92bf1b3d58c067f8c62fa23e24dcb34', '2010-11-15 21:39:02', '2010-11-15 21:39:02', NULL, NULL, 1, 1, NULL, 0, 'd3380ea3aabbd0d53f06b8c6f565a1ae017bd54a', NULL, NULL);
