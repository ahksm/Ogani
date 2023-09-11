-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 11 2023 г., 14:24
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.21

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
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `sort_order`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Fruits', 1, '2023-01-17 13:21:36', '2023-09-11 08:18:06', 1),
(2, 'Vegetables', 2, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1),
(3, 'Dry Fruits & Nuts', 3, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1),
(4, 'Meat', 4, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1),
(5, 'Dairies', 5, '2023-01-17 13:21:36', '2023-01-17 13:22:03', 1),
(6, 'Fast Menu', 6, '2023-01-17 13:21:36', '2023-09-11 08:03:57', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
(11, 6, 'Beverages', 11, '2023-01-17 13:22:33', '2023-09-11 08:46:16', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_comment`, `created_at`, `status`) VALUES
(1, 3, 'Bla Bla Bla', '2023-01-24 18:46:47', 1),
(2, 3, 'Bla Bla Bla2', '2023-01-24 19:08:00', 1),
(3, 10, '', '2023-02-02 05:46:29', 1),
(4, 10, '', '2023-02-02 05:49:28', 1),
(5, 11, 'Bla Bla Bla', '2023-03-29 13:01:06', 1),
(6, 3, '', '2023-04-12 16:32:08', 1),
(7, 12, '', '2023-09-09 17:30:11', 1),
(8, 16, '', '2023-09-11 10:54:09', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total_price`) VALUES
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
(20, 4, 13, 5, '0.7', '3.5'),
(21, 5, 7, 2, '100', '200'),
(22, 5, 9, 4, '2', '8'),
(23, 6, 12, 3, '15', '45'),
(24, 6, 13, 5, '0.7', '3.5'),
(25, 7, 11, 2, '4', '8'),
(26, 7, 12, 2, '15', '30'),
(27, 7, 13, 2, '0.7', '1.4'),
(28, 0, 3, 1, '5', '5'),
(29, 0, 2, 1, '20', '20'),
(30, 0, 4, 1, '10', '10'),
(31, 0, 1, 1, '1', '1'),
(32, 0, 5, 1, '5', '5'),
(33, 8, 6, 1, '40', '40');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `weight` float NOT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int NOT NULL,
  `category_id` int NOT NULL,
  `price` float NOT NULL,
  `availability` int NOT NULL DEFAULT '1',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_sale` int NOT NULL DEFAULT '0',
  `sale_percent` int DEFAULT '0',
  `old_price` float DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `weight`, `size`, `color`, `department_id`, `category_id`, `price`, `availability`, `brand`, `is_sale`, `sale_percent`, `old_price`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Apple', 1, 'medium', 'green', 1, 1, 1, 1, 'Korzinka', 1, 20, 2, '2023-01-17 13:23:19', '2023-04-12 16:33:48', 1),
(2, 'Beef', 1.5, 'large', 'red', 6, 4, 20, 1, 'To\'xtaniyoz Ota', 1, 20, 25, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(3, 'Mango', 1, 'medium', 'yellow', 1, 1, 5, 1, 'Macro Supermarket', 1, 20, 7, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(4, 'Burger', 0.3, 'medium', 'yellow', 9, 6, 10, 1, 'Burger King', 0, 20, 12, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(5, 'Banana', 2, 'medium', 'yellow', 2, 1, 5, 1, 'Bananzo\'r', 1, 15, 8, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(6, 'Cashew', 0.5, 'tiny', 'white', 5, 3, 40, 1, 'Cashew brand', 1, 10, 44, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(7, 'Oysters', 1, 'small', 'black', 7, 4, 100, 1, 'Sea Food Corporation', 1, 5, 120, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(8, 'Dragonfruit', 0.6, 'medium', 'red', 1, 1, 5, 1, 'Fruit company', 1, 3, 6, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(9, 'Watermelon', 3, 'large', 'green', 2, 1, 2, 1, 'Watermelon brand', 1, 50, 4, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(10, 'Orange', 1, 'medium', 'yellow', 1, 1, 1, 1, 'Orange brand', 1, 50, 2, '2023-01-17 13:23:19', '2023-01-17 13:23:44', 1),
(11, 'Coka Cola', 0.5, 'medium', 'black', 11, 6, 4, 1, 'Coke', 0, 0, 0, '2023-01-28 19:03:49', '2023-01-17 16:34:10', 1),
(12, 'Сottage cheese', 1, 'medium', 'white', 5, 5, 15, 1, 'Prostokvashino', 1, 30, 19, '2023-01-17 16:04:32', '2023-01-19 16:44:16', 1),
(13, 'Carrot', 1, 'medium', 'yellow', 2, 2, 0.7, 1, 'Bucks Bunny', 1, 10, 0.77, '2023-01-19 15:52:20', '2023-01-19 16:50:50', 1),
(14, 'Donut', 0.085, 'small', 'blue', 10, 6, 1.5, 1, 'B&R', 0, 0, 0, '2023-01-19 17:41:27', '2023-01-19 17:41:56', 1),
(15, 'Ice Cream', 0.5, 'small', 'white', 10, 6, 5, 1, 'BR', 1, 5, 5.5, '2023-09-10 16:49:02', '2023-09-10 18:33:06', 1),
(27, 'sadf', 224, 'large', 'white', 1, 1, 4, 0, 'fas', 0, NULL, NULL, '2023-09-11 05:52:44', '2023-09-11 05:52:44', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `product_texts`
--

CREATE TABLE `product_texts` (
  `id` int NOT NULL,
  `short_descr` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `long_descr` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `review` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
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
(14, 'Donec ac lacinia turpis, et accumsan justo. Nunc convallis molestie metus, non lobortis nulla porttitor a. Sed mattis rutrum velit ut lacinia. Praesent ornare, augue nec semper semper, erat felis porta urna, at laoreet velit est ut dolor. Cras id urna varius, interdum odio eu, fringilla lacus. Vivamus laoreet sagittis arcu. Proin sed hendrerit massa. In pulvinar, metus non facilisis sollicitudin, tellus arcu scelerisque tortor, id pharetra erat risus ut mi.', 'Fusce eros leo, luctus at efficitur sit amet, tincidunt sed libero. Vivamus tempor pharetra neque ornare vehicula. Donec in maximus nisi. Fusce vitae blandit velit. Pellentesque a efficitur lectus. Mauris efficitur, ipsum eget placerat tristique, sem dolor consequat enim, non sagittis dolor arcu et quam. Maecenas quis eros faucibus, aliquam elit sed, aliquet ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. In tempus tempus libero, eu interdum augue ultrices et. Nunc placerat sed velit et condimentum. Vivamus eget ante a est malesuada varius. Nunc tincidunt, neque at interdum tincidunt, est est facilisis odio, ut euismod tortor lorem quis odio. Nulla lorem massa, mollis in cursus a, tincidunt id nisi. Etiam sollicitudin, felis non congue mollis, risus urna gravida purus, ac condimentum elit lacus eget leo. Aliquam quis consectetur lacus. Fusce nec vestibulum nulla.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc in ex vitae nisl ornare gravida id dictum mauris. Phasellus a nulla non nunc finibus euismod ut et nulla. Mauris non consequat mauris. Nam nec tristique ante. Vivamus felis enim, iaculis non condimentum nec, malesuada iaculis ligula. Aliquam dignissim, ligula non mattis finibus, odio est vestibulum mauris, a fermentum ipsum lacus sed felis. Praesent id pharetra dolor, et cursus turpis. Duis feugiat purus ac eros cursus, et sodales arcu aliquet. In a mauris ultricies neque porttitor eleifend vel ac lacus. Donec luctus mi vel leo bibendum, vel luctus nibh venenatis. Nulla convallis erat turpis, et bibendum lectus molestie laoreet. Nunc cursus massa ut viverra condimentum. Nullam at tellus ut libero blandit blandit. Morbi semper rhoncus maximus.', 'Duis purus massa, ullamcorper eu interdum vel, tristique eget mi. Nunc eu convallis orci, sollicitudin posuere ligula. Nam sit amet ipsum a massa maximus euismod vitae ac est. Nullam venenatis sed magna iaculis dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut tempor, ex vitae aliquam cursus, sapien metus tempor nisl, id consequat tortor tellus sit amet ante. Etiam non aliquam lacus, ut hendrerit risus. Suspendisse imperdiet, dui eu molestie euismod, magna eros laoreet dolor, a vulputate justo augue sagittis metus. Donec efficitur diam arcu, eu pharetra nunc lobortis eu. Proin turpis augue, dictum sit amet finibus eu, sollicitudin vitae odio.'),
(15, 'Short Description', 'Long Description', 'Other Information', 'Review'),
(16, 'asdf', 'sadf', 'sdf', 'fsa'),
(17, 'asdf', 'sadf', 'sdf', 'fsa'),
(18, 'asdf', 'sadf', 'sdf', 'fsa'),
(19, 'asdf', 'sadf', 'sdf', 'fsa'),
(20, 'asdf', 'sadf', 'sdf', 'fsa'),
(21, 'asdf', 'sadf', 'sdf', 'fsa'),
(27, 'gafs', 'vsaff', 'fas', 'gea');

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
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `zip` int NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user'
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
(10, 'ahksm', 'Abduraxmon', 'Qosimov', 'Uzbekistan', 'Olchazor', '3/37', 'Tashkent', 100012, 998999208313, 'abdurahman@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$MFMxalgxeUExRS5KUHpFSw$+lQB477zuJt/gzQzrro2z/KIkOXFLc4z8/pyXlTa+II', '2023-02-02 05:46:29', '2023-02-02 05:46:29', 'user'),
(11, 'kkk', 'Kemran', 'Saidov', 'Uzbekistan', 'STreet', 'gg', 'GG', 12345, 998909890468, 'kemran@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$VndVUENlcUJZdzNENndIaQ$hN/7Uf313yvee4IM+D1IMI1FqdNXswU1juPHx7RNo9s', '2023-03-29 12:59:42', '2023-03-29 12:59:42', 'user'),
(12, 'Gtima', 'Timur', 'Ganiyev', 'Uzbekistan', 'Gulshanobod', '12/1b', 'Tashkent', 100012, 998999208313, 'timurganiyev@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$MVRnSDR5Lk0xYnRHRmVXeQ$vUZQDjU0vWTKqqomxyCM1dx4TlAP4TLCZVBr9XfVt0c', '2023-09-09 17:30:11', '2023-09-09 17:30:11', 'user'),
(15, 'Some User Name', 'Gulmekhri', 'Kasymova', 'Uzbekistan', 'Gulshanobod', '38', 'Tashkent', 100012, 998998400524, 'gulmehrikasimova82@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$OC9mZUUxNENtOTZJODdCYQ$rrGCA8IrGlIqdOKsECRxVbwTSGI0zy0H0rjbM2Tu8WM', '2023-09-10 10:51:37', '2023-09-10 10:51:37', 'user'),
(16, 'ahksm', 'Abduraxmon', 'Qosimov', 'Uzbekistan', 'Gulshanobod', '12', 'Tashkent', 100012, 998999208313, 'testtesttest@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$MFV6eWt1c09TV3R1ai9NZA$hmkObRzu1eYWH+7ND9jRuvDhRPeC6lSP2qRb9AVZq5I', '2023-09-11 10:54:09', '2023-09-11 10:54:09', 'user');

--
-- Индексы сохранённых таблиц
--

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
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `product_texts`
--
ALTER TABLE `product_texts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
