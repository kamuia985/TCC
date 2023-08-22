-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 22-Ago-2023 às 14:52
-- Versão do servidor: 8.0.27
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinic`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `anotacoes` varchar(255) DEFAULT NULL,
  `preco` decimal(19,2) DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `status_` varchar(20) DEFAULT NULL,
  `pagamento` varchar(20) DEFAULT NULL,
  `fk_Usuario_id` bigint DEFAULT NULL,
  `fk_Servico_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reserva_2` (`fk_Usuario_id`),
  KEY `FK_Reserva_3` (`fk_Servico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`id`, `anotacoes`, `preco`, `start_at`, `end_at`, `status_`, `pagamento`, `fk_Usuario_id`, `fk_Servico_id`) VALUES
(1, 'dente dolorido', '50.12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ON', 'credit card', 1, 1),
(2, 'dente dolorido', '50.12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ON', 'credit card', 1, 2),
(3, 'dente dolorido', '50.12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ON', 'credit card', 1, 2),
(4, 'dente dolorido', '50.12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ON', 'credit card', 1, 1),
(5, 'dente dolorido', '50.12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ON', 'credit card', 1, 2),
(6, 'dente dolorido', '50.12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ON', 'credit card', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

DROP TABLE IF EXISTS `servico`;
CREATE TABLE IF NOT EXISTS `servico` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id`, `nome`, `descricao`, `preco`) VALUES
(1, 'Ana', 'serviço dente', '50.12'),
(2, 'Mariana', 'dente serviço', '40.12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `img_profile` varchar(255) DEFAULT NULL,
  `role_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `telefone`, `img_profile`, `role_`) VALUES
(1, 'João', 'joao@gmail.com', 'sucoDElaranja', '15991080200', 'img.png', 'user');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `FK_Reserva_2` FOREIGN KEY (`fk_Usuario_id`) REFERENCES `usuario` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_Reserva_3` FOREIGN KEY (`fk_Servico_id`) REFERENCES `servico` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
