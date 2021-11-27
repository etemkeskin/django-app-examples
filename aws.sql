-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2021 at 07:13 PM
-- Server version: 8.0.22
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aws`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'visitor');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60),
(61, 1, 61),
(62, 1, 62),
(63, 1, 63),
(64, 1, 64),
(65, 1, 65),
(66, 1, 66),
(67, 1, 67),
(68, 1, 68),
(69, 1, 69),
(70, 1, 70),
(71, 1, 71),
(72, 1, 72),
(73, 1, 73),
(74, 1, 74),
(75, 1, 75),
(76, 1, 76),
(77, 1, 77),
(78, 1, 78),
(79, 1, 79),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(84, 1, 84),
(85, 1, 85),
(86, 1, 86),
(87, 1, 87),
(88, 1, 88),
(89, 1, 89),
(90, 1, 90),
(91, 1, 91),
(92, 1, 92),
(93, 1, 93),
(94, 1, 94),
(95, 1, 95),
(96, 1, 96),
(97, 1, 97),
(98, 1, 98),
(99, 1, 99),
(100, 1, 100),
(101, 1, 101),
(102, 1, 102),
(103, 1, 103),
(104, 1, 104),
(105, 1, 105),
(106, 1, 106),
(107, 1, 107),
(108, 1, 108);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add profile', 7, 'add_profile'),
(26, 'Can change profile', 7, 'change_profile'),
(27, 'Can delete profile', 7, 'delete_profile'),
(28, 'Can view profile', 7, 'view_profile'),
(29, 'Can add todo', 8, 'add_todo'),
(30, 'Can change todo', 8, 'change_todo'),
(31, 'Can delete todo', 8, 'delete_todo'),
(32, 'Can view todo', 8, 'view_todo'),
(33, 'Can add topic', 9, 'add_topic'),
(34, 'Can change topic', 9, 'change_topic'),
(35, 'Can delete topic', 9, 'delete_topic'),
(36, 'Can view topic', 9, 'view_topic'),
(37, 'Can add subject', 10, 'add_subject'),
(38, 'Can change subject', 10, 'change_subject'),
(39, 'Can delete subject', 10, 'delete_subject'),
(40, 'Can view subject', 10, 'view_subject'),
(41, 'Can add question', 11, 'add_question'),
(42, 'Can change question', 11, 'change_question'),
(43, 'Can delete question', 11, 'delete_question'),
(44, 'Can view question', 11, 'view_question'),
(45, 'Can add quiz', 12, 'add_quiz'),
(46, 'Can change quiz', 12, 'change_quiz'),
(47, 'Can delete quiz', 12, 'delete_quiz'),
(48, 'Can view quiz', 12, 'view_quiz'),
(49, 'Can add questions in quiz', 13, 'add_questionsinquiz'),
(50, 'Can change questions in quiz', 13, 'change_questionsinquiz'),
(51, 'Can delete questions in quiz', 13, 'delete_questionsinquiz'),
(52, 'Can view questions in quiz', 13, 'view_questionsinquiz'),
(53, 'Can add post', 14, 'add_post'),
(54, 'Can change post', 14, 'change_post'),
(55, 'Can delete post', 14, 'delete_post'),
(56, 'Can view post', 14, 'view_post'),
(57, 'Can add shop cart', 15, 'add_shopcart'),
(58, 'Can change shop cart', 15, 'change_shopcart'),
(59, 'Can delete shop cart', 15, 'delete_shopcart'),
(60, 'Can view shop cart', 15, 'view_shopcart'),
(61, 'Can add category', 16, 'add_category'),
(62, 'Can change category', 16, 'change_category'),
(63, 'Can delete category', 16, 'delete_category'),
(64, 'Can view category', 16, 'view_category'),
(65, 'Can add order', 17, 'add_order'),
(66, 'Can change order', 17, 'change_order'),
(67, 'Can delete order', 17, 'delete_order'),
(68, 'Can view order', 17, 'view_order'),
(69, 'Can add order detail', 18, 'add_orderdetail'),
(70, 'Can change order detail', 18, 'change_orderdetail'),
(71, 'Can delete order detail', 18, 'delete_orderdetail'),
(72, 'Can view order detail', 18, 'view_orderdetail'),
(73, 'Can add product', 19, 'add_product'),
(74, 'Can change product', 19, 'change_product'),
(75, 'Can delete product', 19, 'delete_product'),
(76, 'Can view product', 19, 'view_product'),
(77, 'Can add product gallery', 20, 'add_productgallery'),
(78, 'Can change product gallery', 20, 'change_productgallery'),
(79, 'Can delete product gallery', 20, 'delete_productgallery'),
(80, 'Can view product gallery', 20, 'view_productgallery'),
(81, 'Can add student exam', 21, 'add_studentexam'),
(82, 'Can change student exam', 21, 'change_studentexam'),
(83, 'Can delete student exam', 21, 'delete_studentexam'),
(84, 'Can view student exam', 21, 'view_studentexam'),
(85, 'Can add student answers', 22, 'add_studentanswers'),
(86, 'Can change student answers', 22, 'change_studentanswers'),
(87, 'Can delete student answers', 22, 'delete_studentanswers'),
(88, 'Can view student answers', 22, 'view_studentanswers'),
(89, 'Can add dash app', 23, 'add_dashapp'),
(90, 'Can change dash app', 23, 'change_dashapp'),
(91, 'Can delete dash app', 23, 'delete_dashapp'),
(92, 'Can view dash app', 23, 'view_dashapp'),
(93, 'Can add stateless app', 24, 'add_statelessapp'),
(94, 'Can change stateless app', 24, 'change_statelessapp'),
(95, 'Can delete stateless app', 24, 'delete_statelessapp'),
(96, 'Can view stateless app', 24, 'view_statelessapp'),
(97, 'Can add contact', 25, 'add_contact'),
(98, 'Can change contact', 25, 'change_contact'),
(99, 'Can delete contact', 25, 'delete_contact'),
(100, 'Can view contact', 25, 'view_contact'),
(101, 'Can add event', 26, 'add_event'),
(102, 'Can change event', 26, 'change_event'),
(103, 'Can delete event', 26, 'delete_event'),
(104, 'Can view event', 26, 'view_event'),
(105, 'Can add schedule', 27, 'add_schedule'),
(106, 'Can change schedule', 27, 'change_schedule'),
(107, 'Can delete schedule', 27, 'delete_schedule'),
(108, 'Can view schedule', 27, 'view_schedule');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$OVFO01DBOWdv$bSdD2TUS8qnPyysIh2iURu7yvfwwGoo1XPbIPP5rpVs=', '2021-11-27 18:13:46.848475', 1, 'admin@admin.com', 'etem', 'keskin', 'etemkeskin@yahoo.com', 1, 1, '2020-09-03 12:23:53.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `content` longtext,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`id`, `title`, `content`, `image`, `slug`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(13, 'Django - CKEditor Tutorial', '<p>How to use CKEditor with Django forms and add syntax highlighted code snippets.</p>\r\n\r\n<ul>\r\n	<li>&nbsp;<a href=\"https://samulinatri.com/blog/django-ckeditor-codesnippet-hightlightjs-youtube/#introduction\">Introduction</a></li>\r\n	<li>&nbsp;<a href=\"https://samulinatri.com/blog/django-ckeditor-codesnippet-hightlightjs-youtube/#quickstart\">Quickstart</a></li>\r\n	<li>&nbsp;<a href=\"https://samulinatri.com/blog/django-ckeditor-codesnippet-hightlightjs-youtube/#full-tutorial\">Full tutorial</a></li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://samulinatri.com/images/blog/django-ckeditor-codesnippet-hightlightjs-youtube/00.png\" /></p>\r\n\r\n<ul>\r\n	<li>A Beginner&#39;s Guide To Django:&nbsp;<a href=\"https://samulinatri.com/shop/a-beginners-guide-to-django/\">https://samulinatri.com/shop/a-beginners-guide-to-django/</a></li>\r\n	<li>Watch video on YouTube:&nbsp;<a href=\"https://www.youtube.com/watch?v=L6y6cn1XUfw\" target=\"_blank\">https://www.youtube.com/watch?v=L6y6cn1XUfw</a></li>\r\n	<li>Code:&nbsp;<a href=\"https://github.com/SamuliNatri/django-ckeditor-tutorial\" target=\"_blank\">https://github.com/SamuliNatri/django-ckeditor-tutorial</a></li>\r\n</ul>\r\n\r\n<h2 id=\"introduction\">Introduction</h2>\r\n\r\n<p>CKEditor is a rich text WYSIWYG editor. This tutorial shows how to add a RichTextUploading field to a model that enables all basic CKEditor features plus allows users to upload images and insert code snippets.</p>\r\n\r\n<h2 id=\"quickstart\">Quickstart</h2>\r\n\r\n<h3 id=\"mysite-settings-py\">mysite/settings.py</h3>\r\n\r\n<p>Add these lines to the project settings file:</p>\r\n\r\n<pre>\r\n<code>INSTALLED_APPS = [\r\n    # START\r\n    &#39;blog.apps.BlogConfig&#39;,\r\n    &#39;ckeditor&#39;,\r\n    &#39;ckeditor_uploader&#39;,\r\n    # END\r\n    &#39;django.contrib.admin&#39;,\r\n    &#39;django.contrib.auth&#39;,\r\n    &#39;django.contrib.contenttypes&#39;,\r\n    &#39;django.contrib.sessions&#39;,\r\n    &#39;django.contrib.messages&#39;,\r\n    &#39;django.contrib.staticfiles&#39;,\r\n]\r\n\r\n# START\r\nCKEDITOR_UPLOAD_PATH = &#39;uploads/&#39;\r\nMEDIA_URL = &#39;/media/&#39; \r\nMEDIA_ROOT = &#39;media/&#39;\r\n# END\r\n</code></pre>\r\n\r\n<h3 id=\"blog-models-py\">blog/models.py</h3>\r\n\r\n<p>Add&nbsp;<code>RichTextUploadingField</code>&nbsp;to a model:</p>\r\n\r\n<pre>\r\n<code>from ckeditor_uploader.fields import RichTextUploadingField\r\n\r\nclass Post(models.Model):\r\n    body = RichTextUploadingField(blank=True)\r\n</code></pre>\r\n\r\n<h3 id=\"mysite-urls-py\">mysite/urls.py</h3>\r\n\r\n<p>Edit the project URL configuration file and include ckeditor URLs. Serve uploaded media files using the&nbsp;<code>static</code>&nbsp;function:</p>\r\n\r\n<pre>\r\n<code>urlpatterns = [\r\n    # HERE\r\n    path(&#39;ckeditor/&#39;, include(\r\n        &#39;ckeditor_uploader.urls&#39;)),\r\n] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)\r\n</code></pre>\r\n\r\n<h3 id=\"templates-blog-post-detail-html\">templates/blog/post_detail.html</h3>\r\n\r\n<p>Use the&nbsp;<code>safe</code>&nbsp;filter in templates:</p>\r\n\r\n<pre>\r\n<code>&lt;p&gt;{{ post.body|safe }}&lt;/p&gt;</code></pre>', '', 'django-ckeditor-tutorial', 'published', '2020-09-23 08:36:08.909870', '2020-09-25 11:05:26.080117', 1);

-- --------------------------------------------------------

--
-- Table structure for table `calendar_app_event`
--

CREATE TABLE `calendar_app_event` (
  `id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `color` varchar(200) NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `calendar_app_event`
--

INSERT INTO `calendar_app_event` (`id`, `title`, `color`, `user_id`) VALUES
(1, 'workout', '#dddddd', 1),
(3, 'Lunch', '#28a745', 1),
(4, 'Go home', '#ffc107', 1),
(5, 'Do homework', '#17a2b8', 1),
(6, 'Sleep', '#dc3545', 1),
(7, 'Work on UI design', '#007bff', 1);

-- --------------------------------------------------------

--
-- Table structure for table `calendar_app_schedule`
--

CREATE TABLE `calendar_app_schedule` (
  `id` int NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `all_day` varchar(20) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `event_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-09-04 18:12:43.586198', '1', ' ', 1, '[{\"added\": {}}]', 7, 1),
(2, '2020-09-04 18:17:45.760185', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(3, '2020-09-04 18:18:24.883854', '2', 'etemkeskin@gmail.com', 1, '[{\"added\": {}}]', 4, 1),
(4, '2020-09-07 07:55:51.080986', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(5, '2020-09-07 07:58:00.045738', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(6, '2020-09-07 08:06:51.327265', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(7, '2020-09-07 08:08:22.145142', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(8, '2020-09-07 08:10:37.339762', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(9, '2020-09-07 08:11:49.080745', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(10, '2020-09-07 08:17:40.984075', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(11, '2020-09-07 08:25:24.489012', '1', 'Todo object (1)', 1, '[{\"added\": {}}]', 8, 1),
(12, '2020-09-07 08:25:41.069437', '2', 'Todo object (2)', 1, '[{\"added\": {}}]', 8, 1),
(13, '2020-09-09 11:06:43.931288', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Occupation\"]}}]', 7, 1),
(14, '2020-09-10 09:27:22.869032', '37', 'Calendar 1', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(15, '2020-09-12 18:03:19.612784', '1', 'Python', 1, '[{\"added\": {}}]', 10, 1),
(16, '2020-09-12 18:03:30.102898', '2', 'Javascript', 1, '[{\"added\": {}}]', 10, 1),
(17, '2020-09-12 18:04:51.262895', '3', 'PHP', 1, '[{\"added\": {}}]', 10, 1),
(18, '2020-09-12 18:06:14.231958', '1', 'Variables', 1, '[{\"added\": {}}]', 9, 1),
(19, '2020-09-12 18:06:30.116455', '2', 'Data Types', 1, '[{\"added\": {}}]', 9, 1),
(20, '2020-09-12 18:06:59.354909', '3', 'Numbers', 1, '[{\"added\": {}}]', 9, 1),
(21, '2020-09-12 18:07:17.173681', '4', 'Strings', 1, '[{\"added\": {}}]', 9, 1),
(22, '2020-09-12 18:07:39.299189', '5', 'Booleans', 1, '[{\"added\": {}}]', 9, 1),
(23, '2020-09-12 18:08:02.193315', '6', 'Operators', 1, '[{\"added\": {}}]', 9, 1),
(24, '2020-09-12 18:08:15.275166', '7', 'Lists', 1, '[{\"added\": {}}]', 9, 1),
(25, '2020-09-12 18:08:25.880850', '8', 'Variables', 1, '[{\"added\": {}}]', 9, 1),
(26, '2020-09-12 18:08:54.074695', '9', 'Data Types', 1, '[{\"added\": {}}]', 9, 1),
(27, '2020-09-12 18:09:24.224254', '10', 'Strings', 1, '[{\"added\": {}}]', 9, 1),
(28, '2020-09-12 18:16:27.473854', '1', 'What is a correct syntax to output \"Hello World\" in Python?', 1, '[{\"added\": {}}]', 11, 1),
(29, '2020-09-12 18:18:07.060069', '2', 'Which one is NOT a legal variable name?', 1, '[{\"added\": {}}]', 11, 1),
(30, '2020-09-12 18:19:28.922408', '2', 'Which one is NOT a legal variable name?', 2, '[{\"changed\": {\"fields\": [\"Answer\"]}}]', 11, 1),
(31, '2020-09-12 18:24:48.095934', '3', 'Which of the following are valid ways to specify the string literal foo\'bar in Python', 1, '[{\"added\": {}}]', 11, 1),
(32, '2020-09-19 19:14:19.509825', '1', 'Django Slug Tutorial', 1, '[{\"added\": {}}]', 14, 1),
(33, '2020-09-21 09:44:26.042964', '2', 'Veri Gorsel', 1, '[{\"added\": {}}]', 14, 1),
(34, '2020-09-21 09:46:52.033372', '3', 'Veri Gorsel', 1, '[{\"added\": {}}]', 14, 1),
(35, '2020-09-21 09:50:30.777489', '4', 'Veri Gorsel', 1, '[{\"added\": {}}]', 14, 1),
(36, '2020-09-21 17:42:41.386341', '1', 'Django Slug Tutorial', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 1),
(37, '2020-09-22 10:51:26.144916', '12', 'Dash ve Plotly ile Raporlama Ekranları Hazırlama', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Content\"]}}]', 14, 1),
(38, '2020-09-22 10:53:12.798556', '8', 'Deneme 4', 3, '', 14, 1),
(39, '2020-09-22 10:53:12.832590', '7', 'deneme 3', 3, '', 14, 1),
(40, '2020-09-22 10:53:12.834550', '5', 'Deneme 1', 3, '', 14, 1),
(41, '2020-09-22 10:53:12.838553', '4', 'Veri Gorsel', 3, '', 14, 1),
(42, '2020-09-22 10:53:12.841555', '2', 'Veri Gorsel', 3, '', 14, 1),
(43, '2020-09-23 19:19:26.196025', '1', 'Category object (1)', 1, '[{\"added\": {}}]', 16, 1),
(44, '2020-09-23 19:19:51.785002', '1', 'Category object (1)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 16, 1),
(45, '2020-09-23 19:20:06.226626', '1', 'Category object (1)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 16, 1),
(46, '2020-09-23 19:21:11.774830', '1', 'Printer', 2, '[]', 16, 1),
(47, '2020-09-23 19:21:19.135819', '2', 'Computer', 1, '[{\"added\": {}}]', 16, 1),
(48, '2020-09-23 19:21:30.364372', '3', 'Phone', 1, '[{\"added\": {}}]', 16, 1),
(49, '2020-09-23 19:21:45.807882', '4', 'Inkjet', 1, '[{\"added\": {}}]', 16, 1),
(50, '2020-09-23 19:22:01.359992', '4', 'Inkjet', 2, '[{\"changed\": {\"fields\": [\"Parent\"]}}]', 16, 1),
(51, '2020-09-23 19:22:14.202995', '5', 'Laser', 1, '[{\"added\": {}}]', 16, 1),
(52, '2020-09-23 19:22:26.415206', '6', 'Laptop', 1, '[{\"added\": {}}]', 16, 1),
(53, '2020-09-23 19:22:35.698450', '7', 'Tablet', 1, '[{\"added\": {}}]', 16, 1),
(54, '2020-09-23 19:23:02.234366', '8', 'Desktop', 1, '[{\"added\": {}}]', 16, 1),
(55, '2020-09-24 15:12:59.677865', '1', 'Lenovo Ideacentre A340 21.5-inch Full HD IPS All-in-One Desktop (10th Gen Intel Core i3/8GB/1TB HDD)', 1, '[{\"added\": {}}]', 19, 1),
(56, '2020-09-25 11:04:00.753159', '12', 'Dash ve Plotly ile Raporlama Ekranları Hazırlama', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(57, '2020-10-11 16:04:57.088301', '1', 'Samsung', 1, '[{\"added\": {}}]', 20, 1),
(58, '2020-10-11 16:05:17.413649', '2', 'Samsung', 1, '[{\"added\": {}}]', 20, 1),
(59, '2020-10-11 16:21:17.560190', '3', 'New Apple MacBook Pro (13-inch, 16GB RAM, 512GB SSD Storage, Magic Keyboard) - Space Gray', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 19, 1),
(60, '2020-10-11 16:45:04.263220', '3', 'New Apple MacBook Pro (13-inch, 16GB RAM, 512GB SSD Storage, Magic Keyboard) - Space Gray', 1, '[{\"added\": {}}]', 20, 1),
(61, '2020-10-11 16:45:18.678226', '4', 'New Apple MacBook Pro (13-inch, 16GB RAM, 512GB SSD Storage, Magic Keyboard) - Space Gray', 1, '[{\"added\": {}}]', 20, 1),
(62, '2020-10-11 16:45:30.408889', '5', 'New Apple MacBook Pro (13-inch, 16GB RAM, 512GB SSD Storage, Magic Keyboard) - Space Gray', 1, '[{\"added\": {}}]', 20, 1),
(63, '2020-10-20 18:04:58.240242', '1', 'Quiz object (1)', 1, '[{\"added\": {}}]', 12, 1),
(64, '2020-10-20 18:06:57.044413', '2', 'Php Basics', 1, '[{\"added\": {}}]', 12, 1),
(65, '2020-10-20 18:12:00.143444', '2', 'Php Basics', 2, '[{\"changed\": {\"fields\": [\"Quiz code\"]}}]', 12, 1),
(66, '2020-10-20 18:12:12.368110', '1', 'Python Basics', 2, '[{\"changed\": {\"fields\": [\"Quiz code\"]}}]', 12, 1),
(67, '2020-10-22 10:20:47.322362', '3', 'Which of the following are valid ways to specify the string literal foo\'bar in Python', 2, '[{\"changed\": {\"fields\": [\"Quiz\"]}}]', 11, 1),
(68, '2020-10-22 10:20:59.975168', '2', 'Which one is NOT a legal variable name?', 2, '[{\"changed\": {\"fields\": [\"Quiz\"]}}]', 11, 1),
(69, '2020-10-22 10:21:14.688926', '1', 'What is a correct syntax to output \"Hello World\" in Python?', 2, '[{\"changed\": {\"fields\": [\"Quiz\"]}}]', 11, 1),
(70, '2020-10-31 18:01:00.592936', '134', 'StudentExam object (134)', 3, '', 21, 1),
(71, '2020-10-31 18:01:00.606936', '133', 'StudentExam object (133)', 3, '', 21, 1),
(72, '2020-10-31 18:01:00.610935', '132', 'StudentExam object (132)', 3, '', 21, 1),
(73, '2020-10-31 18:01:00.623456', '131', 'StudentExam object (131)', 3, '', 21, 1),
(74, '2020-10-31 18:01:00.626456', '130', 'StudentExam object (130)', 3, '', 21, 1),
(75, '2020-10-31 18:01:00.631454', '129', 'StudentExam object (129)', 3, '', 21, 1),
(76, '2020-10-31 18:01:00.637455', '128', 'StudentExam object (128)', 3, '', 21, 1),
(77, '2020-10-31 18:01:00.642460', '127', 'StudentExam object (127)', 3, '', 21, 1),
(78, '2020-10-31 18:01:00.646455', '126', 'StudentExam object (126)', 3, '', 21, 1),
(79, '2020-10-31 18:01:00.652453', '125', 'StudentExam object (125)', 3, '', 21, 1),
(80, '2020-10-31 18:01:00.656454', '124', 'StudentExam object (124)', 3, '', 21, 1),
(81, '2020-10-31 18:01:00.661980', '123', 'StudentExam object (123)', 3, '', 21, 1),
(82, '2020-10-31 18:01:00.664979', '122', 'StudentExam object (122)', 3, '', 21, 1),
(83, '2020-10-31 18:01:00.671978', '121', 'StudentExam object (121)', 3, '', 21, 1),
(84, '2020-10-31 18:01:00.684976', '120', 'StudentExam object (120)', 3, '', 21, 1),
(85, '2020-10-31 18:01:00.689506', '119', 'StudentExam object (119)', 3, '', 21, 1),
(86, '2020-10-31 18:01:26.696985', '144', 'StudentExam object (144)', 3, '', 21, 1),
(87, '2020-10-31 18:01:26.702986', '143', 'StudentExam object (143)', 3, '', 21, 1),
(88, '2020-10-31 18:01:26.705986', '142', 'StudentExam object (142)', 3, '', 21, 1),
(89, '2020-10-31 18:01:26.708986', '141', 'StudentExam object (141)', 3, '', 21, 1),
(90, '2020-10-31 18:01:26.712985', '140', 'StudentExam object (140)', 3, '', 21, 1),
(91, '2020-10-31 18:01:26.715988', '139', 'StudentExam object (139)', 3, '', 21, 1),
(92, '2020-10-31 18:01:26.718984', '138', 'StudentExam object (138)', 3, '', 21, 1),
(93, '2020-10-31 18:01:26.721984', '137', 'StudentExam object (137)', 3, '', 21, 1),
(94, '2020-10-31 18:01:26.723983', '136', 'StudentExam object (136)', 3, '', 21, 1),
(95, '2020-10-31 18:01:26.725983', '135', 'StudentExam object (135)', 3, '', 21, 1),
(96, '2020-11-16 11:50:49.969081', '6', 'New Apple MacBook Pro (13-inch, 16GB RAM, 512GB SSD Storage, Magic Keyboard) - Space Gray', 1, '[{\"added\": {}}]', 20, 1),
(97, '2020-11-16 11:50:55.082764', '6', 'New Apple MacBook Pro (13-inch, 16GB RAM, 512GB SSD Storage, Magic Keyboard) - Space Gray', 2, '[]', 20, 1),
(98, '2020-11-16 11:51:07.886652', '7', 'New Apple MacBook Pro (13-inch, 16GB RAM, 512GB SSD Storage, Magic Keyboard) - Space Gray', 1, '[{\"added\": {}}]', 20, 1),
(99, '2020-11-25 12:28:39.804394', '1', 'Schedule object (1)', 3, '', 27, 1),
(100, '2020-11-25 12:55:07.679053', '1', 'Event object (1)', 1, '[{\"added\": {}}]', 26, 1),
(101, '2020-11-25 12:56:04.850216', '1', 'Schedule object (1)', 1, '[{\"added\": {}}]', 27, 1),
(102, '2020-11-25 12:56:28.151287', '1', 'Schedule object (1)', 2, '[{\"changed\": {\"fields\": [\"End date\"]}}]', 27, 1),
(103, '2020-11-25 12:57:37.597246', '1', 'workout', 2, '[{\"changed\": {\"fields\": [\"Color\"]}}]', 26, 1),
(104, '2020-11-25 17:42:16.715928', '3', 'Lunch', 1, '[{\"added\": {}}]', 26, 1),
(105, '2020-11-25 17:42:53.003887', '4', 'Go home', 1, '[{\"added\": {}}]', 26, 1),
(106, '2020-11-25 17:43:28.625086', '5', 'Do homework', 1, '[{\"added\": {}}]', 26, 1),
(107, '2020-11-25 17:43:54.347128', '6', 'Sleep', 1, '[{\"added\": {}}]', 26, 1),
(108, '2020-11-25 17:44:38.080420', '7', 'Work on UI design', 1, '[{\"added\": {}}]', 26, 1),
(109, '2020-11-25 18:56:53.400587', '2', 'Schedule object (2)', 1, '[{\"added\": {}}]', 27, 1),
(110, '2020-11-27 07:05:26.631277', '72', 'Schedule object (72)', 2, '[{\"changed\": {\"fields\": [\"Url\"]}}]', 27, 1),
(111, '2020-11-27 07:05:37.865523', '72', 'Schedule object (72)', 2, '[]', 27, 1),
(112, '2020-11-27 07:05:43.267851', '72', 'Schedule object (72)', 2, '[]', 27, 1),
(113, '2020-11-27 07:05:50.013495', '71', 'Schedule object (71)', 2, '[{\"changed\": {\"fields\": [\"Url\"]}}]', 27, 1),
(114, '2020-11-27 07:05:56.974232', '70', 'Schedule object (70)', 2, '[{\"changed\": {\"fields\": [\"Url\"]}}]', 27, 1),
(115, '2020-11-27 07:07:48.279100', '72', 'Schedule object (72)', 2, '[{\"changed\": {\"fields\": [\"All day\"]}}]', 27, 1),
(116, '2020-11-27 07:08:09.631142', '72', 'Schedule object (72)', 2, '[{\"changed\": {\"fields\": [\"All day\"]}}]', 27, 1),
(117, '2020-11-27 07:22:54.618607', '73', 'Schedule object (73)', 2, '[{\"changed\": {\"fields\": [\"All day\"]}}]', 27, 1),
(118, '2020-11-27 07:24:29.139343', '73', 'Schedule object (73)', 2, '[{\"changed\": {\"fields\": [\"All day\", \"Url\"]}}]', 27, 1),
(119, '2020-11-27 08:09:11.923174', '8', 'trial', 3, '', 26, 1),
(120, '2020-11-27 08:09:11.925178', '2', 'new event', 3, '', 26, 1),
(121, '2020-11-27 08:09:20.989968', '7', 'Work on UI design', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 26, 1),
(122, '2020-11-27 08:09:29.482494', '6', 'Sleep', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 26, 1),
(123, '2020-11-27 08:09:36.619887', '5', 'Do homework', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 26, 1),
(124, '2020-11-27 08:09:43.450727', '4', 'Go home', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 26, 1),
(125, '2020-11-27 08:09:51.787576', '3', 'Lunch', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 26, 1),
(126, '2020-11-27 08:10:00.038106', '3', 'Lunch', 2, '[]', 26, 1),
(127, '2020-11-27 08:10:21.878862', '1', 'workout', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 26, 1),
(128, '2020-12-03 10:41:19.229689', '154', 'StudentExam object (154)', 3, '', 21, 1),
(129, '2020-12-03 10:41:19.248693', '153', 'StudentExam object (153)', 3, '', 21, 1),
(130, '2020-12-03 10:41:19.249693', '152', 'StudentExam object (152)', 3, '', 21, 1),
(131, '2020-12-03 10:41:19.252690', '151', 'StudentExam object (151)', 3, '', 21, 1),
(132, '2020-12-03 10:41:19.255689', '150', 'StudentExam object (150)', 3, '', 21, 1),
(133, '2020-12-03 10:41:19.257687', '149', 'StudentExam object (149)', 3, '', 21, 1),
(134, '2020-12-03 10:41:19.258694', '148', 'StudentExam object (148)', 3, '', 21, 1),
(135, '2020-12-03 10:41:19.260693', '147', 'StudentExam object (147)', 3, '', 21, 1),
(136, '2020-12-03 10:41:19.261691', '146', 'StudentExam object (146)', 3, '', 21, 1),
(137, '2020-12-03 10:41:19.263690', '145', 'StudentExam object (145)', 3, '', 21, 1),
(138, '2021-01-06 08:49:34.569394', '1', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(139, '2021-01-06 08:50:27.371287', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(140, '2021-01-06 08:51:15.142759', '2', 'visitor', 1, '[{\"added\": {}}]', 3, 1),
(141, '2021-01-07 10:32:41.078297', '1', 'etemkeskin@yahoo.com', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(142, '2021-11-27 18:55:52.695891', '4', 'halil@halil.com', 3, '', 4, 1),
(143, '2021-11-27 18:56:35.168686', '16', 'Ev', 3, '', 14, 1),
(144, '2021-11-27 18:56:35.187873', '15', 'deneme56', 3, '', 14, 1),
(145, '2021-11-27 18:56:35.191863', '11', 'deneme 7', 3, '', 14, 1),
(146, '2021-11-27 18:56:35.195867', '10', 'deneme 6', 3, '', 14, 1),
(147, '2021-11-27 18:56:35.199866', '9', 'deneme 5', 3, '', 14, 1),
(148, '2021-11-27 18:56:35.203864', '3', 'Veri Gorsel', 3, '', 14, 1),
(149, '2021-11-27 18:58:03.347125', '12', 'Dash ve Plotly ile Raporlama Ekranları Hazırlama', 3, '', 14, 1),
(150, '2021-11-27 18:58:03.358077', '6', 'Deneme 2', 3, '', 14, 1),
(151, '2021-11-27 18:58:03.361826', '1', 'Django Slug Tutorial', 3, '', 14, 1),
(152, '2021-11-27 18:58:58.229054', '6', 'new', 3, '', 11, 1),
(153, '2021-11-27 18:58:58.248604', '5', 'deneme2', 3, '', 11, 1),
(154, '2021-11-27 19:00:25.005193', '4', 'JAVA', 2, '[{\"changed\": {\"fields\": [\"Quiz code\"]}}]', 12, 1),
(155, '2021-11-27 19:00:51.171308', '1', 'Python Basics 2', 2, '[{\"changed\": {\"fields\": [\"Quiz title\"]}}]', 12, 1),
(156, '2021-11-27 19:12:06.405384', '1', 'admin@admin.com', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(157, '2021-11-27 19:12:42.085301', '3', 'etem.keskin@datajarlabs.com', 3, '', 4, 1),
(158, '2021-11-27 19:12:42.098752', '2', 'etemkeskin@gmail.com', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'main', 'profile'),
(8, 'todo', 'todo'),
(9, 'quiz', 'topic'),
(10, 'quiz', 'subject'),
(11, 'quiz', 'question'),
(12, 'quiz', 'quiz'),
(13, 'quiz', 'questionsinquiz'),
(14, 'blog', 'post'),
(15, 'shop', 'shopcart'),
(16, 'shop', 'category'),
(17, 'shop', 'order'),
(18, 'shop', 'orderdetail'),
(19, 'shop', 'product'),
(20, 'shop', 'productgallery'),
(21, 'quiz', 'studentexam'),
(22, 'quiz', 'studentanswers'),
(23, 'django_plotly_dash', 'dashapp'),
(24, 'django_plotly_dash', 'statelessapp'),
(25, 'main', 'contact'),
(26, 'calendar_app', 'event'),
(27, 'calendar_app', 'schedule');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-09-03 12:21:38.266752'),
(2, 'auth', '0001_initial', '2020-09-03 12:21:38.871712'),
(3, 'admin', '0001_initial', '2020-09-03 12:21:39.504674'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-09-03 12:21:39.647678'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-03 12:21:39.691665'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-09-03 12:21:39.783657'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-09-03 12:21:39.830654'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-09-03 12:21:39.871652'),
(9, 'auth', '0004_alter_user_username_opts', '2020-09-03 12:21:39.883651'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-09-03 12:21:39.923649'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-09-03 12:21:39.927649'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-09-03 12:21:39.943651'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-09-03 12:21:39.983645'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-09-03 12:21:40.030643'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-09-03 12:21:40.070642'),
(16, 'auth', '0011_update_proxy_permissions', '2020-09-03 12:21:40.082640'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-09-03 12:21:40.124639'),
(18, 'sessions', '0001_initial', '2020-09-03 12:21:40.253629'),
(19, 'main', '0001_initial', '2020-09-04 18:11:25.697841'),
(20, 'todo', '0001_initial', '2020-09-07 08:24:01.507886'),
(21, 'main', '0002_profile_occupation', '2020-09-09 11:06:01.690469'),
(22, 'quiz', '0001_initial', '2020-09-12 18:00:10.027559'),
(23, 'quiz', '0002_quiz', '2020-09-15 18:47:34.605492'),
(24, 'quiz', '0003_auto_20200915_2226', '2020-09-15 19:26:48.550053'),
(25, 'blog', '0001_initial', '2020-09-19 18:58:53.148570'),
(26, 'blog', '0002_auto_20200921_1152', '2020-09-21 08:52:56.765806'),
(27, 'blog', '0003_auto_20200923_1133', '2020-09-23 08:33:33.137378'),
(28, 'shop', '0001_initial', '2020-09-23 19:03:30.642177'),
(29, 'shop', '0002_auto_20201008_2307', '2020-10-08 20:07:16.482560'),
(30, 'shop', '0003_productgallery', '2020-10-11 16:03:34.467408'),
(31, 'shop', '0004_product_short_description', '2020-10-11 16:11:45.626216'),
(32, 'shop', '0005_auto_20201013_2038', '2020-10-13 17:38:09.186937'),
(33, 'shop', '0006_auto_20201015_2035', '2020-10-15 17:35:57.528617'),
(34, 'quiz', '0004_auto_20201020_2022', '2020-10-20 17:23:01.772823'),
(35, 'quiz', '0005_auto_20201022_1316', '2020-10-22 10:17:02.799391'),
(36, 'quiz', '0006_auto_20201023_2111', '2020-10-23 18:11:44.289046'),
(37, 'quiz', '0007_auto_20201026_1059', '2020-10-26 07:59:30.150836'),
(38, 'quiz', '0008_auto_20201028_2236', '2020-10-28 19:36:58.475453'),
(39, 'quiz', '0009_studentanswers_result', '2020-10-30 11:43:05.912432'),
(40, 'django_plotly_dash', '0001_initial', '2020-11-02 13:26:10.092724'),
(41, 'django_plotly_dash', '0002_add_examples', '2020-11-02 13:26:10.192718'),
(42, 'main', '0003_contact', '2020-11-12 08:45:15.096211'),
(43, 'calendar_app', '0001_initial', '2020-11-25 10:17:00.332454'),
(44, 'main', '0004_auto_20201125_1315', '2020-11-25 10:17:00.853423'),
(45, 'calendar_app', '0002_auto_20201125_1343', '2020-11-25 10:43:33.452438'),
(46, 'calendar_app', '0003_remove_schedule_duration', '2020-11-25 11:35:30.478474'),
(47, 'calendar_app', '0004_auto_20201125_1534', '2020-11-25 12:52:19.977008'),
(48, 'calendar_app', '0005_auto_20201125_1535', '2020-11-25 12:52:20.443980'),
(49, 'calendar_app', '0006_event_schedule', '2020-11-25 12:52:20.856952'),
(50, 'calendar_app', '0007_auto_20201125_2119', '2020-11-25 18:19:58.011342'),
(51, 'calendar_app', '0008_auto_20201127_1000', '2020-11-27 07:01:07.353571'),
(52, 'calendar_app', '0009_event_user', '2020-11-27 08:08:11.541954'),
(53, 'quiz', '0010_auto_20201201_1418', '2020-12-01 11:19:07.850153');

-- --------------------------------------------------------

--
-- Table structure for table `django_plotly_dash_dashapp`
--

CREATE TABLE `django_plotly_dash_dashapp` (
  `id` int NOT NULL,
  `instance_name` varchar(100) NOT NULL,
  `slug` varchar(110) NOT NULL,
  `base_state` longtext NOT NULL,
  `creation` datetime(6) NOT NULL,
  `update` datetime(6) NOT NULL,
  `save_on_change` tinyint(1) NOT NULL,
  `stateless_app_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_plotly_dash_statelessapp`
--

CREATE TABLE `django_plotly_dash_statelessapp` (
  `id` int NOT NULL,
  `app_name` varchar(100) NOT NULL,
  `slug` varchar(110) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_plotly_dash_statelessapp`
--

INSERT INTO `django_plotly_dash_statelessapp` (`id`, `app_name`, `slug`) VALUES
(1, 'SimpleExample', 'simpleexample'),
(2, 'SimpleExample2', 'simpleexample2'),
(3, 'SimpleExample3', 'simpleexample3'),
(4, 'SimpleExample4', 'simpleexample4'),
(5, 'SimpleExample5', 'simpleexample5');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('fb6evzvzypamfqtt5cpamwez05pl91x8', '.eJxVjEEOwiAQRe_C2pACrYBL9z0DmRkGqRpISrsy3l1JutDtf-_9lwiwbznsjdewRHERSpx-NwR6cOkg3qHcqqRatnVB2RV50CbnGvl5Pdy_gwwtf2szmmQG5UF75zRYS9qhVuMEmKI9Kx-JbSJFPCmHZrCGLThNHnVvWLw_y3s3qQ:1kL2lq:quC713g-B5qcQsBsIHuGdo7p3TOxukVFsB63y6KVARY', '2020-10-07 11:17:10.177095'),
('c7y2keuanzv137bdbka0t9nwbrbfgp6t', '.eJxVjMEOwiAQRP-FsyGFFQGP3vsNZGEXqRqalPZk_Hdp0oPeJvPezFsE3NYStsZLmEhchRKn3y5ienLdAT2w3meZ5rouU5S7Ig_a5DgTv26H-3dQsJW-TpmRBuAEaM4Qs1aJesCLQnSDctqTTdEY1M6CIVSdeOuBPWTn0YvPF_6EN_8:1kev0N:5I8SrPL7yiKR0cMcEznJ7GT6ypP_TAYQ0AczG9oumSQ', '2020-12-01 07:02:19.377589'),
('2apau19kwpn6rqxa0pb5s6l7yyt29ubq', '.eJxVjMEOwiAQRP-FsyGFFQGP3vsNZGEXqRqalPZk_Hdp0oPeJvPezFsE3NYStsZLmEhchRKn3y5ienLdAT2w3meZ5rouU5S7Ig_a5DgTv26H-3dQsJW-TpmRBuAEaM4Qs1aJesCLQnSDctqTTdEY1M6CIVSdeOuBPWTn0YvPF_6EN_8:1kUXfz:QZzX5h_sBP3r7YUr_afcGWmJlUeyCouhvfZfjEO6kGE', '2020-11-02 16:06:23.242130'),
('ah2em7sze7cv7u7mi66awdufcwgqivos', '.eJxVjMEOwiAQRP-FsyGFFQGP3vsNZGEXqRqalPZk_Hdp0oPeJvPezFsE3NYStsZLmEhchRKn3y5ienLdAT2w3meZ5rouU5S7Ig_a5DgTv26H-3dQsJW-TpmRBuAEaM4Qs1aJesCLQnSDctqTTdEY1M6CIVSdeOuBPWTn0YvPF_6EN_8:1kl6z9:jk2c-4zBiYPlfc53BZsR2jPwHD2R7zZFaz7kJv7H8wQ', '2020-12-18 09:02:39.270601'),
('5th17fvmjpb852br9ppnqrhqkj4x3ubg', '.eJxVjMEOwiAQRP-FsyGFFQGP3vsNZGEXqRqalPZk_Hdp0oPeJvPezFsE3NYStsZLmEhchRKn3y5ienLdAT2w3meZ5rouU5S7Ig_a5DgTv26H-3dQsJW-TpmRBuAEaM4Qs1aJesCLQnSDctqTTdEY1M6CIVSdeOuBPWTn0YvPF_6EN_8:1kx4QB:WtEZP5L4e8cqC-HWNmNKT_psRAZwM7wfVgrYc3ztZNQ', '2021-01-20 08:43:59.067461'),
('w3mufn5t7jksgqioh7biuz47pygjrf89', '.eJxVjMEOwiAQRP-FsyGFFQGP3vsNZGEXqRqalPZk_Hdp0oPeJvPezFsE3NYStsZLmEhchRKn3y5ienLdAT2w3meZ5rouU5S7Ig_a5DgTv26H-3dQsJW-TpmRBuAEaM4Qs1aJesCLQnSDctqTTdEY1M6CIVSdeOuBPWTn0YvPF_6EN_8:1kzE2Y:pUfDmHCGdntygKuitndDnhGtgE-6RkfhAN3CLO35800', '2021-01-26 07:24:30.062043'),
('47orxbzmj9fuqqlzt34r356xeb07b3w2', '.eJxVjMEOwiAQRP-FsyGFFQGP3vsNZGEXqRqalPZk_Hdp0oPeJvPezFsE3NYStsZLmEhchRKn3y5ienLdAT2w3meZ5rouU5S7Ig_a5DgTv26H-3dQsJW-TpmRBuAEaM4Qs1aJesCLQnSDctqTTdEY1M6CIVSdeOuBPWTn0YvPF_6EN_8:1l6TTp:-PvYg-IT2s3COPiMwtxTQNPysMLnMt_xLuzQ_HEQk6I', '2021-02-15 07:18:37.730733'),
('2u6vubenig1pbc9wqawxcmkzaopp9cpo', '.eJxVjMEOwiAQRP-FsyGFFQGP3vsNZGEXqRqalPZk_Hdp0oPeJvPezFsE3NYStsZLmEhchRKn3y5ienLdAT2w3meZ5rouU5S7Ig_a5DgTv26H-3dQsJW-TpmRBuAEaM4Qs1aJesCLQnSDctqTTdEY1M6CIVSdeOuBPWTn0YvPF_6EN_8:1mP9Ly:LjC5PPXxNfmpzjGMAame2qmRAPMwNdg0hf8f60Gxmac', '2021-09-25 20:11:58.559080'),
('7ez42wzqufte55tjsnhlce85dfmz2szn', '.eJxVjDsOwjAQBe_iGlms_1DScwZr17vGAZRIcVIh7g6RUkD7Zua9VMZ1aXntMueB1VmBOvxuhOUh4wb4juNt0mUal3kgvSl6p11fJ5bnZXf_Dhr29q0tUbDJAfsIrpRoTMIklSHUBCyWA1aCZKN3VNB4Ce5kyJSjEFhvSL0_4u438w:1mr37G:lAyVZldJwH46N2bJl_iiomr-FHiw6-0_3-scfJxC1TA', '2021-12-11 19:12:06.428376');

-- --------------------------------------------------------

--
-- Table structure for table `main_contact`
--

CREATE TABLE `main_contact` (
  `id` int NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `main_contact`
--

INSERT INTO `main_contact` (`id`, `email`, `subject`, `message`) VALUES
(1, 'hakan@hakan.com', 'new member', 'jdjıugıdfgj'),
(2, 'etemkeskin@yahoo.com', 'dfg', 'dfgd'),
(3, 'etemkeskin@yahoo.com', 'new member', 'fghfgh'),
(4, 'etemkeskin@yahoo.com', 'rth', 'rth'),
(5, 'etemkeskin@yahoo.com', 'dfg', 'fff'),
(6, 'etemkeskin@yahoo.com', 'sdf', 'sdf'),
(7, 'etemkeskin@yahoo.com', 'new member', 'sdf');

-- --------------------------------------------------------

--
-- Table structure for table `main_profile`
--

CREATE TABLE `main_profile` (
  `id` int NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `occupation` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `main_profile`
--

INSERT INTO `main_profile` (`id`, `phone`, `address`, `city`, `country`, `image`, `user_id`, `occupation`) VALUES
(1, '05066350490', 'ilkyerleşim m. 25. sk k', 'California', 'Türkiye', 'pictures/2020/11/24/kedi.jpeg', 1, 'Electrical and Electronic Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question`
--

CREATE TABLE `quiz_question` (
  `id` int NOT NULL,
  `title` longtext,
  `image` varchar(255) DEFAULT NULL,
  `level` varchar(2) NOT NULL,
  `option_a` varchar(1000) DEFAULT NULL,
  `option_b` varchar(1000) DEFAULT NULL,
  `option_c` varchar(1000) DEFAULT NULL,
  `option_d` varchar(1000) DEFAULT NULL,
  `answer` varchar(2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `topic_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_question`
--

INSERT INTO `quiz_question` (`id`, `title`, `image`, `level`, `option_a`, `option_b`, `option_c`, `option_d`, `answer`, `created_at`, `updated_at`, `topic_id`) VALUES
(1, 'What is a correct syntax to output \"Hello World\" in Python?', '', 'L', 'echo \"Hello World\"', 'echo(\"Hello World\")', 'p(\"Hello World\")', 'print(\"Hello World\")', 'D', '2020-09-12 18:16:27.447857', '2020-10-22 10:21:14.677930', 10),
(2, 'Which one is NOT a legal variable name?', '', 'L', 'my-var', 'Myvar', '_myvar', 'my_var', 'A', '2020-09-12 18:18:07.040067', '2020-10-22 10:20:59.967168', 1),
(3, 'Which of the following are valid ways to specify the string literal foo\'bar in Python', '', 'L', '\'foo\'bar\'', '\"foo-\'bar\"', '\'foo\\\'bar\'', '\'foo\'\'bar\'', 'C', '2020-09-12 18:24:48.075940', '2020-10-22 10:20:47.308362', 2),
(7, '<p><code># Python code for &quot;Hello World&quot; </code></p>\r\n\r\n<p><code># nothing else to type...see how simple is the syntax. </code></p>\r\n\r\n<p><code>&nbsp;</code>&nbsp;</p>\r\n\r\n<p><code>print</code><code>(</code><code>&quot;Hello World&quot;</code><code>)</code></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><code>id</code></p>', '', 'M', 'sdg', 'sdf', 'sdf', 'sdf', 'A', '2020-12-01 11:33:38.349270', '2020-12-01 11:54:17.511703', 11);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question_quiz`
--

CREATE TABLE `quiz_question_quiz` (
  `id` int NOT NULL,
  `question_id` int NOT NULL,
  `quiz_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_question_quiz`
--

INSERT INTO `quiz_question_quiz` (`id`, `question_id`, `quiz_id`) VALUES
(1, 3, 1),
(2, 2, 1),
(3, 1, 1),
(6, 7, 4),
(7, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_quiz`
--

CREATE TABLE `quiz_quiz` (
  `id` int NOT NULL,
  `quiz_title` varchar(150) DEFAULT NULL,
  `quiz_note` varchar(500) DEFAULT NULL,
  `quiz_datetime` datetime(6) DEFAULT NULL,
  `quiz_duration` smallint UNSIGNED DEFAULT NULL,
  `marks_per_right_answer` decimal(4,2) DEFAULT NULL,
  `marks_per_wrong_answer` decimal(4,2) DEFAULT NULL,
  `quiz_status` tinyint(1) NOT NULL,
  `quiz_code` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_quiz`
--

INSERT INTO `quiz_quiz` (`id`, `quiz_title`, `quiz_note`, `quiz_datetime`, `quiz_duration`, `marks_per_right_answer`, `marks_per_wrong_answer`, `quiz_status`, `quiz_code`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Python Basics 2', 'new note', '2020-12-12 00:00:00.000000', 60, '1.00', '0.50', 0, 'PYT01', '2020-10-20 18:04:58.227243', '2021-11-27 19:00:51.157191', 1),
(2, 'Php Basics', NULL, '2020-10-20 18:06:25.000000', 50, '1.00', '0.20', 0, 'PHP01', '2020-10-20 18:06:57.040415', '2020-10-20 18:12:00.138445', 1),
(4, 'JAVA', 'vd', '2020-10-13 00:00:00.000000', 40, '4.00', '1.00', 0, 'java001', '2020-10-24 19:13:59.901302', '2021-11-27 19:00:25.000658', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_studentanswers`
--

CREATE TABLE `quiz_studentanswers` (
  `id` int NOT NULL,
  `answer` varchar(2) NOT NULL,
  `marks` decimal(4,2) DEFAULT NULL,
  `question_id` int NOT NULL,
  `studentexam_id` int NOT NULL,
  `result` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_studentanswers`
--

INSERT INTO `quiz_studentanswers` (`id`, `answer`, `marks`, `question_id`, `studentexam_id`, `result`) VALUES
(99, 'A', '1.00', 2, 166, 'CORRECT'),
(98, 'B', '0.50', 1, 166, 'WRONG'),
(97, '', '0.00', 7, 165, ''),
(94, '', '0.00', 3, 165, ''),
(93, '', '0.00', 2, 165, ''),
(92, '', '0.00', 1, 165, ''),
(89, '', '0.00', 3, 162, ''),
(88, '', '0.00', 2, 162, ''),
(87, '', '0.00', 1, 162, ''),
(84, '', '0.00', 3, 161, ''),
(83, '', '0.00', 2, 161, ''),
(82, '', '0.00', 1, 161, ''),
(81, '', '0.00', 2, 160, ''),
(80, 'B', '0.50', 1, 160, 'WRONG'),
(78, 'D', '0.50', 3, 159, 'WRONG'),
(77, 'A', '1.00', 2, 159, 'CORRECT'),
(100, 'B', '0.50', 3, 166, 'WRONG'),
(76, 'C', '0.50', 1, 159, 'WRONG'),
(71, 'B', '0.00', 3, 156, ''),
(72, 'B', '0.50', 1, 158, 'WRONG'),
(73, '', '0.00', 2, 158, ''),
(74, 'B', '0.50', 3, 158, 'WRONG'),
(103, 'D', '1.00', 1, 167, 'CORRECT'),
(104, 'C', '0.50', 2, 167, 'WRONG'),
(105, 'D', '0.50', 3, 167, 'WRONG');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_studentexam`
--

CREATE TABLE `quiz_studentexam` (
  `id` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quiz_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_studentexam`
--

INSERT INTO `quiz_studentexam` (`id`, `created_at`, `updated_at`, `quiz_id`, `user_id`) VALUES
(158, '2020-10-30 12:03:11.700530', '2020-10-30 12:03:11.700530', 1, 1),
(157, '2020-10-30 12:00:28.296584', '2020-10-30 12:00:28.296584', 1, 1),
(156, '2020-10-30 11:57:46.734990', '2020-10-30 11:57:46.734990', 1, 1),
(155, '2020-10-30 11:56:43.448667', '2020-10-30 11:56:43.448667', 1, 1),
(166, '2020-12-03 10:42:45.554719', '2020-12-03 10:42:45.554719', 1, 1),
(165, '2020-12-01 11:37:04.073644', '2020-12-01 11:37:04.073644', 1, 1),
(164, '2020-12-01 11:35:33.448113', '2020-12-01 11:35:33.448113', 4, 1),
(163, '2020-12-01 11:34:58.300645', '2020-12-01 11:34:58.300645', 4, 1),
(162, '2020-11-27 09:07:32.056284', '2020-11-27 09:07:32.056284', 1, 1),
(161, '2020-11-27 08:54:57.039698', '2020-11-27 08:54:57.039698', 1, 1),
(160, '2020-11-23 13:43:59.530093', '2020-11-23 13:43:59.530093', 1, 1),
(159, '2020-11-17 13:29:18.578019', '2020-11-17 13:29:18.578019', 1, 1),
(167, '2020-12-26 18:59:37.091544', '2020-12-26 18:59:37.091544', 1, 1),
(168, '2021-11-27 18:48:00.939722', '2021-11-27 18:48:00.939722', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_subject`
--

CREATE TABLE `quiz_subject` (
  `id` int NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_subject`
--

INSERT INTO `quiz_subject` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Python', '2020-09-12 18:03:19.609785', '2020-10-21 08:44:30.911517'),
(2, 'Javascript', '2020-09-12 18:03:30.084900', '2020-09-12 18:03:30.084900'),
(3, 'PHP', '2020-09-12 18:04:51.246925', '2020-09-12 18:04:51.246925'),
(4, 'JAVA', '2020-10-21 08:23:03.393269', '2020-10-21 08:23:03.393269'),
(5, 'Linux', '2020-10-21 08:24:11.890144', '2020-10-21 08:24:11.890144');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_topic`
--

CREATE TABLE `quiz_topic` (
  `id` int NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `subject_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_topic`
--

INSERT INTO `quiz_topic` (`id`, `title`, `created_at`, `updated_at`, `subject_id`) VALUES
(1, 'Variables', '2020-09-12 18:06:14.228957', '2020-10-21 10:17:43.021813', 2),
(2, 'Data Types', '2020-09-12 18:06:30.093457', '2020-09-12 18:06:30.093457', 1),
(3, 'Numbers', '2020-09-12 18:06:59.344906', '2020-09-12 18:06:59.344906', 1),
(4, 'Strings', '2020-09-12 18:07:17.151667', '2020-09-12 18:07:17.151667', 1),
(5, 'Booleans', '2020-09-12 18:07:39.271192', '2020-09-12 18:07:39.271192', 1),
(6, 'Operators', '2020-09-12 18:08:02.162794', '2020-09-12 18:08:02.162794', 1),
(7, 'Lists', '2020-09-12 18:08:15.262152', '2020-09-12 18:08:15.262152', 1),
(8, 'Variables', '2020-09-12 18:08:25.869851', '2020-09-12 18:08:25.869851', 3),
(9, 'Data Types', '2020-09-12 18:08:54.055695', '2020-09-12 18:08:54.055695', 3),
(10, 'Strings', '2020-09-12 18:09:24.206268', '2020-09-12 18:09:24.206268', 3),
(11, 'Variables', '2020-10-21 08:30:39.111925', '2020-10-21 08:30:39.111925', 4);

-- --------------------------------------------------------

--
-- Table structure for table `shop_category`
--

CREATE TABLE `shop_category` (
  `id` int NOT NULL,
  `title` varchar(250) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shop_category`
--

INSERT INTO `shop_category` (`id`, `title`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Printer', '2020-09-23 19:19:26.183021', '2020-09-23 19:21:11.771833', NULL),
(2, 'Computer', '2020-09-23 19:21:19.101820', '2020-09-23 19:21:19.101820', NULL),
(3, 'Phone', '2020-09-23 19:21:30.335375', '2020-09-23 19:21:30.336372', NULL),
(9, 'Printer', '2020-10-06 12:40:30.289929', '2020-10-06 12:40:30.289929', NULL),
(6, 'Laptop', '2020-09-23 19:22:26.412206', '2020-09-23 19:22:26.412206', 2),
(7, 'Tablet', '2020-09-23 19:22:35.654452', '2021-01-07 07:47:39.880216', 2),
(8, 'Desktop', '2020-09-23 19:23:02.231361', '2020-09-23 19:23:02.231361', 2),
(10, 'Laser', '2020-10-06 12:41:23.529933', '2020-10-06 12:41:23.529933', 1),
(11, 'Dotted', '2020-10-06 12:41:48.233603', '2020-10-06 12:41:48.233603', 1),
(12, 'Samsung', '2020-10-06 12:57:52.520216', '2020-10-06 12:57:52.521217', 3),
(13, 'Apple', '2020-10-06 15:19:45.372490', '2020-10-06 17:05:49.895292', 2),
(14, 'Appliances', '2021-01-07 07:46:59.234119', '2021-01-07 07:46:59.234119', NULL),
(15, 'Iron', '2021-01-07 07:47:22.396408', '2021-01-07 07:47:22.396408', 14);

-- --------------------------------------------------------

--
-- Table structure for table `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `company` varchar(150) DEFAULT NULL,
  `address` varchar(150) NOT NULL,
  `city` varchar(70) DEFAULT NULL,
  `country` varchar(2) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `total` double NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `note` longtext,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_orderdetail`
--

CREATE TABLE `shop_orderdetail` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_product`
--

CREATE TABLE `shop_product` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `discount_price` double DEFAULT NULL,
  `label` varchar(20) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `short_description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shop_product`
--

INSERT INTO `shop_product` (`id`, `title`, `code`, `description`, `price`, `image`, `discount_price`, `label`, `slug`, `created_at`, `updated_at`, `category_id`, `stock`, `short_description`) VALUES
(1, 'Lenovo Ideacentre A340 21.5-inch Full HD IPS All-in-One Desktop (10th Gen Intel Core i3/8GB/1TB HDD)', 'LNV01', 'Processor: 10th Generation Inter Core i3-10110U Processor, 2.1 GHz base speed, up to 4.1 GHz maximum speed, 2 Cores, 4MB Cache\r\nMemory and Storage: 8GB DDR4 RAM with integrated UHD graphics | Storage: 1TB HDD\r\nDisplay: 21.5-inch Full HD (1920x1080), Brightness: 250 nits, Anti-Glare Display | Wide Viewing Angle\r\nOperating System: Pre-Loaded Windows 10 Home with Lifetime Validity | In The Box: All-in-One, Wireless Keyboard, Wireless Mouse, User Manual\r\nPorts: 2 USB 3.1, 2 USB 2.0, Headphone/Mic combo jack (3.5mm), Ethernet (RJ-45), HDMI-out, Media card reader | With CD-Drive\r\nWarranty: 1 Year On-site Warranty', 500, 'pictures/2020/09/24/714WRfELS4L._SX679_.jpg', NULL, 'P', 'desktop', '2020-09-24 15:12:59.644867', '2020-10-11 18:29:18.191317', 8, 1, ''),
(2, 'Samsung', 'COM105', 'LCD Screen, SSD 250GB, DDR4, Nvidia', 750, 'pictures/2020/10/06/pexels-photo-188777.jpeg', NULL, 'new', 'samsung', '2020-10-06 17:54:31.256159', '2020-10-13 17:38:59.421804', 8, 1, ''),
(3, 'New Apple MacBook Pro (13-inch, 16GB RAM, 512GB SSD Storage, Magic Keyboard) - Space Gray', 'MAC13', 'Display\r\n\r\n13.3-inch (diagonal) LED-backlit Retina display with IPS technology; 2560-by-1600 native resolution at 227 pixels per inch with support for millions of colors, 16:10 aspect ratio\r\n\r\nProcessor\r\n\r\n2.0GHz quad-core 10th-generation Intel Core i5, Turbo Boost up to 3.8GHz, with 6MB shared L3 cache\r\n\r\nGraphics and Video Support\r\n\r\nIntel Iris Plus Graphics 645\r\n\r\nCharging and Expansion\r\n\r\nFour Thunderbolt 3 (USB-C) ports with support for: Charging, DisplayPort Thunderbolt (up to 40 Gbps), USB 3.1 Gen 2 (up to 10 Gbps)\r\n\r\nWireless\r\n\r\nWi-Fi; 802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible, Bluetooth 5.0 wireless technology\r\n\r\nIn the Box\r\n\r\n13-inch MacBook Pro, 61W USB-C Power Adapter, USB-C Charge Cable (2 m)', 650, 'pictures/2020/10/11/mac1.webp', 450, 'P', 'macbook', '2020-10-11 16:19:28.277447', '2020-10-11 16:21:17.538191', 8, 1, 'Tenth-generation quad-core Intel Core i5 processor\r\nBrilliant Retina display with True Tone technology\r\nBacklit Magic Keyboard\r\nTouch Bar and Touch ID\r\nIntel Iris Plus Graphics\r\nUltrafast SSD\r\nFour Thunderbolt 3 (USB-C) ports\r\nUp to 10 hours of battery life\r\n802.11ac Wi-Fi\r\nForce Touch trackpad'),
(4, 'Apple iPhone XR, 64GB, Black - Fully Unlocked', 'PHO74', 'About this item\r\nFully unlocked and compatible with any carrier of choice (e.g. AT&T, T-Mobile, Sprint, Verizon, US-Cellular, Cricket, Metro, etc.).\r\nThe device does not come with headphones or a SIM card. It does include a charger and charging cable that may be generic, in which case it will be UL or Mfi (Made for iPhone) Certified.\r\nInspected and guaranteed to have minimal cosmetic damage, which is not noticeable when the device is held at arms length.\r\nSuccessfully passed a full diagnostic test which ensures like-new functionality and removal of any prior-user personal information.\r\nTested for battery health and guaranteed to have a minimum battery capacity of 80%.', 800, 'pictures/2020/10/12/phone1.jpg', 750, 'free_shipping', 'apple-iphone-xr-64gb-black-fully-unlocked', '2020-10-12 08:06:29.642968', '2020-10-13 17:38:42.306364', 3, 1, 'Product works and looks like new. Backed by the 90-day Amazon Renewed Guarantee.\r\n- This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.\r\n- There will be no visible cosmetic imperfections when held at an arm’s length.\r\n- This product will have a battery which exceeds 80% capacity relative to new.\r\n- Accessories may not be original, but will be compatible and fully functional. Product may come in generic Box.\r\n- This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied under the Amazon Renewed Guarantee.');

-- --------------------------------------------------------

--
-- Table structure for table `shop_productgallery`
--

CREATE TABLE `shop_productgallery` (
  `id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shop_productgallery`
--

INSERT INTO `shop_productgallery` (`id`, `image`, `product_id`) VALUES
(1, 'pictures/2020/10/11/data-science.jpg', 2),
(2, 'pictures/2020/10/11/photo_1766_20120509.jpg', 2),
(3, 'pictures/2020/10/11/mac2.jpg', 3),
(4, 'pictures/2020/10/11/mac3.jpg', 3),
(5, 'pictures/2020/10/11/mac4.jpg', 3),
(6, 'pictures/2020/11/16/kartal.jpg', 3),
(10, 'pictures/2020/11/16/GunZgV.jpeg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `shop_shopcart`
--

CREATE TABLE `shop_shopcart` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shop_shopcart`
--

INSERT INTO `shop_shopcart` (`id`, `quantity`, `product_id`, `user_id`) VALUES
(1, 1, 2, 1),
(7, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `todo_todo`
--

CREATE TABLE `todo_todo` (
  `id` int NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `todo_todo`
--

INSERT INTO `todo_todo` (`id`, `description`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Login Page', 1, '2020-09-07 08:25:24.486042', '2020-09-08 12:50:48.939365', 1),
(2, 'Logout', 1, '2020-09-07 08:25:41.067437', '2020-09-08 12:48:43.334920', 1),
(3, 'CK editor integration', 1, '2020-09-07 11:15:45.433569', '2020-09-24 10:15:39.720426', 1),
(4, 'Logging System', 0, '2020-09-07 11:15:58.366095', '2020-09-08 12:51:18.523630', 1),
(5, 'Ajax request system', 0, '2020-09-07 11:16:13.526263', '2020-09-08 12:51:20.644500', 1),
(6, 'Alert system ajax', 1, '2020-09-07 11:16:27.141850', '2020-11-04 09:45:03.667306', 1),
(7, 'Context Processors', 1, '2020-09-07 11:16:44.366098', '2020-10-11 18:33:14.266447', 1),
(8, 'Password Reset', 1, '2020-09-07 11:16:56.838709', '2020-11-14 18:30:27.370771', 1),
(9, 'Password Activation Mail', 1, '2020-09-07 11:17:18.132641', '2020-10-30 09:16:19.772720', 1),
(10, 'Django Signal', 1, '2020-09-07 11:17:38.245330', '2020-10-11 18:33:09.891931', 1),
(11, 'Pdf report', 0, '2020-09-07 11:17:54.994511', '2020-09-07 11:17:54.994511', 1),
(12, 'Django Filtering', 1, '2020-09-07 11:18:12.916623', '2020-10-11 18:54:44.710907', 1),
(13, 'Django Pagination', 1, '2020-09-07 11:18:25.106138', '2020-09-08 12:52:13.490274', 1),
(14, 'Django Messaging', 0, '2020-09-07 11:18:38.321921', '2020-09-07 12:52:18.494686', 1),
(15, 'Django Mail Template  ', 0, '2020-09-07 11:19:10.532540', '2020-09-07 11:19:10.532540', 1),
(16, 'Django Searching', 0, '2020-09-07 11:19:24.423067', '2020-09-07 11:19:24.423067', 1),
(17, 'Blog system', 1, '2020-09-07 12:34:27.724057', '2020-10-11 18:33:03.598903', 1),
(18, 'Url slug type', 1, '2020-09-07 12:36:02.564880', '2020-10-11 18:34:46.800419', 1),
(19, 'Chart, graphs', 0, '2020-09-07 12:37:09.478857', '2020-09-07 12:37:09.478857', 1),
(20, 'Shopping Cart', 1, '2020-09-07 12:45:55.685199', '2020-10-11 18:54:35.261410', 1),
(21, 'Stripe ', 0, '2020-09-07 12:47:35.859480', '2020-09-07 19:33:07.799877', 1),
(22, 'Corona Dashboard', 0, '2020-09-07 12:48:47.052411', '2020-09-07 19:33:30.489510', 1),
(23, 'Django Forms', 1, '2020-09-07 12:48:58.033900', '2020-10-11 18:33:28.748502', 1),
(32, 'Authorisation', 1, '2020-09-08 12:52:49.830086', '2020-11-24 13:27:50.416670', 1),
(24, 'Appplication Settings', 0, '2020-09-07 19:34:50.291738', '2020-09-07 19:34:50.292739', 1),
(25, 'Profile Page', 1, '2020-09-07 19:35:17.500070', '2020-10-13 15:24:36.775006', 1),
(26, 'Signup Page', 1, '2020-09-07 19:36:16.248640', '2020-10-12 15:04:56.005580', 1),
(27, '404 page', 1, '2020-09-07 19:36:24.217626', '2020-09-09 14:33:54.173229', 1),
(28, 'Todo page bugs\r\n', 0, '2020-09-08 12:21:08.590516', '2020-09-08 12:55:35.134138', 1),
(29, 'Class Based CRUD processes\r\n', 0, '2020-09-08 12:23:15.015906', '2020-09-08 12:53:29.692704', 1),
(30, 'Quiz System\r\n', 1, '2020-09-08 12:23:48.690896', '2020-10-30 09:17:19.252064', 1),
(31, 'Create requirements.txt\r\n', 1, '2020-09-08 12:24:27.581542', '2020-11-14 18:31:01.634260', 1),
(33, 'Alert Notification', 1, '2020-09-08 12:53:09.104926', '2020-09-10 09:32:21.089409', 1),
(34, 'React App', 0, '2020-09-08 12:53:59.845870', '2020-09-24 09:50:27.374720', 1),
(35, 'Rest Api', 0, '2020-09-08 12:54:52.268718', '2020-09-09 08:08:18.638556', 1),
(36, 'Image Uploading', 1, '2020-09-08 13:54:04.087822', '2020-09-08 13:54:09.494464', 1),
(37, 'Calendar ', 0, '2020-09-09 08:08:35.053336', '2020-09-10 09:31:44.239669', 1),
(38, 'Django Email for username', 0, '2020-09-09 08:09:51.590762', '2020-09-09 08:10:05.523447', 1),
(39, 'Password Update', 1, '2020-09-09 11:37:46.736066', '2020-10-30 09:16:44.379407', 1),
(40, 'DataTable.js integration', 1, '2020-09-10 14:11:41.919193', '2020-10-30 09:16:43.027835', 1),
(41, 'Dash report\r\n', 0, '2020-09-19 17:34:19.981900', '2020-09-19 17:34:19.981900', 1),
(43, '1-) product create auto slug adding table', 1, '2020-10-11 18:34:31.675072', '2020-10-12 08:07:05.247579', 1),
(44, '2) product gallery creation', 1, '2020-10-11 18:36:11.389835', '2020-11-24 13:27:41.636515', 1),
(45, '3-) product add category select', 0, '2020-10-11 18:36:51.011717', '2020-10-11 18:36:51.011717', 1),
(46, '4) checkout page', 1, '2020-10-11 18:37:16.278265', '2020-10-30 09:16:32.328089', 1),
(47, '5-) country list in chekout page', 1, '2020-10-11 18:37:51.011322', '2020-10-30 09:15:57.430954', 1),
(48, '6-) discount price add', 1, '2020-10-11 18:38:50.404225', '2020-10-12 09:30:52.692869', 1),
(49, '7-) product badge(sale, new)', 1, '2020-10-11 18:39:21.266829', '2020-10-13 17:49:06.555975', 1),
(50, 'change password', 1, '2020-10-13 15:25:16.268041', '2020-10-13 15:25:29.733201', 1),
(55, 'Logo', 1, '2020-11-14 14:21:42.835875', '2020-11-14 14:21:45.230728', 1),
(54, 'Contact Page', 1, '2020-11-14 14:21:27.737820', '2020-11-14 14:21:34.225427', 1),
(56, 'Alert color and style', 1, '2020-11-14 14:22:03.595603', '2020-11-14 14:22:05.859446', 1),
(57, 'Google Analytics', 1, '2020-11-14 14:22:21.719464', '2020-11-14 14:22:23.407360', 1),
(58, 'google recaptcha', 1, '2020-11-14 14:22:43.244167', '2020-11-14 14:22:45.821004', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  ADD KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  ADD KEY `auth_user_groups_group_id_97559544` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  ADD KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `blog_post_user_id_710cc4d2` (`user_id`);

--
-- Indexes for table `calendar_app_event`
--
ALTER TABLE `calendar_app_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendar_app_event_user_id_4b6d67ff` (`user_id`);

--
-- Indexes for table `calendar_app_schedule`
--
ALTER TABLE `calendar_app_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendar_app_schedule_title_id_4b2d6f58` (`event_id`),
  ADD KEY `calendar_app_schedule_user_id_da1a0155` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_plotly_dash_dashapp`
--
ALTER TABLE `django_plotly_dash_dashapp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `instance_name` (`instance_name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `django_plotly_dash_dashapp_stateless_app_id_220444de` (`stateless_app_id`);

--
-- Indexes for table `django_plotly_dash_statelessapp`
--
ALTER TABLE `django_plotly_dash_statelessapp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_name` (`app_name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_contact`
--
ALTER TABLE `main_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_profile`
--
ALTER TABLE `main_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_question_topic_id_60c95c20` (`topic_id`);

--
-- Indexes for table `quiz_question_quiz`
--
ALTER TABLE `quiz_question_quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quiz_question_quiz_question_id_quiz_id_3414207a_uniq` (`question_id`,`quiz_id`),
  ADD KEY `quiz_question_quiz_question_id_2b2637b3` (`question_id`),
  ADD KEY `quiz_question_quiz_quiz_id_eccb418d` (`quiz_id`);

--
-- Indexes for table `quiz_quiz`
--
ALTER TABLE `quiz_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_quiz_user_id_ac77e40e` (`user_id`);

--
-- Indexes for table `quiz_studentanswers`
--
ALTER TABLE `quiz_studentanswers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_studentanswers_question_id_4eac62ff` (`question_id`),
  ADD KEY `quiz_studentanswers_studentexam_id_b6c48dd1` (`studentexam_id`);

--
-- Indexes for table `quiz_studentexam`
--
ALTER TABLE `quiz_studentexam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_studentexam_quiz_id_27f5dc77` (`quiz_id`),
  ADD KEY `quiz_studentexam_user_id_caecb613` (`user_id`);

--
-- Indexes for table `quiz_subject`
--
ALTER TABLE `quiz_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_topic`
--
ALTER TABLE `quiz_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_topic_topic_id_760b5d69` (`subject_id`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_category_parent_id_901626c9` (`parent_id`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_order_user_id_00aba627` (`user_id`);

--
-- Indexes for table `shop_orderdetail`
--
ALTER TABLE `shop_orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_orderdetail_order_id_80ad38f0` (`order_id`),
  ADD KEY `shop_orderdetail_product_id_c1f13554` (`product_id`),
  ADD KEY `shop_orderdetail_user_id_62930a2f` (`user_id`);

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `shop_product_category_id_14d7eea8` (`category_id`);

--
-- Indexes for table `shop_productgallery`
--
ALTER TABLE `shop_productgallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_productgallery_product_id_8618fa6b` (`product_id`);

--
-- Indexes for table `shop_shopcart`
--
ALTER TABLE `shop_shopcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_shopcart_product_id_bdeff15c` (`product_id`),
  ADD KEY `shop_shopcart_user_id_8bdec93b` (`user_id`);

--
-- Indexes for table `todo_todo`
--
ALTER TABLE `todo_todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `todo_todo_user_id_6d8f07e8` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `calendar_app_event`
--
ALTER TABLE `calendar_app_event`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `calendar_app_schedule`
--
ALTER TABLE `calendar_app_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `django_plotly_dash_dashapp`
--
ALTER TABLE `django_plotly_dash_dashapp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_plotly_dash_statelessapp`
--
ALTER TABLE `django_plotly_dash_statelessapp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `main_contact`
--
ALTER TABLE `main_contact`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `main_profile`
--
ALTER TABLE `main_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quiz_question`
--
ALTER TABLE `quiz_question`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quiz_question_quiz`
--
ALTER TABLE `quiz_question_quiz`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quiz_quiz`
--
ALTER TABLE `quiz_quiz`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quiz_studentanswers`
--
ALTER TABLE `quiz_studentanswers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `quiz_studentexam`
--
ALTER TABLE `quiz_studentexam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `quiz_subject`
--
ALTER TABLE `quiz_subject`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quiz_topic`
--
ALTER TABLE `quiz_topic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_orderdetail`
--
ALTER TABLE `shop_orderdetail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shop_productgallery`
--
ALTER TABLE `shop_productgallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shop_shopcart`
--
ALTER TABLE `shop_shopcart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `todo_todo`
--
ALTER TABLE `todo_todo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
