-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.11-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- mcdonalddb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `mcdonalddb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mcdonalddb`;

-- 테이블 mcdonalddb.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID (기본키)',
  `email` varchar(255) NOT NULL COMMENT '이메일',
  `pwd` varchar(128) NOT NULL COMMENT '비밀번호',
  `salt` varchar(200) NOT NULL COMMENT '암호화할때 쓴 난수',
  `admin_name` varchar(255) NOT NULL COMMENT '이름',
  `phone` varchar(20) NOT NULL COMMENT '전화번호',
  `created_at` datetime NOT NULL COMMENT '가입일',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.admin:~1 rows (대략적) 내보내기
INSERT INTO `admin` (`id`, `email`, `pwd`, `salt`, `admin_name`, `phone`, `created_at`) VALUES
	(1, 'i1004902@naver.com', 'bb8b126ed9d240da8de3c9671baa0cdd07cc81c1ab27096560bad572f21648d513dde731da924a521fbe36e489b147f18c046f9078e34ca1c11201d5aca34095', 'fzNwlKN0MCgWnv3zcmn4wgORICW3ge/r0fBDCAz6ul855NM/mTw5yTl4/XivHtiVUGun1Lqaqe+dEyA16AxdBWSGY8YUhiAQBKExy44yHdLFyfNU4jY0o7OGFSzdx1CEwxfbwV/5hcy5noF+AOgrBPGKCxQ/QK6g3x6ORo3F0i4=', '김지환', '010-9312-0285', '2023-11-02 00:46:04');

-- 테이블 mcdonalddb.banner 구조 내보내기
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_id` int(11) NOT NULL COMMENT '버튼에 들어갈 텍스트',
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '배너 타이틀',
  `content` varchar(255) DEFAULT NULL COMMENT '서브메뉴별 비쥬얼 백그라운드 중간 내용',
  `background_img_url` varchar(255) DEFAULT NULL COMMENT '서브메뉴별 비쥬얼 백그라운드 배경 이미지 경로',
  `link` varchar(255) DEFAULT NULL COMMENT '서브메뉴별 비쥬얼 백그라운드 url들 배열형태',
  PRIMARY KEY (`id`),
  KEY `sub_category_id` (`sub_category_id`),
  CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.banner:~27 rows (대략적) 내보내기
INSERT INTO `banner` (`id`, `sub_category_id`, `type`, `title`, `content`, `background_img_url`, `link`) VALUES
	(1, 1, 'burger', '버거', '빅맥®에서 맥스파이시® 상하이버거까지,주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.', '/upload/visualbackground/bg_visual_menu01.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/menu/1", "name": "Menu"}, {"url": "/menu/1", "name": "버거"}]'),
	(2, 2, 'mclunch', '맥런치', '빅맥®에서 맥스파이시® 상하이버거까지,주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.', '/upload/visualbackground/bg_visual_menu01.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/menu/1", "name": "Menu"}, {"url": "/menu/2", "name": "맥런치"}]'),
	(3, 3, 'mcmorning', '맥모닝', '빅맥®에서 맥스파이시® 상하이버거까지,주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.', '/upload/visualbackground/bg_visual_menu01.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/menu/1", "name": "Menu"}, {"url": "/menu/3", "name": "맥모닝"}]'),
	(4, 4, 'happysnack', '해피 스낵', '빅맥®에서 맥스파이시® 상하이버거까지,주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.', '/upload/visualbackground/bg_visual_menu01.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/menu/1", "name": "Menu"}, {"url": "/menu/4", "name": "해피 스낵"}]'),
	(5, 5, 'sidedessert', '사이드 & 디저트', '빅맥®에서 맥스파이시® 상하이버거까지,주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.', '/upload/visualbackground/bg_visual_menu01.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/menu/1", "name": "Menu"}, {"url": "/menu/5", "name": "사이드 & 디저트"}]'),
	(6, 6, 'mccafe', '맥카페 & 음료', '빅맥®에서 맥스파이시® 상하이버거까지,주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.', '/upload/visualbackground/bg_visual_menu01.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/menu/1", "name": "Menu"}, {"url": "/menu/6", "name": "맥카페 & 음료"}]'),
	(7, 7, 'happymeal', '해피밀', '빅맥®에서 맥스파이시® 상하이버거까지,주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.', '/upload/visualbackground/bg_visual_menu01.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/menu/1", "name": "Menu"}, {"url": "/menu/7", "name": "해피밀"}]'),
	(8, 8, 'find', '매장찾기', NULL, '/upload/visualbackground/headerImg.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/store/find", "name": "Store"}, {"url": "/store/find", "name": "매장찾기"}]'),
	(9, 9, 'mcdelivery', '맥딜리버리', NULL, '/upload/visualbackground/headerImg.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/store/find", "name": "Store"}, {"url": "/store/mcdelivery", "name": "맥딜리버리"}]'),
	(10, 10, 'mcdrive', '맥드라이브', NULL, '/upload/visualbackground/headerImg.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/store/find", "name": "Store"}, {"url": "/store/mcdrive", "name": "맥드라이브"}]'),
	(11, 11, 'rental', '임차문의', NULL, '/upload/visualbackground/headerImg.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/store/find", "name": "Store"}, {"url": "/store/rental", "name": "임차문의"}]'),
	(12, 12, 'promotion', '맥도날드 프로모션', NULL, '/upload/visualbackground/bg_visual_whats02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/whats-new/12", "name": "Whats\'s New"}, {"url": "/whats-new/12", "name": "맥도날드 프로모션"}]'),
	(13, 13, 'news', '새로운 소식', NULL, '/upload/visualbackground/bg_visual_whats02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/whats-new/12", "name": "Whats\'s New"}, {"url": "/whats-new/13", "name": "새로운 소식"}]'),
	(14, 14, 'month-happymeal', '이달의 해피밀', NULL, '/upload/visualbackground/bg_visual_whats02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/whats-new/12", "name": "Whats\'s New"}, {"url": "/whats-new/14", "name": "이달의 해피밀"}]'),
	(15, 15, 'brandintro', '브랜드 소개', '1955년 작은 레스토랑에서부터 지금에 이르기까지 고객이 가장 좋아하는 장소이자, \n음식을 즐기는 최고의 방법이 되기 위해 맥도날드는 오늘도 노력합니다.', '/upload/visualbackground/headerImg.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/brandintro", "name": "브랜드 소개"}]'),
	(16, 16, 'society', '사회적 책임과 지원', '맥도날드는 건전한 기업시민으로서의 책임을 다하고자 노력합니다.\n지역 사회의 발전과 사람들의 행복에 기여하고, 지금보다 더 나은 세상을 만들기 위해 오늘도 나아갑니다.', '/upload/visualbackground/bg_visual_whats02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/society", "name": "맥도날드 사회적 책임"}]'),
	(17, 17, 'farmtorestaurant', '맥도날드 품질 이야기', '우리가 엄격해질수록 버거는 더 맛있어지니까! \n모두의 노력으로 엄격하고 꼼꼼하게 키워진 신선한 식재료가 모여, 마침내 맛있는 맥도날드 버거가 됩니다.', '/upload/visualbackground/bg_visual_whats02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/farmtorestaurant", "name": "맥도날드 품질 이야기"}]'),
	(18, 18, 'faq', '맥도날드 경쟁력', '맥도날드는 어떤 곳 보다 햄버거 비즈니스를 진지하게 생각합니다.\n엄격한 품질 관리 시스템을 통해 고품질의 음식을 제공하며,조리 과정에서 고객이 궁금한 모든 것을 알려드립니다.', '/upload/visualbackground/competition.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/faq", "name": "맥도날드 경쟁력"}]'),
	(19, 19, 'crew', '이달의 해피밀', '끊임없는 변화와 도전을 통해 성장해온 맥도날드 이 변화의 중심에는 맥도날드와 함께 변화하며 성장하는 ‘맥도날드 사람들’이 있습니다.', '/upload/visualbackground/bg_visual_whats02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/crew", "name": "맥도날드 사람들"}]'),
	(20, 19, 'work', '이달의 해피밀', '끊임없는 변화와 도전을 통해 성장해온 맥도날드 이 변화의 중심에는 맥도날드와 함께 변화하며 성장하는 ‘맥도날드 사람들’이 있습니다.', '/upload/visualbackground/bg_visual_whats02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/crew", "name": "맥도날드 사람들"}]'),
	(21, 19, 'recruit', '이달의 해피밀', '끊임없는 변화와 도전을 통해 성장해온 맥도날드 이 변화의 중심에는 맥도날드와 함께 변화하며 성장하는 ‘맥도날드 사람들’이 있습니다.', '/upload/visualbackground/bg_visual_whats02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/crew", "name": "맥도날드 사람들"}]'),
	(22, 16, 'scaleforgood', '맥도날드 사회적 책임', '맥도날드는 어떤 곳 보다 햄버거 비즈니스를 진지하게 생각합니다.\n엄격한 품질 관리 시스템을 통해 고품질의 음식을 제공하며,조리 과정에서 고객이 궁금한 모든 것을 알려드립니다.', '/upload/visualbackground/bg_visual_story02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/crew", "name": "맥도날드 사람들"}]'),
	(23, 16, 'kidssoccer', '맥도날드 사회적 책임', '맥도날드는 어떤 곳 보다 햄버거 비즈니스를 진지하게 생각합니다.\n엄격한 품질 관리 시스템을 통해 고품질의 음식을 제공하며,조리 과정에서 고객이 궁금한 모든 것을 알려드립니다.', '/upload/visualbackground/bg_visual_story02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/crew", "name": "맥도날드 사람들"}]'),
	(24, 16, 'happyburger', '맥도날드 사회적 책임', '맥도날드는 건전한 기업시민으로서의 책임을 다하고자 노력합니다.\n지역 사회의 발전과 사람들의 행복에 기여하고, 지금보다 더 나은 세상을 만들기 위해 오늘도 나아갑니다.', '/upload/visualbackground/bg_visual_story02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/crew", "name": "맥도날드 사람들"}]'),
	(25, 16, 'safetyguard', '맥도날드 사회적 책임', '맥도날드는 건전한 기업시민으로서의 책임을 다하고자 노력합니다.\n지역 사회의 발전과 사람들의 행복에 기여하고, 지금보다 더 나은 세상을 만들기 위해 오늘도 나아갑니다.', '/upload/visualbackground/bg_visual_story02.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/crew", "name": "맥도날드 사람들"}]'),
	(26, 16, 'mcdonaldhouse', '맥도날드 사회적 책임', '맥도날드는 건전한 기업시민으로서의 책임을 다하고자 노력합니다.\n지역 사회의 발전과 사람들의 행복에 기여하고, 지금보다 더 나은 세상을 만들기 위해 오늘도 나아갑니다.', '/upload/visualbackground/bg_visual_story02 .jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/crew", "name": "맥도날드 사람들"}]'),
	(27, 15, 'brandhistory', '브랜드 소개', '1955년 작은 레스토랑에서부터 지금에 이르기까지 고객이 가장 좋아하는 장소이자, \n음식을 즐기는 최고의 방법이 되기 위해 맥도날드는 오늘도 노력합니다.', '/upload/visualbackground/headerImg.jpg', '[{"url": "/", "name": "HOME"}, {"url": "/story/main", "name": "Story"}, {"url": "/story/brandintro", "name": "브랜드 소개"}]');

-- 테이블 mcdonalddb.category 구조 내보내기
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT 'What''s New 메뉴면 promotion',
  `name` varchar(255) NOT NULL COMMENT '버튼에 들어갈 텍스트',
  `link` varchar(255) NOT NULL COMMENT '클릭시 이동할 주소',
  `seq` int(11) NOT NULL COMMENT '표시될 순서',
  PRIMARY KEY (`id`),
  UNIQUE KEY `seq` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.category:~4 rows (대략적) 내보내기
INSERT INTO `category` (`id`, `type`, `name`, `link`, `seq`) VALUES
	(1, 'menu', 'Menu', '/munu/burger', 1),
	(2, 'store', 'Store', '/store/find', 2),
	(3, 'whats-new', 'What\'s New', '/whats-new/promotion', 3),
	(4, 'story', 'Story', '/story/main', 4);

-- 테이블 mcdonalddb.crew 구조 내보내기
CREATE TABLE IF NOT EXISTS `crew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT 'admin테이블의 id참초',
  `store_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL COMMENT '직책',
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `crew_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.crew:~4 rows (대략적) 내보내기
INSERT INTO `crew` (`id`, `admin_id`, `store_id`, `title`, `name`, `img_url`, `position`, `description`) VALUES
	(1, 1, 1, '변화는 나의 자부심', '김지웅', '/upload/Story/crew1.png', '매니저', '처음엔 ‘그냥 아르바이트 하는 곳’이라는 생각으로 시작 하였던 것이 어느 것 16년을 함께 하고 있습니다. 맥도날드의 다양한 경험을 통해 항상 새로운 시도와 변화를 먼저 이끌어 나가는 기업이라는 것을 자연스럽게 느낄 수 있었습니다.\n맥드라이브, 맥딜리버리, 최근의 미래형 매장까지···\n멈추지 않는 다양한 시도들은 저에게 변화를 함께 만들어 가면서 최초라는 자부심을 갖고 일할 수 있게 해주었습니다.\n맥도날드의 변화는 곧 저의 즐거움이자 자부심이며,\n이러한 새로운 변화를 계속해서 이끌어갈 것입니다.'),
	(2, 1, 2, '매일 열정적일 수 있는 나만의 비결', '권영미', '/upload/Story/crew2.png', '크루', '야간 근무를 하면서 밤낮이 바뀐 생활이 쉽진 않았습니다.\n하지만 한 집안의 ‘엄마’와 ‘아내’로서, 그리고 맥도날드에\n찾아오는 모든 고객 분들의 ‘이웃’과 ‘친구’로서 균형을\n잃지 않기 위해 더 열심히 일했습니다.\n누구보다 더 변화하는 시스템을 긍정적이고 빠르게 받아들이려\n노력하여, 어느새 저는 매장의\n맏언니로 자리할 수 있었습니다.\n함께 일하는 크루들도 언제나 열정적인 저의 모습을 통해\n힘을 얻고 함께 변화하며 성장하고 있습니다.\n오늘 밤에도 나, 그리고 맥도날드를 찾아 주시는\n고객 분들을 위해 더 열정적으로 일하려 합니다.'),
	(3, 1, 3, '행복을 배달하는 사람으로', '이지혁', '/upload/Story/crew3.png', '라이더', '제가 어떤 마음으로 일하느냐에 따라 고객 분들이 느끼는 게\n다를거라 생각했습니다. 돈을 벌기 위해서, 어쩔 수\n없이 해야하니까 하는 것 보단 스스로 가치 있고 “행복을 전달하는 일이다.”라고 생각하는 태도를 갖기로 마음 먹었습니다.\n그러자 전보다 감사한 마음으로 일할 수 있었고,\n그 마음이 어느 정도 고객\n분들에게 전달 되어지고 있다고 생각합니다.\n그렇게 감사하며 유쾌하게 일을 하고 있고,\n더 많은 행복을 전달할 수 있도록 노력할 것 입니다'),
	(4, 1, 4, '맥도날드를 넘어, 나 자신의 변화까지', '이나라', '/upload/Story/crew4.png', '크루', '올 해, 고객 분들과 직접 접할 일이 더욱 많은 ‘서비스 리더’라는 직책을 맡게 되면서 저에게 고객과의\n소통은 중요한 일이 되었습니다. 처음엔 낯설고 힘들었습니다.\n하지만 고객 분들에게 저희 매장의 직원들이 친절하다는 칭찬을 듣고 싶은 욕심이 점점 생겼습니다.\n그렇게 마음 먹은 뒤로부터 웃는\n얼굴로 일하여 노력하기 시작했고, 그러자 일이 즐겁게 느껴졌습니다.\n그런 것을 고객 분들도 알아주시고, 함께 웃는 얼굴로 마주해주시니 제 삶까지 행복해졌습니다.\n처음에는 작은 욕심으로 시작한 일이\n맥도날드의 변화를 넘어, 나 자신의 변화까지 가져왔습니다.');

-- 테이블 mcdonalddb.effort 구조 내보내기
CREATE TABLE IF NOT EXISTS `effort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT 'admin테이블의 id참초',
  `title` varchar(255) NOT NULL,
  `title_description` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `sub_title_description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.effort:~14 rows (대략적) 내보내기
INSERT INTO `effort` (`id`, `admin_id`, `title`, `title_description`, `img_url`, `sub_title`, `sub_title_description`) VALUES
	(1, 1, '철저한 재료관리', '철저한 식재료 관리는 농장에서부터 배송센터 뿐만 아니라 레스토랑에서도 계속 되어야겠죠?\n재료가 레스토랑으로 배송되면 매뉴얼을 준수, 신선한 상태로 유지하도록 최선을 다합니다.', '/upload/effort/1.jpg', '냉장/냉동고로 식재료를 입고할 때\n적정 온도 유지는 필수', '배송된 재료가 바로 냉장/냉동실로 이동될 수 있도록 사전에 필요한 공간을 확보해 둡니다. 그리고 항온 담요와 방수포를 덮어 식재료 온도를 유지하며, 바닥에 닿지 않도록 트레이를 사용하여 냉장/냉동고로 입고시킵니다.'),
	(2, 1, '철저한 재료관리', '철저한 식재료 관리는 농장에서부터 배송센터 뿐만 아니라 레스토랑에서도 계속 되어야겠죠?\n재료가 레스토랑으로 배송되면 매뉴얼을 준수, 신선한 상태로 유지하도록 최선을 다합니다.', '/upload/effort/2.jpg', '샘플 검수를 통해 식재료의 신선한 상태를 점검', '식재료가 배송되면 기준에 미달하는 식재료는 없는지 냉동/냉장 각 재료 중 일부 박스를 샘플로 뜯어 확인하고, 문제가 있을 경우 폐기를 위해 반품 처리 합니다.'),
	(3, 1, '철저한 재료관리', '철저한 식재료 관리는 농장에서부터 배송센터 뿐만 아니라 레스토랑에서도 계속 되어야겠죠?\n재료가 레스토랑으로 배송되면 매뉴얼을 준수, 신선한 상태로 유지하도록 최선을 다합니다.', '/upload/effort/3.jpg', '먼저 들어온 제품을 먼저 사용하고\n냉장/냉동고의 온도를 철저히 유지', '선입선출이라는 말을 아시나요? 먼저 들어온 식재료부터 들어온 순서에 맞게 사용될 수 있도록 보관·관리하며, 재료 박스간의 적정 간격을 유지하여 온도가 잘 유지될 수 있도록 보관합니다.'),
	(4, 1, '조리환경 관리', '본격적인 조리를 시작하기 전 조리를 준비하는 과정에서도 식품 안전을 위한 점검은 계속됩니다.', '/upload/effort/4.jpg', '매일 첫 제품이 제공되기 전에\n조리된 제품의 온도를 체크', '매일 첫 제품이 제공되기 전 패티의 온도를 체크하여 식품 안전 온도를 유지하는지 확인합니다.'),
	(5, 1, '조리환경 관리', '본격적인 조리를 시작하기 전 조리를 준비하는 과정에서도 식품 안전을 위한 점검은 계속됩니다.', '/upload/effort/5.jpg', '식약처 기준보다 더 엄격한 산가기준 적용', '매일 레스토랑 기름의 산가를 측정하여 기준을 초과하는 경우 즉시 교체하고 있습니다. 국내 식품 위생 법률에서 정한 3.0의 산가 기준보다 더 엄격한 2.5의 산가 기준을 적용합니다.'),
	(6, 1, '조리환경 관리', '본격적인 조리를 시작하기 전 조리를 준비하는 과정에서도 식품 안전을 위한 점검은 계속됩니다.', '/upload/effort/6.jpg', '매일 식품 안전사항을 체크하고 관리', '모든 레스토랑에서는 매일 식품 안전사항을 체크하여 철저히 품질 관리를 하며, 맥도날드 글로벌 공통의 레스토랑 식품안전 기준이 상시 유지 중인지 제 3자 점검기관을 통해 전 매장을 점검합니다.'),
	(7, 1, '조리과정 관리', '조리 과정에도 안전과 위생과 만전을 기하고 있습니다.', '/upload/effort/7.jpg', '패티의 종류에 따라 적정 온도로\n조리되는 오토 쿠킹 모드', '패티는 그릴이라는 장비를 통해 자동으로 구워집니다. 오토 쿠킹 모드를 누르면 정해진 조리 시간에 따라 자동으로 조리되며, 정해진 시간이 종료되면 자동으로 상판이 올라가며 조리가 완료됩니다.'),
	(8, 1, '조리과정 관리', '조리 과정에도 안전과 위생과 만전을 기하고 있습니다.', '/upload/effort/8.jpg', '교차 오염 방지를 위한 일회용 장갑 사용', '교차 오염을 방지하기 위해 조리되지 않은 식품을 만질 때는 파란 장갑을, 조리된 식품이나 조리 도구를 만질 때는 흰 장갑을 사용합니다. 한번 사용한 장갑은 바로 폐기하고, 새 장갑으로 교체하여 사용합니다.'),
	(9, 1, '조리과정 관리', '조리 과정에도 안전과 위생과 만전을 기하고 있습니다.', '/upload/effort/9.jpg', '깨끗하고 안전한 제품을\n제공하기 위해 준비하는 크루', '레스토랑 주방에서는 30분마다 한번씩 손 씻기 타이머가 울립니다. 주방에서 근무하는 모든 직원들은 30분마다 한 번씩 손부터 아래팔까지 손을 씻습니다. 청결한 유니폼 착용 등 개인 위생에도 만전을 기합니다.'),
	(10, 1, '조리과정 관리', '조리 과정에도 안전과 위생과 만전을 기하고 있습니다.', '/upload/effort/10.jpg', '4시간 경마다 세척하여 사용하는 조리 도구', '깨끗한 조리 환경을 위해, 레스토랑 직원들은 4시간 경마다 한 번씩 조리 도구를 세척하여 청결하게 사용하고 있습니다.'),
	(11, 1, '고객만족을 위한 노력', '정성을 다해 만든 제품을 제공하기 위해 보이지 않는 곳까지 점검합니다.', '/upload/effort/11.jpg', '주문이 들어옴과 동시에 음식을 만드는 ‘메이드 포 유’ 시스템', '맥도날드는 음식을 미리 만들어 놓지 않고, 고객 주문 접수와 동시에 음식을 만들어 갓 조리된 신선한 음식만을 제공하는 ‘메이드 포 유(Made for You)’ 시스템을 적용하고 있습니다.'),
	(12, 1, '고객만족을 위한 노력', '정성을 다해 만든 제품을 제공하기 위해 보이지 않는 곳까지 점검합니다.', '/upload/effort/12.jpg', '고객의견을 반영한 제품 구성 및 함량 변경', '위생을 위해 슈레더로 변경한 양상추의 함량이 적게 느껴진다는 고객 의견을 반영하여 일부 메뉴의 슈레더 양상추 함량이 30g씩 늘어났습니다.'),
	(13, 1, '고객만족을 위한 노력', '정성을 다해 만든 제품을 제공하기 위해 보이지 않는 곳까지 점검합니다.', '/upload/effort/13.jpg', '고객이 주문하는 공간도 언제나 깨끗하게 유지', '고객이 주문을 하는 카운터와 디지털 키오스크 공간도 언제나 기분 좋게 사용하실 수 있도록 깨끗이 유지합니다.'),
	(14, 1, '고객만족을 위한 노력', '정성을 다해 만든 제품을 제공하기 위해 보이지 않는 곳까지 점검합니다.', '/upload/effort/14.jpg', '고객이 레스토랑을 나가는 순간까지 깨끗하게', '고객이 음식을 드시는 테이블은 물론, 휴지통과 화장실까지 청결하게 유지될 수 있도록 노력합니다.');

-- 테이블 mcdonalddb.faq 구조 내보내기
CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT 'admin테이블의 id참초',
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.faq:~20 rows (대략적) 내보내기
INSERT INTO `faq` (`id`, `admin_id`, `category`, `title`, `description`) VALUES
	(1, 1, '전체', '1', '1'),
	(2, 1, '원재료', '쇠고기 패티는 어떤 고기를 사용하나요?', '호주 청정지역에서 기른 소의 원료육을 사용합니다. 최적의 식감을 내기 위해 지방을 적절히 사용하여, 내장 등의 부위는 전혀 사용하고 있지 않습니다.'),
	(3, 1, '원재료', '햄버거 패티에 방부제나 첨가물이 들어가나요?', '맥도날드 버거의 패티에는 방부제가 들어가지 않으며, 패티의 종류에 따라 맛과 식감을 위해 식약처 등 정부에서 인증한 안전한 식품과 첨가물을 사용합니다. 소고기 패티는 100% 순쇠고기로 만들어지며, 매장에서는 소금과 후추만을 뿌려 조리합니다. 돼지고기 패티는 국내산 돼지고기 뒷다리살 등의 부위를 사용하며, 부드러운 식감을 위해 콩단백을 더하고 고기의 잡내를 잡기 위해 세이지 등 허브 시즈닝이 들어갑니다.'),
	(4, 1, '원재료', '닭고기는 어느 부위를 사용하나요?', '맥스파이시 상하이 버거는 담백한 통가슴살이 들어가는 제품으로, 패티를 잘랐을 때 통살의 질감을 그대로 즐기실 수 있습니다. 이밖에 치킨 텐더는 통안심살, 맥너겟은 가슴살 등의 부위를 사용합니다.'),
	(5, 1, '원재료', '맥도날드 계란은 안전한가요??', '우수한 품질의 1+등급 계란만을 사용합니다. 표면 세척과 UV 살균 등 꼼꼼한 위생 처리를 거친 뒤, 매장에서 조리될 때까지 7도 이하로 냉장 보관 및 유통되며 매장에서 하나 하나 깨트려 조리하여 최상의 신선함을 자랑합니다.'),
	(6, 1, '원재료', '양상추, 토마토 같은 야채는 어떻게 관리하나요?', '양상추의 경우 강원도 대관령 등 국내 청정 지역의 농장에서 재배된 양상추를 공급 받고 있습니다. 매일유업 등 국내 협력 공장에서 먹기 좋게 잘라 꼼꼼한 세척 과정을 거친 뒤 진공 포장하여 내장 상태로 매장에 배송되며, 사용 직전 진공 포장을 뜯어서 사용합니다. 다만 국내 농가의 작황에 따라 공급이 여의치 않을 경우 일부 수입산을 사용하는 경우도 있습니다. 토마토 역시 신세계 푸드 등 국내 유명 협력사를 통해 전북 김제, 정읍 등 엄선된 국내 농가로부터 공급 받고 있으며, 매장에서는 전용 슬라이서로 잘라 사용하고 있습니다.'),
	(7, 1, '원재료', '후렌치 후라이는 정말 감자로 만들어지나요?', '맥도날드의 후렌치 후라이는 미국에서 생상된 엄격한 기준을 통과한 품종의 감자로 만들어집니다.'),
	(8, 1, '원재료', '감자에 까만 부분이 있어요, 썩은 것 아닌가요?', '감자 제품에서 간혹 발견되는 검은 부분은 수확 및 보관, 생산 과정에서 감자가 서로 부딪히며 발생하는 멍으로, 원재료의 특성으로 인해 자연스럽게 발생하는 현상입니다. 또는 두꺼운 껍질일 수도 있습니다. 품질에 이상이 있는 것은 아니므로 안심하고 드셔도 됩니다.'),
	(9, 1, '원재료', '감자에 녹색 부분이 보일 때가 있어요. 괜찮은 건가요?', '감자 제품에서 간혹 발견되는 녹색 부분은 감자의 엽록소가 보이는 것으로, 원재료의 특성으로 인해 자연스럽게 발생하는 현상입니다. 품질에 이상이 있는 것은 아니므로 안심하고 드셔도 됩니다.'),
	(10, 1, '원재료', '맥도날드 제품은 최근 이슈(살충제 계란, 유럽 베이컨 이슈)로부터 안전한가요?', '맥도날드에서 사용하는 계란은 축산물품질평가원으로부터 1+ 등급을 받은 최상급의 계란이며, 최근 이루어진 국립농산물품질관리원 등 정부 기관의 전수 조사 결과에서도 적합 판정을 받았습니다. 베이컨 역시 국내산을 주로 사용하며, 일부 제품의 경우 유럽산 베이컨을 사용하고 있으나, 최근 우려를 감안하여 조사를 실시한 결과 전혀 이상 없을을 확인하였습니다.'),
	(11, 1, '원재료', '햄버거 빵 어떻게 만드나요?', '맥도날드의 일반 버거 메뉴에 사용되는 빵은 국내 협력 공장에서 매일 구워 매장으로 배송하며, 생이스트를 사용해 인위적인 시간 단축없이 천천히 발효하여 더욱 건강합니다.'),
	(12, 1, '원재료', '맥카페 커피는 어떤 원두를 사용하나요?', '콜롬비아, 엘살바도르, 브라질 등에서 재배한 100% 아라비카 원두를 사용하며 말레이시아에서 로스팅합니다. 전국 맥도날드 매장에서는 하루 평균 13만장 이상의 커피가 판매되어 항상 신선한 원두 상태를 유지하고 있습니다.'),
	(13, 1, '품질관리', '(비프/포크)패티는 어떻게 조리하나요?', '패티는 그릴이라는 장비를 통해 자동으로 구워집니다. 그릴 위에 패티를 올려 놓고 조리 버튼을 누르면, 그릴의 상단판이 자동으로 내려와 위/아래가 동시에 구워지는 방식이며, 그릴의 상단판은 섭씨 218.5도 하단판은 176.8도의 고온으로 세팅되어 있습니다. 패티의 종류별로 정해진 조리 시간 동안 일정하게 조리되며, 정해진 시간이 종료되면 자동으로 상판이 올라가며 조리가 완료됩니다.'),
	(14, 1, '품질관리', '기름은 얼마나 자주 교체하나요?', '매장에서 사용하는 튀김용 기름은 카놀라유, 하이올레익 해바라기유로 사용하고 있으며, 대부분 제품의 트랜스지방 제로(식약처 표기 기준 의거)를 달성했습니다. 모든 매장은 기름의 산가를 측정하는 3M사의 오일 스트립지를 구비하고 있으며, 매일 기름의 산가를 측정하고 기록하고, 기준 산가를 초과하는 경우 즉기 교체하여 신선한 기름 상태를 유지합니다. 참고로 맥도날드는 관련 법규에서 정한 산가 기준인 3보다 엄격한 2.5의 산가 기준을 자체 적용하고 있습니다.'),
	(15, 1, '품질관리', '패티를 굽는 그릴의 청결은 어떻게 유지하나요?', '그릴판은 매번 사용할 때마다 전용 도구를 이용하여 닦아내며, 매일 그릴 전체를 분리한 뒤 꼼곰히 세척하여 최적의 위상상태를 유지하도록 하고 있습니다.'),
	(16, 1, '품질관리', '소고기 패티 품질 관리 어떻게 하시나요?', '먼저 패티의 재료가 되는 원료육의 온도, 포장, 상태, 원료육 배송 차량의 위생 상태 등을 확인합니다. 패티의 생산 공정에서는 패티의 무게, 두께, 온도, 지방 함량을 측정하고, 패티를 포장하는 단계에서는 패티 제-품의 포장 상태, 외박스 상태를 확인하는 제품 검사를 시행합니다. 또한 이물 혼입 방지를 위해 육안 검사, 금속 검출기 장비를 사용한 2차례의 검출 테스트, X-ray 장비를 사용한 이물 검출 테스트를 시행하고 있습니다. 제품 출고 단계에서는 제품을 배송하는 차량의 위생 상태, 냉동기 상태를 확인한 후 차량에 제품을 상차하며, 제품을 실은 차량의 적재함을 봉인하여 출고하고 있습니다.'),
	(17, 1, '품질관리', '미리 만들어 놓은 버거를 판매하나요?', '맥도날도는 제품을 미리 만들어 놓지 않습니다. 고객이 주문을 하면 햄버거 빵을 토스팅 하는 것을 시작으로 바로 만들어 신선한 제품만을 고객에게 제공하는 메이드 포 유(Made For You)시스템을 운영하고 있습니다.(일부 매장 제외)'),
	(18, 1, '품질관리', '원재료는 어떻게 배송, 보관되나요?', '맥도날드의 모든 매장은 대형 냉장, 냉동고 및 건자재실을 갖추고 있으며, 배송 과정에서는 콜드체인 시스템을 이용해 모든 과정에서 실온, 냉장, 냉동 등 제품에 따라 적정한 온도가 유지되도록 관리하고 있습니다.'),
	(19, 1, '매장위생', '테이블 위생 관리는 어떻게 하나요?', '식사가 끝난 테이블은 전용 세정 타올로 닦아내고 있으며, 깨끗한 환경에서 편안하게 식사를 즐기실 수 있도록 테이블은 항상 위생적으로 관리할 수 있도록 하고 있습니다.'),
	(20, 1, '매장위생', '주방의 위생은 잘 관리되고 있나요?', '맥도날도는 식품 안전을 최우선 가치로 삼아 고객들이 안심하고 드실 수 있는 제품을 제공 드리기 위해 눈에 보이지 않는 부분까지 노력하고 있습니다. 매장에서 근무하는 직원들은 30분 마다 한 번씩 팔꿈치까지 손을 씻고, 교차 오염을 방지하기 위해 조리되지 않은 식품을 만질 때는 파란 장갑을, 조리된 식품이나 조리 도구를 만질 때는 흰 장갑을 끼고 한 번 사용한 장갑은 바로 폐기하는 등 철저한 위생 수칙을 적용하고 있습니다. 뿐만 아니라 모든 조리 도구는 4시간에 한 번씩 세척하고, 식재료의 경우 각각 보관 온도에 따라 매장에 구부된 전용 냉동, 냉장, 건자재실에 구분하여 보관하고, 개봉한 제품에 대해서도 2차 유효기간을 별도 표기, 관리하는 등 식품 안전에 만전을 기하고 있습니다.');

-- 테이블 mcdonalddb.material 구조 내보내기
CREATE TABLE IF NOT EXISTS `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT 'admin테이블의 id참초',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `additional_info` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) NOT NULL,
  `background_img_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.material:~8 rows (대략적) 내보내기
INSERT INTO `material` (`id`, `admin_id`, `title`, `description`, `additional_info`, `img_url`, `background_img_url`) VALUES
	(1, 1, '호주 청정 지역에서 키운 무방부제 & 무첨가제', '맥도날드 쇠고기 패티는 청정한 호주 대자연에서 깨끗함을 먹고 자란 100% 순 쇠고기로만 제조되며, 어떠한 첨가물이나 방부제도 사용되지 않았습니다. ‘쇠고기 이력번호’를 통해 생산부터 유통과정까지 철저하게 확인하고 있으며, 식품 안전 기준에 맞는 쇠고기만을 사용하기 위하여 만전을 기하고 있습니다. ', '쇠고기 이력번호 : 수입쇠고기유통이력관리시스템 사이트에서 조회 시 쇠고기의 세부 정보 (수출국 도축장, 가공장, 수출업체 및 도축, 수입일자 등)를 확인할 수 있는 번호', '/upload/material/1.png', '/upload/material/1-1.jpg'),
	(2, 1, '신선하고 안전한 재료로 엄선하여 만든 치킨 패티', '맥도날드 치킨 패티는 세계보건기구(WHO)에서 공표한 ‘주요항생제리스트(HPCIA)’ 에 포함된 항생제 및 방부제를 사용하지 않으며, 식약처 등 정부에서 인증한 안전한 재료를 사용합니다. 또한, 맥도날드의 동물 복지 기준 (McDonald’s Animal Health & Welfare)을 준수하는 도축장, HACCP & FSSC22000 인증 시설에서 생산됩니다. 맥스파이시 상하이 버거에는 국내산 통 닭가슴살을 사용합니다.  ', 'HPCIA(High Priority Critically Important Antimicrobials) : 사람에게 처방되는 항생제로 동물에게 사용될 경우, 이를 취식하는 사람에게도 영향을 줄 수 있는 항생제', '/upload/material/2.png', '/upload/material/2-1.jpg'),
	(3, 1, '매일 구워 배송 받는 햄버거 빵', '맥도날드에서 사용하는 햄버거 빵은 국제식품안전협회(GFSI*)의 식품안전시스템 규격 인증을 받은 공장에서, 60년 이상의 햄버거 빵 제조 기술을 바탕으로 생산된 우수한 품질의 제품입니다. 신선한 햄버거 빵을 고객들께 제공하게 위해, 하루 수요량에 맞춰 국내에서 직접 구운 햄버거 빵을 사용합니다. 레스토랑으로 배송을 받을 때는 외부 오염을 차단한 전용 탑차를 이용하여 신선도를 유지합니다. ', '맥도날드에서 사용하는 햄버거 빵은 GFSI가 공인하는 식품안전경영시스템 (FSSC-22000)을 인증 받은 공장에서 생산되고 있습니다.', '/upload/material/3.png', '/upload/material/3-1.jpg'),
	(4, 1, '국제적인 우수 농산물 품질 관리 인증 제조사에서 공급하는 신선한 양상추', '농지의 물은 깨끗한지, 토양의 영양분은 풍부한지 농지 주위에 오염 요소는 없는지, 양상추가 자라는 농장부터 꼼꼼히 확인합니다. 수확된 양상추는 3번 이상 꼼꼼하게 세척하며, 신선함을 유지하기 위해 진공으로 포장하여, 가공한 지 2일 이내 배송센터로 배송됩니다.', '자연 재해 등 불가피한 경우가 발생될 경우, 수급 업체가 변동될 수 있습니다.', '/upload/material/4.png', '/upload/material/4-1.jpg'),
	(5, 1, '우리 땅에서 건강하게 키운 100% 국내산 토마토', '맥도날드에서는 우리 땅, 좋은 흙에서 정성껏 재배하여 수확한 100% 국내산 토마토만을 사용합니다. 모든 토마토는 수확 후 식품 안전을 위해 2회 이상을 거쳐 꼼꼼하게 세척되며, 이후 살균 공정 과정까지 거쳐 신선하게 공급됩니다. ', NULL, '/upload/material/5.png', '/upload/material/5-1.jpg'),
	(6, 1, '우수한 품질의 국내산 1+ 등급 계란', '표면 세척과 UV 살균 등 꼼꼼한 위생 처리를 거친 뒤, 레스토랑에서 조리될 때까지 7°C 이하로 냉장 보관되어 최상의 신선함을 자랑합니다.', '자연 재해 등 불가피한 경우가 발생될 경우, 수급 업체가 변동될 수 있습니다.', '/upload/material/6.png', '/upload/material/6-1.jpg'),
	(7, 1, '치즈 본연의 풍미가 가득한 뉴질랜드 방목 치즈', '청정 뉴질랜드의 목초지에서 자연 방목으로 풀을 먹인 젖소의 원류로 제조하여', NULL, '/upload/material/7.png', '/upload/material/7-1.jpg'),
	(8, 1, 'HACCP 인증 완료한 시설에서 공급하는 신선한 양파', '맥도날드에서 사용되는 모든 양파는 최고의 위생 시설과 관리 하에 꼼꼼한 살균과 세척 과정을 거친 후, 진공포장을 통해 더욱 더 안전하고 신선하게 공급됩니다.', NULL, '/upload/material/8.png', '/upload/material/8-1.jpg');

-- 테이블 mcdonalddb.option 구조 내보내기
CREATE TABLE IF NOT EXISTS `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '옵션 이름(양상추, 피클 등등)',
  `price` int(11) NOT NULL COMMENT '개당 가격',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.option:~7 rows (대략적) 내보내기
INSERT INTO `option` (`id`, `name`, `price`) VALUES
	(1, '감자튀김', 1600),
	(2, '사이다', 1500),
	(3, '치즈', 700),
	(4, '마요네즈', 300),
	(5, '베이컨', 500),
	(6, '양상추', 500),
	(7, '토마토', 500);

-- 테이블 mcdonalddb.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '누가 주문했는지(user테이블의 id 가져옴)',
  `store_id` int(11) NOT NULL COMMENT '어느 지점에서 주문했는지(store테이블의 id 가져옴)',
  `status` enum('주문대기','조리중','배달중','배달완료') NOT NULL DEFAULT '주문대기' COMMENT '주문 상태(ENUM은 ()안에 있는 값만 넣을 수 있음)',
  `total_price` int(11) NOT NULL COMMENT '총 가격',
  `cancel_yn` tinyint(1) NOT NULL DEFAULT 0 COMMENT '주문 취소 여부(기본 false)',
  `created_at` datetime NOT NULL COMMENT '주문한 DATE',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.order:~0 rows (대략적) 내보내기

-- 테이블 mcdonalddb.ordermenu 구조 내보내기
CREATE TABLE IF NOT EXISTS `ordermenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '어떤 주문인지',
  `product_id` int(11) NOT NULL COMMENT '어떤 상품인지',
  `quantity` int(11) NOT NULL COMMENT '수량',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `ordermenu_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordermenu_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.ordermenu:~0 rows (대략적) 내보내기

-- 테이블 mcdonalddb.orderoption 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderMenu_id` int(11) NOT NULL COMMENT '어떤 주문인지',
  `option_id` int(11) NOT NULL COMMENT '어떤 상품인지',
  `quantity` int(11) NOT NULL COMMENT '수량',
  PRIMARY KEY (`id`),
  KEY `orderMenu_id` (`orderMenu_id`),
  KEY `option_id` (`option_id`),
  CONSTRAINT `orderoption_ibfk_1` FOREIGN KEY (`orderMenu_id`) REFERENCES `ordermenu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderoption_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.orderoption:~0 rows (대략적) 내보내기

-- 테이블 mcdonalddb.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 아이디 (기본키)',
  `sub_category_id` int(11) NOT NULL COMMENT '서브카테고리 아이디 참조',
  `admin_id` int(11) NOT NULL COMMENT 'admin테이블의 id참초',
  `product_category` tinyint(1) NOT NULL COMMENT '세트, 단품 여부',
  `k_name` varchar(255) NOT NULL COMMENT '한국어 상품 이름',
  `e_name` varchar(255) NOT NULL COMMENT '영어 상품 이름',
  `thumbnail_img_url` varchar(255) NOT NULL COMMENT '썸네일 이미지 경로',
  `seq` int(11) NOT NULL COMMENT '표시될 순서',
  `description` varchar(255) NOT NULL COMMENT '상품 설명',
  `sale_start_time` varchar(255) DEFAULT NULL COMMENT '판매 시작 시간',
  `sale_end_time` varchar(255) DEFAULT NULL COMMENT '판매 종료 시간',
  `llergen_information` varchar(255) DEFAULT NULL COMMENT '알러지 정보',
  `cuntry_of_origin` varchar(255) DEFAULT NULL COMMENT '원산지',
  `price` int(11) NOT NULL COMMENT '상품 가격',
  `created_at` datetime NOT NULL COMMENT '등록일',
  PRIMARY KEY (`id`),
  KEY `sub_category_id` (`sub_category_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 mcdonalddb.product:~104 rows (대략적) 내보내기
INSERT INTO `product` (`id`, `sub_category_id`, `admin_id`, `product_category`, `k_name`, `e_name`, `thumbnail_img_url`, `seq`, `description`, `sale_start_time`, `sale_end_time`, `llergen_information`, `cuntry_of_origin`, `price`, `created_at`) VALUES
	(1, 1, 1, 0, '더블 비프 미트칠리 버거', 'Double Beef Meat Chili Burger', '/upload/product/1669777596825.png', 1, '진한 고기맛 살리는 미트칠리소스에 상큼한 사워크림, 순쇠고기 100% 패티 2장과 짭조롬한 치즈와 베이컨까지!연말엔 더블 비프 미트칠리 버거!', '10:30', '04:00', '(난류,우유,대두,밀,토마토,쇠고기)', '쇠고기:호주산 돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 8300, '2023-11-02 00:46:04'),
	(2, 1, 1, 0, '미트칠리 BLT 버거', 'Meat Chili BLT Burger', '/upload/product/1669776925356.png', 2, '진한 고기맛 살리는 미트칠리 소스에 상큼한 사워크림,신선한 양상추와 토마토까지!미트칠리 BLT 버거', '10:30', '04:00', '(난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산 돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 7800, '2023-11-02 00:46:04'),
	(3, 1, 1, 0, '빅맥®', 'Big Mac®', '/upload/product/1583727841393.png', 3, '100% 순 쇠고기 패티 두 장에 빅맥®만의 특별한 소스.입안에서 살살 녹는 치즈와 신선한 양상추, 양파, 그리고 피클까지.50년 넘게 전 세계인의 입맛을 사로 잡은 버거의 대명사.', '08:00', '24:00', '(난류,우유,대두,밀,쇠고기)', '쇠고기:호주산', 6300, '2023-11-02 00:46:04'),
	(4, 1, 1, 0, '더블 쿼터파운더® 치즈', 'Double Quarter Pounder® with Cheese', '/upload/product/1583727487454.png', 4, '좋아하는건 더 많이 즐기시라고,두 배 이상 커진 1/4 파운드 비프 패티가 두 장 (226그램)! 육즙이 풍부한 고기 맛을그대로 살린 100% 순 쇠고기 패티 두 장과치즈 두 장이 입안 가득 완벽하게 조화되는 놀라운 맛', '10:30', '04:00', '(우유,대두,밀,토마토,쇠고기)', '쇠고기:호주산', 8200, '2023-11-02 00:46:04'),
	(5, 1, 1, 0, '쿼터파운더® 치즈', 'Quarter Pounder® with Cheese', '/upload/product/1583728183515.png', 5, '쿼터파운더라는 이름에서 알 수 있듯이 두 배 이상 커진 1/4파운드(113그램) 비프와부드러운 치즈 두 장의 환상궁합!두툼한 순 쇠고기 패티와 신선한 치즈의풍부한 맛으로 세계적으로 사랑받고 있는맥도날드의 대표적인 프리미엄 버거', '10:30', '04:00', '(우유,대두,밀,토마토,쇠고기)', '쇠고기:호주산', 6300, '2023-11-02 00:46:04'),
	(6, 1, 1, 0, '맥크리스피™ 디럭스 버거', 'McCrispy™ Deluxe Burger', '/upload/product/1653436835912.png', 6, '100% 통닭다리살 겉바속촉 케이준 치킨 패티,촉촉한 포테이토 브리오쉬 번, 스페셜 스모키 소스가 선사하는 놀랍도록 새로운 맛의 치킨 버거!', '10:30', '04:00', ' (난류,우유,대두,밀,토마토,닭고기,쇠고기)', '닭고기:브라질산 또는 태국산', 7600, '2023-11-02 00:46:04'),
	(7, 1, 1, 0, '맥크리스피™ 클래식 버거', 'McCrispy™ Classic Burger', '/upload/product/1653436573153.png', 7, '100% 통닭다리살 겉바속촉 케이준 치킨 패티!치킨 버거 본연의 맛에 충실한 클래식 버거', '10:30', '04:00', ' (난류,우유,대두,밀,토마토,닭고기,쇠고기)', '닭고기:브라질산 또는 태국산', 6700, '2023-11-02 00:46:04'),
	(8, 1, 1, 0, '맥스파이시® 상하이 버거', 'McSpicy® Shanghai Burger', '/upload/product/1583728339451.png', 8, '매콤한 시즈닝을 입힌 100% 닭가슴 통살 위에아삭아삭한 양상추와 신선한 토마토~겉은 바삭, 속은 부드러운 치킨 패티의 매콤함으로입맛도 기분도 화끈하게!', '10:30', '04:00', ' (난류,대두,밀,토마토,닭고기)', '닭고기:국내산', 6300, '2023-11-02 00:46:04'),
	(9, 1, 1, 0, '1955® 버거', '1955® Burger', '/upload/product/1599119588089.png', 9, '113g 두툼한 순 쇠고기 패티,특별한 1955 소스에 깊은 풍미의 그릴드 어니언까지!맥도날드가 처음 생긴 1955년의 맛을 담은영원한 오리지널 1955 버거', '10:30', '04:00', ' (난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 7200, '2023-11-02 00:46:04'),
	(10, 1, 1, 0, '맥치킨® 모짜렐라', 'McChicken® Mozzarella', '/upload/product/1583727633823.png', 10, '든든한 맥치킨에 골든 모짜렐라 치즈 스틱 2개와매콤한 아라비아따 소스를 더해 강렬하게 재탄생한 맥치킨 모짜렐라!', '10:30', '04:00', '(난류,우유,대두,밀,토마토,닭고기)', '닭고기:국내산', 5800, '2023-11-02 00:46:04'),
	(11, 1, 1, 0, '맥치킨®', 'McChicken®', '/upload/product/1583730322955.png', 11, '바삭한 치킨 패티, 고소한 화이트 마요 소스와아삭한 양상추가 함께! 더 업그레이드된 맛으로 돌아온 맥치킨', '10:30', '04:00', ' (난류,대두,밀,닭고기)', '닭고기:국내산', 4300, '2023-11-02 00:46:04'),
	(12, 1, 1, 0, '더블 불고기 버거', 'Double Bulgogi Burger', '/upload/product/1583727299888.png', 12, '진한 불고기 소스의 패티가 두 장!여기에 고소한 치즈와 마요네즈, 신선한 양상추를 곁들인 깊고 풍부한 맛.', '10:30', '04:00', '(난류,우유,대두,밀,돼지고기,조개,굴)', '돼지고기:국내산', 5400, '2023-11-02 00:46:04'),
	(13, 1, 1, 0, '에그 불고기 버거', 'Egg Bulgogi Burger', '/upload/product/1644572710018.png', 13, '불고기 버거에 국내산 1+등급 계란을 더해맛의 정점을 찍다!', '10:30', '04:00', '(난류,대두,밀,돼지고기,조개,굴)', '돼지고기:국내산', 4700, '2023-11-02 00:46:04'),
	(14, 1, 1, 0, '불고기 버거', 'Bulgogi Burger', '/upload/product/1583727790570.png', 14, '한국인의 입맛에 딱 맞는 불고기 소스에잘 재운 패티와 고소한 마요네즈,신선한 양상추의 맛있는 조합.', '10:30', '04:00', ' (난류,대두,밀,돼지고기,조개,굴)', '돼지고기:국내산', 4000, '2023-11-02 00:46:04'),
	(15, 1, 1, 0, '슈슈 버거', 'Supreme Shrimp Burger', '/upload/product/1583727985443.png', 15, '탱~글한 통새우살 가득~ 슈슈 버거!', '10:30', '04:00', '(난류,우유,대두,밀,토마토,새우,쇠고기,굴)', '새우패티:태국산', 5500, '2023-11-02 00:46:04'),
	(16, 1, 1, 0, '슈비 버거', 'Shrimp Beef Burger', '/upload/product/1583727896884.png', 16, '탱~글한 통새우살에 비프 패티를 더해 푸짐하게~슈비 버거', '10:30', '04:00', '(난류,우유,대두,밀,토마토,새우,쇠고기,굴)', '새우패티:태국산 쇠고기:호주산', 6600, '2023-11-02 00:46:04'),
	(17, 1, 1, 1, '더블 비프 미트칠리 버거 세트', 'Double Beef Meat Chili Burger EVM', '/upload/product/1669777706184.png', 1, '진한 고기맛 살리는 미트칠리 소스에 상큼한 사워크림,순쇠고기 100% 패티 2장과 짭조롬한 치즈와 베이컨까지!연말엔 더블 비프 미트칠리 버거!', '10:30', '04:00', '(난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 9700, '2023-11-02 00:46:04'),
	(18, 1, 1, 1, '미트칠리 BLT 버거 세트', 'Meat Chili BLT Burger EVM', '/upload/product/1669777095888.png', 2, '진한 고기맛 살리는 미트칠리 소스에 상큼한 사워크림,신선한 양상추와 토마토까지!미트칠리 BLT 버거', '10:30', '04:00', '(난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 8200, '2023-11-02 00:46:04'),
	(19, 1, 1, 1, '빅맥® 세트', 'Big Mac® Meal', '/upload/product/1614163214488.png', 3, '100% 순 쇠고기 패티 두 장에 빅맥®만의 특별한 소스.입안에서 살살 녹는 치즈와 신선한 양상추, 양파, 그리고 피클까지.50년 넘게 전 세계인의 입맛을 사로 잡은 버거의 대명사.', '10:30', '04:00', '(난류,우유,대두,밀,쇠고기)', '쇠고기:호주산', 10400, '2023-11-02 00:46:04'),
	(20, 1, 1, 1, '더블 쿼터파운더® 치즈 세트', 'Double Quarter Pounder®with Cheese Meal', '/upload/product/1583730166912.png', 4, '좋아하는건 더 많이 즐기시라고,두 배 이상 커진 1/4 파운드비프 패티가 두 장 (226그램)!육즙이 풍부한 고기 맛을그대로 살린 100% 순 쇠고기 패티 두 장과치즈 두 장이 입안 가득 완벽하게 조화되는 놀라운 맛', '10:30', '04:00', '(우유,대두,밀,토마토,쇠고기)', '쇠고기:호주산', 8900, '2023-11-02 00:46:04'),
	(21, 1, 1, 1, '쿼터파운더® 치즈 세트', 'Quarter Pounder®with Cheese Meal', '/upload/product/1583730926203.png', 5, '쿼터파운더라는 이름에서 알 수 있듯이두 배 이상 커진 1/4파운드(113그램) 비프와부드러운 치즈 두 장의 환상궁합!두툼한 순 쇠고기 패티와 신선한 치즈의풍부한 맛으로 세계적으로 사랑받고 있는맥도날드의 대표적인 프리미엄 버거', '10:30', '04:00', '(우유,대두,밀,토마토,쇠고기)', '쇠고기:호주산', 8900, '2023-11-02 00:46:04'),
	(22, 1, 1, 1, '맥크리스피™ 디럭스 버거 세트', 'McCrispy™ Deluxe Burger Meal', '/upload/product/1653437184803.png', 6, '100% 통닭다리살 겉바속촉 케이준 치킨 패티,촉촉한 포테이토 브리오쉬 번, 스페셜 스모키 소스가선사하는 놀랍도록 새로운 맛의 치킨 버거!', '10:30', '04:00', '(난류,우유,대두,밀,토마토,닭고기,쇠고기)', '닭고기:브라질산 또는 태국산', 9200, '2023-11-02 00:46:04'),
	(23, 1, 1, 1, '맥크리스피™ 클래식 버거 세트', 'McCrispy™ Classic Burger Meal', '/upload/product/1653437044613.png', 7, '100% 통닭다리살 겉바속촉 케이준 치킨 패티!치킨 버거 본연의 맛에 충실한 클래식 버거', '10:30', '04:00', '(난류,우유,대두,밀,토마토,닭고기,쇠고기)', '닭고기:브라질산 또는 태국산', 8700, '2023-11-02 00:46:04'),
	(24, 1, 1, 1, '맥스파이시® 상하이 버거 세트', 'McSpicy® Shanghai BurgerMeal', '/upload/product/1614163251951.png', 8, '매콤한 시즈닝을 입힌 100% 닭가슴 통살 위에아삭아삭한 양상추와 신선한 토마토~겉은 바삭, 속은 부드러운 치킨 패티의 매콤함으로 입맛도 기분도 화끈하게!', '10:30', '04:00', '(난류,대두,밀,토마토,닭고기).', '닭고기:국내산', 10200, '2023-11-02 00:46:04'),
	(25, 1, 1, 1, '1955® 버거 세트', '1955®Burger Meal', '/upload/product/1599120019760.png', 9, '113g 두툼한 순 쇠고기 패티,특별한 1955 소스에 깊은 풍미의 그릴드 어니언까지!맥도날드가 처음 생긴 1955년의 맛을 담은영원한 오리지널 1955 버거', '10:30', '04:00', '(난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 10000, '2023-11-02 00:46:04'),
	(26, 2, 1, 0, '더블 비프 미트칠리 버거 세트', 'Double Beef Meat Chili Burger EVM', '/upload/product/1669777828657.png', 1, '진한 고기맛 살리는 미트칠리 소스에 상큼한 사워크림,순쇠고기 100% 패티 2장과 짭조롬한 치즈와 베이컨까지!연말엔 더블 비프 미트칠리 버거!', '10:30', '14:00', '(난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 8900, '2023-11-02 00:46:04'),
	(27, 2, 1, 0, '미트칠리 BLT 버거 세트', 'Meat Chili BLT Burger EVM', '/upload/product/1669777460555.png', 2, '진한 고기맛 살리는 미트칠리 소스에 상큼한 사워크림,신선한 양상추와 토마토까지!미트칠리 BLT 버거', '10:30', '14:00', '(난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 8400, '2023-11-02 00:46:04'),
	(28, 2, 1, 0, '빅맥® 세트', 'Big Mac® Meal', '/upload/product/1631113397418.png', 3, '100% 순 쇠고기 패티 두 장에 빅맥®만의 특별한 소스.입안에서 살살 녹는 치즈와 신선한 양상추, 양파, 그리고 피클까지.50년 넘게 전 세계인의 입맛을 사로 잡은 버거의 대명사.', '10:30', '14:00', '(난류,우유,대두,밀,쇠고기)', '쇠고기:호주산', 6100, '2023-11-02 00:46:04'),
	(29, 2, 1, 0, '맥크리스피™ 디럭스 버거 세트', 'McCrispy™ Deluxe Burger Meal', '/upload/product/1653438170756.png', 4, '100% 통닭다리살 겉바속촉 케이준 치킨 패티,촉촉한 포테이토 브리오쉬 번, 스페셜 스모키 소스가선사하는 놀랍도록 새로운 맛의 치킨 버거!', '10:30', '14:00', '(난류,우유,대두,밀,토마토,닭고기,쇠고기)', '닭고기:브라질산 또는 태국산', 7500, '2023-11-02 00:46:04'),
	(30, 2, 1, 0, '맥스파이시® 상하이 버거 세트', 'McSpicy® Shanghai Burger Meal', '/upload/product/1631113277763.png', 5, '매콤한 시즈닝을 입힌 100% 닭가슴 통살 위에아삭아삭한 양상추와 신선한 토마토~겉은 바삭, 속은 부드러운 치킨 패티의 매콤함으로 입맛도 기분도 화끈하게!', '10:30', '14:00', '(난류,대두,밀,토마토,닭고기)', '닭고기:국내산', 6100, '2023-11-02 00:46:04'),
	(31, 2, 1, 0, '1955® 버거 세트', '1955® Burger Meal', '/upload/product/1631113417090.png', 6, '113g 두툼한 순 쇠고기 패티,더 풍성해진 신선한 양상추,깊은 풍미의 그릴드 어니언까지!맥도날드가 처음 생긴 1955년의 맛을 담은영원한 오리지널 1955 버거', '10:30', '14:00', '(난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 7000, '2023-11-02 00:46:04'),
	(32, 2, 1, 0, '더블 불고기 버거 세트', 'Double Bulgogi Burger Meal', '/upload/product/1631113219963.png', 7, '진한 불고기 소스의 패티가 두 장!여기에 고소한 치즈와 마요네즈,신선한 양상추를 곁들인 깊고 풍부한 맛.', '10:30', '14:00', '(난류,우유,대두,밀,돼지고기,조개,굴)', '돼지고기:국내산', 6000, '2023-11-02 00:46:04'),
	(33, 2, 1, 0, '베이컨 토마토 디럭스 세트', 'Bacon Tomato Deluxe Meal', '/upload/product/1631113355471.png', 8, '두 장의 100% 순 쇠고기 패티에 그릴에 구워더욱 고소한 1장의 베이컨을 얹고,신선한 토마토와 양상추,매콤달콤한 스위트 칠리 소스, 치즈, 마요네즈를 더해더욱 풍부하고 신선한 맛의 프리미엄 버거', '10:30', '14:00', '(난류,우유,대두,밀,돼지고기,토마토,쇠고기)', '쇠고기:호주산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 8900, '2023-11-02 00:46:04'),
	(34, 3, 1, 0, '베이컨 토마토 에그 머핀', 'BLT Egg Muffin', '/upload/product/1646207398160.png', 1, '갓 구워내 따뜻하고 신선한베이컨 토마토 에그 머핀', '04:00', '10:30', '(난류,대두,밀,돼지고기,토마토)', '케네디언베이컨:미국산', 4900, '2023-11-02 00:46:04'),
	(35, 3, 1, 0, '치킨 치즈 머핀', 'Chicken \'n Cheese Muffin', '/upload/product/1597032732299.png', 2, '바삭한 치킨 패티와 고소한 치즈로 아침에도 든든하게!', '04:00', '10:30', '(난류,우유,대두,밀,닭고기)', '닭고기:국내산', 5300, '2023-11-02 00:46:04'),
	(36, 3, 1, 0, '에그 맥머핀', 'Egg McMuffin', '/upload/product/prol_201901290308474630.png', 3, '캐나디안 스타일 베이컨과 계란의 클래식한 만남,맥도날드의 아침을 탄생하게 한 바로 그 메뉴.', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '캐네디언베이컨:미국산', 4400, '2023-11-02 00:46:04'),
	(37, 3, 1, 0, '베이컨 에그 맥머핀', 'Bacon Egg McMuffin', '/upload/product/prol_201901290309065310.png', 4, '부드러운 계란, 바삭바삭한 베이컨과 고소한 치즈가갓 구워진 따뜻한 맥머핀®', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 4600, '2023-11-02 00:46:04'),
	(38, 3, 1, 0, '소시지 에그 맥머핀', 'Sausage Egg McMuffin', '/upload/product/prol_201903190244458360.png', 5, '잉글리쉬 머핀 위에 먹음직스럽게 올려진 치즈와 계란,그리고 촉촉한 소시지 패티의 맛있는 조화!', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '돼지고기:국내산 *제주 지역의 경우, 포크소세지패티:미국산으로 제공', 4800, '2023-11-02 00:46:04'),
	(39, 3, 1, 0, '상하이 치킨 스낵랩', 'Shanghai Chicken Snack Wrap', '/upload/product/prol_201902080435011620.png', 6, '매콤한 치킨에 달콤한 화이트 마요 소스로 매콤달콤하게!베이컨에 양상추, 또띠아까지 어우러져씹는 맛까지 즐겁다!', '04:00', '10:30', '(난류,대두,밀,돼지고기,닭고기)', '닭고기:국내산돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 3800, '2023-11-02 00:46:04'),
	(40, 3, 1, 0, '디럭스 브렉퍼스트', 'Deluxe Breakfast', '/upload/product/prol_201901290309431230.png', 7, '정통 아메리칸 스타일의 브렉퍼스트와 달콤한 핫케익을 함께~프리미엄한 주말 브런치를 매일 즐겨보세요.', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '돼지고기:국내산 *제주 지역의 경우, 포크소세지패티:미국산으로 제공', 3600, '2023-11-02 00:46:04'),
	(41, 3, 1, 0, '핫케익 3조각', 'Hotcakes 3pcs', '/upload/product/1562814414746.jpg', 8, '부드럽게 구워낸 핫케이크에 향긋한 버터와달콤한 시럽을 살며시 부어 오늘 하루도 기분 좋게 시작하세요.', '04:00', '10:30', '(난류,우유,대두,밀)', NULL, 3800, '2023-11-02 00:46:04'),
	(42, 3, 1, 0, '핫케익 2조각', 'Hotcakes 2pcs', '/upload/product/prol_201902111059484920.png', 9, '부드럽게 구워낸 핫케이크에향긋한 버터와 달콤한 시럽을 살며시 부어오늘 하루도 기분 좋게 시작하세요.', '04:00', '10:30', '(난류,우유,대두,밀)', NULL, 3000, '2023-11-02 00:46:04'),
	(43, 3, 1, 1, '베이컨 토마토 에그 머핀 세트', 'BLT Egg Muffin Extra Value Breakfast', '/upload/product/1677677491958.png', 1, '100% 아라비카로 내린 드립 커피와 갓 구워내 따뜻하고 신선한 베이컨 토마토 에그 머핀 세트', '04:00', '10:30', ' (난류,대두,밀,돼지고기,토마토)', '케네디언베이컨:미국산', 5600, '2023-11-02 00:46:04'),
	(44, 3, 1, 1, '에그 맥머핀 콤보', 'Egg McMuffin Combo', '/upload/product/1677677924172.png', 2, '100% 아라비카로 내린 드립 커피와 신선한 에그 맥머핀, 커피 한 잔 가격으로 가볍게 즐기는 맥모닝 콤보!', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '캐네디언베이컨:미국산', 6000, '2023-11-02 00:46:04'),
	(45, 3, 1, 1, '베이컨 에그 맥머핀 콤보', 'Bacon Egg McMuffin Combo', '/upload/product/1677677806357.png', 3, '100% 아라비카로 내린 드립 커피와 신선한 베이컨 에그 맥머핀, 커피 한 잔 가격으로 가볍게 즐기는 맥모닝 콤보!', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 5900, '2023-11-02 00:46:04'),
	(46, 3, 1, 1, '소시지 에그 맥머핀 콤보', 'Sausage Egg McMuffin Combo', '/upload/product/1677677669331.png', 4, '100% 아라비카로 내린 드립 커피와 신선한 소시지 에그 맥머핀, 커피 한 잔 가격으로 가볍게 즐기는 맥모닝 콤보!', '04:00', '10:30', ' (난류,우유,대두,밀,돼지고기)', '돼지고기:국내산 *제주 지역의 경우, 포크소세지패티:미국산으로 제공', 7100, '2023-11-02 00:46:04'),
	(47, 3, 1, 1, '치킨 치즈 머핀 세트', 'Chicken \'n Cheese Muffin Extra Value Breakfast', '/upload/product/1677678001535.png', 5, '100% 아라비카로 내린 드립 커피와 바삭한 치킨 패티와 고소한 치즈로 아침에도 든든하게!', '04:00', '10:30', '(난류,우유,대두,밀,닭고기)', '닭고기:국내산', 5500, '2023-11-02 00:46:04'),
	(48, 3, 1, 1, '에그 맥머핀 세트', 'Egg McMuffin Extra Value Breakfast', '/upload/product/1677678451419.png', 6, '100% 아라비카로 내린 드립 커피와 바삭바삭 고소한 해쉬 브라운, 신선한 에그 맥머핀으로 즐기는 제대로 된 아침 식사. 이제 맥모닝 세트로 아침을 깨워보세요.', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '캐네디언베이컨:미국산', 5600, '2023-11-02 00:46:04'),
	(49, 3, 1, 1, '베이컨 에그 맥머핀 세트', 'Bacon Egg McMuffin Extra Value Breakfast', '/upload/product/1677678333145.png', 7, '100% 아라비카로 내린 드립 커피와 바삭바삭 고소한 해쉬 브라운, 신선한 베이컨 에그 맥머핀으로 즐기는 제대로 된 아침 식사. 이제 맥모닝 세트로 아침을 깨워보세요.', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 6600, '2023-11-02 00:46:04'),
	(50, 3, 1, 1, '소시지 에그 맥머핀 세트', 'Sausage Egg McMuffin Extra Value Breakfast', '/upload/product/1677678228583.png', 8, '100% 아라비카로 내린 드립 커피와 바삭바삭 고소한 해쉬 브라운, 신선한 소시지 에그 맥머핀으로 즐기는 제대로 된 아침 식사. 이제 맥모닝 세트로 아침을 깨워보세요.', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '돼지고기:국내산 *제주 지역의 경우, 포크소세지패티:미국산으로 제공', 7800, '2023-11-02 00:46:04'),
	(51, 4, 1, 0, '소시지 스낵랩', 'Sausage Snack Wrap', '/upload/product/1697009350071.png', 1, '육즙 가득 든든한 소시지에 짭조롬한 베이컨까지! 소시지 스낵랩', NULL, NULL, '(난류,대두,밀,돼지고기,쇠고기)', '돼지고기:국내산과 미국산 섞음 돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 3100, '2023-11-02 00:46:04'),
	(52, 4, 1, 0, '타로 파이', 'Taro Pie', '/upload/product/1697009525219.png', 2, '달콤한 보랏빛 디저트! 맥도날드 타로 파이', '10:30', '04:00', '(난류,우유,대두,밀)', NULL, 1800, '2023-11-02 00:46:04'),
	(53, 4, 1, 0, '아이스 아메리카노 M', 'Iced Americano', '/upload/product/1697007523063.png', 3, '바로 내린 100% 친환경 커피로 더 신선하게! 더 풍부하게!', NULL, NULL, NULL, NULL, 3000, '2023-11-02 00:46:04'),
	(54, 4, 1, 0, '카페 라떼 M', 'Café Late', '/upload/product/1697008722625.png', 4, '바로 내린 100% 친환경 커피가 신선한 우유를 만나 더 신선하고 부드럽게!', NULL, NULL, '(우유)', NULL, 2500, '2023-11-02 00:46:04'),
	(55, 4, 1, 0, '코카-콜라 M', 'Coca-Cola', '/upload/product/1697008508333.png', 5, '갈증해소 뿐만이 아니라 기분까지 상쾌하게! 코카-콜라', NULL, NULL, NULL, NULL, 2500, '2023-11-02 00:46:04'),
	(56, 4, 1, 0, '골든 모짜렐라 치즈스틱 2조각', 'Golden Mozzarella Cheese Sticks 2pcs', '/upload/product/1686627165567.png', 6, '속이 꽉 찬 황금빛 바삭함! 자연 모짜렐라 치즈로 빈틈 없이 고소한 맥도날드 치즈스틱을 즐겨보세요!', NULL, NULL, '(우유,대두,밀)', NULL, 3500, '2023-11-02 00:46:04'),
	(57, 4, 1, 0, '맥스파이시® 치킨 텐더 2조각', 'McSpicy® Chicken Tenders 2pcs', '/upload/product/1697007871561.png', 7, '부드러운 100% 닭안심살을 스파이시 시즈닝으로 매콤 바삭하게 튀겨낸 치킨 텐더!', NULL, NULL, '(대두,밀,닭고기)', '닭고기:국내산', 4000, '2023-11-02 00:46:04'),
	(58, 5, 1, 0, '소시지 스낵랩', 'Sausage Snack Wrap', '/upload/product/1697007357140.png', 1, '육즙 가득 든든한 소시지에 짭조롬한 베이컨까지! 소시지 스낵랩', NULL, NULL, '(난류,대두,밀,돼지고기,쇠고기)', '돼지고기:국내산과 미국산 섞음 돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 3100, '2023-11-02 00:46:04'),
	(59, 5, 1, 0, '토마토 치킨 스낵랩', 'Tomato Chicken Snack Wrap', '/upload/product/1698645087433.png', 2, '상큼한 토마토와 바삭한 치킨의 조합! 매콤한 스파이시 어니언 소스로 더 맛있게!', NULL, NULL, '(난류,우유,대두,밀,토마토,닭고기,쇠고기,굴)', '닭고기:국내산', 3500, '2023-11-02 00:46:04'),
	(60, 5, 1, 0, '코울슬로', 'Coleslaw', '/upload/product/1676460052498.png', 3, '양배추, 당근, 양파가 상큼하고 크리미한 마요 드레싱과 어우러져 아삭하게 씹히는 샐러드', NULL, NULL, '(난류,대두,조개,굴)', NULL, 2100, '2023-11-02 00:46:04'),
	(61, 5, 1, 0, '상하이 치킨 스낵랩', 'Shanghai Chicken Snack Wrap', '/upload/product/prol_201902080435011620.png', 4, '매콤한 치킨에 달콤한 화이트 마요 소스로 매콤달콤하게! 베이컨에 양상추, 또띠아까지 어우러져 씹는 맛까지 즐겁다!', NULL, NULL, '(난류,대두,밀,돼지고기,닭고기)', '닭고기:국내산 돼지고기(베이컨):외국산(아일랜드,스페인,캐나다)', 3500, '2023-11-02 00:46:04'),
	(62, 5, 1, 0, '골든 모짜렐라 치즈스틱', 'Golden Mozzarella Cheese Sticks', '/upload/product/prol_201902080435496530.png', 5, '속이 꽉 찬 황금빛 바삭함! 자연 모짜렐라 치즈로 빈틈 없이 고소한 맥도날드 치즈스틱을 2조각과 4조각으로 다양하게 즐겨보세요!', NULL, NULL, '(우유,대두,밀)', NULL, 2500, '2023-11-02 00:46:04'),
	(63, 5, 1, 0, '후렌치 후라이', 'French Fries', '/upload/product/prol_201902070318045120.png', 6, '통으로 썰어낸 감자를 맥도날드만의 노하우로 튀겨낸 남다른 맛과 바삭함! 맥도날드의 역사가 담긴 월드 클래스 후렌치 후라이', NULL, NULL, '(대두)', NULL, 2000, '2023-11-02 00:46:04'),
	(64, 5, 1, 0, '맥너겟®', 'McNuggets®', '/upload/product/1612402125092.png', 7, '바삭하고 촉촉한 치킨이 한 입에 쏙! 다양한 소스로 입맛에 맞게 즐겨보세요!', NULL, NULL, '(대두,밀,닭고기)', '닭고기:국내산', 3000, '2023-11-02 00:46:04'),
	(65, 5, 1, 0, '맥스파이시®치킨 텐더', 'McSpicy® Chicken Tenders', '/upload/product/1612402237089.png', 8, '부드러운 100% 닭안심살을 스파이시 시즈닝으로 매콤 바삭하게 튀겨낸 치킨 텐더! 2가지 소스로 입맛에 맞게 즐겨보세요!', NULL, NULL, '(대두,밀,닭고기)', '닭고기:국내산', 3400, '2023-11-02 00:46:04'),
	(66, 5, 1, 0, '해쉬 브라운', 'Hash Brown', '/upload/product/1563759767701.jpg', 9, '씹으면 바삭바삭, 속은 부드러운 감자의 고소함.', '04:00', '10:30', '(대두)', NULL, 1900, '2023-11-02 00:46:04'),
	(67, 5, 1, 1, '타로 파이', 'Taro Pie', '/upload/product/1697007247509.png', 1, '달콤한 보랏빛 디저트! 맥도날드 타로 파이', '10:30', '04:00', '(난류,우유,대두,밀)', NULL, 1800, '2023-11-02 00:46:04'),
	(68, 5, 1, 1, '베리 스트로베리 맥플러리', 'Very Strawberry McFlurry', '/upload/product/1617837791724.png', 2, '신선한 1등급 원유에 국내산 딸기 과즙이 들어간 스트로베리 아이스크림에 오레오가 블랜드 되어 있는 맥플러리', NULL, NULL, '(우유,대두,밀)', NULL, 3000, '2023-11-02 00:46:04'),
	(69, 5, 1, 1, '오레오 맥플러리', 'Oreo McFlurry', '/upload/product/1615378570338.png', 3, '우유 듬뿍 신선한 아이스크림에 아삭아삭 오레오 쿠키가 가득!', NULL, NULL, '(우유,대두,밀)', NULL, 2700, '2023-11-02 00:46:04'),
	(70, 5, 1, 1, '딸기 오레오 맥플러리', 'Strawberry Oreo McFlurry', '/upload/product/1615378501027.png', 4, '상큼한 딸기와 달콤한 오레오 쿠키가 신선한 우유 아이스크림에 퐁당!', NULL, NULL, '(우유,대두,밀)', NULL, 3000, '2023-11-02 00:46:04'),
	(71, 5, 1, 1, '초코 오레오 맥플러리', 'Choco Oreo McFlurry', '/upload/product/1615378442605.png', 5, '초콜릿 퍼지와 오레오 쿠키까지! 달달함이 두 배로!', NULL, NULL, '(우유,대두,밀)', NULL, 2700, '2023-11-02 00:46:04'),
	(72, 5, 1, 1, '스트로베리콘', 'Strawberry Cone', '/upload/product/1617838116835.png', 6, '신선한 1등급 원유와 딸기과즙으로 만든 아이스크림', NULL, NULL, '(우유,밀)', NULL, 1500, '2023-11-02 00:46:04'),
	(73, 5, 1, 1, '아이스크림콘', 'Ice Cream Cone', '/upload/product/prol_201902041118158920.png', 7, '신선한 우유로 만든 부드러운 아이스크림 콘. 이전 메뉴다음 메뉴 영양정보', NULL, NULL, '(우유,밀)', NULL, 1100, '2023-11-02 00:46:04'),
	(74, 5, 1, 1, '바닐라 선데이 아이스크림', 'Vanilla Sundae', '/upload/product/1657246835409.png', 8, '신선한 우유로 만든 부드럽고 달콤한 아이스크림', NULL, NULL, '(우유)', NULL, 1100, '2023-11-02 00:46:04'),
	(75, 5, 1, 1, '초코 선데이 아이스크림', 'Chocolate Sundae', '/upload/product/prol_201901290248295110.png', 9, '신선한 우유로 만든 아이스크림에 달콤한 초콜렛 시럽이 입안 가득.', NULL, NULL, '(우유)', NULL, 1600, '2023-11-02 00:46:04'),
	(76, 6, 1, 0, '자두 천도복숭아 칠러', 'Plum Peach Chiller', '/upload/product/1698851151138.png', 1, '상콤한 자두와 달콤한 천도복숭아의 만남!\n자두 천도복숭아 칠러\n\n*일부 매장 판매 제외', NULL, NULL, ' (복숭아)', NULL, 3700, '2023-11-02 00:46:04'),
	(77, 6, 1, 0, '제주 한라봉 칠러', 'Jeju Hallabong Chiller', '/upload/product/1698851151138.png', 2, '제주 한라봉의\n상큼새콤한 맛과 향을 즐겨보세요!\n\n*일부 매장 판매 제외', NULL, NULL, NULL, NULL, 3700, '2023-11-02 00:46:04'),
	(78, 6, 1, 0, '바닐라 라떼', 'Plum Peach Chiller', '/upload/product/1698851151138.png', 3, '바로 내린 100% 친환경 커피의 진한 맛과 향,\n1A등급 우유, 그리고 천연 바닐라 향으로 달콤함까지!', NULL, NULL, ' (우유)', NULL, 4500, '2023-11-02 00:46:04'),
	(79, 6, 1, 0, '아이스 바닐라 라떼', 'Iced Vanilla Latte', '/upload/product/1654652258015.png', 4, '바로 내린 100% 친환경 커피의 진한 맛과 향,\n1A등급 우유, 그리고 천연 바닐라 향으로 달콤함까지!', NULL, NULL, ' (우유)', NULL, 4500, '2023-11-02 00:46:04'),
	(80, 6, 1, 0, '카페라떼', 'Café Latte', '/upload/product/1677680098077.png', 5, '바로 내린 100% 친환경 커피가 신선한 우유를 만나\n더 신선하고 부드럽게!', NULL, NULL, ' (우유)', NULL, 4000, '2023-11-02 00:46:04'),
	(81, 6, 1, 0, '디카페인 카페라떼', 'Decaffeine Café Latte', '/upload/product/1677679191098.png', 6, '바로 내린 100% 친환경 커피가 신선한 우유를 만나 더 신선하고 부드럽게!\n\n*일부 매장 판매 제외', NULL, NULL, ' (우유)', NULL, 4200, '2023-11-02 00:46:04'),
	(82, 6, 1, 0, '아이스 카페라떼', 'Iced Café Latte', '/upload/product/1610885438226.png', 7, '바로 내린 100% 친환경 커피가 신선한 우유를 만나 더 신선하고 부드럽게!', NULL, NULL, ' (우유)', NULL, 4000, '2023-11-02 00:46:04'),
	(83, 6, 1, 0, '디카페인 아이스 카페라떼', 'Decaffeine Iced Café Latte', '/upload/product/1610887213766.png', 8, '바로 내린 100% 친환경 커피가 신선한 우유를 만나 더 신선하고 부드럽게!\n\n*일부 매장 판매 제외', NULL, NULL, ' (우유)', NULL, 4200, '2023-11-02 00:46:04'),
	(84, 6, 1, 0, '아메리카노', 'Americano', '/upload/product/1677680268942.png', 9, '바로 내린 100% 친환경 커피로\n더 신선하게! 더 풍부하게!', NULL, NULL, 'null', NULL, 3300, '2023-11-02 00:46:04'),
	(85, 6, 1, 1, '코카-콜라', 'Coca-Cola', '/upload/product/1583889953745.png', 1, '갈증해소 뿐만이 아니라 기분까지 상쾌하게! 코카-콜라', NULL, NULL, 'null', NULL, 2400, '2023-11-02 00:46:04'),
	(86, 6, 1, 1, '코카-콜라 제로', 'Coca-Cola Zero', '/upload/product/1583890010342.png', 2, '상쾌한 맛은 살리면서 웰빙 트렌드에 맞춰\n설탕과 칼로리를 제로로 줄인 코카-콜라 제로', NULL, NULL, 'null', NULL, 2400, '2023-11-02 00:46:04'),
	(87, 6, 1, 1, '스프라이트', 'Sprite', '/upload/product/1631160642498.png', 3, '청량함에 레몬, 라임향을 더한 시원함!', NULL, NULL, 'null', NULL, 2400, '2023-11-02 00:46:04'),
	(88, 6, 1, 1, '환타', 'Fanta', '/upload/product/1631160682409.png', 4, '톡 쏘는 오렌지 향!', NULL, NULL, 'null', NULL, 2400, '2023-11-02 00:46:04'),
	(89, 6, 1, 1, '바닐라 쉐이크 Medium', 'Vanilla Shake Medium', '/upload/product/prol_201901290255488970.png', 5, '신선한 우유에 달콤한 바닐라 시럽으로 맛을 더한\n깔끔한 쉐이크!', NULL, NULL, ' (우유)', NULL, 3500, '2023-11-02 00:46:04'),
	(90, 6, 1, 1, '딸기 쉐이크 Medium', 'Strawberry Shake Medium', '/upload/product/prol_201901290257347040.png', 6, '신선한 우유에 상큼한 딸기 시럽으로 맛을 더한\n부드러운 쉐이크!', NULL, NULL, ' (우유)', NULL, 3500, '2023-11-02 00:46:04'),
	(91, 6, 1, 1, '초코 쉐이크 Medium', 'Chocolate Shake Medium', '/upload/product/prol_201901290257444640.png', 7, '신선한 우유에 달콤함 초코렛 시럽이 들어간\n부드러운 쉐이크!', NULL, NULL, ' (우유)', NULL, 3500, '2023-11-02 00:46:04'),
	(92, 7, 1, 0, '에그 맥머핀', 'Egg McMuffin', '/upload/product/prol_201901290308474630.png', 1, '캐나디안 스타일 베이컨과 계란의 클래식한 만남,\n맥도날드의 아침을 탄생하게 한 바로 그 메뉴.', '04:00', '10:30', '(난류,우유,대두,밀,돼지고기)', '캐네디언베이컨:미국산', 2500, '2023-11-02 00:46:04'),
	(93, 7, 1, 0, '핫케익 2조각', 'Hotcakes 2pcs', '/upload/product/prol_201902111059484920.png', 2, '부드럽게 구워낸 핫케이크에\n향긋한 버터와 달콤한 시럽을 살며시 부어\n오늘 하루도 기분 좋게 시작하세요.', '04:00', '10:30', '(난류,우유,대두,밀)', NULL, 2300, '2023-11-02 00:46:04'),
	(94, 7, 1, 0, '딸기 코코넛 푸딩', 'Strawberry Coconut Pudding', '/upload/product/1671607055254.png', 3, '새콤 달콤 딸기 퓨레와 코코넛 젤리를 한 입에\n먹을 수 있는 부드러운 딸기 코코넛 푸딩', NULL, NULL, '(우유,대두,토마토)', NULL, 1000, '2023-11-02 00:46:04'),
	(95, 7, 1, 0, '해쉬 브라운', 'Hash Brown', '/upload/product/1671607055254.png', 4, '씹으면 바삭바삭,\n속은 부드러운 감자의 고소함.', '04:00', '10:30', '(대두)', NULL, 1000, '2023-11-02 00:46:04'),
	(96, 7, 1, 0, '생수', 'Mineral Water', '/upload/product/prol_201901290258201750.png', 5, '활력을 되찾아주는 깔끔한 미네랄 생수.', NULL, NULL, NULL, NULL, 1000, '2023-11-02 00:46:04'),
	(97, 7, 1, 0, '오렌지 주스', 'Orange Juice', '/upload/product/1641520279171.png', 6, '비타민 C를 함유한 4년 연속 세계 판매 1위 100% 오렌지 주스.', NULL, NULL, NULL, NULL, 1000, '2023-11-02 00:46:04'),
	(98, 7, 1, 1, '불고기 버거', 'Bulgogi Burger', '/upload/product/1583727790570_2.png', 1, '한국인의 입맛에 딱 맞는 불고기 소스에\n잘 재운 패티와 고소한 마요네즈,\n신선한 양상추의 맛있는 조합.', '10:30', '04:00', '(난류,대두,밀,돼지고기,조개,굴)', '돼지고기:국내산', 4000, '2023-11-02 00:46:04'),
	(99, 7, 1, 1, '햄버거', 'Bulgogi Burger', '/upload/product/1583727790570_2.png', 2, '100% 순 쇠고기 패티에 상큼한 피클과 양파,\n기본에 충실한 맥도날드 햄버거.', '10:30', '04:00', ' (대두,밀,토마토,쇠고기)', '쇠고기:호주산', 3300, '2023-11-02 00:46:04'),
	(100, 7, 1, 1, '맥너겟® 4조각', 'McNuggets® 4pcs', '/upload/product/1612402426518_2.png', 3, '바삭하고 촉촉한 치킨이 한 입에 쏙!\n다양한 소스로 입맛에 맞게 즐겨보세요!', NULL, NULL, '(대두,밀,닭고기)', '닭고기:국내산', 3400, '2023-11-02 00:46:04'),
	(101, 7, 1, 1, '딸기 코코넛 푸딩', 'Strawberry Coconut Pudding', '/upload/product/1671607055254_2.png', 4, '새콤 달콤 딸기 퓨레와 코코넛 젤리를 한 입에\n먹을 수 있는 부드러운 딸기 코코넛 푸딩', NULL, NULL, '(우유,대두,토마토)', NULL, 1000, '2023-11-02 00:46:04'),
	(102, 7, 1, 1, '후렌치 후라이 Small', 'French Fries Small', '/upload/product/1671607055254_2.png', 5, '통으로 썰어낸 감자를 맥도날드만의 노하우로 튀겨낸 남다른 맛과 바삭함!\n맥도날드의 역사가 담긴 월드 클래스 후렌치 후라이', '10:30', '04:00', '(대두)', NULL, 2000, '2023-11-02 00:46:04'),
	(103, 7, 1, 1, '생수', 'Mineral Water', '/upload/product/prol_201901290258201750_2.png', 6, '활력을 되찾아주는 깔끔한 미네랄 생수.', NULL, NULL, NULL, NULL, 1000, '2023-11-02 00:46:04'),
	(104, 7, 1, 1, '오렌지 주스', 'Orange Juice', '/upload/product/1641520279171_2.png', 7, '비타민 C를 함유한 4년 연속 세계 판매 1위 100% 오렌지 주스.', NULL, NULL, NULL, NULL, 1000, '2023-11-02 00:46:04');

-- 테이블 mcdonalddb.slider 구조 내보내기
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '슬라이더 타입',
  `content_url` varchar(255) NOT NULL COMMENT '슬라이더안에 들어갈 이미지, 동영상 저장 경로',
  `duration` int(11) NOT NULL COMMENT '슬라이더 넘어가는 시간',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.slider:~10 rows (대략적) 내보내기
INSERT INTO `slider` (`id`, `type`, `content_url`, `duration`) VALUES
	(1, 'image', '/upload/main/1.jpg', 5000),
	(2, 'video', '/upload/main/1.mp4', 30000),
	(3, 'image', '/upload/main/2.jpg', 5000),
	(4, 'image', '/upload/main/3.jpg', 5000),
	(5, 'image', '/upload/main/4.jpg', 5000),
	(6, 'image', '/upload/main/5.jpg', 5000),
	(7, 'image', '/upload/main/6.jpg', 5000),
	(8, 'image', '/upload/main/7.jpg', 5000),
	(9, 'image', '/upload/main/8.jpg', 5000),
	(10, 'image', '/upload/main/9.jpg', 5000);

-- 테이블 mcdonalddb.store 구조 내보내기
CREATE TABLE IF NOT EXISTS `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL COMMENT '지점명',
  `phone` varchar(20) NOT NULL COMMENT '지점 전화번호',
  `address` varchar(100) NOT NULL COMMENT '주소',
  `start_time` varchar(255) NOT NULL COMMENT '판매 시작 시간',
  `end_time` varchar(255) NOT NULL COMMENT '판매 종료 시간',
  `latitude` float NOT NULL COMMENT '위도 좌표',
  `longitude` float NOT NULL COMMENT '경도 좌표',
  `yn_24h` tinyint(1) NOT NULL DEFAULT 0 COMMENT '24시간 운영 여부(시작시간이 00이고 종료시간이 24면 true넣고 아니면 false)',
  `yn_mcmorning` tinyint(1) NOT NULL DEFAULT 0 COMMENT '맥모닝 파는지 여부',
  `yn_mcdrive` tinyint(1) NOT NULL DEFAULT 0 COMMENT '맥드라이브 여부',
  `yn_mcdelivery` tinyint(1) NOT NULL DEFAULT 0 COMMENT '맥딜리버리 여부',
  `yn_parking` tinyint(1) NOT NULL DEFAULT 0 COMMENT '주차 가능 여부',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.store:~32 rows (대략적) 내보내기
INSERT INTO `store` (`id`, `store_name`, `phone`, `address`, `start_time`, `end_time`, `latitude`, `longitude`, `yn_24h`, `yn_mcmorning`, `yn_mcdrive`, `yn_mcdelivery`, `yn_parking`) VALUES
	(1, '명지대점', '010-1111-1111', '서울 서대문구 남가좌동 324-3', '08:00', '24:00', 37.5799, 126.925, 0, 0, 0, 0, 0),
	(2, '수원 망포 DT', '010-2222-1111', '경기 수원시 영통구 망포동 21-1', '08:00', '24:00', 37.2461, 127.054, 0, 0, 0, 0, 1),
	(3, '인천계산DT', '010-3333-1111', '인천 계양구 계산동 1083-3', '08:00', '24:00', 37.5343, 126.738, 0, 0, 0, 1, 0),
	(4, '경산정평DT', '010-4444-1111', '경북 경산시 정평동 147-6', '08:00', '24:00', 35.8346, 128.727, 0, 0, 0, 1, 1),
	(5, '옥포 SK DT', '010-5555-1111', '경남 거제시 옥포동 551-1', '08:00', '24:00', 34.8887, 128.692, 0, 0, 1, 0, 0),
	(6, '제천DT점', '010-6666-2222', '충북 제천시 청전동 165-5', '08:00', '24:00', 37.1452, 128.214, 0, 0, 1, 0, 1),
	(7, '충남논산DT', '010-7777-2222', '충남 논산시 내동 343-1', '08:00', '24:00', 36.1888, 127.096, 0, 0, 1, 1, 0),
	(8, '대전한남대DT점', '010-8888-1111', '대전 대덕구 중리동 230-15', '08:00', '24:00', 36.3584, 127.421, 0, 0, 1, 1, 1),
	(9, '군산이마트', '010-9999-2222', '전북 군산시 경암동 590-296', '08:00', '24:00', 35.9826, 126.735, 0, 1, 0, 0, 0),
	(10, '여수이마트', '010-0000-2222', '전남 여수시 오림동 405-1', '08:00', '24:00', 34.758, 127.715, 0, 1, 0, 0, 1),
	(11, '대구 수성DT', '010-1111-2222', '대구 수성구 수성동4가 1020-2', '08:00', '24:00', 35.8599, 128.619, 0, 1, 0, 1, 0),
	(12, '울산옥동 DT', '010-1111-3333', '울산 남구 신정동 1639-36', '08:00', '24:00', 35.5338, 129.3, 0, 1, 0, 1, 1),
	(13, '해운대DT', '010-2222-4444', '부산 해운대구 우동 626-13', '08:00', '24:00', 35.1601, 129.16, 0, 1, 1, 0, 0),
	(14, '제주서귀포DT', '010-2222-5555', '제주특별자치도 서귀포시 서귀동 284-29', '08:00', '24:00', 33.2533, 126.563, 0, 1, 1, 0, 1),
	(15, '판교테크노밸리', '010-2222-6666', '경기 성남시 분당구 삼평동 680', '08:00', '24:00', 37.4012, 127.109, 0, 1, 1, 1, 0),
	(16, '평택서정 DT점', '010-2222-7777', '경기 평택시 서정동 779-5', '08:00', '24:00', 37.0697, 127.064, 0, 1, 1, 1, 1),
	(17, '강남 2호점', '010-2222-8888', '서울 강남구 역삼동 822-2', '00:00', '24:00', 37.4986, 127.029, 1, 0, 0, 0, 0),
	(18, '잠실역', '010-2222-9999', '서울 송파구 신천동 7-25', '00:00', '24:00', 37.515, 127.1, 1, 0, 0, 0, 1),
	(19, '남극', '010-9999-9999', '남극기지', '00:00', '24:00', -62.2232, -58.788, 1, 1, 1, 1, 1),
	(20, '서울교대점', '010-2222-0000', '서울 서초구 서초동 1674-5', '00:00', '24:00', 37.4941, 127.016, 1, 0, 0, 1, 0),
	(21, '수원GS DT', '010-3333-3333', '경기 수원시 권선구 권선동 1029', '00:00', '24:00', 37.2949, 127.048, 1, 0, 0, 1, 1),
	(22, '여의도', '010-3333-4444', '서울 영등포구 여의도동 23', '00:00', '24:00', 37.5249, 126.925, 1, 0, 1, 0, 0),
	(23, '합정메세나폴리스', '010-3333-5555', '서울 마포구 서교동 490', '00:00', '24:00', 37.5508, 126.913, 1, 0, 1, 0, 1),
	(24, '울산 일산 DT', '010-3333-6666', '울산 동구 일산동 951-5', '00:00', '24:00', 35.4982, 129.428, 1, 0, 1, 1, 0),
	(25, '가산디지털', '010-3333-7777', '서울 금천구 가산동 50-3', '00:00', '24:00', 37.4816, 126.883, 1, 0, 1, 1, 1),
	(26, '명동 2호점', '010-3333-8888', '서울 중구 회현동3가 1-5', '00:00', '24:00', 37.5606, 126.985, 1, 1, 0, 0, 0),
	(27, '신도림 디큐브', '010-3333-9999', '서울 구로구 신도림동 692', '00:00', '24:00', 37.5093, 126.89, 1, 1, 0, 0, 1),
	(28, '중앙대', '010-4444-4444', '서울 동작구 흑석동 221', '00:00', '24:00', 37.5065, 126.959, 1, 1, 0, 1, 0),
	(29, '종로 3', '010-5555-5555', '서울 종로구 종로3가 10', '00:00', '24:00', 37.5706, 126.991, 1, 1, 0, 1, 1),
	(30, '쌍문DT점', '010-6666-6666', '서울 도봉구 쌍문동 700', '00:00', '24:00', 37.6537, 127.037, 1, 1, 1, 0, 0),
	(31, '양재', '010-7777-7777', '서울 서초구 양재동 24', '00:00', '24:00', 37.4825, 127.036, 1, 1, 1, 0, 1),
	(32, '서울역', '010-8888-9999', '서울 용산구 동자동 43-205', '00:00', '24:00', 37.5541, 126.971, 1, 1, 1, 1, 0);

-- 테이블 mcdonalddb.subcategory 구조 내보내기
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL COMMENT '버튼에 들어갈 텍스트',
  `name` varchar(255) NOT NULL COMMENT '버튼에 들어갈 텍스트',
  `seq` int(11) NOT NULL COMMENT '표시될 순서',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.subcategory:~19 rows (대략적) 내보내기
INSERT INTO `subcategory` (`id`, `category_id`, `name`, `seq`) VALUES
	(1, 1, '버거', 1),
	(2, 1, '맥런치', 2),
	(3, 1, '맥모닝', 3),
	(4, 1, '해피 스낵', 4),
	(5, 1, '사이드 & 디저트', 5),
	(6, 1, '맥카페 & 음료', 6),
	(7, 1, '해피밀', 7),
	(8, 2, '매장찾기', 1),
	(9, 2, '맥딜리버리', 2),
	(10, 2, '맥드라이브', 3),
	(11, 2, '임차문의', 4),
	(12, 3, '프로모션', 1),
	(13, 3, '새로운 소식', 2),
	(14, 3, '이달의 해피밀', 3),
	(15, 4, '브랜드 소개', 1),
	(16, 4, '맥도날드 사회적 책임', 2),
	(17, 4, '맥도날드 품질 이야기', 3),
	(18, 4, '맥도날드 경쟁력', 4),
	(19, 4, '맥도날드 사람들', 5);

-- 테이블 mcdonalddb.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '(기본키)',
  `email` varchar(255) NOT NULL COMMENT 'ID(이메일)',
  `pwd` varchar(128) NOT NULL COMMENT '비밀번호',
  `salt` varchar(200) NOT NULL COMMENT '암호화할때 쓴 난수',
  `user_name` varchar(20) NOT NULL COMMENT '이름',
  `phone` varchar(20) NOT NULL COMMENT '회원 전화번호',
  `address` varchar(100) NOT NULL COMMENT '주소',
  `detail_address` varchar(100) NOT NULL COMMENT '상세주소',
  `birth` date NOT NULL COMMENT '생년월일',
  `created_at` datetime NOT NULL COMMENT '회원 가입일',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.user:~1 rows (대략적) 내보내기
INSERT INTO `user` (`id`, `email`, `pwd`, `salt`, `user_name`, `phone`, `address`, `detail_address`, `birth`, `created_at`) VALUES
	(1, 'qwer@naver.com', 'c49bc8aadbed70c77ec4d196d51221565da1c451e0ff0b3d02a254768478eb3888cf7502608bc52a85204c31e5bff30c8a73c7e07e863233843663c725f4c5f9', '1K3HIBb1Bwx0+C7j1a7hygFdPb+jzHmf+rKVT2I6KdC5JCHGN1a215B4g+IlMmYCV41qnZtoBwA7pIELgBwGF7WAb5kJguEszA69SCoQI2xoRT3XvU3wOYI8i5FXyLanC86cHscFI6ludXMzdObEa6GgtP5RuPUx0zgFPi95uUA=', '홍길동', '01012345678', '경기 성남시 분당구 삼평동 636', '1104동 601호', '2000-12-25', '2023-12-28 20:29:04');

-- 테이블 mcdonalddb.visualbackgrounds 구조 내보내기
CREATE TABLE IF NOT EXISTS `visualbackgrounds` (
  `id` varchar(20) NOT NULL COMMENT '(기본키)',
  `title` varchar(255) NOT NULL COMMENT '타이틀',
  `subCopy` varchar(255) DEFAULT NULL COMMENT '서브',
  `backgroundImage` varchar(255) DEFAULT NULL COMMENT '배경이미지url',
  `path` varchar(255) NOT NULL COMMENT '주소(배열형태)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.visualbackgrounds:~0 rows (대략적) 내보내기

-- 테이블 mcdonalddb.whatsnew 구조 내보내기
CREATE TABLE IF NOT EXISTS `whatsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_id` int(11) NOT NULL COMMENT '서브카테고리 참조',
  `thumbnail_img_url` varchar(255) DEFAULT NULL COMMENT '썸네일 이미지 주소',
  `title` varchar(255) NOT NULL COMMENT '타이틀',
  `seq` int(11) NOT NULL COMMENT '표시될 순서',
  `read_count` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
  `content_img_url` varchar(255) NOT NULL COMMENT '내용의 이미지 주소',
  `created_at` date NOT NULL DEFAULT curdate() COMMENT '글 생성일(YYYY-MM-DD)',
  PRIMARY KEY (`id`),
  KEY `sub_category_id` (`sub_category_id`),
  CONSTRAINT `whatsnew_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 mcdonalddb.whatsnew:~11 rows (대략적) 내보내기
INSERT INTO `whatsnew` (`id`, `sub_category_id`, `thumbnail_img_url`, `title`, `seq`, `read_count`, `content_img_url`, `created_at`) VALUES
	(1, 12, '/upload/whatsNew/promotion/1700550501889.jpg', '신선한 토마토와 매콤한 소스의 만남!', 1, 0, '/upload/whatsNew/promotion/1679374416681.jpg', '2023-11-02'),
	(2, 12, '/upload/whatsNew/promotion/1701069859118.jpg', '미트칠리 버거와 연말을 더 특별하게', 2, 0, '/upload/whatsNew/promotion/1701410863762.jpg', '2023-11-02'),
	(3, 12, '/upload/whatsNew/promotion/1696925069360.jpg', '갓성비 간식 맛집, 맥도날드 해피 스낵!', 3, 0, '/upload/whatsNew/promotion/1697093210662.jpg', '2023-11-02'),
	(4, 12, '/upload/whatsNew/promotion/1696768788564.jpg', '맥도날드 M오더', 4, 0, '/upload/whatsNew/promotion/1698130994298.jpg', '2023-11-02'),
	(5, 12, '/upload/whatsNew/promotion/1680500594149.jpg', '상콤달콤!\n NEW 자두 천도복숭아 칠러 출시!', 5, 0, '/upload/whatsNew/promotion/1680713561787.jpg', '2023-11-02'),
	(6, 12, '/upload/whatsNew/promotion/1679374416689.jpg', '첫 적립 시 2000 포인트 제공!\n 새로워진 마이 맥도날드 리워드!', 6, 0, '/upload/whatsNew/promotion/1680855222777.jpg', '2023-11-02'),
	(7, 13, NULL, '주방 공개 행사 잠정 중단 안내의 건', 1, 0, '/upload/whatsNew/news/20200227151443c34e6d0a-f3c3-4794-8336-681581d69c78.png', '2023-11-02'),
	(8, 13, NULL, '디카페인 커피 미판매 매장 안내', 2, 0, '/upload/whatsNew/news/20200813172607f99a21af-d316-427d-9066-8b30f98d9dbb.png', '2023-11-02'),
	(9, 13, NULL, '칠러 미판매 매장 안내', 3, 0, '/upload/whatsNew/news/20221101110610fb51d8ae-9d97-48ce-aef9-19731e049789.png', '2023-11-02'),
	(10, 13, NULL, '맥도날드 모바일 쿠폰 사용 제외 매장 안내', 4, 0, '/upload/whatsNew/news/20230823114647535aba5b-cb5a-4e30-91cb-ea9324be7534.png', '2023-11-02'),
	(11, 14, '/upload/whatsNew/happyMeal/1698301310196.jpg', '입양하세요!\n귀여운 애완 동물들을\n맥도날드 해피밀 토이로 만나보세요!', 1, 0, '/upload/whatsNew/happyMeal/1698285826592.jpg', '2023-11-02');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
