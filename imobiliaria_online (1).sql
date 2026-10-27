-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Out-2026 às 12:54
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imobiliaria_online`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `conversas`
--

CREATE TABLE `conversas` (
  `id` int(11) NOT NULL,
  `usuario1_id` int(11) NOT NULL,
  `usuario2_id` int(11) NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `conversas`
--

INSERT INTO `conversas` (`id`, `usuario1_id`, `usuario2_id`, `data_criacao`) VALUES
(1, 4, 2, '2025-11-14 16:38:01'),
(2, 6, 4, '2026-01-04 17:39:51'),
(3, 6, 2, '2026-01-04 17:40:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens_imoveis`
--

CREATE TABLE `imagens_imoveis` (
  `id` int(11) NOT NULL,
  `imovel_id` int(11) NOT NULL,
  `caminho_imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `imagens_imoveis`
--

INSERT INTO `imagens_imoveis` (`id`, `imovel_id`, `caminho_imagem`) VALUES
(1, 1, 'Uploads/imoveis/2/1/galeria/foto_691724a919d8d.webp'),
(8, 4, 'Uploads/imoveis/4/4/galeria/foto_695a65b90df26.jpg'),
(9, 4, 'Uploads/imoveis/4/4/galeria/foto_695a65b90e161.jpg'),
(10, 1, 'Uploads/imoveis/2/1/galeria/foto_695a893b1a6be.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imoveis`
--

CREATE TABLE `imoveis` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `tipo_imovel` enum('Casa','Apartamento','Terreno','Loja','Armazém','Escritório','Vivenda','Outro') NOT NULL,
  `finalidade` enum('Venda','Aluguel') NOT NULL,
  `preco` decimal(12,2) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `imagem_principal` varchar(255) DEFAULT NULL,
  `data_publicacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `imoveis`
--

INSERT INTO `imoveis` (`id`, `usuario_id`, `titulo`, `descricao`, `tipo_imovel`, `finalidade`, `preco`, `endereco`, `provincia`, `cidade`, `imagem_principal`, `data_publicacao`) VALUES
(1, 2, '', 'Loja de roupas', 'Loja', 'Venda', 5000.00, '1 de maio', 'Maputo (Província)', NULL, 'Uploads/imoveis/2/1/principal/principal_695a892d88595.webp', '2025-11-14 12:46:33'),
(4, 4, '', 'Casa tipo 3', 'Casa', 'Aluguel', 3000.00, 'maracuene', 'Inhambane', NULL, 'Uploads/imoveis/4/4/principal/principal_695a65b90dca4.webp', '2026-01-04 13:06:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(11) NOT NULL,
  `conversa_id` int(11) NOT NULL,
  `remetente_id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `data_envio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `mensagens`
--

INSERT INTO `mensagens` (`id`, `conversa_id`, `remetente_id`, `mensagem`, `data_envio`) VALUES
(1, 1, 2, 'Come', '2025-12-11 10:29:09'),
(2, 1, 4, 'yc', '2025-12-11 10:34:39'),
(3, 1, 2, 'verifica', '2025-12-11 10:39:01'),
(4, 1, 2, 'yc', '2025-12-11 10:39:12'),
(5, 1, 2, 'yc', '2025-12-11 10:39:17'),
(6, 1, 2, 'verifica', '2025-12-11 10:40:44'),
(7, 1, 4, 'd', '2025-12-11 10:44:27'),
(8, 1, 4, 'ff', '2025-12-11 10:49:00'),
(9, 1, 4, 'vivo?', '2026-01-04 15:06:38'),
(10, 1, 2, 'sim', '2026-01-04 15:06:59'),
(11, 3, 6, 'Come', '2026-01-04 17:40:33');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `pais` varchar(100) DEFAULT 'Moçambique',
  `provincia` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT 'Uploads/perfil/default.jpg',
  `tipo` enum('admin','usuario') DEFAULT 'usuario',
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `telefone`, `pais`, `provincia`, `senha`, `foto_perfil`, `tipo`, `data_cadastro`) VALUES
(1, 'Administrador', 'admin@admin.com', NULL, 'Moçambique', NULL, '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'Uploads/perfil/default.jpg', 'admin', '2025-11-12 02:37:36'),
(2, 'Shelton Cossa', 'shelton@gmail.com', '+258843671168', 'Moçambique', 'Maputo', '$2y$10$pSQgDBzGpbnvkrPKFyIEGeqxK/W5Y/3xu1AGwWtII/cTHjEGKd3Mm', 'uploads/perfil/2/perfil_695a894a0eba0.jpg', 'usuario', '2025-11-12 02:45:02'),
(4, 'jose bata', 'jose@gmail.com', '+258843671160', 'Moçambique', 'Sofala', '$2y$10$cdkqQVv5ctAeKAcZML9kauuYmLyuj.azJ93OF6vvHC0dzt8eS48r6', 'uploads/perfil/default.jpg', 'usuario', '2025-11-14 14:26:07'),
(6, 'Jorge Mabucuro', 'jorge@gmail.com', '+258842121478', 'Moçambique', 'Nampula', '$2y$10$xLxUkTNw9Nooy0P6APwX2eBrWRmEwEIU4hyTrFCug5lDR5XgujGea', 'uploads/perfil/default.jpg', 'usuario', '2026-01-04 15:22:00');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `view_conversas`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `view_conversas` (
`conversa_id` int(11)
,`outro_usuario_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `view_conversas`
--
DROP TABLE IF EXISTS `view_conversas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_conversas`  AS SELECT `c`.`id` AS `conversa_id`, CASE WHEN `c`.`usuario1_id` = `u`.`id` THEN `c`.`usuario2_id` ELSE `c`.`usuario1_id` END AS `outro_usuario_id` FROM (`conversas` `c` join `usuarios` `u` on(`c`.`usuario1_id` = `u`.`id` or `c`.`usuario2_id` = `u`.`id`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `conversas`
--
ALTER TABLE `conversas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario1_id` (`usuario1_id`),
  ADD KEY `usuario2_id` (`usuario2_id`);

--
-- Índices para tabela `imagens_imoveis`
--
ALTER TABLE `imagens_imoveis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imovel_id` (`imovel_id`);

--
-- Índices para tabela `imoveis`
--
ALTER TABLE `imoveis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversa_id` (`conversa_id`),
  ADD KEY `remetente_id` (`remetente_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `conversas`
--
ALTER TABLE `conversas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `imagens_imoveis`
--
ALTER TABLE `imagens_imoveis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `imoveis`
--
ALTER TABLE `imoveis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `conversas`
--
ALTER TABLE `conversas`
  ADD CONSTRAINT `conversas_ibfk_1` FOREIGN KEY (`usuario1_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversas_ibfk_2` FOREIGN KEY (`usuario2_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `imagens_imoveis`
--
ALTER TABLE `imagens_imoveis`
  ADD CONSTRAINT `imagens_imoveis_ibfk_1` FOREIGN KEY (`imovel_id`) REFERENCES `imoveis` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `imoveis`
--
ALTER TABLE `imoveis`
  ADD CONSTRAINT `imoveis_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`conversa_id`) REFERENCES `conversas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mensagens_ibfk_2` FOREIGN KEY (`remetente_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
