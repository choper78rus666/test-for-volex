-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 20 2018 г., 14:59
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
(1, 'Ответ 1', 'radio'),
(2, 'Ответ 2', 'radio'),
(3, 'Ответ 3', 'radio'),
(4, 'Ответ 4', 'radio'),
(5, 'Ответ 5', 'radio'),
(6, 'Ответ 1', 'checkbox'),
(7, 'Ответ 2', 'checkbox'),
(8, 'Ответ 3', 'checkbox'),
(9, 'Ответ 4', 'checkbox'),
(10, 'Ответ 5', 'checkbox'),
(11, 'Ответ 1', 'text'),
(12, 'Ответ 2', 'text'),
(13, 'Ответ 3', 'text'),
(14, 'Ответ 4', 'text'),
(15, 'Ответ 5', 'text');

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
  `questions_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `correct` enum('true','false') NOT NULL,
  `history` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `variations`
--

INSERT INTO `variations` (`questions_id`, `answer_id`, `correct`, `history`) VALUES
(1, 1, 'false', 0),
(1, 2, 'true', 0),
(1, 3, 'false', 0),
(1, 4, 'false', 0),
(1, 5, 'false', 0),
(2, 6, 'true', 0),
(2, 7, 'false', 0),
(2, 8, 'true', 0),
(2, 9, 'false', 0),
(2, 10, 'true', 0),
(3, 11, 'true', 0),
(3, 12, 'false', 0),
(3, 13, 'false', 0),
(3, 14, 'false', 0),
(3, 5, 'false', 0);

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
