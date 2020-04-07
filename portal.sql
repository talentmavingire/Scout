-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 11, 2019 at 10:04 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add company account', 1, 'add_companyaccount'),
(2, 'Can change company account', 1, 'change_companyaccount'),
(3, 'Can delete company account', 1, 'delete_companyaccount'),
(4, 'Can view company account', 1, 'view_companyaccount'),
(5, 'Can add company type', 2, 'add_companytype'),
(6, 'Can change company type', 2, 'change_companytype'),
(7, 'Can delete company type', 2, 'delete_companytype'),
(8, 'Can view company type', 2, 'view_companytype'),
(9, 'Can add skill set', 3, 'add_skillset'),
(10, 'Can change skill set', 3, 'change_skillset'),
(11, 'Can delete skill set', 3, 'delete_skillset'),
(12, 'Can view skill set', 3, 'view_skillset'),
(13, 'Can add post', 4, 'add_post'),
(14, 'Can change post', 4, 'change_post'),
(15, 'Can delete post', 4, 'delete_post'),
(16, 'Can view post', 4, 'view_post'),
(17, 'Can add job post skill set', 5, 'add_jobpostskillset'),
(18, 'Can change job post skill set', 5, 'change_jobpostskillset'),
(19, 'Can delete job post skill set', 5, 'delete_jobpostskillset'),
(20, 'Can view job post skill set', 5, 'view_jobpostskillset'),
(21, 'Can add job post activity', 6, 'add_jobpostactivity'),
(22, 'Can change job post activity', 6, 'change_jobpostactivity'),
(23, 'Can delete job post activity', 6, 'delete_jobpostactivity'),
(24, 'Can view job post activity', 6, 'view_jobpostactivity'),
(25, 'Can add company profile', 7, 'add_companyprofile'),
(26, 'Can change company profile', 7, 'change_companyprofile'),
(27, 'Can delete company profile', 7, 'delete_companyprofile'),
(28, 'Can view company profile', 7, 'view_companyprofile'),
(29, 'Can add account', 8, 'add_account'),
(30, 'Can change account', 8, 'change_account'),
(31, 'Can delete account', 8, 'delete_account'),
(32, 'Can view account', 8, 'view_account'),
(33, 'Can add seeker skill set', 9, 'add_seekerskillset'),
(34, 'Can change seeker skill set', 9, 'change_seekerskillset'),
(35, 'Can delete seeker skill set', 9, 'delete_seekerskillset'),
(36, 'Can view seeker skill set', 9, 'view_seekerskillset'),
(37, 'Can add profile', 10, 'add_profile'),
(38, 'Can change profile', 10, 'change_profile'),
(39, 'Can delete profile', 10, 'delete_profile'),
(40, 'Can view profile', 10, 'view_profile'),
(41, 'Can add experience', 11, 'add_experience'),
(42, 'Can change experience', 11, 'change_experience'),
(43, 'Can delete experience', 11, 'delete_experience'),
(44, 'Can view experience', 11, 'view_experience'),
(45, 'Can add education', 12, 'add_education'),
(46, 'Can change education', 12, 'change_education'),
(47, 'Can delete education', 12, 'delete_education'),
(48, 'Can view education', 12, 'view_education'),
(49, 'Can add log entry', 13, 'add_logentry'),
(50, 'Can change log entry', 13, 'change_logentry'),
(51, 'Can delete log entry', 13, 'delete_logentry'),
(52, 'Can view log entry', 13, 'view_logentry'),
(53, 'Can add permission', 14, 'add_permission'),
(54, 'Can change permission', 14, 'change_permission'),
(55, 'Can delete permission', 14, 'delete_permission'),
(56, 'Can view permission', 14, 'view_permission'),
(57, 'Can add group', 15, 'add_group'),
(58, 'Can change group', 15, 'change_group'),
(59, 'Can delete group', 15, 'delete_group'),
(60, 'Can view group', 15, 'view_group'),
(61, 'Can add user', 16, 'add_user'),
(62, 'Can change user', 16, 'change_user'),
(63, 'Can delete user', 16, 'delete_user'),
(64, 'Can view user', 16, 'view_user'),
(65, 'Can add content type', 17, 'add_contenttype'),
(66, 'Can change content type', 17, 'change_contenttype'),
(67, 'Can delete content type', 17, 'delete_contenttype'),
(68, 'Can view content type', 17, 'view_contenttype'),
(69, 'Can add session', 18, 'add_session'),
(70, 'Can change session', 18, 'change_session'),
(71, 'Can delete session', 18, 'delete_session'),
(72, 'Can view session', 18, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$pQdMPTmbvvym$9ACLJwUgEzSiMAM62nkSCWMJCoJ3Tpv5RSjqCa/8cn0=', '2019-11-11 09:46:04.339677', 1, 'PaulTest', '', '', '16511111003@stu.wzu.edu.cn', 1, 1, '2019-11-07 16:31:51.314040'),
(2, 'pbkdf2_sha256$150000$gmkSFEEtNNnD$AJLplpaKjIvx2BnfoyyaZyjKNHP4HCiBZsY6zPE4rw0=', '2019-11-07 18:00:48.081465', 0, 'Talent', '', '', 'mavingiretalent@gmail.com', 0, 1, '2019-11-07 16:49:38.294701'),
(4, 'pbkdf2_sha256$150000$EVxxPfM7TV3T$I5rplFbn1xjN+LKFc/vSM0nBIutqbhTkMS4uCoE7szA=', NULL, 0, 'Mabasa', '', '', '', 0, 1, '2019-11-07 16:51:47.000000'),
(5, 'pbkdf2_sha256$150000$BVnwbxpuIJXy$896D3TAMqONeXh7D9xLLWUe4IdU5EzRs2kSd4GD7txQ=', NULL, 0, 'Philemon', '', '', '', 0, 1, '2019-11-07 16:52:33.926891'),
(10, 'pbkdf2_sha256$150000$g1gCB6FgSS1l$PvcEtf7YUFSRvePhrZyk+SNAH23vx8B7SEw0gGeEjco=', NULL, 0, 'Rutendo', 'Rutendo', 'Mavingire', 'rutendo@gmail.com', 0, 1, '2019-11-11 04:41:39.658274'),
(11, 'pbkdf2_sha256$150000$8qu0mlkcly9y$OMVdNs9Ff5/0VIQMb009nw0AECFyXgTFD+bwoCYljXg=', NULL, 0, 'TestUser1', '', '', '', 0, 1, '2019-11-11 09:46:44.200016');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_companyaccount`
--

DROP TABLE IF EXISTS `dashboard_companyaccount`;
CREATE TABLE IF NOT EXISTS `dashboard_companyaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `profile_description` longtext NOT NULL,
  `date_established` datetime(6) NOT NULL,
  `company_website_url` longtext NOT NULL,
  `company_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_companyaccount_company_type_id_9292d76d` (`company_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dashboard_companyaccount`
--

INSERT INTO `dashboard_companyaccount` (`id`, `company_name`, `profile_description`, `date_established`, `company_website_url`, `company_type_id`) VALUES
(1, 'Google', 'Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, search engine, cloud computing, software, and hardware. It is considered one of the Big Four technology companies, alongside Amazon, Apple, and Facebook.', '1998-09-01 16:38:20.000000', 'http://www.google.com/', 1),
(2, 'Twitter', 'Twitter is an American microblogging and social networking service on which users post and interact with messages known as \"tweets\". Tweets were originally restricted to 140 characters, but on November 7, 2017, this limit was doubled to 280 for all languages except Chinese, Japanese, and Korean. Registered users can post, like, and retweet tweets, but unregistered users can only read them. Users access Twitter through its website interface, through Short Message Service or its mobile-device application software. Twitter, Inc. is based in San Francisco, California, and has more than 25 offices around the world.', '2006-03-21 16:39:44.000000', 'https://twitter.com/', 2),
(3, 'PricewaterhouseCoopers', 'PricewaterhouseCoopers is a multinational professional services network with headquarters in London, United Kingdom. PwC ranks as the second largest professional services firm in the world and is one of the Big Four auditors, along with Deloitte, EY and KPMG.', '1996-11-11 16:41:10.000000', 'http://www.pwc.com/', 3),
(4, 'Facebook', 'Facebook, Inc. is an American online social media and social networking service company based in Menlo Park, California. It was founded by Mark Zuckerberg, along with fellow Harvard College students and roommates Eduardo Saverin, Andrew McCollum, Dustin Moskovitz and Chris Hughes. It is considered one of the Big Four technology companies along with Amazon, Apple, and Google', '2004-02-04 16:41:59.000000', 'https://www.facebook.com/', 2),
(5, 'Baidu', 'Baidu, Inc. is a Chinese multinational technology company specializing in Internet-related services and products and artificial intelligence, headquartered in Beijing\'s Haidian District. It is one of the largest AI and internet companies in the world. The holding company of the group is incorporated in the Cayman Islands. Baidu was incorporated in January 2000 by Robin Li and Eric Xu. The Baidu search engine is currently the fourth largest website in the Alexa Internet rankings. Baidu has origins in RankDex, an earlier search engine developed by Robin Li in 1996, before he founded Baidu in 2000.', '2000-01-01 16:43:01.000000', 'http://www.baidu.com/', 1),
(6, 'Alibaba', 'Alibaba Group Holding Limited is a Chinese multinational conglomerate holding company specializing in e-commerce, retail, Internet, and technology. Founded on 4 April 1999 in Hangzhou, Zhejiang, the company provides consumer-to-consumer, business-to-consumer, and business-to-business sales services via web portals, as well as electronic payment services, shopping search engines and cloud computing services. It owns and operates a diverse array of businesses around the world in numerous sectors, and is named as one of the world\'s most admired companies by Fortune.', '1999-01-12 16:44:00.000000', 'http://www.alibabagroup.com/', 4);

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_companyprofile`
--

DROP TABLE IF EXISTS `dashboard_companyprofile`;
CREATE TABLE IF NOT EXISTS `dashboard_companyprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_image` varchar(100) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id` (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dashboard_companyprofile`
--

INSERT INTO `dashboard_companyprofile` (`id`, `company_image`, `company_id`) VALUES
(1, 'profile_pics/google_4ZLC85Y.jpg', 1),
(2, 'profile_pics/twitter_UDhAkJo.jpg', 2),
(3, 'profile_pics/pwc_NYHQSvE.jpg', 3),
(4, 'profile_pics/facebook.jpg', 4),
(5, 'profile_pics/baidu.jpg', 5),
(6, 'profile_pics/alibaba.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_companytype`
--

DROP TABLE IF EXISTS `dashboard_companytype`;
CREATE TABLE IF NOT EXISTS `dashboard_companytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dashboard_companytype`
--

INSERT INTO `dashboard_companytype` (`id`, `company_type_name`) VALUES
(1, 'Multinational Technology Company'),
(2, 'Social Networking Service'),
(3, 'Professional Services Network'),
(4, 'Holding Company');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_jobpostactivity`
--

DROP TABLE IF EXISTS `dashboard_jobpostactivity`;
CREATE TABLE IF NOT EXISTS `dashboard_jobpostactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_date` datetime(6) NOT NULL,
  `job_post_id` int(11) NOT NULL,
  `user_account_id` int(11) NOT NULL,
  `notify_closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_jobpostactivity_job_post_id_8acb8a51` (`job_post_id`),
  KEY `dashboard_jobpostactivity_user_account_id_83dfe8fe` (`user_account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dashboard_jobpostactivity`
--

INSERT INTO `dashboard_jobpostactivity` (`id`, `apply_date`, `job_post_id`, `user_account_id`, `notify_closed`) VALUES
(1, '2019-11-11 09:52:51.000000', 12, 1, 1),
(2, '2019-11-11 09:55:29.000000', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_jobpostskillset`
--

DROP TABLE IF EXISTS `dashboard_jobpostskillset`;
CREATE TABLE IF NOT EXISTS `dashboard_jobpostskillset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_level` int(10) UNSIGNED NOT NULL,
  `job_post_id` int(11) NOT NULL,
  `skill_set_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_jobpostskillset_job_post_id_2fa579e7` (`job_post_id`),
  KEY `dashboard_jobpostskillset_skill_set_id_8aedfd0d` (`skill_set_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_post`
--

DROP TABLE IF EXISTS `dashboard_post`;
CREATE TABLE IF NOT EXISTS `dashboard_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(50) NOT NULL,
  `is_company_name_hidden` tinyint(1) NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `job_description` longtext NOT NULL,
  `street_address` varchar(100) NOT NULL,
  `job_city` varchar(50) NOT NULL,
  `job_state` varchar(50) NOT NULL,
  `job_country` varchar(50) NOT NULL,
  `job_zip` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `company_id` int(11) NOT NULL,
  `posted_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_post_company_id_e35039e5` (`company_id`),
  KEY `dashboard_post_posted_by_id_1ffb40d1` (`posted_by_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dashboard_post`
--

INSERT INTO `dashboard_post` (`id`, `job_title`, `is_company_name_hidden`, `date_posted`, `job_description`, `street_address`, `job_city`, `job_state`, `job_country`, `job_zip`, `is_active`, `company_id`, `posted_by_id`) VALUES
(1, 'Software Engineer, PhD University Grad', 0, '2019-11-07 17:24:18.000000', 'Responsibilities:\r\n\r\n•Build highly-scalable software systems using primarily C++ and Java.\r\n•Design flexible APIs for Facebook product teams developing applications for web and mobile.\r\n•Build detailed monitoring to track the health of these systems and quickly triage issues.\r\n•Analyze the shortcomings of existing systems.\r\n•Design and build next generation systems to constantly be at the cutting edge\r\n\r\nMinimum Qualification:\r\n\r\n•PhD in Computer Science, related STEM or quantitative field or relevant experience\r\n•Graduating with a PhD by November 2020, or completing a university postdoctoral assignment\r\n•Research and/or work experience in Algorithms, Architecture, Programming Languages, Compilers, •Database, Data Mining, Distributed Systems, Networking, or Systems\r\n•Experience in C++, Java, Perl, PHP or Python\r\n•Knowledge of relational databases and SQL\r\n•Experience in Computer Science, with knowledge in systems, data structures and software design\r\n•Interpersonal skills, cross-group and cross-culture collaboration\r\n\r\nPreferred Qualification:\r\n\r\n•Demonstrated software engineer experience via an internship, work experience, coding competitions, or PhD papers', 'Facebook One Hacker Drive', 'Manchester', 'London', 'Great Britain', '25000', 1, 4, 2),
(2, 'Manager - Information Technology (Risk Assurance)', 0, '2019-11-07 17:26:42.000000', 'Job Description:\r\n\r\n•As a Manager, you’ll work as part of a team of problem solvers, helping to solve complex business issues from strategy to execution. PwC Professional skills and responsibilities for this management level include but are not limited to:\r\n\r\n•Responsible for delivering a range of IT Risk related Services across a range of industries. For example, IT general controls and compliance reviews, Automated application controls assessment, •Third party assurance, CAATs, Pre and post implementation reviews, Data migration reviews\r\n•Conduct automated application controls assessment\r\n•Liaise with core Assurance teams to ensure that work done is aligned with overall engagement objectives in order to achieve timely review of the clients’ financial statements, business processes, IT •General controls and the relevant automated application controls.\r\n\r\n\r\nEducation/Qualification:\r\n\r\n•Bachelor\'s and/ or postgraduate degree in one of the following: Accounting, Finance/Economics, •Management Information Systems, Computer Science, Business, Science, Technology, Engineering, •Mathematics, and/or other business fields of study. Minimum of second class upper;\r\n•Experience in the use of ACL / SQL;\r\n•Experience in the review of Flexcube. Finacle, Navision, SAP, Oracle ERP is an advantage', '29 Lagos View', 'Lagos', 'Lagos', 'Nigeria', '15000', 1, 3, 1),
(5, 'New Grad, Software Engineer (Beijing-Undergrad)', 0, '2019-11-07 17:43:28.000000', 'Qualifications:\r\n\r\n•So what are we looking for in a New Grad, Software Engineer (Undergrad)?\r\n•Recent or graduating students looking to start work from June 2019 onwards\r\n•Pursuing a Bachelor\'s degree in Computer Science, Computer Engineering or a related field\r\n•Proficiency in at least one programming language or technology including, but not limited, to Java, C/C++, •C#, .NET, python, Javascript, HTML, CSS and Objective-C.\r\n•The ability to take on challenges and address problems head-on\r\n•Highly driven and resourceful\r\n•Strong ability to collaborate', 'Yandai Xiejie Street', 'Beijing', 'Beijing', 'China', '32000', 1, 5, 2),
(6, '2020 Graduates-Software Engineer-STCA-Beijing', 0, '2019-11-07 17:47:06.000000', 'Responsibilities:\r\n\r\nSoftware Engineer is to work with project manager to understand the customer and market requirements, architect and design software systems, implement and ship online service product with high quality assurance.\r\n\r\nQualifications:\r\n\r\n•Strongly passionate about software design and programming, capable of learning quickly and continuously; strong interest and curiosity in technology\r\n•Excellent analytical skills and problem solving skills, obsessed with customers\r\n•Solid background on computer science or related areas. Candidate with software development experience is preferred. Candidate with certain level of specialty in computer science or software engineering is preferred\r\n•Bachelor or master degree in Computer Science or related engineering areas is preferred\r\n•Willing to take challenges and initiatives, be a team player, and with accountability\r\n•Able to work effectively in an environment where English is the primary working language', 'Yandai Xiejie Street', 'Beijing', 'Beijing', 'China', '32000', 1, 1, 2),
(12, 'New Job', 0, '2019-11-11 09:53:06.000000', 'Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum', 'Guanzhou', 'Guanzhou', 'Guanzhou', 'China', '3655545', 1, 1, 1),
(8, 'People & Organisation - Senior Associate', 0, '2019-11-07 17:53:02.000000', 'Knowledge and expertise in the following areas:\r\nOrganisation Change and Culture:\r\n\r\n•Organisation change & business transformation\r\n•Leadership and programme governance alignment/engagement\r\n•Organisation alignment\r\n•Culture transformation and behavioural change\r\n•Psychometry\r\n\r\n\r\nOrganisation Design and Effectiveness:\r\n\r\n•Operating model development\r\n•Organisation diagnostic and design\r\n•Organisation transition strategy', 'Cape Verda', 'Cape Town Area', 'Cape', 'South Africa', '65646', 1, 3, 2),
(9, 'Account Manager', 0, '2019-11-11 07:45:26.549219', 'Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum', 'Chashan', 'Wenzhou', 'Zhejiang', 'China', '325000', 1, 1, 1),
(10, 'Account Manager', 0, '2019-11-11 07:46:22.693458', 'Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum', 'Chashan', 'Wenzhou', 'Zhejiang', 'China', '325000', 1, 1, 1),
(11, 'Account Manager', 0, '2019-11-11 09:51:26.532479', 'Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum', 'Chashan', 'Wenzhou', 'Zhejiang', 'China', '325000', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_skillset`
--

DROP TABLE IF EXISTS `dashboard_skillset`;
CREATE TABLE IF NOT EXISTS `dashboard_skillset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_set_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-11-07 16:37:24.100114', '1', 'Multinational Technology Company ', 1, '[{\"added\": {}}]', 2, 1),
(2, '2019-11-07 16:38:34.791186', '1', 'Google', 1, '[{\"added\": {}}]', 1, 1),
(3, '2019-11-07 16:39:09.104923', '2', 'Social Networking Service ', 1, '[{\"added\": {}}]', 2, 1),
(4, '2019-11-07 16:39:55.009453', '2', 'Twitter', 1, '[{\"added\": {}}]', 1, 1),
(5, '2019-11-07 16:40:21.347075', '3', 'Professional Services Network ', 1, '[{\"added\": {}}]', 2, 1),
(6, '2019-11-07 16:41:12.454389', '3', 'PricewaterhouseCoopers', 1, '[{\"added\": {}}]', 1, 1),
(7, '2019-11-07 16:42:11.733213', '4', 'Facebook', 1, '[{\"added\": {}}]', 1, 1),
(8, '2019-11-07 16:43:08.255071', '5', 'Baidu', 1, '[{\"added\": {}}]', 1, 1),
(9, '2019-11-07 16:43:45.662097', '4', 'Holding Company ', 1, '[{\"added\": {}}]', 2, 1),
(10, '2019-11-07 16:44:08.215776', '6', 'Alibaba', 1, '[{\"added\": {}}]', 1, 1),
(11, '2019-11-07 16:46:03.973228', '1', 'Google Company Profile', 1, '[{\"added\": {}}]', 7, 1),
(12, '2019-11-07 16:47:22.591601', '2', 'Twitter Company Profile', 1, '[{\"added\": {}}]', 7, 1),
(13, '2019-11-07 16:47:32.618026', '3', 'PricewaterhouseCoopers Company Profile', 1, '[{\"added\": {}}]', 7, 1),
(14, '2019-11-07 16:47:46.094945', '4', 'Facebook Company Profile', 1, '[{\"added\": {}}]', 7, 1),
(15, '2019-11-07 16:48:31.283002', '5', 'Baidu Company Profile', 1, '[{\"added\": {}}]', 7, 1),
(16, '2019-11-07 16:48:44.090317', '6', 'Alibaba Company Profile', 1, '[{\"added\": {}}]', 7, 1),
(17, '2019-11-07 16:49:38.480144', '2', 'Talent', 1, '[{\"added\": {}}]', 16, 1),
(18, '2019-11-07 16:49:53.181417', '1', 'Account object (1)', 1, '[{\"added\": {}}]', 8, 1),
(19, '2019-11-07 16:50:50.205366', '3', 'Conrad', 1, '[{\"added\": {}}]', 16, 1),
(20, '2019-11-07 16:51:18.650977', '2', 'Account object (2)', 1, '[{\"added\": {}}]', 8, 1),
(21, '2019-11-07 16:51:48.046229', '4', 'Mavingire', 1, '[{\"added\": {}}]', 16, 1),
(22, '2019-11-07 16:52:02.500748', '3', 'Account object (3)', 1, '[{\"added\": {}}]', 8, 1),
(23, '2019-11-07 16:52:34.122647', '5', 'Philemon', 1, '[{\"added\": {}}]', 16, 1),
(24, '2019-11-07 16:52:51.092655', '4', 'Account object (4)', 1, '[{\"added\": {}}]', 8, 1),
(25, '2019-11-07 16:55:06.134176', '1', 'Paul Profile', 1, '[{\"added\": {}}]', 10, 1),
(26, '2019-11-07 17:15:10.751467', '2', 'Philemon Profile', 1, '[{\"added\": {}}]', 10, 1),
(27, '2019-11-07 17:16:42.573862', '3', 'Conrad Profile', 1, '[{\"added\": {}}]', 10, 1),
(28, '2019-11-07 17:17:42.655110', '4', 'Talent Profile', 1, '[{\"added\": {}}]', 10, 1),
(29, '2019-11-07 17:17:59.463860', '5', 'Mavingire Profile', 1, '[{\"added\": {}}]', 10, 1),
(30, '2019-11-07 17:18:42.211104', '4', 'Mabasa', 2, '[{\"changed\": {\"fields\": [\"username\"]}}]', 16, 1),
(31, '2019-11-07 17:18:44.677765', '3', 'Account object (3)', 2, '[]', 8, 1),
(32, '2019-11-07 17:26:33.683144', '1', 'Facebook, Software Engineer, PhD University Grad ', 1, '[{\"added\": {}}]', 4, 1),
(33, '2019-11-07 17:35:01.962732', '2', 'PricewaterhouseCoopers, Manager - Information Technology (Risk Assurance) ', 1, '[{\"added\": {}}]', 4, 1),
(34, '2019-11-07 17:39:00.673308', '3', 'Google, Research Analyst, Japan (Tokyo ', 1, '[{\"added\": {}}]', 4, 1),
(35, '2019-11-07 17:40:07.614939', '2', 'PricewaterhouseCoopers, Manager - Information Technology (Risk Assurance) ', 2, '[{\"changed\": {\"fields\": [\"job_description\"]}}]', 4, 1),
(36, '2019-11-07 17:40:36.460104', '1', 'Facebook, Software Engineer, PhD University Grad ', 2, '[{\"changed\": {\"fields\": [\"job_description\"]}}]', 4, 1),
(37, '2019-11-07 17:43:21.644016', '4', 'Alibaba, 3D & Deep Learning Engineer ', 1, '[{\"added\": {}}]', 4, 1),
(38, '2019-11-07 17:47:03.261623', '5', 'Baidu, New Grad, Software Engineer (Beijing-Undergrad) ', 1, '[{\"added\": {}}]', 4, 1),
(39, '2019-11-07 17:50:04.405717', '6', 'Google, 2020 Graduates-Software Engineer-STCA-Beijing ', 1, '[{\"added\": {}}]', 4, 1),
(40, '2019-11-07 17:52:13.900073', '7', 'Baidu, Full Stack Javascript Developer ', 1, '[{\"added\": {}}]', 4, 1),
(41, '2019-11-07 18:00:06.485330', '8', 'PricewaterhouseCoopers, People & Organisation - Senior Associate ', 1, '[{\"added\": {}}]', 4, 1),
(42, '2019-11-11 04:29:37.121500', '6', 'Rutendo', 3, '', 16, 1),
(43, '2019-11-11 04:32:40.468965', '7', 'Rutendo', 3, '', 16, 1),
(44, '2019-11-11 04:38:42.380899', '8', 'Rutendo', 3, '', 16, 1),
(45, '2019-11-11 04:41:05.892979', '9', 'Rutendo', 3, '', 16, 1),
(46, '2019-11-11 09:46:44.387480', '11', 'TestUser1', 1, '[{\"added\": {}}]', 16, 1),
(47, '2019-11-11 09:52:19.451658', '3', 'Conrad', 3, '', 16, 1),
(48, '2019-11-11 09:53:50.717634', '12', 'Google, New Job ', 1, '[{\"added\": {}}]', 4, 1),
(49, '2019-11-11 09:53:52.961149', '1', 'Job: Google, New Job , Applicant: PaulTest ', 1, '[{\"added\": {}}]', 6, 1),
(50, '2019-11-11 09:55:52.943332', '2', 'Job: PricewaterhouseCoopers, Manager - Information Technology (Risk Assurance) , Applicant: PaulTest ', 1, '[{\"added\": {}}]', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'dashboard', 'companyaccount'),
(2, 'dashboard', 'companytype'),
(3, 'dashboard', 'skillset'),
(4, 'dashboard', 'post'),
(5, 'dashboard', 'jobpostskillset'),
(6, 'dashboard', 'jobpostactivity'),
(7, 'dashboard', 'companyprofile'),
(8, 'users', 'account'),
(9, 'users', 'seekerskillset'),
(10, 'users', 'profile'),
(11, 'users', 'experience'),
(12, 'users', 'education'),
(13, 'admin', 'logentry'),
(14, 'auth', 'permission'),
(15, 'auth', 'group'),
(16, 'auth', 'user'),
(17, 'contenttypes', 'contenttype'),
(18, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-11-07 16:25:59.731072'),
(2, 'auth', '0001_initial', '2019-11-07 16:25:59.832561'),
(3, 'admin', '0001_initial', '2019-11-07 16:26:00.244035'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-11-07 16:26:00.350067'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-11-07 16:26:00.352580'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-11-07 16:26:00.411438'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-11-07 16:26:00.431092'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-11-07 16:26:00.462682'),
(9, 'auth', '0004_alter_user_username_opts', '2019-11-07 16:26:00.475245'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-11-07 16:26:00.500968'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-11-07 16:26:00.500968'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-11-07 16:26:00.512802'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-11-07 16:26:00.540228'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-11-07 16:26:00.572830'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-11-07 16:26:00.591069'),
(16, 'auth', '0011_update_proxy_permissions', '2019-11-07 16:26:00.602962'),
(17, 'dashboard', '0001_initial', '2019-11-07 16:26:00.800468'),
(18, 'dashboard', '0002_auto_20191103_1909', '2019-11-07 16:26:01.170134'),
(19, 'sessions', '0001_initial', '2019-11-07 16:26:01.190138'),
(20, 'users', '0001_initial', '2019-11-07 16:26:01.392566'),
(21, 'users', '0002_auto_20191102_2253', '2019-11-07 16:26:01.630243'),
(22, 'users', '0003_auto_20191102_2305', '2019-11-07 16:26:01.682445');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('gpfulz5kb86s3jrbi97g5dkwum4i8m3g', 'MjFhOGZhY2Q2ODk5MmMxODJlYTIxYjFiZjc4MzNiNzU0MGE0OWE2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNjllNGUwYTlkOGE4ZjM2NDkzYmM5NzAxMWVhYzRkMDllNzEwYzNkIn0=', '2019-11-25 02:22:56.661712'),
('0gc9ppnrdf009vkioc1rb6i2dv5er4rn', 'MjFhOGZhY2Q2ODk5MmMxODJlYTIxYjFiZjc4MzNiNzU0MGE0OWE2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNjllNGUwYTlkOGE4ZjM2NDkzYmM5NzAxMWVhYzRkMDllNzEwYzNkIn0=', '2019-11-25 09:46:04.339677');

-- --------------------------------------------------------

--
-- Table structure for table `users_account`
--

DROP TABLE IF EXISTS `users_account`;
CREATE TABLE IF NOT EXISTS `users_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(2) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `sms_notifications` tinyint(1) NOT NULL,
  `email_notifications` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_account`
--

INSERT INTO `users_account` (`id`, `user_type`, `phone`, `sms_notifications`, `email_notifications`, `user_id`) VALUES
(1, 'RT', '15557561309', 0, 0, 2),
(3, 'SR', '15258973541', 0, 0, 4),
(4, 'SR', '15578946130', 0, 0, 5),
(5, 'SR', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_education`
--

DROP TABLE IF EXISTS `users_education`;
CREATE TABLE IF NOT EXISTS `users_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_degree_name` varchar(50) NOT NULL,
  `major` varchar(50) NOT NULL,
  `institute_university_name` varchar(50) NOT NULL,
  `starting_date` date NOT NULL,
  `completion_date` date NOT NULL,
  `percentage` int(10) UNSIGNED NOT NULL,
  `cgpa` double NOT NULL,
  `user_account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_education_user_account_id_3b29a9ab` (`user_account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_experience`
--

DROP TABLE IF EXISTS `users_experience`;
CREATE TABLE IF NOT EXISTS `users_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_current_job` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `job_location_city` varchar(50) NOT NULL,
  `job_location_state` varchar(50) NOT NULL,
  `job_location_country` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `user_account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_experience_user_account_id_c235f1da` (`user_account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
CREATE TABLE IF NOT EXISTS `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `image`, `user_id`) VALUES
(1, 'profile_pics/paul.jpg', 1),
(2, 'profile_pics/phile.jpg', 5),
(4, 'profile_pics/talent_HgJwDoa.jpg', 2),
(5, 'profile_pics/mabasa.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users_seekerskillset`
--

DROP TABLE IF EXISTS `users_seekerskillset`;
CREATE TABLE IF NOT EXISTS `users_seekerskillset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_level` int(10) UNSIGNED NOT NULL,
  `skill_set_id` int(11) NOT NULL,
  `user_account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_seekerskillset_skill_set_id_8aeb0f05` (`skill_set_id`),
  KEY `users_seekerskillset_user_account_id_c2b26d60` (`user_account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
