-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2023 at 03:23 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelscrap`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_08_25_002423_create_scraped_data_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scraped_data`
--

CREATE TABLE `scraped_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `BookName` text NOT NULL,
  `Author` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scraped_data`
--

INSERT INTO `scraped_data` (`id`, `BookName`, `Author`, `created_at`, `updated_at`) VALUES
(1, 'رواية أماريتا .. أرض زيكولا 2', 'عمرو عبد الحميد', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(2, 'رواية في قلبي انثى عبرية', 'خولة حمدي', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(3, 'رواية الشيطان يحكي', 'أحمد خالد مصطفى', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(4, 'رواية أرض زيكولا', 'عمرو عبد الحميد', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(5, 'رواية وادي الذئاب المنسية', 'عمرو عبد الحميد', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(6, 'رواية ليطمئن قلبي', 'أدهم شرقاوي', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(7, 'رواية قواعد العشق الأربعون', 'أليف شافاك', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(8, 'رواية انت لي الجزء الثاني', 'منى المرشود', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(9, 'رواية عوالم سفلية', 'سامح شوقي', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(10, 'رواية فتاة الياقة الزرقاء', 'عمرو عبد الحميد', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(11, 'رواية بيت خالتي', 'أحمد خيري العمري', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(12, 'رواية الليالي البيضاء', 'فيودور دوستويفسكي', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(13, 'رواية قواعد جارتين', 'عمرو عبد الحميد', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(14, 'رواية أوبال', 'حنان لاشين', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(15, 'رواية 11:11 رب خرافة خير من ألف واقع', 'يوسف جاسم رمضان', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(16, 'رواية الخيميائي', 'باولو كويلو', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(17, 'رواية كونسيلر', 'نرمين نحمدالله', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(18, 'رواية قبل أن تبرد القهوة الجزء الأول', 'توشيكازو كواغوشي', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(19, 'رواية بحيرة العشق', 'عبدالله بوموزة', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(20, 'رواية الأسود يليق بك', 'أحلام مستغانمي', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(21, 'رواية ولنا في الحلال لقاء', 'أحمد عطا', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(22, 'رواية أحببتها في انتقامي', 'عليا حمدي', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(23, 'رواية مكتبة منتصف الليل', 'مات هيغ', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(24, 'رواية شيفرة دافنشي', 'دان براون', '2023-08-24 22:11:36', '2023-08-24 22:11:36'),
(25, 'رواية انت لي الجزء الأول', 'منى المرشود', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(26, 'رواية سقطرى', 'حنان لاشين', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(27, 'رواية غربة الياسمين', 'خولة حمدي', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(28, 'رواية الحفرة عودة ياماتش', 'جوكهان هورزوم', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(29, 'رواية حياتك الثانية تبدأ حين تدرك أن لديك حياة واحدة', 'رافاييل جيوردانو', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(30, 'كتاب كبرت ونسيت أن أنسى', 'بثينة العيسى', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(31, 'كتاب رواء مكة', 'حسن أوريد', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(32, 'رواية إيكادولي', 'حنان لاشين', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(33, 'رواية أبابيل', 'أحمد آل حمدان', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(34, 'رواية أمانوس', 'حنان لاشين', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(35, 'رواية شجرتي شجرة البرتقال الرائعة', 'جوزيه ماورو', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(36, 'رواية سينابون - النسخة الكاملة', 'نرمين نحمدالله', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(37, 'رواية في ممر الفئران', 'أحمد خالد توفيق', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(38, 'رواية مئة عام من العزلة', 'غابرييل غارسيا ماركيز', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(39, 'رواية كويكول مملكة البلاغة 4', 'حنان لاشين', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(40, 'رواية أنتيخريستوس 2', 'أحمد خالد مصطفى', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(41, 'كتاب أن تبقى', 'خولة حمدي', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(42, 'رواية خوف', 'أسامة المسلم', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(43, 'رواية نبض', 'أدهم شرقاوي', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(44, 'كتاب أرني أنظر إليك', 'خولة حمدي', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(45, 'رواية ياسمين العودة', 'خولة حمدي', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(46, 'رواية جارية في ثياب ملكية', 'نرمين نحمدالله', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(47, 'رواية القصر الأسود', 'منى سلامة', '2023-08-24 22:12:28', '2023-08-24 22:12:28'),
(48, 'رواية الجزار', 'حسن الجندي', '2023-08-24 22:12:28', '2023-08-24 22:12:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `scraped_data`
--
ALTER TABLE `scraped_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scraped_data`
--
ALTER TABLE `scraped_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
