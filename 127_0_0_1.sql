-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 21 Nis 2024, 21:59:05
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `dildershanesi`
--
CREATE DATABASE IF NOT EXISTS `dildershanesi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dildershanesi`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `konu_anlatimi_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `konu_anlatimi_id`, `course_id`, `topic_id`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 3, 1, 2, 1, '2024-04-20 16:46:20', '2024-04-20 16:46:20');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `excerpt` text NOT NULL,
  `slug` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `courses`
--

INSERT INTO `courses` (`id`, `title`, `excerpt`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'İngilizce', '<p class=\"mt-3 text-gray-500\">         İngilizce grammer ve kelimelerini sıfırdan zirveye kadar öğren.Özellikle <strong>YDT</strong> ve         <strong>YÖKDİL</strong> sınavlarına uygun hazırlanmış müfredatla ingilizcenin hakimi ol.     </p>', 'english', '2024-04-19 16:22:07', '2024-04-19 16:22:07');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `konu_anlatimi`
--

CREATE TABLE `konu_anlatimi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `sirasi` int(11) NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `konu_anlatimi`
--

INSERT INTO `konu_anlatimi` (`id`, `title`, `body`, `sirasi`, `topic_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, '<div>\r\n<p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.<p>\r\n</div>', '\"Be\" konusu part 1,Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.', 1, 1, 1, '2024-04-19 16:26:07', '2024-04-19 16:26:07'),
(3, '<span class=\"text-blue-500\">\"Be\" Konusu</span>', '<div class=\"bg-white rounded-lg shadow-md p-4 mb-6\">\n  <p class=\"font-semibold\">İngilizce Dilinin en temel yapı taşlarından olan “Be” olmak fiili özneye göre am/is/are şeklini alarak kullanılır.</p>\n</div>\n\n<div class=\"bg-white rounded-lg shadow-md p-4 mb-6\">\n  <p class=\"font-semibold\">Örnek olarak:</p>\n  <ul class=\"list-disc list-inside\">\n    <li><strong>I am busy</strong> -> Ben meşgulüm.</li>\n    <li><strong>You are happy</strong> -> Sen mutlusun.</li>\n    <li><strong>He is a police</strong> -> O bir polis (erkek).</li>\n    <li><strong>She is unhappy</strong> -> O mutsuz (kız).</li>\n    <li><strong>It is a cat</strong> -> O bir kedi (O burada insan hariç herhangi bir şey olduğu için ‘it’).</li>\n    <li><strong>We are married</strong> -> Biz evliyiz.</li>\n    <li><strong>You are students</strong> -> Siz öğrencilersiniz.</li>\n    <li><strong>They are early</strong> -> Onlar erkenciler (erken gelmişler anlamında).</li>\n  </ul>\n</div>\n\n<div class=\"bg-white rounded-lg shadow-md p-4 mb-6\">\n  <p class=\"font-semibold\">Be fiilinin olumsuzu kendisinden sonra “not” eklenerek yapılır.</p>\n  <p class=\"font-semibold\">Örnek:</p>\n  <ul class=\"list-disc list-inside\">\n    <li><strong>I am not busy</strong> -> Meşgul değilim.</li>\n    <li><strong>You are not happy</strong> -> Mutlu değilsin.</li>\n    <li><strong>He is not a police</strong> -> O bir polis değil (erkek için).</li>\n    <li><strong>She is not unhappy</strong> -> O mutsuz değil (kadın için).</li>\n    <li><strong>It is not a cat</strong> -> O bir kedi değil (It insan hariç her türlü öznenin yerini tutar).</li>\n    <li><strong>We are not married</strong> -> Biz evli değiliz.</li>\n    <li><strong>You are not students</strong> -> Siz öğrenci değilsiniz.</li>\n    <li><strong>They are not early</strong> -> Onlar erkenci değiller.</li>\n  </ul>\n</div>\n\n<div class=\"bg-white rounded-lg shadow-md p-4 mb-6\">\n  <p class=\"font-semibold\">Be Fiilinin sorusu “Be” yi başa getirilerek yapılır.</p>\n  <p class=\"font-semibold\">Örnek:</p>\n  <ul class=\"list-disc list-inside\">\n    <li><strong>Am I busy?</strong> -> Meşgul müyüm?</li>\n    <li><strong>Are you happy?</strong> -> Mutlu musun?</li>\n    <li><strong>Is he a police?</strong> -> O (erkek için) bir polis mi?</li>\n    <li><strong>Is she unhappy?</strong> -> O (kız için) mutsuz mu?</li>\n    <li><strong>Is it a cat?</strong> -> O (insan hariç) bir kedi mi?</li>\n    <li><strong>Are we married?</strong> -> Evli miyiz?</li>\n    <li><strong>Are you students?</strong> -> Öğrenci misiniz?</li>\n    <li><strong>Are they early?</strong> -> Erkenciler mi?</li>\n  </ul>\n</div>', 2, 2, 1, '2024-04-20 02:19:58', '2024-04-20 02:19:58'),
(4, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.<p> </div>', '\"Be\" konusu part 1,Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.', 3, 3, 1, '2024-04-20 02:25:43', '2024-04-20 02:25:43'),
(6, '\"Be\" İkinci Kısım Gramer', '<p><strong>One</strong> -> bir</p>\r\n<p><strong>Two</strong> -> iki</p>\r\n<p><strong>Three</strong> -> üç</p>\r\n<p><strong>Four</strong> -> dört</p>\r\n<p><strong>Five</strong> -> beş</p>\r\n<p><strong>Six</strong> -> altı</p>\r\n<p><strong>Seven</strong> -> yedi</p>\r\n<p><strong>Eight</strong> -> sekiz</p>\r\n<p><strong>Nine</strong> -> dokuz</p>\r\n<p><strong>Ten</strong> -> on</p>\r\n<p><strong>Eleven</strong> -> on bir</p>\r\n<p><strong>Twelve</strong> -> on iki</p>\r\n<p><strong>Thirteen</strong> -> on üç</p>\r\n<p><strong>Fourteen</strong> -> on dört</p>\r\n<p><strong>Fifteen</strong> -> on beş</p>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>burdan sonrakilere sadece -teen ekleniyor olucak. Örneğin sixteen -> on altı vb.</p>\r\n</div>\r\n<p><strong>Thirty</strong> -> otuz</p>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>burdan sonrakilerde Thirty + numara yazılıyor olacak.Örneğin,otuz yedi -> thirty seven</p>\r\n</div>\r\n<p><strong>Fourty</strong> -> kırk</p>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>burdan sonrakilerde Fourty + numara yazılıyor olacak.Örneğin,kırk iki -> fourty two</p>\r\n</div>\r\n<p><strong>Fifty</strong> -> Elli</p>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>burdan sonrakilerde Fifty + numara yazılıyor olacak.Örneğin,elli beş-> fifty five</p>\r\n</div>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>Burdan sonraki ondalık sayı ilerleyişi de sayı+ty olacak ilerliyor olucak.Örneğin,60-> sixty vb.</p>\r\n</div>\r\n<p><strong>One hundred</strong> -> yüz</p>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>Bundan sonra üstekki verilen bilgileri birleştirerek ilerleyebilirsiniz.</p>\r\n</div>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>Not: bazen hundred’tan sonra and koyulabilir.özellikle ingilizceyi pek anlamayan insanlarla konuşurken açıklık kazanması için tercih edebilirsiniz.</p>\r\n</div>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>Örneğin,one hundred and twenty five -> 125.</p>\r\n</div>\r\n<p><strong>Thousand</strong> -> Bin.</p>\r\n<div class=\"bg-gray-200 rounded-md p-4 mb-4\">\r\n  <p>Binlikler de yüzlükteki kuralı uygulamaya devam ediceğiz.</p>\r\n</div>\r\n<p><strong>1250</strong> -> one thousand two hundred fifty.</p>\r\n<p><strong>2335</strong> -> two thousand three hundred thirty five.</p>', 4, 4, 1, '2024-04-20 02:53:16', '2024-04-20 02:53:16'),
(16, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.<p> </div>', '\"Be\" konusu part 1,Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.', 5, 14, 1, '2024-04-21 01:30:18', '2024-04-21 01:30:18'),
(17, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması \'Bilmiyorum\' Tuşuna basınız.Lütfen Devam edebilmek için 4 kez Tekrarlayınız.<p> </div>', '{\n  \"Who\": {\n    \"value\": \"kim\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/who.wav\"\n  },\n  \"What\": {\n    \"value\": \"ne\",\n    \"uses\": \"example\",\n    \"sound\":\"audio/english/what.wav\"\n  },\n  \"When\": {\n    \"value\": \"ne zaman\",\n    \"uses\": \"sample\",\n    \"sound\":\"audio/english/when.wav\"\n  },\n  \"How\": {\n    \"value\": \"nasıl\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/how.wav\"\n  },\n  \"How old\": {\n    \"value\": \"kaç yaşında\",\n    \"uses\": \"example\",\n    \"sound\":\"audio/english/how_old.wav\"\n  },\n  \"Math\": {\n    \"value\": \"Matematik\",\n    \"uses\": \"sample\",\n    \"sound\":\"audio/english/math.wav\"\n  },\n  \"Date\": {\n    \"value\": \"Tarih\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/date.wav\"\n  },\n  \"Free\": {\n    \"value\": \"bedava,müsait\",\n    \"uses\": \"example\",\n    \"sound\":\"audio/english/free.wav\"\n  },\n  \"Day\": {\n    \"value\": \"gün\",\n    \"uses\": \"sample\",\n    \"sound\":\"audio/english/day.wav\"\n  },\n  \"First\": {\n    \"value\": \"ilk\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/first.wav\"\n  },\n  \"Cousin\": {\n    \"value\": \"kuzen\",\n    \"uses\": \"example\",\n    \"sound\":\"audio/english/cousin.wav\"\n  },\n  \"Cold\": {\n    \"value\": \"soğuk\",\n    \"uses\": \"sample\",\n    \"sound\":\"audio/english/cold.wav\"\n  },\n  \"Today\": {\n    \"value\": \"bugün\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/today.wav\"\n  },\n  \"Shelf\": {\n    \"value\": \"raf\",\n    \"uses\": \"example\",\n    \"sound\":\"audio/english/shelf.wav\"\n  },\n  \"Your\": {\n    \"value\": \"senin\",\n    \"uses\": \"sample\",\n    \"sound\":\"audio/english/your.wav\"\n  },\n  \"Girl\": {\n    \"value\": \"kız\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/girl.wav\"\n  },\n  \"Teacher\": {\n    \"value\": \"öğretmen\",\n    \"uses\": \"example\",\n    \"sound\":\"audio/english/teacher.wav\"\n  },\n  \"These\": {\n    \"value\": \"bunlar\",\n    \"uses\": \"sample\",\n    \"sound\":\"audio/english/these.wav\"\n  },\n  \"Those\": {\n    \"value\": \"şunlar\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/those.wav\"\n  },\n  \"This\": {\n    \"value\": \"bu\",\n    \"uses\": \"example\",\n    \"sound\":\"audio/english/this.wav\"\n  },\n  \"That\": {\n    \"value\": \"şu\",\n    \"uses\": \"sample\",\n    \"sound\":\"audio/english/that.wav\"\n  },\n  \"Anxious\": {\n    \"value\": \"endişeli\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/anxious.wav\"\n  },\n  \"Computer\": {\n    \"value\": \"Bilgisayar\",\n    \"uses\": \"example\",\n    \"sound\":\"audio/english/computer.wav\"\n  },\n  \"Engineer\": {\n    \"value\": \"mühendis\",\n    \"uses\": \"sample\",\n    \"sound\":\"audio/english/engineer.wav\"\n  },\n  \"Very\": {\n    \"value\": \"çok\",\n    \"uses\": \"test\",\n    \"sound\":\"audio/english/very.wav\"\n  }\n}', 6, 15, 1, '2024-04-21 01:44:39', '2024-04-21 01:44:39'),
(18, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.<p> </div>', '\"Be\" konusu part 1,Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.', 7, 16, 1, '2024-04-21 01:51:49', '2024-04-21 01:51:49'),
(19, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması \'Bilmiyorum\' Tuşuna basınız.Lütfen Devam edebilmek için 4 kez Tekrarlayınız.<p> </div>', '{\n  \"January\": {\n    \"value\": \"Ocak\",\n    \"uses\": \"My birthday is in January.|Ocak ayında doğum günüm var.\",\n    \"sound\": \"audio/turkish/Ocak.wav\"\n  },\n  \"February\": {\n    \"value\": \"Şubat\",\n    \"uses\": \"February is a short month.|Şubat ayı kısa bir aydır.\",\n    \"sound\": \"audio/turkish/Şubat.wav\"\n  },\n  \"March\": {\n    \"value\": \"Mart\",\n    \"uses\": \"March marks the beginning of spring.|Mart ayı baharın başlangıcıdır.\",\n    \"sound\": \"audio/turkish/Mart.wav\"\n  },\n  \"April\": {\n    \"value\": \"Nisan\",\n    \"uses\": \"April usually brings rain.|Nisan ayında genellikle yağmurlar başlar.\",\n    \"sound\": \"audio/turkish/Nisan.wav\"\n  },\n  \"May\": {\n    \"value\": \"Mayıs\",\n    \"uses\": \"People born in May often enjoy sunny days.|Mayıs ayında doğanlar genellikle güneşli günleri sever.\",\n    \"sound\": \"audio/turkish/Mayıs.wav\"\n  },\n  \"June\": {\n    \"value\": \"Haziran\",\n    \"uses\": \"Schools are typically on summer break in June.|Haziran ayında okullar genellikle tatil olur.\",\n    \"sound\": \"audio/turkish/Haziran.wav\"\n  },\n  \"July\": {\n    \"value\": \"Temmuz\",\n    \"uses\": \"July may bring heatwaves.|Temmuz ayında sıcak hava dalgası olabilir.\",\n    \"sound\": \"audio/turkish/Temmuz.wav\"\n  },\n  \"August\": {\n    \"value\": \"Ağustos\",\n    \"uses\": \"August is often vacation time.|Ağustos ayında genellikle tatil mevsimidir.\",\n    \"sound\": \"audio/turkish/Ağustos.wav\"\n  },\n  \"September\": {\n    \"value\": \"Eylül\",\n    \"uses\": \"September marks the beginning of autumn.|Eylül ayı sonbaharın başlangıcıdır.\",\n    \"sound\": \"audio/turkish/Eylül.wav\"\n  },\n  \"October\": {\n    \"value\": \"Ekim\",\n    \"uses\": \"Leaves start turning yellow in October.|Ekim ayında yapraklar sararmaya başlar.\",\n    \"sound\": \"audio/turkish/Ekim.wav\"\n  },\n  \"November\": {\n    \"value\": \"Kasım\",\n    \"uses\": \"November brings cooler weather.|Kasım ayında hava soğumaya başlar.\",\n    \"sound\": \"audio/turkish/Kasım.wav\"\n  },\n  \"December\": {\n    \"value\": \"Aralık\",\n    \"uses\": \"December is the last month of the year.|Aralık ayı yılın son ayıdır.\",\n    \"sound\": \"audio/turkish/Aralık.wav\"\n  }\n}', 8, 17, 1, '2024-04-21 02:12:47', '2024-04-21 02:12:47'),
(20, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.<p> </div>', '\"Be\" konusu part 1,Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.', 9, 18, 1, '2024-04-21 02:15:28', '2024-04-21 02:15:28'),
(21, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması \'Bilmiyorum\' Tuşuna basınız.Lütfen Devam edebilmek için 4 kez Tekrarlayınız.<p> </div>', '{\n\"book\": {\n    \"value\": \"kitap\",\n    \"uses\": \"Kitap okumayı seviyorum.|I love reading books.\",\n    \"sound\": \"audio/turkish/Kitap.wav\"\n  },\n  \"knowledge\": {\n    \"value\": \"bilgi\",\n    \"uses\": \"Bilgi edinmek önemlidir.|Acquiring knowledge is important.\",\n    \"sound\": \"audio/turkish/bilgi.wav\"\n  },\n  \"key\": {\n    \"value\": \"anahtar\",\n    \"uses\": \"Anahtarımı kaybettim.|I lost my key.\",\n    \"sound\": \"audio/turkish/Anahtar.wav\"\n  },\n  \"success\": {\n    \"value\": \"başarı\",\n    \"uses\": \"Başarı elde etmek için çalışmalısın.|You must work hard to achieve success.\",\n    \"sound\": \"audio/turkish/Başarı.wav\"\n  },\n  \"first language\": {\n    \"value\": \"ilk dil\",\n    \"uses\": \"Anadilim Türkçe.|My first language is Turkish.\",\n    \"sound\": \"audio/turkish/İlk dil.wav\"\n  },\n  \"soccer\": {\n    \"value\": \"futbol\",\n    \"uses\": \"Futbol maçı izlemeyi seviyorum.|I love watching soccer matches.\",\n    \"sound\": \"audio/turkish/futbol.wav\"\n  },\n  \"most-watched\": {\n    \"value\": \"çok izlenen\",\n    \"uses\": \"Bu dizi çok izlenen bir dizi.|This series is one of the most-watched series.\",\n    \"sound\": \"audio/turkish/çok izlenen.wav\"\n  },\n  \"worldwide\": {\n    \"value\": \"dünya çağında\",\n    \"uses\": \"Bu problem dünya çağında bir sorundur.|This issue is a worldwide problem.\",\n    \"sound\": \"audio/turkish/dünya çağında.wav\"\n  },\n  \"children\": {\n    \"value\": \"çocuklar\",\n    \"uses\": \"Çocuklar parkta oynuyor.|Children are playing in the park.\",\n    \"sound\": \"audio/turkish/çocuklar.wav\"\n  },\n  \"upcoming\": {\n    \"value\": \"gelen\",\n    \"uses\": \"Gelen hafta izin alacağım.|I will take leave next week.\",\n    \"sound\": \"audio/turkish/gelen.wav\"\n  },\n  \"trip\": {\n    \"value\": \"gezi\",\n    \"uses\": \"Geziye gitmeyi planlıyoruz.|We are planning a trip.\",\n    \"sound\": \"audio/turkish/gezi.wav\"\n  },\n  \"field\": {\n    \"value\": \"alan,saha\",\n    \"uses\": \"Çocuklar futbol sahasında oynuyor.|The children are playing in the soccer field.\",\n    \"sound\": \"audio/turkish/alan.wav\"\n  },\n  \"field trip\": {\n    \"value\": \"saha gezisi\",\n    \"uses\": \"Okul saha gezisi düzenliyor.|The school is organizing a field trip.\",\n    \"sound\": \"audio/turkish/saha gezisi.wav\"\n  },\n  \"milk\": {\n    \"value\": \"süt\",\n    \"uses\": \"Süt içmek kemikler için iyidir.|Drinking milk is good for bones.\",\n    \"sound\": \"audio/turkish/süt.wav\"\n  },\n  \"fridge\": {\n    \"value\": \"buz dolabı\",\n    \"uses\": \"Buz dolabında biraz meyve var.|There are some fruits in the fridge.\",\n    \"sound\": \"audio/turkish/buz dolabı.wav\"\n  },\n  \"virtue\": {\n    \"value\": \"erdem\",\n    \"uses\": \"Erdemli bir yaşam sürmek önemlidir.|It is important to live a virtuous life.\",\n    \"sound\": \"audio/turkish/erdem.wav\"\n  },\n  \"chemistry\": {\n    \"value\": \"kimya\",\n    \"uses\": \"Kimya dersine çalışıyorum.|I am studying chemistry.\",\n    \"sound\": \"audio/turkish/kimya.wav\"\n  },\n  \"difficult\": {\n    \"value\": \"zor\",\n    \"uses\": \"Bu problem oldukça zor görünüyor.|This problem seems quite difficult.\",\n    \"sound\": \"audio/turkish/zor.wav\"\n  },\n  \"subject\": {\n    \"value\": \"ders,konu\",\n    \"uses\": \"Bu dersi seviyorum.|I like this subject.\",\n    \"sound\": \"audio/turkish/ders,konu.wav\"\n  },\n  \"flower\": {\n    \"value\": \"çiçek\",\n    \"uses\": \"Bahçede güzel çiçekler var.|There are beautiful flowers in the garden.\",\n    \"sound\": \"audio/turkish/çiçek.wav\"\n  },\n  \"express\": {\n    \"value\": \"ifade etmek\",\n    \"uses\": \"Duygularımı ifade etmekte zorlanıyorum.|I struggle to express my feelings.\",\n    \"sound\": \"audio/turkish/ifade etmek.wav\"\n  },\n  \"weather\": {\n    \"value\": \"hava\",\n    \"uses\": \"Bugün hava nasıl?|How is the weather today?\",\n    \"sound\": \"audio/turkish/hava.wav\"\n  },\n \"predictable\": {\n    \"value\": \"tahmin edilebilir\",\n    \"uses\": \"Hava durumu genellikle tahmin edilebilirdir.|The weather is usually predictable.\",\n    \"sound\": \"audio/turkish/tahmin edilebilir.wav\"\n  },\n  \"spring\": {\n    \"value\": \"ilk bahar\",\n    \"uses\": \"İlk bahar çiçeklerin açtığı zaman.|Spring is the time when flowers bloom.\",\n    \"sound\": \"audio/turkish/ilk bahar.wav\"\n  },\n  \"prefer\": {\n    \"value\": \"tercih etmek\",\n    \"uses\": \"Ben yaz tatillerini kış tatillerine tercih ederim.|I prefer summer vacations over winter vacations.\",\n    \"sound\": \"audio/turkish/tercih etmek.wav\"\n  },\n  \"genre\": {\n    \"value\": \"tür\",\n    \"uses\": \"Bu film hangi türe giriyor?|What genre does this movie belong to?\",\n    \"sound\": \"audio/turkish/tür.wav\"\n  },\n  \"capable of\": {\n    \"value\": \"yeteneğe sahip\",\n    \"uses\": \"Bu öğrenci matematikte yeteneğe sahip.|This student is capable in mathematics.\",\n    \"sound\": \"audio/turkish/yeteneğe sahip.wav\"\n  },\n  \"exam\": {\n    \"value\": \"sınav\",\n    \"uses\": \"Sınavlara çalışmalısın.|You should study for exams.\",\n    \"sound\": \"audio/turkish/sınav.wav\"\n  },\n  \"result\": {\n    \"value\": \"sonuç\",\n    \"uses\": \"Sonuç oldukça tatmin ediciydi.|The result was quite satisfying.\",\n    \"sound\": \"audio/turkish/sonuç.wav\"\n  },\n  \"painting\": {\n    \"value\": \"boyama,resim\",\n    \"uses\": \"Çocuklar boyama yapmayı sever.|Children enjoy painting.\",\n    \"sound\": \"audio/turkish/boyama,resim.wav\"\n  },\n  \"precious\": {\n    \"value\": \"değerli\",\n    \"uses\": \"Bu hatıra bana çok değerli.|This memento is very precious to me.\",\n    \"sound\": \"audio/turkish/değerli.wav\"\n  },\n  \"wisely\": {\n    \"value\": \"akıllıca\",\n    \"uses\": \"Kararını akıllıca vermelisin.|You should make your decision wisely.\",\n    \"sound\": \"audio/turkish/akıllıca.wav\"\n  },\n  \"elephant\": {\n    \"value\": \"fil\",\n    \"uses\": \"Fil, büyük bir hayvandır.|The elephant is a large animal.\",\n    \"sound\": \"audio/turkish/fil.wav\"\n  },\n  \"found\": {\n    \"value\": \"bulundu\",\n    \"uses\": \"Kayıp köpek nihayet bulundu!|The lost dog was finally found!\",\n    \"sound\": \n}', 10, 19, 1, '2024-04-21 14:52:48', '2024-04-21 14:52:48'),
(22, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.<p> </div>', '\"Be\" konusu part 1,Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.', 11, 20, 1, '2024-04-21 14:54:57', '2024-04-21 14:54:57'),
(23, 'Simple Present Tense Gramer', '<div class=\"max-w-2xl mx-auto\">\r\n        <h1 class=\"text-2xl font-bold mb-4\">Simple Present Tense Examples</h1>\r\n\r\n        <p class=\"text-lg font-semibold mb-2\">Simple Present Tense, İngilizce\'de genellikle düzenli olarak tekrarlanan eylemleri, alışkanlıkları, genel gerçekleri ve sabit durumları ifade etmek için kullanılan bir zaman şeklidir.</p>\r\n\r\n        <p class=\"mb-2\">Örneğin:</p>\r\n        <ul class=\"list-disc list-inside mb-4\">\r\n            <li>\"I go to school every day.\" (Her gün okula giderim.) - Burada \"go\" fiili, düzenli olarak tekrarlanan bir eylemi ifade eder.</li>\r\n            <li>\"She works at a bank.\" (O, bir bankada çalışır.) - Burada \"works\" fiili, kişinin genel bir durumunu ifade eder, yani o genel olarak bir bankada çalışır.</li>\r\n            <li>\"Water boils at 100 degrees Celsius.\" (Su, 100 derecede kaynar.) - Burada \"boils\" fiili, bir genel gerçeği ifade eder.</li>\r\n        </ul>\r\n\r\n        <p class=\"mb-2\">Simple Present Tense\'de, üçüncü tekil şahıslar (he, she, it) için fiillere \"-s\" veya \"-es\" eklenir:</p>\r\n        <ul class=\"list-disc list-inside mb-4\">\r\n            <li>He works. (O çalışır.)</li>\r\n            <li>She watches TV. (O televizyon izler.)</li>\r\n        </ul>\r\n\r\n        <p class=\"mb-2\">Ancak, olumsuz cümlelerde ve soru cümlelerinde yardımcı fiiller kullanılır:</p>\r\n        <p class=\"mb-2\">Olumsuz:</p>\r\n        <ul class=\"list-disc list-inside mb-4\">\r\n            <li>I don\'t work. (Ben çalışmam.)</li>\r\n            <li>She doesn\'t watch TV. (O televizyon izlemez.)</li>\r\n        </ul>\r\n        <p class=\"mb-2\">Soru:</p>\r\n        <ul class=\"list-disc list-inside mb-4\">\r\n            <li>Do you work? (Sen çalışır mısın?)</li>\r\n            <li>Does she watch TV? (O televizyon izler mi?)</li>\r\n        </ul>\r\n\r\n        <p class=\"mb-2\">Daha Fazla Örnek olarak :</p>\r\n        <p class=\"text-lg font-semibold mb-2\">Affirmative (Olumlu):</p>\r\n        <ul class=\"list-disc list-inside mb-4\">\r\n            <li>I attend school daily. (Ben her gün okula katılırım.)</li>\r\n            <li>You visit school regularly. (Sen okulu düzenli ziyaret edersin.)</li>\r\n            <li>He regularly attends school. (O düzenli olarak okula katılır.)</li>\r\n            <li>She is employed at a bank. (O, bir bankada çalışıyor.)</li>\r\n            <li>It consistently reaches a boiling point of 100 degrees Celsius. (O, tutarlı bir şekilde 100 derece\r\n                Celsius\'a kadar kaynar.)</li>\r\n            <li>We regularly go to our classes. (Biz derslerimize düzenli olarak gideriz.)</li>\r\n            <li>They frequently attend school sessions. (Onlar sık sık okul oturumlarına katılırlar.)</li>\r\n        </ul>\r\n\r\n        <p class=\"text-lg font-semibold mb-2\">Negative (Olumsuz):</p>\r\n        <ul class=\"list-disc list-inside mb-4\">\r\n            <li>I seldom miss school. (Ben nadiren okulu kaçırırım.)</li>\r\n            <li>You rarely skip school. (Sen nadiren okulu atlıyorsun.)</li>\r\n            <li>He doesn\'t usually skip school. (O genellikle okulu asmaz)</li>\r\n <li>She isn\'t absent from work often. (O, işten sık sık ayrılmaz.)</li>\r\n            <li>It doesn\'t often fail to reach a boiling point. (O, sık sık kaynama noktasına ulaşmaz.)</li>\r\n            <li>We hardly ever avoid going to class. (Biz neredeyse hiç derslere gitmekten kaçınmayız.)</li>\r\n            <li>They don\'t frequently neglect school attendance. (Onlar okula sık sık katılmayı ihmal etmezler.)</li>\r\n        </ul>\r\n\r\n        <p class=\"text-lg font-semibold mb-2\">Question (Soru):</p>\r\n        <ul class=\"list-disc list-inside mb-4\">\r\n            <li>Do I usually attend school? (Ben genellikle okula katılır mıyım?)</li>\r\n            <li>Do you regularly visit school? (Sen okulu düzenli olarak mı ziyaret edersin?)</li>\r\n            <li>Does he consistently attend school? (O tutarlı olarak okula katılır mı?)</li>\r\n            <li>Does she often work at the bank? (O, bankada sık sık mı çalışır?)</li>\r\n            <li>Does it usually reach a boiling point? (O genellikle kaynama noktasına mı ulaşır?)</li>\r\n            <li>Do we frequently attend our classes? (Biz sık sık derslerimize mi gideriz?)</li>\r\n            <li>Do they regularly participate in school sessions? (Onlar düzenli olarak okul oturumlarına mı katılırlar?)</li>\r\n        </ul>\r\n\r\n        <p class=\"text-lg font-semibold mb-2\">Short Answers (Kısa Cevaplar):</p>\r\n        <ul class=\"list-disc list-inside mb-4\">\r\n            <li>Yes, I do. / No, I don\'t.</li>\r\n            <li>Yes, you do. / No, you don\'t.</li>\r\n            <li>Yes, he does. / No, he doesn\'t.</li>\r\n            <li>Yes, she does. / No, she doesn\'t.</li>\r\n            <li>Yes, it does. / No, it doesn\'t.</li>\r\n            <li>Yes, we do. / No, we don\'t.</li>\r\n            <li>Yes, they do. / No, they don\'t.</li>\r\n        </ul>\r\n    </div>', 12, 21, 1, '2024-04-21 16:26:51', '2024-04-21 16:26:51'),
(24, '<div> <p class=\"text-blue-500\">\"Be\" konusu</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması \'Bilmiyorum\' Tuşuna basınız.Lütfen Devam edebilmek için 4 kez Tekrarlayınız.<p> </div>', '{\n  \"attend\": {\n    \"value\": \"Katılmak\",\n    \"uses\": \"Toplantıya katılmak istiyorum.|I want to attend the meeting.\",\n    \"sound\": \"audio/english/attend.wav\"\n  },\n  \"visit\": {\n    \"value\": \"Ziyaret\",\n    \"uses\": \"Bugün bir arkadaşımı ziyaret ettim.|Today I visited a friend.\",\n    \"sound\": \"audio/english/visit.wav\"\n  },\n  \"regularly\": {\n    \"value\": \"Düzenli olarak\",\n    \"uses\": \"Egzersizi düzenli olarak yapmak sağlıklıdır.|Exercising regularly is healthy.\",\n    \"sound\": \"audio/english/regularly.wav\"\n  },\n  \"employee\": {\n    \"value\": \"Çalışan\",\n    \"uses\": \"Bu şirkette birçok çalışan var.|There are many employees in this company.\",\n    \"sound\": \"audio/english/employee.wav\"\n  },\n  \"bank\": {\n    \"value\": \"Banka\",\n    \"uses\": \"Yakındaki bankaya gitmemiz gerekiyor.|We need to go to the nearby bank.\",\n    \"sound\": \"audio/english/bank.wav\"\n  },\n  \"consistently\": {\n    \"value\": \"Tutarlı bir şekilde\",\n    \"uses\": \"Tutarlı bir şekilde çalışarak hedeflerinize ulaşabilirsiniz.|You can reach your goals by consistently working.\",\n    \"sound\": \"audio/english/consistently.wav\"\n  },\n  \"reach\": {\n    \"value\": \"Ulaşmak\",\n    \"uses\": \"Hedeflerinize ulaşmak için çaba gösterin.|Strive to reach your goals.\",\n    \"sound\": \"audio/english/reach.wav\"\n  },\n  \"boiling point\": {\n    \"value\": \"Kaynama noktası\",\n    \"uses\": \"Su 100 derecede kaynar.|Water boils at 100 degrees.\",\n    \"sound\": \"audio/english/boiling_point.wav\"\n  },\n  \"degree\": {\n    \"value\": \"Derece\",\n    \"uses\": \"Bu yaz günleri çok yüksek derecelere ulaşabilir.|These summer days can reach very high degrees.\",\n    \"sound\": \"audio/english/degree.wav\"\n  },\n  \"session\": {\n    \"value\": \"Oturum\",\n    \"uses\": \"Toplantı oturumu saat 2\'de başlayacak.|The meeting session will start at 2 o\'clock.\",\n    \"sound\": \"audio/english/session.wav\"\n  },\n  \"seldom\": {\n    \"value\": \"Nadiren\",\n    \"uses\": \"O, spor salonuna nadiren gider.|He seldom goes to the gym.\",\n    \"sound\": \"audio/english/seldom.wav\"\n  },\n  \"miss\": {\n    \"value\": \"Kaçırmak, özlemek\",\n    \"uses\": \"Seni çok özledim.|I miss you so much.\",\n    \"sound\": \"audio/english/miss.wav\"\n  },\n  \"skip\": {\n    \"value\": \"Atlamak\",\n    \"uses\": \"Bugün kahvaltıyı atladım.|I skipped breakfast today.\",\n    \"sound\": \"audio/english/skip.wav\"\n  },\n  \"rarely\": {\n    \"value\": \"Nadiren\",\n    \"uses\": \"Bu fırsat nadiren ortaya çıkar.|This opportunity rarely comes up.\",\n    \"sound\": \"audio/english/rarely.wav\"\n  },\n  \"absent\": {\n    \"value\": \"Yok, eksik\",\n    \"uses\": \"Bazı öğrenciler bugün sınıfta yoktu.|Some students were absent from class today.\",\n    \"sound\": \"audio/english/absent.wav\"\n  },\n  \"often\": {\n    \"value\": \"Sık sık\",\n    \"uses\": \"O, bu parkta sık sık koşar.|He often runs in this park.\",\n    \"sound\": \"audio/english/often.wav\"\n  },\n  \"fail\": {\n    \"value\": \"Başarısız olmak\",\n    \"uses\": \"Sınavda başarısız oldum.|I failed the exam.\",\n    \"sound\": \"audio/english/fail.wav\"\n  },\n  \"hardly ever\": {\n    \"value\": \"Neredeyse hiç\",\n    \"uses\": \"O, neredeyse hiç kitap okumaz.|He hardly ever reads books.\",\n    \"sound\": \"audio/english/hardly_ever.wav\"\n  },\n  \"avoid\": {\n    \"value\": \"Kaçınmak\",\n    \"uses\": \"Zararlı alışkanlıklardan kaçınmalısınız.|You should avoid harmful habits.\",\n    \"sound\": \"audio/english/avoid.wav\"\n  },\n  \"neglect\": {\n    \"value\": \"İhmal etmek\",\n    \"uses\": \"Evcil hayvanınızı ihmal etmeyin.|Don\'t neglect your pet.\",\n    \"sound\": \"audio/english/neglect.wav\"\n  },\n  \"participation\": {\n    \"value\": \"Katılım\",\n    \"uses\": \"Toplantı katılımı bekleniyor.|Meeting participation is expected.\",\n    \"sound\": \"audio/english/participation.wav\"\n  }\n}', 13, 22, 1, '2024-04-21 16:37:49', '2024-04-21 16:37:49'),
(25, '<div> <p class=\"text-blue-500\">Simple Present Tense</p><p class=\"text-gray-500\">Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.<p> </div>', '\"Be\" konusu part 1,Eğer ki sorunun cevabını bilmiyorsanız açıklaması için soruya tıklayabilirsiniz.', 14, 23, 1, '2024-04-21 16:40:37', '2024-04-21 16:40:37');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `konu_anlatimi_commentler`
--

CREATE TABLE `konu_anlatimi_commentler` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `konu_anlatimi_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(49, '2014_10_12_000000_create_users_table', 1),
(50, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(51, '2019_08_19_000000_create_failed_jobs_table', 1),
(52, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(53, '2024_04_01_084348_create_courses_table', 1),
(54, '2024_04_01_084402_create_topics_table', 1),
(55, '2024_04_01_084418_create_konuanlatim_table', 1),
(56, '2024_04_01_084470_create_quizler_table', 1),
(57, '2024_04_01_084500_create_konu_anlatim_commentler_table', 1),
(58, '2024_04_01_084519_create_bookmarks_table', 1),
(59, '2024_04_02_004518_create_questions_table', 1),
(60, '2024_04_02_014708_create_user_courses_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
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
-- Tablo için tablo yapısı `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`question`)),
  `isTrueFalse` tinyint(1) NOT NULL,
  `isMultiChoice` tinyint(1) NOT NULL,
  `isClickComplete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `question`, `isTrueFalse`, `isMultiChoice`, `isClickComplete`, `created_at`, `updated_at`) VALUES
(1, 1, '{\r\n  \"key1\": \"Ben\",\r\n   \"key2\": \"Sen\",\r\n\"key3\": \"Siz\",\r\n  \"correct_answer\": \"key1\",\r\n  \"title\": \"\\\"I\\\" ne demektir ?\",\r\n  \"explain\":\"İngilizcede \\\"I\\\" ben demektir\"\r\n}\r\n', 0, 1, 0, '2024-04-19 16:26:26', '2024-04-19 16:26:26'),
(2, 1, '{\n  \"key1\": \"Sen,Siz\",\n   \"key2\": \"Biz\",\n\"key2\": \"Ben\",\n  \"correct_answer\": \"key1\",\n   \"title\": \"\\\"You\\\" ne demektir ?\",\n  \"explain\":\"İngilizcede \\\"You\\\" Sen,Siz demektir\"\n}', 0, 1, 0, '2024-04-19 19:30:28', '2024-04-19 19:30:28'),
(3, 1, '{\n  \"key1\": \"O(kız için)\",\n   \"key2\": \"O(erkek için)\",\n\"key3\": \"Sen\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"İngilizce\'de \\\"He\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de He Erkek için O anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:01:16', '2024-04-20 02:01:16'),
(4, 1, '{\n  \"key1\": \"O(kız için)\",\n   \"key2\": \"O(erkek için)\",\n\"key3\": \"Sen\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"İngilizce\'de \\\"She\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de He Kız için O anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:01:42', '2024-04-20 02:01:42'),
(5, 1, '{\n  \"key1\": \"O(kız için)\",\n   \"key2\": \"Ben\",\n\"key3\": \"O(insan harici)\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"İngilizce\'de \\\"It\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'It\' insan hariç her şey için \'O\' anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:02:21', '2024-04-20 02:02:21'),
(6, 1, '{\n  \"key1\": \"Biz(kız için)\",\n   \"key2\": \"Siz(erkek için)\",\n\"key3\": \"O(insan harici)\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"İngilizce\'de \\\"We\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'We\' Biz anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:03:00', '2024-04-20 02:03:00'),
(7, 1, '{\n  \"key1\": \"Siz\",\n   \"key2\": \"Biz\",\n\"key3\": \"Onlar\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"İngilizce\'de \\\"They\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'They\' Onlar anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:03:42', '2024-04-20 02:03:42'),
(8, 1, '{\n  \"key1\": \"Meşgul\",\n   \"key2\": \"Biz\",\n\"key3\": \"Siz\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"İngilizce\'de \\\"Busy\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Busy\' Meşgul anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:04:57', '2024-04-20 02:04:57'),
(9, 1, '{\n  \"key1\": \"Meşgul\",\n   \"key2\": \"Mutlu\",\n\"key3\": \"Siz\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"İngilizce\'de \\\"Happy\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Happy\' Mutlu anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:05:25', '2024-04-20 02:05:25'),
(10, 1, '{\n  \"key1\": \"Siz\",\n   \"key2\": \"Mutlu\",\n\"key3\": \"Polis\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"İngilizce\'de \\\"Police\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Police\' Polis anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:06:18', '2024-04-20 02:06:18'),
(11, 1, '{\n  \"key1\": \"Polis\",\n   \"key2\": \"Mutlu\",\n\"key3\": \"Mutsuz\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"İngilizce\'de \\\"Unhappy \\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Unhappy \' Mutsuz anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:06:42', '2024-04-20 02:06:42'),
(12, 1, '{\n  \"key1\": \"Kedi\",\n   \"key2\": \"Mutlu\",\n\"key3\": \"Polis\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"İngilizce\'de \\\"Cat\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Cat\' Kedi anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:07:08', '2024-04-20 02:07:08'),
(13, 1, '{\n  \"key1\": \"Mutlu\",\n   \"key2\": \"Evli Olmak\",\n\"key3\": \"Meşgul\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"İngilizce\'de \\\"Be married \\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Be married \' Evli Olmak anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:07:57', '2024-04-20 02:07:57'),
(14, 1, '{\n  \"key1\": \"Mutsuz\",\n   \"key2\": \"Kedi\",\n\"key3\": \"Öğrenci\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"İngilizce\'de \\\"Student \\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Student\' Öğrenci anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:09:02', '2024-04-20 02:09:02'),
(15, 1, '{\n  \"key1\": \"Öğrenci\",\n   \"key2\": \"Kedi\",\n\"key3\": \"Erken\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"İngilizce\'de \\\"Early\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Early\' Erken anlamına gelmektedir.\"\n}', 0, 1, 0, '2024-04-20 02:09:33', '2024-04-20 02:09:33'),
(16, 1, '{\n  \"key1\": \"Polis\",\n   \"key2\": \"Mutsuz\",\n\"key3\": \"Olumsuzluk Eki\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"İngilizce\'de \\\"Not\\\" ne anlama gelmektedir ?\",\n  \"explain\":\"İngilizce\'de \'Not\' olumsuzluk eki\'dir.\"\n}', 0, 1, 0, '2024-04-20 02:10:21', '2024-04-20 02:10:21'),
(17, 2, '{\n  \"key1\": \"Biz evli değiliz. \",\n   \"key2\": \"Meşgul değilim.\",\n\"key3\": \"Meşgulüm.\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"I am not busy. \",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:27:45', '2024-04-20 02:27:45'),
(18, 2, '{\n  \"key1\": \"Meşgul değilim. \",\n   \"key2\": \"O(kız için) mutsuz.\",\n\"key3\": \"Sen mutlusun.\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"You are happy.\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:28:46', '2024-04-20 02:28:46'),
(19, 2, '{\n  \"key1\": \"O bir polis (erkek).\",\n   \"key2\": \"Onlar erkenci değiller.\",\n\"key3\": \"Siz öğrencilersiniz.\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"He is a police.\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:32:10', '2024-04-20 02:32:10'),
(20, 2, '{\n  \"key1\": \"O mutsuz (kız)\",\n   \"key2\": \"O bir polis (erkek)\",\n\"key3\": \"Meşgul değilim.\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"She is unhappy.\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:34:28', '2024-04-20 02:34:28'),
(21, 2, '{\n  \"key1\": \"Öğrenci misiniz ?\",\n   \"key2\": \"Siz öğrenci değilsiniz.\",\n\"key3\": \"O bir kedi değil.\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"It is not a cat.\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:36:15', '2024-04-20 02:36:15'),
(22, 2, '{\n  \"key1\": \"Onlar erkenci değiller.\",\n   \"key2\": \"Biz evli değiliz.\",\n\"key3\": \"mutlu musun ?\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"We are not married.\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:36:49', '2024-04-20 02:36:49'),
(23, 2, '{\n  \"key1\": \"Meşgul müyüm ?\",\n   \"key2\": \"Mutlu musun ?\",\n\"key3\": \"Öğrenci misiniz ?\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Am i busy  ?\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:38:30', '2024-04-20 02:38:30'),
(24, 2, '{\n  \"key1\": \"Mutlu musun ?\",\n   \"key2\": \"o(kız için) mutsuz mu ?\",\n\"key3\": \"Bir\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Are you happy?\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:39:15', '2024-04-20 02:39:15'),
(25, 2, '{\n  \"key1\": \"İki\",\n   \"key2\": \"meşgul müyüm ?\",\n\"key3\": \"o (erkek için) bir polis mi ?\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"Is he a police ?\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:39:50', '2024-04-20 02:39:50'),
(26, 2, '{\n  \"key1\": \"o(kız için) mutsuz mu ?\",\n   \"key2\": \"evli miyiz ?\",\n\"key3\": \"erkenciler mi ?\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Is she unhappy ?\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:40:33', '2024-04-20 02:40:33'),
(27, 2, '{\n  \"key1\": \"O bir polis değil.(erkek için)\",\n   \"key2\": \"Siz öğrenci değilsiniz.\",\n\"key3\": \"o(insan hariç) bir kedi mi ?\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"Is it a cat ?\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:41:06', '2024-04-20 02:41:06'),
(28, 2, '{\n  \"key1\": \"O bir polis değil.(erkek için)\",\n   \"key2\": \"O mutsuz (kız)\",\n\"key3\": \"evli miyiz ?\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"Are we married ?\",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:42:11', '2024-04-20 02:42:11'),
(29, 2, '{\n  \"key1\": \"öğrenci misiniz ?\",\n   \"key2\": \"Siz öğrenci değilsiniz.\",\n\"key3\": \"o(insan hariç) bir kedi mi ?\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Are you students ? \",\n   \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:42:52', '2024-04-20 02:42:52'),
(30, 2, '{\n  \"key1\": \"O bir kedi.\",\n   \"key2\": \"O mutsuz değil.(kadın için)\",\n\"key3\": \"erkenciler mi ?\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"Are they early ? \",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-20 02:44:22', '2024-04-20 02:44:22'),
(35, 6, '{\n  \"key1\": \"One\",\n   \"key2\": \"Two\",\n\"key3\": \"Three\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Bir\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:33:53', '2024-04-21 01:33:53'),
(36, 6, '{\n  \"key1\": \"One\",\n   \"key2\": \"Two\",\n\"key3\": \"Three\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"İki\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:34:17', '2024-04-21 01:34:17'),
(37, 6, '{\n  \"key1\": \"One\",\n   \"key2\": \"Two\",\n\"key3\": \"Three\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"Üç\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:34:25', '2024-04-21 01:34:25'),
(38, 6, '{\n  \"key1\": \"Six\",\n   \"key2\": \"Four\",\n\"key3\": \"One\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"Dört\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:34:50', '2024-04-21 01:34:50'),
(39, 6, '{\n  \"key1\": \"Five\",\n   \"key2\": \"Seven\",\n\"key3\": \"One\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Beş\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:35:04', '2024-04-21 01:35:04'),
(40, 6, '{\n  \"key1\": \"Five\",\n   \"key2\": \"Seven\",\n\"key3\": \"Six\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"Altı\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:35:15', '2024-04-21 01:35:15'),
(41, 6, '{\n  \"key1\": \"Two\",\n   \"key2\": \"Seven\",\n\"key3\": \"Six\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"Yedi\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:35:26', '2024-04-21 01:35:26'),
(42, 6, '{\n  \"key1\": \"Two\",\n   \"key2\": \"Seven\",\n\"key3\": \"Eight\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"Sekiz\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:35:36', '2024-04-21 01:35:36'),
(43, 6, '{\n  \"key1\": \"Nine\",\n   \"key2\": \"Seven\",\n\"key3\": \"Six\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Dokuz\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:35:54', '2024-04-21 01:35:54'),
(44, 6, '{\n  \"key1\": \"Nine\",\n   \"key2\": \"Six\",\n\"key3\": \"Ten\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"On\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:36:09', '2024-04-21 01:36:09'),
(45, 6, '{\n  \"key1\": \"Eleven\",\n   \"key2\": \"Two\",\n\"key3\": \"Ten\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"On bir\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:36:33', '2024-04-21 01:36:33'),
(46, 6, '{\n  \"key1\": \"Five\",\n   \"key2\": \"One\",\n\"key3\": \"Twelve\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"On iki\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:36:51', '2024-04-21 01:36:51'),
(47, 6, '{\n  \"key1\": \"Eleven\",\n   \"key2\": \"Sixteen\",\n\"key3\": \"Twelve\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"On Altı\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:37:16', '2024-04-21 01:37:16'),
(48, 6, '{\n  \"key1\": \"Twenty Eight\",\n   \"key2\": \"Sixteen\",\n\"key3\": \"Thirteen\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Yirmi Sekiz\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:37:51', '2024-04-21 01:37:51'),
(49, 6, '{\n  \"key1\": \"Twenty Six\",\n   \"key2\": \"Thirty\",\n\"key3\": \"Fifty Eight\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"Otuz\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:38:22', '2024-04-21 01:38:22'),
(50, 6, '{\n  \"key1\": \"One Hundred Thirty Three\",\n   \"key2\": \"One Hundred Fifty Three\",\n\"key3\": \"One Hundred Ninety Three\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Yüz Otuz Üç\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:39:15', '2024-04-21 01:39:15'),
(51, 6, '{\n  \"key1\": \"One Thousand One Hundred Fourty Five\",\n   \"key2\": \"One Thousand Two Hundred Fourty Five\",\n\"key3\": \"Five Thousand Two Hundred Fourty Five\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Bin Yüz Kırk Beş\",\n  \"explain\":\"Açıklama için bir önceki derse bakmanızı tavsiye ederiz.\"\n}', 0, 1, 0, '2024-04-21 01:40:13', '2024-04-21 01:40:13'),
(52, 7, '{\n  \"key1\": \"Ben mutluyum\",\n   \"key2\": \"Ben bir futbolcuyum \",\n\"key3\": \"Ben bir voleybolcuyum\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"I am a football player.\",\n  \"explain\":\"Ben bir futbol oyuncusuyum.\"\n}', 0, 1, 0, '2024-04-21 01:53:04', '2024-04-21 01:53:04'),
(53, 7, '{\n  \"key1\": \"O (kız) bir matematik öğretmeni\",\n   \"key2\": \"Ben bir futbolcuyum\",\n\"key3\": \"Ben Evliyim\",\n  \"correct_answer\": \"key1\",\n  \"title\": \" She is a math teacher.\",\n  \"explain\":\"O (kız) bir matematik öğretmeni\"\n}', 0, 1, 0, '2024-04-21 01:54:34', '2024-04-21 01:54:34'),
(54, 7, '{\n  \"key1\": \"Bugün mayıs ayının dördüncü günü\",\n   \"key2\": \"Bugün mayıs ayının beşinci günü\",\n\"key3\": \"Bugün mayıs ayının ikinci günü\",\n  \"correct_answer\": \"key2\",\n  \"title\": \" Today is the fifth day of May.\",\n  \"explain\":\"Bugün mayıs ayının beşinci günü\"\n}', 0, 1, 0, '2024-04-21 02:03:40', '2024-04-21 02:03:40'),
(55, 7, '{\n  \"key1\": \"O (kız) bir matematik öğretmeni\",\n   \"key2\": \"Onlar bilgisayar mühendisleri mi ?\",\n\"key3\": \"Ne zaman müsaitsin ?\",\n  \"correct_answer\": \"key2\",\n  \"title\": \" Are they computer engineers ?\",\n  \"explain\":\"Onlar bilgisayar mühendisleri mi ?\"\n}', 0, 1, 0, '2024-04-21 02:04:32', '2024-04-21 02:04:32'),
(56, 7, '{\n  \"key1\": \"O (kız) bir matematik öğretmeni\",\n   \"key2\": \"Şu kızlar kuzenlerin mi ? \",\n\"key3\": \"Ben bir futbolcuyum.\",\n  \"correct_answer\": \"key2\",\n  \"title\": \" Are those girls your cousins ?\",\n  \"explain\":\"Şu kızlar kuzenlerin mi ? \"\n}', 0, 1, 0, '2024-04-21 02:05:13', '2024-04-21 02:05:13'),
(57, 7, '{\n  \"key1\": \"O (kız) bir matematik öğretmeni\",\n   \"key2\": \"Ben bir futbolcuyum\",\n\"key3\": \"Matematik öğretmenin kim ? \",\n  \"correct_answer\": \"key3\",\n  \"title\": \" Who is your math teacher ?\",\n  \"explain\":\"Matematik öğretmenin kim ?\"\n}', 0, 1, 0, '2024-04-21 02:06:06', '2024-04-21 02:06:06'),
(58, 7, '{\n  \"key1\": \"Bugünün tarihi ne ?\",\n   \"key2\": \"Ben mutsuz muyum ?\",\n\"key3\": \"Matematik öğretmenin kim ? \",\n  \"correct_answer\": \"key1\",\n  \"title\": \"  What is the date today ?\",\n  \"explain\":\"Bugünün tarihi ne ?\"\n}', 0, 1, 0, '2024-04-21 02:06:52', '2024-04-21 02:06:52'),
(59, 7, '{\n  \"key1\": \"Bugünün tarihi ne ?\",\n   \"key2\": \"Ne zaman müsaitsin ?\",\n\"key3\": \"Matematik öğretmenin kim ? \",\n  \"correct_answer\": \"key2\",\n  \"title\": \"  When are you free ?\",\n  \"explain\":\"Ne zaman müsaitsin ?\"\n}', 0, 1, 0, '2024-04-21 02:07:23', '2024-04-21 02:07:23'),
(60, 7, '{\n  \"key1\": \"Ayşegül kaç yaşında ?\",\n   \"key2\": \"Ne zaman müsaitsin ?\",\n\"key3\": \"Onlar bilgisayar mühendisleri mi ?\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"  How old is Ayşegül ?\",\n  \"explain\":\"Ayşegül kaç yaşında ?\"\n}', 0, 1, 0, '2024-04-21 02:07:57', '2024-04-21 02:07:57'),
(61, 8, '{\r\n  \"key1\": \"Bugünün tarihi ne?\",\r\n  \"key2\": \"Bugün neredeyse hava nasıl?\",\r\n  \"key3\": \"Bugün kaçıncı gün?\",\r\n  \"correct_answer\": \"key1\",\r\n  \"title\": \"What is the date today?\",\r\n  \"explain\": \"Bugünün tarihi ne?\"\r\n}\r\n', 0, 1, 0, '2024-04-21 02:25:55', '2024-04-21 02:25:55'),
(62, 8, '{\r\n  \"key1\": \"Neden endişelisin?\",\r\n  \"key2\": \"Bugün neden endişelisin?\",\r\n  \"key3\": \"Neden endişelisin ?\",\r\n  \"correct_answer\": \"key3\",\r\n  \"title\": \"Why are you anxious?\",\r\n  \"explain\": \"Neden endişelisin ?\"\r\n}\r\n', 0, 1, 0, '2024-04-21 02:26:01', '2024-04-21 02:26:01'),
(63, 8, '{\n  \"key1\": \"Bugün çok soğuk\",\n  \"key2\": \"Çiçekler bahçede\",\n  \"key3\": \"Şu rafın üstündeki ne ?\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"What is on that shelf?\",\n  \"explain\": \"Şu rafın üstündeki ne ?\"\n}', 0, 1, 0, '2024-04-21 02:26:07', '2024-04-21 02:26:07'),
(64, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"There ___ many books on the shelf. Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'books\' çoğul olmasından dolayı \'are\' dır.\"\n}', 0, 1, 0, '2024-04-21 14:57:08', '2024-04-21 14:57:08'),
(65, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"Knowledge ___ the key to success. Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'Knowledge\' tekil olmasından dolayı \'is\' dır.\"\n}', 0, 1, 0, '2024-04-21 14:57:56', '2024-04-21 14:57:56'),
(66, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"_____ English your first language? Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'English\' tekil olmasından ve it\'i temsil etmesinden dolayı \'is\' dır.\"\n}', 0, 1, 0, '2024-04-21 14:58:53', '2024-04-21 14:58:53'),
(67, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"Soccer ___ the most-watched sport worldwide. Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'Soccer\' tekil olmasından ve it\'i temsil etmesinden dolayı \'is\' dır.\"\n}', 0, 1, 0, '2024-04-21 14:59:20', '2024-04-21 14:59:20'),
(68, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key3\",\n  \"title\": \"The children ___ excited about the upcoming field trip. Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'The children\' çoğul olmasından ve They\'i temsil etmesinden dolayı \'Are\' dır.\"\n}', 0, 1, 0, '2024-04-21 14:59:57', '2024-04-21 14:59:57'),
(69, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key5\",\n  \"title\": \"There ___ any milk left in the fridge. Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'any milk\' tekil olmasından ve any\'nin olumsuzluk eklentisinden dolayı \'is not\' dir.\"\n}', 0, 1, 0, '2024-04-21 15:02:05', '2024-04-21 15:02:05'),
(70, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"Patience ___ a virtue. Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'Patience \' tekil olmasından ve it\'i temsil etmesinden dolayı \'is\' dir.\"\n}', 0, 1, 0, '2024-04-21 15:03:00', '2024-04-21 15:03:00'),
(71, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"___ Chemistry a difficult subject for you? Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'Chemistry\' tekil olmasından ve it\'i temsil etmesinden dolayı \'is\' dir.\"\n}', 0, 1, 0, '2024-04-21 15:04:00', '2024-04-21 15:04:00'),
(72, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key4\",\n  \"title\": \"Penguins ___ capable of flying. Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'Penguins\' çoğul olmasından ve they\'i temsil etmesinden ayrıca penguenlerin uçamayacağından dolayı \'are not\' dir.\"\n}', 0, 1, 0, '2024-04-21 15:05:11', '2024-04-21 15:05:11'),
(73, 9, '{\n  \"key1\": \"am\",\n   \"key2\": \"is\",\n\"key3\": \"are\",\n\"key4\": \"are not\",\n\"key5\": \"is not\",\n\"key6\": \"am not\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"Time ___ precious, so use it wisely. Boş bırakılan yere ne gelmelidir?\",\n  \"explain\":\"Doğru cevap \'Time\' tekil olmasından ve it\'i temsil etmesinden dolayı \'is\' dir.\"\n}', 0, 1, 0, '2024-04-21 15:05:52', '2024-04-21 15:05:52'),
(74, 10, '{\n  \"key1\": \"Bu toplantıya kaç kişi katılacak?\",\n  \"key2\": \"Derslere düzenli olarak katılmak önemlidir.\",\n  \"key3\": \"Şirketin başarısı için çalışan katılımı çok önemlidir.\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"Regular attendance in classes is important.\",\n  \"explain\": \"Derslere düzenli olarak katılmak önemlidir.\"\n}', 0, 1, 0, '2024-04-21 16:41:00', '2024-04-21 16:41:00'),
(75, 10, '{\n  \"key1\": \"Hafta sonu nereyi ziyaret etmeyi planlıyorsun?\",\n  \"key2\": \"Bankayı sık sık ziyaret etmek zorunda değilsiniz.\",\n  \"key3\": \"Müzeyi daha önce ziyaret ettin mi?\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"You don\'t have to visit the bank often.\",\n  \"explain\": \"Bankayı sık sık ziyaret etmek zorunda değilsiniz.\"\n}', 0, 1, 0, '2024-04-21 16:41:12', '2024-04-21 16:41:12'),
(76, 10, '{\n  \"key1\": \"Spora düzenli olarak gitmek sağlıklıdır.\",\n  \"key2\": \"Bu ilacı günde üç defa düzenli olarak almanız gerekiyor.\",\n  \"key3\": \"Şirket pikniğine katılmak için düzenli olarak çalışmaya gerek yok.\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Going to the gym regularly is healthy.\",\n  \"explain\": \"Spora düzenli olarak gitmek sağlıklıdır.\"\n}', 0, 1, 0, '2024-04-21 16:42:50', '2024-04-21 16:42:50'),
(77, 10, '{\n  \"key1\": \"Yeni bir çalışan işe başladı mı?\",\n  \"key2\": \"Mühendislik ekibi çok yetenekli çalışanlardan oluşuyor.\",\n  \"key3\": \"Çay yapmak için mutfağa gitmeye gerek yok.\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"The engineering team consists of very talented employees.\",\n  \"explain\": \"Mühendislik ekibi çok yetenekli çalışanlardan oluşuyor.\"\n}', 0, 1, 0, '2024-04-21 16:43:38', '2024-04-21 16:43:38'),
(78, 10, '{\n  \"key1\": \"En yakın banka şubesi nerede?\",\n  \"key2\": \"Parayı nakit olarak mı kredi kartıyla mı ödemek istersiniz?\",\n  \"key3\": \"Kitap okumak için bankaya gitmek garip olmaz mı?\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"Where is the nearest bank branch?\",\n  \"explain\": \"En yakın banka şubesi nerede?\"\n}', 0, 1, 0, '2024-04-21 16:45:13', '2024-04-21 16:45:13'),
(79, 10, '{\n  \"key1\": \"Tutarlı bir egzersiz rutinine sahip olmanın önemi nedir?\",\n  \"key2\": \"Derste dikkatli dinlemek başarılı olmak için tutarlı bir şekilde yapılması gerekenlerden biridir.\",\n  \"key3\": \"Hava durumu tutarlı bir şekilde tahmin edilebilseydi hayat daha kolay olurdu.\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"What is the importance of having a consistent exercise routine?\",\n  \"explain\": \"Tutarlı bir egzersiz rutinine sahip olmanın önemi nedir?\"\n}', 0, 1, 0, '2024-04-21 16:47:45', '2024-04-21 16:47:45'),
(80, 10, '{\n  \"key1\": \"Suyun kaynama noktası 100 santigrat derecedir.\",\n  \"key2\": \"Düdüklü tencere, yiyeceklerin daha kısa sürede pişmesini sağlar çünkü içindeki basıncı artırarak suyun kaynama noktasını yükseltir.\",\n  \"key3\": \"Soğuk suyun kaynama noktası daha yüksektir.\",\n  \"correct_answer\": \"key1\",\n  \"title\": \"The boiling point of water is 100 degrees Celsius.\",\n  \"explain\": \"Suyun kaynama noktası 100 santigrat derecedir.\"\n}', 0, 1, 0, '2024-04-21 16:51:34', '2024-04-21 16:51:34'),
(81, 10, '{\n  \"key1\": \"Hava durumu bugün 25 derece olacak.\",\n  \"key2\": \"Matematik sınavında her zamanki gibi hiçbir şey anlamadım.\",\n  \"key3\": \"Dönme açılar genellikle derece (°) ile ölçülür.\",\n  \"correct_answer\": \"key2\",\n  \"title\": \"I completely zoned out during the math exam\",\n  \"explain\": \"Matematik sınavında her zamanki gibi hiçbir şey anlamadım.\"\n}', 0, 1, 0, '2024-04-21 16:54:04', '2024-04-21 16:54:04');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `quizler`
--

CREATE TABLE `quizler` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_end` tinyint(1) NOT NULL,
  `konu_anlatimi_id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `quizler`
--

INSERT INTO `quizler` (`id`, `is_end`, `konu_anlatimi_id`, `topic_id`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 1, '2024-04-19 16:26:12', '2024-04-19 16:26:12'),
(2, 0, 4, 3, '2024-04-20 02:25:59', '2024-04-20 02:25:59'),
(6, 0, 16, 14, '2024-04-21 01:30:25', '2024-04-21 01:30:25'),
(7, 0, 18, 16, '2024-04-21 01:51:56', '2024-04-21 01:51:56'),
(8, 0, 20, 18, '2024-04-21 02:15:38', '2024-04-21 02:15:38'),
(9, 0, 22, 20, '2024-04-21 14:55:02', '2024-04-21 14:55:02'),
(10, 0, 25, 23, '2024-04-21 16:40:47', '2024-04-21 16:40:47');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `topics`
--

CREATE TABLE `topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `excerpt` text NOT NULL,
  `isGrammar` tinyint(1) NOT NULL,
  `isQuiz` tinyint(1) NOT NULL,
  `isWord` tinyint(1) NOT NULL,
  `slug` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `topics`
--

INSERT INTO `topics` (`id`, `course_id`, `title`, `excerpt`, `isGrammar`, `isQuiz`, `isWord`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, '“Be” Birinci Kısım Kelime', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 1, 0, 'be-part-one-words', '2024-04-19 16:24:07', '2024-04-19 16:24:07'),
(2, 1, '\"Be\" Birinci Kısım Gramer', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 1, 0, 0, 'be-part-one-grammar', '2024-04-20 02:13:29', '2024-04-20 02:13:29'),
(3, 1, '\"Be\" Birinci Kısım Quiz', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 1, 0, 'be-part-one-quiz', '2024-04-20 02:24:42', '2024-04-20 02:24:42'),
(4, 1, '\"Be\" İkinci Kısım Gramer', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 1, 0, 0, 'be-part-two-grammar', '2024-04-20 02:47:16', '2024-04-20 02:47:16'),
(14, 1, '\"Be\" İkinci Kısım Quiz', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 1, 0, 'be-part-two-quiz', '2024-04-21 01:29:13', '2024-04-21 01:29:13'),
(15, 1, '\"Be\" İkinci Kısım Words', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 0, 1, 'be-part-two-words', '2024-04-21 01:41:41', '2024-04-21 01:41:41'),
(16, 1, '\"Be\" İkinci Kısım Quiz İki', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 1, 0, 'be-part-two-quiz-two', '2024-04-21 01:50:44', '2024-04-21 01:50:44'),
(17, 1, 'Be İkinci Kısım Words İki', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 0, 1, 'be-part-two-words-two', '2024-04-21 02:09:16', '2024-04-21 02:09:16'),
(18, 1, 'Be Kısım İki Quiz Üç', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 1, 0, 'be-part-two-quiz-three', '2024-04-21 02:14:47', '2024-04-21 02:14:47'),
(19, 1, 'Be Kısım Üç Words', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 0, 1, 'be-part-three-words', '2024-04-21 14:52:20', '2024-04-21 14:52:20'),
(20, 1, '\"Be\" Kısım Üç Quiz', 'İngilizce Dilinin en temel yapı taşlarından olan “Be” yi öğrenelim.', 0, 1, 0, 'be-part-three-quiz', '2024-04-21 14:54:31', '2024-04-21 14:54:31'),
(21, 1, 'Simple Present Tense Gramer Kısım 1', 'Simple Present Tense ile cümle kurmayı öğrenelim.', 1, 0, 0, 'simple-present-tense-grammar', '2024-04-21 16:23:15', '2024-04-21 16:23:15'),
(22, 1, 'Simple Present Tense Word Kısım 1', 'Simple Present Tense ile cümle kurmayı öğrenelim.', 0, 0, 1, 'simple-present-tense-word', '2024-04-21 16:37:07', '2024-04-21 16:37:07'),
(23, 1, 'Simple Present Tense Quiz 1 Kısım 1', 'Simple Present Tense ile cümle kurmayı öğrenelim.', 0, 1, 0, 'simple-present-tense-quiz', '2024-04-21 16:40:02', '2024-04-21 16:40:02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_pro_member` tinyint(1) NOT NULL DEFAULT 0,
  `pro_member_end_date` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `is_pro_member`, `pro_member_end_date`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Oktay', 'oktaykarakas71@gmail.com', NULL, '$2y$10$f2.KmrFMVzCoAXxc40Rf7ukOXP.w1Qwwtlw2RXVt9vTJ4BAQ1widy', 1, 0, NULL, 'QznPudoCdeaTdr46OngpeHRaoW6y0Y7y71kXqlbnj12q7qwSQE8gDfzjUHmf', '2024-04-18 21:05:30', '2024-04-18 21:05:30'),
(2, 'Oktay', 'oktayininstagram@gmail.com', NULL, '$2y$10$fVl2ivqFgN/fGw67QNitruGUsatlqLF.Or6xO.t0IOdTsEuXdLBlG', 0, 0, NULL, NULL, '2024-04-18 21:08:29', '2024-04-18 21:08:52');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_courses`
--

CREATE TABLE `user_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `completed_quizes` text NOT NULL,
  `isCompleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `user_courses`
--

INSERT INTO `user_courses` (`id`, `user_id`, `course_id`, `topic_id`, `completed_quizes`, `isCompleted`, `created_at`, `updated_at`) VALUES
(25, 1, 1, 15, '[]', 1, '2024-04-20 17:00:19', '2024-04-21 01:47:24');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_konu_anlatimi_id_foreign` (`konu_anlatimi_id`),
  ADD KEY `bookmarks_course_id_foreign` (`course_id`),
  ADD KEY `bookmarks_topic_id_foreign` (`topic_id`),
  ADD KEY `bookmarks_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `konu_anlatimi`
--
ALTER TABLE `konu_anlatimi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konu_anlatimi_topic_id_foreign` (`topic_id`),
  ADD KEY `konu_anlatimi_course_id_foreign` (`course_id`);

--
-- Tablo için indeksler `konu_anlatimi_commentler`
--
ALTER TABLE `konu_anlatimi_commentler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konu_anlatimi_commentler_konu_anlatimi_id_foreign` (`konu_anlatimi_id`),
  ADD KEY `konu_anlatimi_commentler_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_quiz_id_foreign` (`quiz_id`);

--
-- Tablo için indeksler `quizler`
--
ALTER TABLE `quizler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizler_konu_anlatimi_id_foreign` (`konu_anlatimi_id`),
  ADD KEY `quizler_topic_id_foreign` (`topic_id`);

--
-- Tablo için indeksler `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_course_id_foreign` (`course_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Tablo için indeksler `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_courses_user_id_foreign` (`user_id`),
  ADD KEY `user_courses_course_id_foreign` (`course_id`),
  ADD KEY `user_courses_topic_id_foreign` (`topic_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `konu_anlatimi`
--
ALTER TABLE `konu_anlatimi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Tablo için AUTO_INCREMENT değeri `konu_anlatimi_commentler`
--
ALTER TABLE `konu_anlatimi_commentler`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Tablo için AUTO_INCREMENT değeri `quizler`
--
ALTER TABLE `quizler`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_konu_anlatimi_id_foreign` FOREIGN KEY (`konu_anlatimi_id`) REFERENCES `konu_anlatimi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `konu_anlatimi`
--
ALTER TABLE `konu_anlatimi`
  ADD CONSTRAINT `konu_anlatimi_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `konu_anlatimi_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `konu_anlatimi_commentler`
--
ALTER TABLE `konu_anlatimi_commentler`
  ADD CONSTRAINT `konu_anlatimi_commentler_konu_anlatimi_id_foreign` FOREIGN KEY (`konu_anlatimi_id`) REFERENCES `konu_anlatimi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `konu_anlatimi_commentler_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizler` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `quizler`
--
ALTER TABLE `quizler`
  ADD CONSTRAINT `quizler_konu_anlatimi_id_foreign` FOREIGN KEY (`konu_anlatimi_id`) REFERENCES `konu_anlatimi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizler_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_courses_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Veritabanı: `new_schema`
--
CREATE DATABASE IF NOT EXISTS `new_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `new_schema`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Work', 'work', '2024-03-25 19:13:41', '2024-03-25 19:13:41'),
(2, 'Personal', 'personal', '2024-03-25 19:13:41', '2024-03-25 19:13:41'),
(3, 'Family', 'family', '2024-03-25 19:13:41', '2024-03-25 19:13:41');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '0001_01_01_000000_create_users_table', 1),
(12, '0001_01_01_000001_create_cache_table', 1),
(13, '0001_01_01_000002_create_jobs_table', 1),
(14, '2024_03_23_052628_create_post_table', 1),
(15, '2024_03_23_061357_create_categories_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `slug`, `title`, `excerpt`, `body`, `created_at`, `updated_at`, `published_at`) VALUES
(1, 3, 1, 'my-first-post', 'My Family Post', 'Lorem ipsum dolar sit amet.', 'Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.', '2024-03-25 19:11:03', '2024-03-25 19:11:03', NULL),
(2, 3, 1, 'my-first-post', 'My Family Post', 'Lorem ipsum dolar sit amet.', 'Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.', '2024-03-25 19:13:05', '2024-03-25 19:13:05', NULL),
(3, 3, 1, 'my-first-post', 'My Family Post', 'Lorem ipsum dolar sit amet.', 'Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.', '2024-03-25 19:13:41', '2024-03-25 19:13:41', NULL),
(4, 2, 1, 'my-first-post', 'My Family Post', 'Lorem ipsum dolar sit amet.', 'Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.', '2024-03-25 19:13:41', '2024-03-25 19:13:41', NULL),
(5, 1, 1, 'my-first-post', 'My Family Post', 'Lorem ipsum dolar sit amet.', 'Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.Lorem ipsum dolar sit amet.', '2024-03-25 19:13:41', '2024-03-25 19:13:41', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('r5U4hsFqoeFHfO4BXsWTDarI3s6N6dr9kJ8pWWLU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHd3OGlyRlhZNlJnRWRZNkhJbTBpVHJESUdjakxKVHQ3NmFFU1NkRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/cGFnZT0yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1711519126);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Fanny Trantow DVM', 'anna27@example.net', '2024-03-25 19:13:41', '$2y$12$yWPAS.FnZI6D64DHaHL79.GUpbOmEApWMVwlI6zzRpkR9wl8Rq8Gi', 'r38ECsvNsw', '2024-03-25 19:13:41', '2024-03-25 19:13:41');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Tablo için indeksler `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
