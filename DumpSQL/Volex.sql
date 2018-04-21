-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 21 2018 г., 20:54
-- Версия сервера: 5.6.38
-- Версия PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Volex`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`id`, `answer`, `type`) VALUES
(1, 'Ответ 1-1', 'radio'),
(2, 'Ответ 1-2', 'radio'),
(3, 'Ответ 1-3', 'radio'),
(4, 'Ответ 1-4', 'radio'),
(5, 'Ответ 1-5', 'radio'),
(6, 'Ответ 2-1', 'checkbox'),
(7, 'Ответ 2-2', 'checkbox'),
(8, 'Ответ 2-3', 'checkbox'),
(9, 'Ответ 2-4', 'checkbox'),
(10, 'Ответ 2-5', 'checkbox'),
(11, 'Ответ 3-1', 'text'),
(12, 'Ответ 3-2', 'text'),
(13, 'Ответ 3-3', 'text'),
(14, 'Ответ 3-4', 'text'),
(15, 'Ответ 3-5', 'text');

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quest` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `quest`) VALUES
(1, 'Вопрос 1'),
(2, 'Вопрос 2'),
(3, 'Вопрос 3');

-- --------------------------------------------------------

--
-- Структура таблицы `variations`
--

CREATE TABLE `variations` (
  `id_variations` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `correct` enum('true','false') NOT NULL,
  `history` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `variations`
--

INSERT INTO `variations` (`id_variations`, `questions_id`, `answer_id`, `correct`, `history`) VALUES
(1, 1, 1, 'false', 11),
(2, 1, 2, 'true', 8),
(3, 1, 3, 'false', 3),
(4, 1, 4, 'false', 2),
(5, 1, 5, 'false', 1),
(6, 2, 6, 'true', 11),
(7, 2, 7, 'false', 10),
(8, 2, 8, 'true', 6),
(9, 2, 9, 'false', 8),
(10, 2, 10, 'true', 5),
(11, 3, 11, 'true', 5),
(12, 3, 12, 'false', 3),
(13, 3, 13, 'false', 1),
(14, 3, 14, 'false', 0),
(15, 3, 15, 'false', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id_variations`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `questions_id` (`questions_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `variations`
--
ALTER TABLE `variations`
  MODIFY `id_variations` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`),
  ADD CONSTRAINT `variations_ibfk_2` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
