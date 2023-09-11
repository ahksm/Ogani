-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 05 2023 г., 14:53
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `phpshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `sort_order`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Beauty', 1, '2023-01-25 18:30:39', '2023-01-25 18:30:39', 1),
(2, 'Food', 2, '2023-01-25 18:30:39', '2023-01-25 18:30:39', 1),
(3, 'Life Style', 3, '2023-01-25 18:31:07', '2023-01-25 18:31:07', 1),
(4, 'Travel', 4, '2023-01-25 18:31:07', '2023-01-25 18:31:07', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `sort_order`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Fruits', 1, '2023-01-17 13:21:36', '2023-01-17 16:47:00', 1),
(2, 'Vegetables', 2, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1),
(3, 'Dry Fruits & Nuts', 3, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1),
(4, 'Meat', 4, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1),
(5, 'Dairies', 5, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1),
(6, 'Fast Menu', 6, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`id`, `category_id`, `name`, `sort_order`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Fresh Fruits', 1, '2023-01-17 13:22:33', '2023-01-17 16:54:56', 1),
(2, 1, 'Berries', 2, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(3, 3, 'Dried Fruits', 3, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(4, 2, 'Vegetables', 4, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(5, 3, 'Nuts', 5, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(6, 4, 'Fresh Meat', 6, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(7, 4, 'Sea Food', 7, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(8, 5, 'Dairies', 8, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(9, 6, 'Fast Food', 9, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(10, 6, 'Dessert', 10, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1),
(11, 6, 'Beverages', 11, '2023-01-17 13:22:33', '2023-01-17 13:22:52', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_name`, `user_phone`, `user_comment`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, 'abi', '998999208313', 'Bla Bla Bla', '2023-01-24 18:46:47', '2023-01-24 20:26:25', 1),
(2, 3, 'abi', '998999208313', 'Bla Bla Bla2', '2023-01-24 19:08:00', '2023-01-24 19:08:00', 1),
(3, 10, 'ahksm', '+998999208313', '', '2023-02-02 05:46:29', '2023-02-02 05:46:29', 1),
(4, 10, 'ahksm', '+998999208313', '', '2023-02-02 05:49:28', '2023-02-02 05:49:28', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_1pcs` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price_1pcs`, `total_price`) VALUES
(1, 1, 11, 2, '4', '8'),
(2, 1, 12, 2, '15', '30'),
(3, 1, 13, 1, '0.70', '0.7'),
(4, 1, 14, 2, '1.5', '3'),
(5, 2, 2, 4, '20', '80'),
(6, 2, 3, 3, '5', '15'),
(7, 2, 4, 2, '10', '20'),
(8, 2, 6, 5, '40', '200'),
(9, 2, 7, 5, '100', '500'),
(10, 2, 8, 7, '5', '35'),
(11, 3, 1, 1, '1', '1'),
(12, 3, 2, 1, '20', '20'),
(13, 3, 4, 1, '10', '10'),
(14, 3, 5, 1, '5', '5'),
(15, 3, 6, 1, '40', '40'),
(16, 3, 13, 1, '0.7', '0.7'),
(17, 4, 1, 6, '1', '6'),
(18, 4, 4, 4, '10', '40'),
(19, 4, 6, 4, '40', '160'),
(20, 4, 13, 5, '0.7', '3.5');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `post_content` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `title`, `post_content`, `author`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Top 10 Lipsticks for the Perfect Pout', 'Finding the perfect lipstick can be a daunting task, but we\'ve got you covered with our top 10 picks for the ultimate pout. From classic reds to trendy nudes, these lipsticks are sure to become your new go-tos.', 'Jane Smith', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(2, 1, 'The Best Skincare Routine for Glowing Skin', 'Get the glow you\'ve always wanted with our step-by-step skincare routine. From cleansing to moisturizing, these tips will leave your skin looking and feeling its best.', 'John Doe', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(3, 1, 'The Ultimate Guide to At-Home Manicures', 'DIY manicures can be just as good as salon ones. All you need is the right tools and techniques. Here\'s everything you need to know for a flawless at-home manicure.', 'Emily Johnson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(4, 1, 'The Science of Hair: How to Keep Yours Healthy', 'Your hair is made up of a delicate balance of proteins, lipids, and minerals. Learn how to keep it healthy and strong with our comprehensive guide.', 'Michael Brown', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(5, 1, '5 Easy Hairstyles for Busy Moms', 'Being a busy mom doesn\'t mean you have to sacrifice style. Check out our top 5 easy hairstyles that you can do in just a few minutes.', 'Jessica Davis', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(6, 1, 'The Best Makeup Products for Acne-Prone Skin', 'Acne-prone skin can be a challenge to work with, but it doesn\'t have to be. Here are our top picks for makeup products that won\'t clog your pores.', 'Emily Thompson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(7, 1, 'The Importance of Sun Protection in Skincare', 'Protecting your skin from the sun\'s harmful rays is crucial for maintaining a youthful appearance. Learn how to choose the right sunscreen and incorporate it into your daily routine.', 'John Smith', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(8, 1, 'The Secret to Long, Luscious Lashes', 'Get the lashes of your dreams with our top tips and product recommendations. From serums to mascaras, we\'ve got everything you need to know.', 'Emily Wilson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(9, 1, 'The Beginner\'s Guide to Contouring', 'Contouring can seem intimidating, but it\'s easier than you think. Learn the basics and get started with our beginner-friendly guide.', 'Matthew Taylor', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(10, 1, 'The Best Hair Products for Curly Hair', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(11, 1, 'The Best Hair Products for Curly Hair 2', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(12, 1, 'The Best Hair Products for Curly Hair 3', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(13, 1, 'The Best Hair Products for Curly Hair 4', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(14, 1, 'The Best Hair Products for Curly Hair 5', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(15, 1, 'The Best Hair Products for Curly Hair 6', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(16, 1, 'The Best Hair Products for Curly Hair 7', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(17, 1, 'The Best Hair Products for Curly Hair 8', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(18, 1, 'The Best Hair Products for Curly Hair 9', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(19, 1, 'The Best Hair Products for Curly Hair 10', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(20, 1, 'The Best Hair Products for Curly Hair 11', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(21, 1, 'The Best Hair Products for Curly Hair 12', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(22, 1, 'The Best Hair Products for Curly Hair 13', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(23, 1, 'The Best Hair Products for Curly Hair 14', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(24, 1, 'The Best Hair Products for Curly Hair 15', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(25, 1, 'The Best Hair Products for Curly Hair 16', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(26, 1, 'The Best Hair Products for Curly Hair 17', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(27, 1, 'The Best Hair Products for Curly Hair 18', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(28, 1, 'The Best Hair Products for Curly Hair 19', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(29, 1, 'The Best Hair Products for Curly Hair 20', 'Curly hair can be difficult to manage, but with the right products, it can be tamed. Check out our top picks for shampoos, conditioners, and styling products.', 'Emily Anderson', '2023-01-26 21:47:16', '2023-01-26 21:47:16', 1),
(30, 2, 'The Best Sushi Restaurants in Los Angeles 1', 'Los Angeles is home to some of the best sushi restaurants in the country. Check out our top picks for the best sushi in LA.', 'Emily Johnson', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(31, 2, '5 Easy and Delicious Pasta Recipes for Weeknight Dinners 2', 'Don\'t have a lot of time to cook but still want a delicious dinner? Check out these five easy pasta recipes that are perfect for busy weeknights.', 'John Smith', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(32, 2, 'The Best BBQ Joints in Texas 3', 'Texas is known for its delicious BBQ. Check out our top picks for the best BBQ joints in the state.', 'Michael Williams', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(33, 2, 'The Best Vegetarian and Vegan Restaurants in San Francisco 4', 'San Francisco is home to some of the best vegetarian and vegan restaurants in the country. Check out our top picks for the best veggie and vegan options in the city.', 'Emily Johnson', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(34, 2, 'The Best Seafood Restaurants in New Orleans 5', 'New Orleans is known for its delicious seafood. Check out our top picks for the best seafood restaurants in the city.', 'John Smith', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(35, 2, 'The Best Coffee Shops in Seattle 6', 'Seattle is home to some of the best coffee shops in the country. Check out our top picks for the best coffee in Seattle.', 'Michael Williams', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(36, 2, 'The Best Steakhouses in Chicago 7', 'Chicago is home to some of the best steakhouses in the country. Check out our top picks for the best steaks in the city.', 'Emily Johnson', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(37, 2, 'The Best Tacos in San Diego 8', 'San Diego is known for its delicious tacos. Check out our top picks for the best tacos in the city.', 'John Smith', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(38, 2, 'The Best Ice Cream Shops in New York City 9', 'New York City is home to some of the best ice cream shops in the country. Check out our top picks for the best ice cream in the city.', 'Michael Williams', '2023-01-27 07:06:56', '2023-01-27 07:06:56', 1),
(39, 2, 'The Best Pizza Places in New York City 10', 'New York City is home to some of the best pizza places in the country. Check out our top picks for the best pizza in the city.', 'Michael Williams', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(40, 2, 'The Best Chinese Restaurants in Las Vegas 11', 'Las Vegas is home to some of the best Chinese restaurants in the country. Check out our top picks for the best Chinese food in Vegas.', 'Emily Johnson', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(41, 2, 'The Best Thai Restaurants in Boston 12', 'Boston is known for its delicious Thai food. Check out our top picks for the best Thai restaurants in the city.', 'John Smith', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(42, 2, 'The Best Indian Restaurants in Houston 13', 'Houston is home to some of the best Indian restaurants in the country. Check out our top picks for the best Indian food in Houston.', 'Michael Williams', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(43, 2, 'The Best Mexican Restaurants in Phoenix 14', 'Phoenix is known for its delicious Mexican food. Check out our top picks for the best Mexican restaurants in the city.', 'Emily Johnson', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(44, 2, 'The Best Italian Restaurants in Miami 15', 'Miami is home to some of the best Italian restaurants in the country. Check out our top picks for the best Italian food in Miami.', 'John Smith', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(45, 2, 'The Best Korean BBQ Restaurants in Atlanta 16', 'Atlanta is known for its delicious Korean BBQ. Check out our top picks for the best Korean BBQ restaurants in the city.', 'Michael Williams', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(46, 2, 'The Best French Restaurants in Denver 17', 'Denver is home to some of the best French restaurants in the country. Check out our top picks for the best French food in Denver.', 'Emily Johnson', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(47, 2, 'The Best Greek Restaurants in Portland 18', 'Portland is known for its delicious Greek food. Check out our top picks for the best Greek restaurants in the city.', 'John Smith', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(48, 2, 'The Best Vietnamese Restaurants in Washington D.C. 19', 'Washington D.C. is home to some of the best Vietnamese restaurants in the country. Check out our top picks for the best Vietnamese food in D.C.', 'Michael Williams', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(49, 2, 'The Best Farm-to-Table Restaurants in Nashville 20', 'Nashville is home to some of the best farm-to-table restaurants in the country. Check out our top picks for the best farm-to-table dining in Nashville.', 'Emily Johnson', '2023-01-27 07:06:57', '2023-01-27 07:06:57', 1),
(50, 3, '10 Simple Ways to Live a More Sustainable Lifestyle', 'Living a more sustainable lifestyle doesn\'t have to be difficult. Here are 10 simple ways you can start making a positive impact on the environment today.', 'John Smith', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(51, 3, '5 Tips for a Minimalist Lifestyle', 'Minimalism can be a great way to simplify your life and find more joy in the things that truly matter. Here are 5 tips for getting started.', 'Emily Johnson', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(52, 3, '7 Habits of Highly Effective People', 'Want to be more productive and successful in life? Here are 7 habits that can help you achieve your goals.', 'Michael Williams', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(53, 3, 'The Importance of Self-Care and How to Practice it', 'Self-care is essential for maintaining good physical and mental health. Here\'s how to make it a part of your daily routine.', 'John Smith', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(54, 3, 'The Benefits of Yoga and Meditation', 'Yoga and meditation can be great for improving mental and physical health. Here\'s how to get started.', 'Emily Johnson', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(55, 3, 'How to Start a Garden at Home', 'Starting a garden at home can be a fun and rewarding way to grow your own food. Here\'s how to get started.', 'Michael Williams', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(56, 3, 'The Importance of Sleep and How to Improve it', 'Getting enough sleep is essential for good physical and mental health. Here\'s how to make sure you\'re getting the sleep you need.', 'John Smith', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(57, 3, '5 Tips for Staying Organized', 'Staying organized can help you be more productive and reduce stress. Here are 5 tips for getting started.', 'Emily Johnson', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(58, 3, 'The Importance of Nutrition and How to Eat Healthily', 'Eating a healthy diet is essential for good physical and mental health. Here\'s how to make sure you\'re getting the nutrients you need.', 'Michael Williams', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(59, 3, 'The Benefits of Exercise and How to Incorporate it into Your Life', 'Exercise is essential for good physical and mental health. Here\'s how to make it a part of your daily routine.', 'John Smith', '2023-01-28 08:15:45', '2023-01-28 08:15:45', 1),
(60, 4, 'The Best Places to Travel in Europe', 'Europe is home to some of the most beautiful and historic places in the world. Here are our top picks for where to go on your next trip.', 'John Smith', '2023-01-28 08:18:10', '2023-01-28 08:18:10', 1),
(61, 4, 'How to Plan the Perfect Road Trip', 'A road trip can be a fun and exciting way to see the country. Here\'s how to plan the perfect trip, from choosing the right route to finding the best places to stay.', 'Emily Johnson', '2023-01-28 08:18:10', '2023-01-28 08:18:10', 1),
(62, 4, 'The Best Places to Travel in Asia', 'Asia is home to some of the most fascinating and exotic places in the world. Here are our top picks for where to go on your next trip.', 'Michael Williams', '2023-01-28 08:18:10', '2023-01-28 08:18:10', 1),
(63, 4, 'Tips for Traveling on a Budget', 'Traveling can be expensive, but it doesn\'t have to be. Here are some tips for how to save money on your next trip.', 'John Smith', '2023-01-28 08:18:10', '2023-01-28 08:18:10', 1),
(64, 4, 'The Best Places to Travel in North America', 'North America is home to some of the most beautiful and diverse places in the world. Here are our top picks for where to go on your next trip.', 'Emily Johnson', '2023-01-28 08:18:10', '2023-01-28 14:09:10', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `weight` float NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int NOT NULL,
  `category_id` int NOT NULL,
  `code` int NOT NULL,
  `price` float NOT NULL,
  `availability` int NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_sale` int NOT NULL DEFAULT '0',
  `sale_percent` int NOT NULL,
  `old_price` float NOT NULL,
  `is_featured` int NOT NULL DEFAULT '0',
  `is_latest` int NOT NULL,
  `is_rated` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `weight`, `size`, `color`, `department_id`, `category_id`, `code`, `price`, `availability`, `brand`, `is_sale`, `sale_percent`, `old_price`, `is_featured`, `is_latest`, `is_rated`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Apple', 1, 'medium', 'green', 1, 1, 674857, 1, 1, 'Korzinka', 1, 20, 2, 1, 1, 0, '2023-01-17 13:23:19', '2023-01-19 08:43:22', 1),
(2, 'Beef', 1.5, 'large', 'red', 6, 4, 546765, 20, 1, 'To\'xtaniyoz Ota', 1, 20, 25, 1, 0, 1, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(3, 'Mango', 1, 'medium', 'yellow', 1, 1, 546794, 5, 1, 'Macro Supermarket', 1, 20, 7, 1, 1, 0, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(4, 'Burger', 0.3, 'medium', 'yellow', 9, 6, 425867, 10, 1, 'Burger King', 0, 20, 12, 1, 0, 1, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(5, 'Banana', 2, 'medium', 'yellow', 2, 1, 546762, 5, 1, 'Bananzo\'r', 1, 15, 8, 1, 1, 1, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(6, 'Cashew', 0.5, 'tiny', 'white', 5, 3, 453786, 40, 1, 'Cashew brand', 1, 10, 44, 1, 1, 1, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(7, 'Oysters', 1, 'small', 'black', 7, 4, 879645, 100, 1, 'Sea Food Corporation', 1, 5, 120, 1, 1, 1, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(8, 'Dragonfruit', 0.6, 'medium', 'red', 1, 1, 124768, 5, 1, 'Fruit company', 1, 3, 6, 1, 1, 1, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(9, 'Watermelon', 3, 'large', 'green', 2, 1, 128475, 2, 1, 'Watermelon brand', 1, 50, 4, 1, 1, 1, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(10, 'Orange', 1, 'medium', 'yellow', 1, 1, 675849, 1, 1, 'Orange brand', 1, 50, 2, 1, 1, 1, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(11, 'Coka Cola', 0.5, 'medium', 'black', 11, 6, 647814, 4, 1, 'Coke', 0, 0, 0, 1, 1, 0, '2023-01-28 19:03:49', '2023-01-17 16:34:10', 1),
(12, 'Сottage cheese', 1, 'medium', 'white', 5, 5, 784937, 15, 1, 'Prostokvashino', 1, 30, 19, 1, 1, 1, '2023-01-17 16:04:32', '2023-01-19 16:44:16', 1),
(13, 'Carrot', 1, 'medium', 'yellow', 2, 2, 456789, 0.7, 1, 'Bucks Bunny', 1, 10, 0.77, 1, 1, 0, '2023-01-19 15:52:20', '2023-01-19 16:50:50', 1),
(14, 'Donut', 0.085, 'small', 'blue', 10, 6, 789456, 1.5, 1, 'B&R', 0, 0, 0, 1, 1, 1, '2023-01-19 17:41:27', '2023-01-19 17:41:56', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_texts`
--

CREATE TABLE `product_texts` (
  `id` int NOT NULL,
  `short_descr` text COLLATE utf8_unicode_ci NOT NULL,
  `long_descr` text COLLATE utf8_unicode_ci NOT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `review` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `product_texts`
--

INSERT INTO `product_texts` (`id`, `short_descr`, `long_descr`, `info`, `review`) VALUES
(1, 'Integer finibus est at urna suscipit, vitae malesuada justo pulvinar. Sed volutpat at libero a mattis. Duis sodales imperdiet dui sit amet congue. Proin varius sed odio vitae dapibus. Etiam mollis sollicitudin lorem sit amet congue. Curabitur ut orci orci. Curabitur at nisl vitae mi gravida cursus. Quisque quis libero dui. Sed iaculis lectus non risus rhoncus, sit amet dignissim ligula suscipit. Fusce pharetra laoreet consectetur. Maecenas eget placerat sapien, in ornare purus. Nullam imperdiet in mauris sit amet lacinia. Donec varius mauris tellus, nec semper neque tempus condimentum. Quisque vulputate finibus quam, et faucibus nibh posuere et. Phasellus vulputate ante tristique, imperdiet lacus nec, ultricies libero.', 'Etiam at enim ut justo condimentum rutrum eget eu quam. Proin massa justo, mattis non tempus ut, efficitur quis diam. Vivamus interdum nibh vel justo maximus blandit. Nam quis dictum nunc. Curabitur nec blandit libero, a sollicitudin urna. Suspendisse potenti. Phasellus lacinia ligula tortor, nec hendrerit augue vulputate vitae. Nulla hendrerit porttitor purus. Aenean eu orci sagittis, finibus massa at, dapibus lorem. Donec eros eros, convallis convallis maximus in, viverra eu metus. Etiam nec viverra ex. In quis orci odio. Integer tincidunt lacinia dignissim. Fusce sodales nulla purus, sed sodales justo aliquet at.', 'Suspendisse potenti. Nulla sed egestas urna. Aliquam leo mauris, cursus a semper eu, varius ac velit. Nulla vel lobortis ante. Quisque aliquam dui pretium, aliquet arcu eget, aliquam orci. Quisque non metus quis quam maximus volutpat sit amet a ante. Curabitur vitae velit sed nulla condimentum elementum et at lorem. Donec ut ante at magna sagittis semper. Nullam ullamcorper ac risus et ultrices. Sed eleifend vitae arcu et placerat. Nulla molestie velit arcu, vel hendrerit erat interdum vitae. Curabitur neque ante, egestas in luctus eu, ultricies nec odio. Pellentesque ultrices vulputate tortor vitae sagittis. Proin nisi eros, consequat eget erat quis, dapibus auctor diam. Proin vitae consectetur ipsum, sed volutpat nisi.', 'Integer mattis viverra lacus, eu lobortis elit auctor eget. Phasellus vulputate cursus lectus vitae consequat. Nulla aliquam urna vitae dapibus maximus. Phasellus porttitor lectus ut lobortis venenatis. In dui tellus, imperdiet quis leo non, tincidunt congue urna. Sed bibendum venenatis justo eu facilisis. Nulla facilisis non dolor ac vulputate. Suspendisse molestie, dui ac tincidunt tempus, dui eros condimentum leo, eget lacinia nunc eros nec quam. Integer cursus ligula at ligula aliquam mattis. Nulla facilisi. Vestibulum ut maximus massa. Phasellus egestas, tortor sit amet cursus porttitor, quam diam ullamcorper eros, sit amet pharetra mi ante a ex. Suspendisse ut elit lorem. Morbi viverra fermentum hendrerit. Fusce ac ex dapibus mi cursus tincidunt a sit amet ligula.'),
(2, 'Donec ac lacinia turpis, et accumsan justo. Nunc convallis molestie metus, non lobortis nulla porttitor a. Sed mattis rutrum velit ut lacinia. Praesent ornare, augue nec semper semper, erat felis porta urna, at laoreet velit est ut dolor. Cras id urna varius, interdum odio eu, fringilla lacus. Vivamus laoreet sagittis arcu. Proin sed hendrerit massa. In pulvinar, metus non facilisis sollicitudin, tellus arcu scelerisque tortor, id pharetra erat risus ut mi.', 'Fusce eros leo, luctus at efficitur sit amet, tincidunt sed libero. Vivamus tempor pharetra neque ornare vehicula. Donec in maximus nisi. Fusce vitae blandit velit. Pellentesque a efficitur lectus. Mauris efficitur, ipsum eget placerat tristique, sem dolor consequat enim, non sagittis dolor arcu et quam. Maecenas quis eros faucibus, aliquam elit sed, aliquet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. In tempus tempus libero, eu interdum augue ultrices et. Nunc placerat sed velit et condimentum. Vivamus eget ante a est malesuada varius. Nunc tincidunt, neque at interdum tincidunt, est est facilisis odio, ut euismod tortor lorem quis odio. Nulla lorem massa, mollis in cursus a, tincidunt id nisi. Etiam sollicitudin, felis non congue mollis, risus urna gravida purus, ac condimentum elit lacus eget leo. Aliquam quis consectetur lacus. Fusce nec vestibulum nulla.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in ex vitae nisl ornare gravida id dictum mauris. Phasellus a nulla non nunc finibus euismod ut et nulla. Mauris non consequat mauris. Nam nec tristique ante. Vivamus felis enim, iaculis non condimentum nec, malesuada iaculis ligula. Aliquam dignissim, ligula non mattis finibus, odio est vestibulum mauris, a fermentum ipsum lacus sed felis. Praesent id pharetra dolor, et cursus turpis. Duis feugiat purus ac eros cursus, et sodales arcu aliquet. In a mauris ultricies neque porttitor eleifend vel ac lacus. Donec luctus mi vel leo bibendum, vel luctus nibh venenatis. Nulla convallis erat turpis, et bibendum lectus molestie laoreet. Nunc cursus massa ut viverra condimentum. Nullam at tellus ut libero blandit blandit. Morbi semper rhoncus maximus.', 'Duis purus massa, ullamcorper eu interdum vel, tristique eget mi. Nunc eu convallis orci, sollicitudin posuere ligula. Nam sit amet ipsum a massa maximus euismod vitae ac est. Nullam venenatis sed magna iaculis dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut tempor, ex vitae aliquam cursus, sapien metus tempor nisl, id consequat tortor tellus sit amet ante. Etiam non aliquam lacus, ut hendrerit risus. Suspendisse imperdiet, dui eu molestie euismod, magna eros laoreet dolor, a vulputate justo augue sagittis metus. Donec efficitur diam arcu, eu pharetra nunc lobortis eu. Proin turpis augue, dictum sit amet finibus eu, sollicitudin vitae odio.'),
(3, 'Integer finibus est at urna suscipit, vitae malesuada justo pulvinar. Sed volutpat at libero a mattis. Duis sodales imperdiet dui sit amet congue. Proin varius sed odio vitae dapibus. Etiam mollis sollicitudin lorem sit amet congue. Curabitur ut orci orci. Curabitur at nisl vitae mi gravida cursus. Quisque quis libero dui. Sed iaculis lectus non risus rhoncus, sit amet dignissim ligula suscipit. Fusce pharetra laoreet consectetur. Maecenas eget placerat sapien, in ornare purus. Nullam imperdiet in mauris sit amet lacinia. Donec varius mauris tellus, nec semper neque tempus condimentum. Quisque vulputate finibus quam, et faucibus nibh posuere et. Phasellus vulputate ante tristique, imperdiet lacus nec, ultricies libero.', 'Etiam at enim ut justo condimentum rutrum eget eu quam. Proin massa justo, mattis non tempus ut, efficitur quis diam. Vivamus interdum nibh vel justo maximus blandit. Nam quis dictum nunc. Curabitur nec blandit libero, a sollicitudin urna. Suspendisse potenti. Phasellus lacinia ligula tortor, nec hendrerit augue vulputate vitae. Nulla hendrerit porttitor purus. Aenean eu orci sagittis, finibus massa at, dapibus lorem. Donec eros eros, convallis convallis maximus in, viverra eu metus. Etiam nec viverra ex. In quis orci odio. Integer tincidunt lacinia dignissim. Fusce sodales nulla purus, sed sodales justo aliquet at.', 'Suspendisse potenti. Nulla sed egestas urna. Aliquam leo mauris, cursus a semper eu, varius ac velit. Nulla vel lobortis ante. Quisque aliquam dui pretium, aliquet arcu eget, aliquam orci. Quisque non metus quis quam maximus volutpat sit amet a ante. Curabitur vitae velit sed nulla condimentum elementum et at lorem. Donec ut ante at magna sagittis semper. Nullam ullamcorper ac risus et ultrices. Sed eleifend vitae arcu et placerat. Nulla molestie velit arcu, vel hendrerit erat interdum vitae. Curabitur neque ante, egestas in luctus eu, ultricies nec odio. Pellentesque ultrices vulputate tortor vitae sagittis. Proin nisi eros, consequat eget erat quis, dapibus auctor diam. Proin vitae consectetur ipsum, sed volutpat nisi.', 'Integer mattis viverra lacus, eu lobortis elit auctor eget. Phasellus vulputate cursus lectus vitae consequat. Nulla aliquam urna vitae dapibus maximus. Phasellus porttitor lectus ut lobortis venenatis. In dui tellus, imperdiet quis leo non, tincidunt congue urna. Sed bibendum venenatis justo eu facilisis. Nulla facilisis non dolor ac vulputate. Suspendisse molestie, dui ac tincidunt tempus, dui eros condimentum leo, eget lacinia nunc eros nec quam. Integer cursus ligula at ligula aliquam mattis. Nulla facilisi. Vestibulum ut maximus massa. Phasellus egestas, tortor sit amet cursus porttitor, quam diam ullamcorper eros, sit amet pharetra mi ante a ex. Suspendisse ut elit lorem. Morbi viverra fermentum hendrerit. Fusce ac ex dapibus mi cursus tincidunt a sit amet ligula.'),
(4, 'Donec ac lacinia turpis, et accumsan justo. Nunc convallis molestie metus, non lobortis nulla porttitor a. Sed mattis rutrum velit ut lacinia. Praesent ornare, augue nec semper semper, erat felis porta urna, at laoreet velit est ut dolor. Cras id urna varius, interdum odio eu, fringilla lacus. Vivamus laoreet sagittis arcu. Proin sed hendrerit massa. In pulvinar, metus non facilisis sollicitudin, tellus arcu scelerisque tortor, id pharetra erat risus ut mi.', 'Fusce eros leo, luctus at efficitur sit amet, tincidunt sed libero. Vivamus tempor pharetra neque ornare vehicula. Donec in maximus nisi. Fusce vitae blandit velit. Pellentesque a efficitur lectus. Mauris efficitur, ipsum eget placerat tristique, sem dolor consequat enim, non sagittis dolor arcu et quam. Maecenas quis eros faucibus, aliquam elit sed, aliquet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. In tempus tempus libero, eu interdum augue ultrices et. Nunc placerat sed velit et condimentum. Vivamus eget ante a est malesuada varius. Nunc tincidunt, neque at interdum tincidunt, est est facilisis odio, ut euismod tortor lorem quis odio. Nulla lorem massa, mollis in cursus a, tincidunt id nisi. Etiam sollicitudin, felis non congue mollis, risus urna gravida purus, ac condimentum elit lacus eget leo. Aliquam quis consectetur lacus. Fusce nec vestibulum nulla.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in ex vitae nisl ornare gravida id dictum mauris. Phasellus a nulla non nunc finibus euismod ut et nulla. Mauris non consequat mauris. Nam nec tristique ante. Vivamus felis enim, iaculis non condimentum nec, malesuada iaculis ligula. Aliquam dignissim, ligula non mattis finibus, odio est vestibulum mauris, a fermentum ipsum lacus sed felis. Praesent id pharetra dolor, et cursus turpis. Duis feugiat purus ac eros cursus, et sodales arcu aliquet. In a mauris ultricies neque porttitor eleifend vel ac lacus. Donec luctus mi vel leo bibendum, vel luctus nibh venenatis. Nulla convallis erat turpis, et bibendum lectus molestie laoreet. Nunc cursus massa ut viverra condimentum. Nullam at tellus ut libero blandit blandit. Morbi semper rhoncus maximus.', 'Duis purus massa, ullamcorper eu interdum vel, tristique eget mi. Nunc eu convallis orci, sollicitudin posuere ligula. Nam sit amet ipsum a massa maximus euismod vitae ac est. Nullam venenatis sed magna iaculis dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut tempor, ex vitae aliquam cursus, sapien metus tempor nisl, id consequat tortor tellus sit amet ante. Etiam non aliquam lacus, ut hendrerit risus. Suspendisse imperdiet, dui eu molestie euismod, magna eros laoreet dolor, a vulputate justo augue sagittis metus. Donec efficitur diam arcu, eu pharetra nunc lobortis eu. Proin turpis augue, dictum sit amet finibus eu, sollicitudin vitae odio.'),
(5, 'Integer finibus est at urna suscipit, vitae malesuada justo pulvinar. Sed volutpat at libero a mattis. Duis sodales imperdiet dui sit amet congue. Proin varius sed odio vitae dapibus. Etiam mollis sollicitudin lorem sit amet congue. Curabitur ut orci orci. Curabitur at nisl vitae mi gravida cursus. Quisque quis libero dui. Sed iaculis lectus non risus rhoncus, sit amet dignissim ligula suscipit. Fusce pharetra laoreet consectetur. Maecenas eget placerat sapien, in ornare purus. Nullam imperdiet in mauris sit amet lacinia. Donec varius mauris tellus, nec semper neque tempus condimentum. Quisque vulputate finibus quam, et faucibus nibh posuere et. Phasellus vulputate ante tristique, imperdiet lacus nec, ultricies libero.', 'Etiam at enim ut justo condimentum rutrum eget eu quam. Proin massa justo, mattis non tempus ut, efficitur quis diam. Vivamus interdum nibh vel justo maximus blandit. Nam quis dictum nunc. Curabitur nec blandit libero, a sollicitudin urna. Suspendisse potenti. Phasellus lacinia ligula tortor, nec hendrerit augue vulputate vitae. Nulla hendrerit porttitor purus. Aenean eu orci sagittis, finibus massa at, dapibus lorem. Donec eros eros, convallis convallis maximus in, viverra eu metus. Etiam nec viverra ex. In quis orci odio. Integer tincidunt lacinia dignissim. Fusce sodales nulla purus, sed sodales justo aliquet at.', 'Suspendisse potenti. Nulla sed egestas urna. Aliquam leo mauris, cursus a semper eu, varius ac velit. Nulla vel lobortis ante. Quisque aliquam dui pretium, aliquet arcu eget, aliquam orci. Quisque non metus quis quam maximus volutpat sit amet a ante. Curabitur vitae velit sed nulla condimentum elementum et at lorem. Donec ut ante at magna sagittis semper. Nullam ullamcorper ac risus et ultrices. Sed eleifend vitae arcu et placerat. Nulla molestie velit arcu, vel hendrerit erat interdum vitae. Curabitur neque ante, egestas in luctus eu, ultricies nec odio. Pellentesque ultrices vulputate tortor vitae sagittis. Proin nisi eros, consequat eget erat quis, dapibus auctor diam. Proin vitae consectetur ipsum, sed volutpat nisi.', 'Integer mattis viverra lacus, eu lobortis elit auctor eget. Phasellus vulputate cursus lectus vitae consequat. Nulla aliquam urna vitae dapibus maximus. Phasellus porttitor lectus ut lobortis venenatis. In dui tellus, imperdiet quis leo non, tincidunt congue urna. Sed bibendum venenatis justo eu facilisis. Nulla facilisis non dolor ac vulputate. Suspendisse molestie, dui ac tincidunt tempus, dui eros condimentum leo, eget lacinia nunc eros nec quam. Integer cursus ligula at ligula aliquam mattis. Nulla facilisi. Vestibulum ut maximus massa. Phasellus egestas, tortor sit amet cursus porttitor, quam diam ullamcorper eros, sit amet pharetra mi ante a ex. Suspendisse ut elit lorem. Morbi viverra fermentum hendrerit. Fusce ac ex dapibus mi cursus tincidunt a sit amet ligula.'),
(6, 'Donec ac lacinia turpis, et accumsan justo. Nunc convallis molestie metus, non lobortis nulla porttitor a. Sed mattis rutrum velit ut lacinia. Praesent ornare, augue nec semper semper, erat felis porta urna, at laoreet velit est ut dolor. Cras id urna varius, interdum odio eu, fringilla lacus. Vivamus laoreet sagittis arcu. Proin sed hendrerit massa. In pulvinar, metus non facilisis sollicitudin, tellus arcu scelerisque tortor, id pharetra erat risus ut mi.', 'Fusce eros leo, luctus at efficitur sit amet, tincidunt sed libero. Vivamus tempor pharetra neque ornare vehicula. Donec in maximus nisi. Fusce vitae blandit velit. Pellentesque a efficitur lectus. Mauris efficitur, ipsum eget placerat tristique, sem dolor consequat enim, non sagittis dolor arcu et quam. Maecenas quis eros faucibus, aliquam elit sed, aliquet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. In tempus tempus libero, eu interdum augue ultrices et. Nunc placerat sed velit et condimentum. Vivamus eget ante a est malesuada varius. Nunc tincidunt, neque at interdum tincidunt, est est facilisis odio, ut euismod tortor lorem quis odio. Nulla lorem massa, mollis in cursus a, tincidunt id nisi. Etiam sollicitudin, felis non congue mollis, risus urna gravida purus, ac condimentum elit lacus eget leo. Aliquam quis consectetur lacus. Fusce nec vestibulum nulla.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in ex vitae nisl ornare gravida id dictum mauris. Phasellus a nulla non nunc finibus euismod ut et nulla. Mauris non consequat mauris. Nam nec tristique ante. Vivamus felis enim, iaculis non condimentum nec, malesuada iaculis ligula. Aliquam dignissim, ligula non mattis finibus, odio est vestibulum mauris, a fermentum ipsum lacus sed felis. Praesent id pharetra dolor, et cursus turpis. Duis feugiat purus ac eros cursus, et sodales arcu aliquet. In a mauris ultricies neque porttitor eleifend vel ac lacus. Donec luctus mi vel leo bibendum, vel luctus nibh venenatis. Nulla convallis erat turpis, et bibendum lectus molestie laoreet. Nunc cursus massa ut viverra condimentum. Nullam at tellus ut libero blandit blandit. Morbi semper rhoncus maximus.', 'Duis purus massa, ullamcorper eu interdum vel, tristique eget mi. Nunc eu convallis orci, sollicitudin posuere ligula. Nam sit amet ipsum a massa maximus euismod vitae ac est. Nullam venenatis sed magna iaculis dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut tempor, ex vitae aliquam cursus, sapien metus tempor nisl, id consequat tortor tellus sit amet ante. Etiam non aliquam lacus, ut hendrerit risus. Suspendisse imperdiet, dui eu molestie euismod, magna eros laoreet dolor, a vulputate justo augue sagittis metus. Donec efficitur diam arcu, eu pharetra nunc lobortis eu. Proin turpis augue, dictum sit amet finibus eu, sollicitudin vitae odio.'),
(7, 'Integer finibus est at urna suscipit, vitae malesuada justo pulvinar. Sed volutpat at libero a mattis. Duis sodales imperdiet dui sit amet congue. Proin varius sed odio vitae dapibus. Etiam mollis sollicitudin lorem sit amet congue. Curabitur ut orci orci. Curabitur at nisl vitae mi gravida cursus. Quisque quis libero dui. Sed iaculis lectus non risus rhoncus, sit amet dignissim ligula suscipit. Fusce pharetra laoreet consectetur. Maecenas eget placerat sapien, in ornare purus. Nullam imperdiet in mauris sit amet lacinia. Donec varius mauris tellus, nec semper neque tempus condimentum. Quisque vulputate finibus quam, et faucibus nibh posuere et. Phasellus vulputate ante tristique, imperdiet lacus nec, ultricies libero.', 'Etiam at enim ut justo condimentum rutrum eget eu quam. Proin massa justo, mattis non tempus ut, efficitur quis diam. Vivamus interdum nibh vel justo maximus blandit. Nam quis dictum nunc. Curabitur nec blandit libero, a sollicitudin urna. Suspendisse potenti. Phasellus lacinia ligula tortor, nec hendrerit augue vulputate vitae. Nulla hendrerit porttitor purus. Aenean eu orci sagittis, finibus massa at, dapibus lorem. Donec eros eros, convallis convallis maximus in, viverra eu metus. Etiam nec viverra ex. In quis orci odio. Integer tincidunt lacinia dignissim. Fusce sodales nulla purus, sed sodales justo aliquet at.', 'Suspendisse potenti. Nulla sed egestas urna. Aliquam leo mauris, cursus a semper eu, varius ac velit. Nulla vel lobortis ante. Quisque aliquam dui pretium, aliquet arcu eget, aliquam orci. Quisque non metus quis quam maximus volutpat sit amet a ante. Curabitur vitae velit sed nulla condimentum elementum et at lorem. Donec ut ante at magna sagittis semper. Nullam ullamcorper ac risus et ultrices. Sed eleifend vitae arcu et placerat. Nulla molestie velit arcu, vel hendrerit erat interdum vitae. Curabitur neque ante, egestas in luctus eu, ultricies nec odio. Pellentesque ultrices vulputate tortor vitae sagittis. Proin nisi eros, consequat eget erat quis, dapibus auctor diam. Proin vitae consectetur ipsum, sed volutpat nisi.', 'Integer mattis viverra lacus, eu lobortis elit auctor eget. Phasellus vulputate cursus lectus vitae consequat. Nulla aliquam urna vitae dapibus maximus. Phasellus porttitor lectus ut lobortis venenatis. In dui tellus, imperdiet quis leo non, tincidunt congue urna. Sed bibendum venenatis justo eu facilisis. Nulla facilisis non dolor ac vulputate. Suspendisse molestie, dui ac tincidunt tempus, dui eros condimentum leo, eget lacinia nunc eros nec quam. Integer cursus ligula at ligula aliquam mattis. Nulla facilisi. Vestibulum ut maximus massa. Phasellus egestas, tortor sit amet cursus porttitor, quam diam ullamcorper eros, sit amet pharetra mi ante a ex. Suspendisse ut elit lorem. Morbi viverra fermentum hendrerit. Fusce ac ex dapibus mi cursus tincidunt a sit amet ligula.'),
(8, 'Donec ac lacinia turpis, et accumsan justo. Nunc convallis molestie metus, non lobortis nulla porttitor a. Sed mattis rutrum velit ut lacinia. Praesent ornare, augue nec semper semper, erat felis porta urna, at laoreet velit est ut dolor. Cras id urna varius, interdum odio eu, fringilla lacus. Vivamus laoreet sagittis arcu. Proin sed hendrerit massa. In pulvinar, metus non facilisis sollicitudin, tellus arcu scelerisque tortor, id pharetra erat risus ut mi.', 'Fusce eros leo, luctus at efficitur sit amet, tincidunt sed libero. Vivamus tempor pharetra neque ornare vehicula. Donec in maximus nisi. Fusce vitae blandit velit. Pellentesque a efficitur lectus. Mauris efficitur, ipsum eget placerat tristique, sem dolor consequat enim, non sagittis dolor arcu et quam. Maecenas quis eros faucibus, aliquam elit sed, aliquet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. In tempus tempus libero, eu interdum augue ultrices et. Nunc placerat sed velit et condimentum. Vivamus eget ante a est malesuada varius. Nunc tincidunt, neque at interdum tincidunt, est est facilisis odio, ut euismod tortor lorem quis odio. Nulla lorem massa, mollis in cursus a, tincidunt id nisi. Etiam sollicitudin, felis non congue mollis, risus urna gravida purus, ac condimentum elit lacus eget leo. Aliquam quis consectetur lacus. Fusce nec vestibulum nulla.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in ex vitae nisl ornare gravida id dictum mauris. Phasellus a nulla non nunc finibus euismod ut et nulla. Mauris non consequat mauris. Nam nec tristique ante. Vivamus felis enim, iaculis non condimentum nec, malesuada iaculis ligula. Aliquam dignissim, ligula non mattis finibus, odio est vestibulum mauris, a fermentum ipsum lacus sed felis. Praesent id pharetra dolor, et cursus turpis. Duis feugiat purus ac eros cursus, et sodales arcu aliquet. In a mauris ultricies neque porttitor eleifend vel ac lacus. Donec luctus mi vel leo bibendum, vel luctus nibh venenatis. Nulla convallis erat turpis, et bibendum lectus molestie laoreet. Nunc cursus massa ut viverra condimentum. Nullam at tellus ut libero blandit blandit. Morbi semper rhoncus maximus.', 'Duis purus massa, ullamcorper eu interdum vel, tristique eget mi. Nunc eu convallis orci, sollicitudin posuere ligula. Nam sit amet ipsum a massa maximus euismod vitae ac est. Nullam venenatis sed magna iaculis dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut tempor, ex vitae aliquam cursus, sapien metus tempor nisl, id consequat tortor tellus sit amet ante. Etiam non aliquam lacus, ut hendrerit risus. Suspendisse imperdiet, dui eu molestie euismod, magna eros laoreet dolor, a vulputate justo augue sagittis metus. Donec efficitur diam arcu, eu pharetra nunc lobortis eu. Proin turpis augue, dictum sit amet finibus eu, sollicitudin vitae odio.'),
(9, 'Integer finibus est at urna suscipit, vitae malesuada justo pulvinar. Sed volutpat at libero a mattis. Duis sodales imperdiet dui sit amet congue. Proin varius sed odio vitae dapibus. Etiam mollis sollicitudin lorem sit amet congue. Curabitur ut orci orci. Curabitur at nisl vitae mi gravida cursus. Quisque quis libero dui. Sed iaculis lectus non risus rhoncus, sit amet dignissim ligula suscipit. Fusce pharetra laoreet consectetur. Maecenas eget placerat sapien, in ornare purus. Nullam imperdiet in mauris sit amet lacinia. Donec varius mauris tellus, nec semper neque tempus condimentum. Quisque vulputate finibus quam, et faucibus nibh posuere et. Phasellus vulputate ante tristique, imperdiet lacus nec, ultricies libero.', 'Etiam at enim ut justo condimentum rutrum eget eu quam. Proin massa justo, mattis non tempus ut, efficitur quis diam. Vivamus interdum nibh vel justo maximus blandit. Nam quis dictum nunc. Curabitur nec blandit libero, a sollicitudin urna. Suspendisse potenti. Phasellus lacinia ligula tortor, nec hendrerit augue vulputate vitae. Nulla hendrerit porttitor purus. Aenean eu orci sagittis, finibus massa at, dapibus lorem. Donec eros eros, convallis convallis maximus in, viverra eu metus. Etiam nec viverra ex. In quis orci odio. Integer tincidunt lacinia dignissim. Fusce sodales nulla purus, sed sodales justo aliquet at.', 'Suspendisse potenti. Nulla sed egestas urna. Aliquam leo mauris, cursus a semper eu, varius ac velit. Nulla vel lobortis ante. Quisque aliquam dui pretium, aliquet arcu eget, aliquam orci. Quisque non metus quis quam maximus volutpat sit amet a ante. Curabitur vitae velit sed nulla condimentum elementum et at lorem. Donec ut ante at magna sagittis semper. Nullam ullamcorper ac risus et ultrices. Sed eleifend vitae arcu et placerat. Nulla molestie velit arcu, vel hendrerit erat interdum vitae. Curabitur neque ante, egestas in luctus eu, ultricies nec odio. Pellentesque ultrices vulputate tortor vitae sagittis. Proin nisi eros, consequat eget erat quis, dapibus auctor diam. Proin vitae consectetur ipsum, sed volutpat nisi.', 'Integer mattis viverra lacus, eu lobortis elit auctor eget. Phasellus vulputate cursus lectus vitae consequat. Nulla aliquam urna vitae dapibus maximus. Phasellus porttitor lectus ut lobortis venenatis. In dui tellus, imperdiet quis leo non, tincidunt congue urna. Sed bibendum venenatis justo eu facilisis. Nulla facilisis non dolor ac vulputate. Suspendisse molestie, dui ac tincidunt tempus, dui eros condimentum leo, eget lacinia nunc eros nec quam. Integer cursus ligula at ligula aliquam mattis. Nulla facilisi. Vestibulum ut maximus massa. Phasellus egestas, tortor sit amet cursus porttitor, quam diam ullamcorper eros, sit amet pharetra mi ante a ex. Suspendisse ut elit lorem. Morbi viverra fermentum hendrerit. Fusce ac ex dapibus mi cursus tincidunt a sit amet ligula.'),
(10, 'Donec ac lacinia turpis, et accumsan justo. Nunc convallis molestie metus, non lobortis nulla porttitor a. Sed mattis rutrum velit ut lacinia. Praesent ornare, augue nec semper semper, erat felis porta urna, at laoreet velit est ut dolor. Cras id urna varius, interdum odio eu, fringilla lacus. Vivamus laoreet sagittis arcu. Proin sed hendrerit massa. In pulvinar, metus non facilisis sollicitudin, tellus arcu scelerisque tortor, id pharetra erat risus ut mi.', 'Fusce eros leo, luctus at efficitur sit amet, tincidunt sed libero. Vivamus tempor pharetra neque ornare vehicula. Donec in maximus nisi. Fusce vitae blandit velit. Pellentesque a efficitur lectus. Mauris efficitur, ipsum eget placerat tristique, sem dolor consequat enim, non sagittis dolor arcu et quam. Maecenas quis eros faucibus, aliquam elit sed, aliquet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. In tempus tempus libero, eu interdum augue ultrices et. Nunc placerat sed velit et condimentum. Vivamus eget ante a est malesuada varius. Nunc tincidunt, neque at interdum tincidunt, est est facilisis odio, ut euismod tortor lorem quis odio. Nulla lorem massa, mollis in cursus a, tincidunt id nisi. Etiam sollicitudin, felis non congue mollis, risus urna gravida purus, ac condimentum elit lacus eget leo. Aliquam quis consectetur lacus. Fusce nec vestibulum nulla.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in ex vitae nisl ornare gravida id dictum mauris. Phasellus a nulla non nunc finibus euismod ut et nulla. Mauris non consequat mauris. Nam nec tristique ante. Vivamus felis enim, iaculis non condimentum nec, malesuada iaculis ligula. Aliquam dignissim, ligula non mattis finibus, odio est vestibulum mauris, a fermentum ipsum lacus sed felis. Praesent id pharetra dolor, et cursus turpis. Duis feugiat purus ac eros cursus, et sodales arcu aliquet. In a mauris ultricies neque porttitor eleifend vel ac lacus. Donec luctus mi vel leo bibendum, vel luctus nibh venenatis. Nulla convallis erat turpis, et bibendum lectus molestie laoreet. Nunc cursus massa ut viverra condimentum. Nullam at tellus ut libero blandit blandit. Morbi semper rhoncus maximus.', 'Duis purus massa, ullamcorper eu interdum vel, tristique eget mi. Nunc eu convallis orci, sollicitudin posuere ligula. Nam sit amet ipsum a massa maximus euismod vitae ac est. Nullam venenatis sed magna iaculis dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut tempor, ex vitae aliquam cursus, sapien metus tempor nisl, id consequat tortor tellus sit amet ante. Etiam non aliquam lacus, ut hendrerit risus. Suspendisse imperdiet, dui eu molestie euismod, magna eros laoreet dolor, a vulputate justo augue sagittis metus. Donec efficitur diam arcu, eu pharetra nunc lobortis eu. Proin turpis augue, dictum sit amet finibus eu, sollicitudin vitae odio.'),
(11, 'Integer finibus est at urna suscipit, vitae malesuada justo pulvinar. Sed volutpat at libero a mattis. Duis sodales imperdiet dui sit amet congue. Proin varius sed odio vitae dapibus. Etiam mollis sollicitudin lorem sit amet congue. Curabitur ut orci orci. Curabitur at nisl vitae mi gravida cursus. Quisque quis libero dui. Sed iaculis lectus non risus rhoncus, sit amet dignissim ligula suscipit. Fusce pharetra laoreet consectetur. Maecenas eget placerat sapien, in ornare purus. Nullam imperdiet in mauris sit amet lacinia. Donec varius mauris tellus, nec semper neque tempus condimentum. Quisque vulputate finibus quam, et faucibus nibh posuere et. Phasellus vulputate ante tristique, imperdiet lacus nec, ultricies libero.', 'Etiam at enim ut justo condimentum rutrum eget eu quam. Proin massa justo, mattis non tempus ut, efficitur quis diam. Vivamus interdum nibh vel justo maximus blandit. Nam quis dictum nunc. Curabitur nec blandit libero, a sollicitudin urna. Suspendisse potenti. Phasellus lacinia ligula tortor, nec hendrerit augue vulputate vitae. Nulla hendrerit porttitor purus. Aenean eu orci sagittis, finibus massa at, dapibus lorem. Donec eros eros, convallis convallis maximus in, viverra eu metus. Etiam nec viverra ex. In quis orci odio. Integer tincidunt lacinia dignissim. Fusce sodales nulla purus, sed sodales justo aliquet at.', 'Suspendisse potenti. Nulla sed egestas urna. Aliquam leo mauris, cursus a semper eu, varius ac velit. Nulla vel lobortis ante. Quisque aliquam dui pretium, aliquet arcu eget, aliquam orci. Quisque non metus quis quam maximus volutpat sit amet a ante. Curabitur vitae velit sed nulla condimentum elementum et at lorem. Donec ut ante at magna sagittis semper. Nullam ullamcorper ac risus et ultrices. Sed eleifend vitae arcu et placerat. Nulla molestie velit arcu, vel hendrerit erat interdum vitae. Curabitur neque ante, egestas in luctus eu, ultricies nec odio. Pellentesque ultrices vulputate tortor vitae sagittis. Proin nisi eros, consequat eget erat quis, dapibus auctor diam. Proin vitae consectetur ipsum, sed volutpat nisi.', 'Integer mattis viverra lacus, eu lobortis elit auctor eget. Phasellus vulputate cursus lectus vitae consequat. Nulla aliquam urna vitae dapibus maximus. Phasellus porttitor lectus ut lobortis venenatis. In dui tellus, imperdiet quis leo non, tincidunt congue urna. Sed bibendum venenatis justo eu facilisis. Nulla facilisis non dolor ac vulputate. Suspendisse molestie, dui ac tincidunt tempus, dui eros condimentum leo, eget lacinia nunc eros nec quam. Integer cursus ligula at ligula aliquam mattis. Nulla facilisi. Vestibulum ut maximus massa. Phasellus egestas, tortor sit amet cursus porttitor, quam diam ullamcorper eros, sit amet pharetra mi ante a ex. Suspendisse ut elit lorem. Morbi viverra fermentum hendrerit. Fusce ac ex dapibus mi cursus tincidunt a sit amet ligula.'),
(12, 'Donec ac lacinia turpis, et accumsan justo. Nunc convallis molestie metus, non lobortis nulla porttitor a. Sed mattis rutrum velit ut lacinia. Praesent ornare, augue nec semper semper, erat felis porta urna, at laoreet velit est ut dolor. Cras id urna varius, interdum odio eu, fringilla lacus. Vivamus laoreet sagittis arcu. Proin sed hendrerit massa. In pulvinar, metus non facilisis sollicitudin, tellus arcu scelerisque tortor, id pharetra erat risus ut mi.', 'Fusce eros leo, luctus at efficitur sit amet, tincidunt sed libero. Vivamus tempor pharetra neque ornare vehicula. Donec in maximus nisi. Fusce vitae blandit velit. Pellentesque a efficitur lectus. Mauris efficitur, ipsum eget placerat tristique, sem dolor consequat enim, non sagittis dolor arcu et quam. Maecenas quis eros faucibus, aliquam elit sed, aliquet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. In tempus tempus libero, eu interdum augue ultrices et. Nunc placerat sed velit et condimentum. Vivamus eget ante a est malesuada varius. Nunc tincidunt, neque at interdum tincidunt, est est facilisis odio, ut euismod tortor lorem quis odio. Nulla lorem massa, mollis in cursus a, tincidunt id nisi. Etiam sollicitudin, felis non congue mollis, risus urna gravida purus, ac condimentum elit lacus eget leo. Aliquam quis consectetur lacus. Fusce nec vestibulum nulla.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in ex vitae nisl ornare gravida id dictum mauris. Phasellus a nulla non nunc finibus euismod ut et nulla. Mauris non consequat mauris. Nam nec tristique ante. Vivamus felis enim, iaculis non condimentum nec, malesuada iaculis ligula. Aliquam dignissim, ligula non mattis finibus, odio est vestibulum mauris, a fermentum ipsum lacus sed felis. Praesent id pharetra dolor, et cursus turpis. Duis feugiat purus ac eros cursus, et sodales arcu aliquet. In a mauris ultricies neque porttitor eleifend vel ac lacus. Donec luctus mi vel leo bibendum, vel luctus nibh venenatis. Nulla convallis erat turpis, et bibendum lectus molestie laoreet. Nunc cursus massa ut viverra condimentum. Nullam at tellus ut libero blandit blandit. Morbi semper rhoncus maximus.', 'Duis purus massa, ullamcorper eu interdum vel, tristique eget mi. Nunc eu convallis orci, sollicitudin posuere ligula. Nam sit amet ipsum a massa maximus euismod vitae ac est. Nullam venenatis sed magna iaculis dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut tempor, ex vitae aliquam cursus, sapien metus tempor nisl, id consequat tortor tellus sit amet ante. Etiam non aliquam lacus, ut hendrerit risus. Suspendisse imperdiet, dui eu molestie euismod, magna eros laoreet dolor, a vulputate justo augue sagittis metus. Donec efficitur diam arcu, eu pharetra nunc lobortis eu. Proin turpis augue, dictum sit amet finibus eu, sollicitudin vitae odio.'),
(13, 'Integer finibus est at urna suscipit, vitae malesuada justo pulvinar. Sed volutpat at libero a mattis. Duis sodales imperdiet dui sit amet congue. Proin varius sed odio vitae dapibus. Etiam mollis sollicitudin lorem sit amet congue. Curabitur ut orci orci. Curabitur at nisl vitae mi gravida cursus. Quisque quis libero dui. Sed iaculis lectus non risus rhoncus, sit amet dignissim ligula suscipit. Fusce pharetra laoreet consectetur. Maecenas eget placerat sapien, in ornare purus. Nullam imperdiet in mauris sit amet lacinia. Donec varius mauris tellus, nec semper neque tempus condimentum. Quisque vulputate finibus quam, et faucibus nibh posuere et. Phasellus vulputate ante tristique, imperdiet lacus nec, ultricies libero.', 'Etiam at enim ut justo condimentum rutrum eget eu quam. Proin massa justo, mattis non tempus ut, efficitur quis diam. Vivamus interdum nibh vel justo maximus blandit. Nam quis dictum nunc. Curabitur nec blandit libero, a sollicitudin urna. Suspendisse potenti. Phasellus lacinia ligula tortor, nec hendrerit augue vulputate vitae. Nulla hendrerit porttitor purus. Aenean eu orci sagittis, finibus massa at, dapibus lorem. Donec eros eros, convallis convallis maximus in, viverra eu metus. Etiam nec viverra ex. In quis orci odio. Integer tincidunt lacinia dignissim. Fusce sodales nulla purus, sed sodales justo aliquet at.', 'Suspendisse potenti. Nulla sed egestas urna. Aliquam leo mauris, cursus a semper eu, varius ac velit. Nulla vel lobortis ante. Quisque aliquam dui pretium, aliquet arcu eget, aliquam orci. Quisque non metus quis quam maximus volutpat sit amet a ante. Curabitur vitae velit sed nulla condimentum elementum et at lorem. Donec ut ante at magna sagittis semper. Nullam ullamcorper ac risus et ultrices. Sed eleifend vitae arcu et placerat. Nulla molestie velit arcu, vel hendrerit erat interdum vitae. Curabitur neque ante, egestas in luctus eu, ultricies nec odio. Pellentesque ultrices vulputate tortor vitae sagittis. Proin nisi eros, consequat eget erat quis, dapibus auctor diam. Proin vitae consectetur ipsum, sed volutpat nisi.', 'Integer mattis viverra lacus, eu lobortis elit auctor eget. Phasellus vulputate cursus lectus vitae consequat. Nulla aliquam urna vitae dapibus maximus. Phasellus porttitor lectus ut lobortis venenatis. In dui tellus, imperdiet quis leo non, tincidunt congue urna. Sed bibendum venenatis justo eu facilisis. Nulla facilisis non dolor ac vulputate. Suspendisse molestie, dui ac tincidunt tempus, dui eros condimentum leo, eget lacinia nunc eros nec quam. Integer cursus ligula at ligula aliquam mattis. Nulla facilisi. Vestibulum ut maximus massa. Phasellus egestas, tortor sit amet cursus porttitor, quam diam ullamcorper eros, sit amet pharetra mi ante a ex. Suspendisse ut elit lorem. Morbi viverra fermentum hendrerit. Fusce ac ex dapibus mi cursus tincidunt a sit amet ligula.'),
(14, 'Donec ac lacinia turpis, et accumsan justo. Nunc convallis molestie metus, non lobortis nulla porttitor a. Sed mattis rutrum velit ut lacinia. Praesent ornare, augue nec semper semper, erat felis porta urna, at laoreet velit est ut dolor. Cras id urna varius, interdum odio eu, fringilla lacus. Vivamus laoreet sagittis arcu. Proin sed hendrerit massa. In pulvinar, metus non facilisis sollicitudin, tellus arcu scelerisque tortor, id pharetra erat risus ut mi.', 'Fusce eros leo, luctus at efficitur sit amet, tincidunt sed libero. Vivamus tempor pharetra neque ornare vehicula. Donec in maximus nisi. Fusce vitae blandit velit. Pellentesque a efficitur lectus. Mauris efficitur, ipsum eget placerat tristique, sem dolor consequat enim, non sagittis dolor arcu et quam. Maecenas quis eros faucibus, aliquam elit sed, aliquet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. In tempus tempus libero, eu interdum augue ultrices et. Nunc placerat sed velit et condimentum. Vivamus eget ante a est malesuada varius. Nunc tincidunt, neque at interdum tincidunt, est est facilisis odio, ut euismod tortor lorem quis odio. Nulla lorem massa, mollis in cursus a, tincidunt id nisi. Etiam sollicitudin, felis non congue mollis, risus urna gravida purus, ac condimentum elit lacus eget leo. Aliquam quis consectetur lacus. Fusce nec vestibulum nulla.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in ex vitae nisl ornare gravida id dictum mauris. Phasellus a nulla non nunc finibus euismod ut et nulla. Mauris non consequat mauris. Nam nec tristique ante. Vivamus felis enim, iaculis non condimentum nec, malesuada iaculis ligula. Aliquam dignissim, ligula non mattis finibus, odio est vestibulum mauris, a fermentum ipsum lacus sed felis. Praesent id pharetra dolor, et cursus turpis. Duis feugiat purus ac eros cursus, et sodales arcu aliquet. In a mauris ultricies neque porttitor eleifend vel ac lacus. Donec luctus mi vel leo bibendum, vel luctus nibh venenatis. Nulla convallis erat turpis, et bibendum lectus molestie laoreet. Nunc cursus massa ut viverra condimentum. Nullam at tellus ut libero blandit blandit. Morbi semper rhoncus maximus.', 'Duis purus massa, ullamcorper eu interdum vel, tristique eget mi. Nunc eu convallis orci, sollicitudin posuere ligula. Nam sit amet ipsum a massa maximus euismod vitae ac est. Nullam venenatis sed magna iaculis dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut tempor, ex vitae aliquam cursus, sapien metus tempor nisl, id consequat tortor tellus sit amet ante. Etiam non aliquam lacus, ut hendrerit risus. Suspendisse imperdiet, dui eu molestie euismod, magna eros laoreet dolor, a vulputate justo augue sagittis metus. Donec efficitur diam arcu, eu pharetra nunc lobortis eu. Proin turpis augue, dictum sit amet finibus eu, sollicitudin vitae odio.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `street_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apartment_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` int NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `country`, `street_address`, `apartment_address`, `city`, `zip`, `phone`, `email`, `password`, `created_at`, `updated_at`, `role`) VALUES
(1, 'ahksm', 'Abduraxmon', 'Qosimov', 'Узбекистан', 'Gulshanobod', '3/37', 'Tashkent', 100012, 998999208313, 'abdurahmankasymov0501@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$WFJsMURRd1BJcFNDaDNaRg$jotNLapB3G1Zf+hEJ/0B7hLNq27h5KQ1Tr/XNoF/tyQ', '2023-01-17 17:45:23', '2023-01-17 17:45:23', 'user'),
(2, 'imtagfu', 'Gulsum', 'Iminjanova', 'Uzbekistan', 'Olchazor', '3/37', 'Tashkent', 100012, 998999209313, 'iminjanovagulsum@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$OXNWd0did3dJcXF3Q0RYRw$3XoY+VbFxvA4EX1bu3WuzbqQ57ZNCuLhg24izVI9z2o', '2023-01-17 17:48:46', '2023-01-17 17:48:46', 'user'),
(3, 'abi', 'Abdulvoris', 'Iminjanov', 'Uzbekistan', 'Olchazor', '3/37', 'Tashkent', 100012, 998999208313, 'abi@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$QkFvM25iTkpjVUIxT3YvVA$CF3K2+QdpSj7Pb72fC2uDSasiFAixnRiRfvGlbV/Qhc', '2023-01-17 17:52:40', '2023-01-17 17:52:40', 'admin'),
(7, 'gbvesathb', 'Abduraxmon', 'Qosimov', 'Узбекистан', 'Gulshanobod', 'gvsr', 'Tashkent', 100012, 59873456982, 'asymov@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$aHIyV3JsT3hESnNUMEtNMg$QXoHGA4RMZF6sd3t4hT9v4ULxtHzfwLW4vd4jnhekSM', '2023-01-17 18:24:27', '2023-01-17 18:24:27', 'user'),
(8, 'rrrr', 'rrrr', 'rrrr', 'rrrr', 'rrrr', 'rrrr', 'rrrr', 123456, 998999208313, 'rrrrr@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$WkN6T0RwYWUwSjdOWXBYLw$X0OgN6WRlyRwv3EFDNwUz9Afw87bhRBFz0//5Jr5WU0', '2023-01-23 07:21:59', '2023-01-23 07:21:59', 'user'),
(10, 'ahksm', 'Abduraxmon', 'Qosimov', 'Uzbekistan', 'Olchazor', '3/37', 'Tashkent', 100012, 998999208313, 'abdurahman@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$MFMxalgxeUExRS5KUHpFSw$+lQB477zuJt/gzQzrro2z/KIkOXFLc4z8/pyXlTa+II', '2023-02-02 05:46:29', '2023-02-02 05:46:29', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_texts`
--
ALTER TABLE `product_texts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `product_texts`
--
ALTER TABLE `product_texts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
