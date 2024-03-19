-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql:3306
-- Généré le : mar. 19 mars 2024 à 02:20
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `newsapf`
--

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240318094331', '2024-03-18 09:44:46', 664);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `image_name`, `created_at`, `updated_at`) VALUES
(1, 'Actualités principale', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed commodo nisi vel leo elementum, eu posuere massa faucibus. In hac habitasse platea dictumst. Donec faucibus mollis gravida. Cras suscipit turpis interdum, finibus arcu et, vehicula dui. Maecenas vehicula, lacus nec tincidunt maximus, urna ligula scelerisque mi, eu tristique dui nunc sed mi. In eu odio eleifend, tempor sapien ut, dapibus ex. Vestibulum tempor, velit eu placerat volutpat, nisi est pulvinar nisi, sit amet molestie elit enim vel justo. Integer eu varius elit, a elementum elit. Nulla facilisi. Pellentesque fermentum et augue eget convall</div>', '9b3a2436d140.jpg', '2024-03-18 09:46:00', '2024-03-19 02:14:33'),
(2, 'Deuxième actualité du jour', '<div>Proin pretium nisi egestas dui mollis sagittis sed eget mauris. Donec eu quam mattis, consequat mi sit amet, dictum purus. Praesent sit amet sem metus. Fusce sed varius ligula. Nullam sit amet aliquet sem. Etiam luctus ligula erat, ut mattis lacus feugiat eget. Pellentesque eleifend consequat nisi, vitae ultrices eros fermentum in. Praesent rutrum in sem eu consectetur. Phasellus molestie volutpat massa, id ullamcorper enim tincidunt ut.&nbsp;</div>', '10b8dfa44214.jpg', '2024-03-18 09:46:26', '2024-03-19 02:17:24'),
(3, 'Troisième actualité du jour', 'Duis elementum sem sed felis luctus porta. Phasellus eget volutpat est. Nullam dapibus neque imperdiet dolor aliquet mattis. Nullam volutpat neque ut lacus efficitur, vitae luctus velit maximus. Vivamus sollicitudin neque ut massa consectetur laoreet. Nullam tincidunt odio eu ante porttitor eleifend. Vivamus mollis iaculis sagittis. Vestibulum vel justo lorem. Donec elementum metus eget venenatis consectetur. Nullam volutpat pellentesque congue. Vivamus eget risus elit. Vestibulum elementum posuere posuere. Fusce tincidunt lorem ut venenatis facilisis. Praesent aliquet elementum hendrerit. ', '14ffeb3efb9a.jpg', '2024-03-18 09:48:41', '2024-03-18 09:48:41'),
(4, 'Quatrième actualité du jour', 'Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum eget bibendum mauris, sit amet pharetra tortor. Mauris ullamcorper quam vel enim vestibulum, in rutrum mi pellentesque. Ut quam ex, ornare sodales tortor condimentum, euismod scelerisque eros. Nunc eu leo sed sapien lacinia accumsan. Fusce tincidunt tristique nisi, eu dapibus augue placerat vitae. In hac habitasse platea dictumst. ', '640fb3840709.jpg', '2024-03-18 09:48:41', '2024-03-18 09:48:41'),
(5, 'Cinquième actualité', 'Praesent dapibus est nec purus tristique pellentesque. Vivamus pellentesque eros euismod nisl ornare, at aliquam quam bibendum. Nam ultricies massa ac ultrices venenatis. Nullam sagittis fringilla mattis. Phasellus id semper tellus. Maecenas at purus eu ligula elementum efficitur. In hac habitasse platea dictumst. Sed ut elit neque. In tellus felis, vehicula id convallis nec, dictum vel mauris. Fusce varius quam quis urna malesuada, et molestie felis mattis. Proin interdum, tellus mollis ullamcorper tincidunt, magna turpis posuere orci, sit amet eleifend ante nunc quis sem. Aliquam et facilisis lacus. Duis eu sapien iaculis tortor ornare rhoncus a sed libero. Praesent gravida eget diam nec scelerisque. In a enim nulla. Fusce egestas lorem quis imperdiet ullamcorper. ', 'ad96788de26a.jpg', '2024-03-18 09:49:32', '2024-03-18 09:49:32'),
(6, 'Sixième actualité du jour', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed commodo nisi vel leo elementum, eu posuere massa faucibus. In hac habitasse platea dictumst. Donec faucibus mollis gravida. Cras suscipit turpis interdum, finibus arcu et, vehicula dui. Maecenas vehicula, lacus nec tincidunt maximus, urna ligula scelerisque mi, eu tristique dui nunc sed mi. In eu odio eleifend, tempor sapien ut, dapibus ex. Vestibulum tempor, velit eu placerat volutpat, nisi est pulvinar nisi, sit amet molestie elit enim vel justo. Integer eu varius elit, a elementum elit. Nulla facilisi. Pellentesque fermentum et augue eget convallis. Proin pretium nisi egestas dui mollis sagittis sed eget mauris. Donec eu quam mattis, consequat mi sit amet, dictum purus. Praesent sit amet sem metus. Fusce sed varius ligula. Nullam sit amet aliquet sem. Etiam luctus ligula erat, ut mattis lacus feugiat eget. Pellentesque eleifend consequat nisi, vitae ultrices eros fermentum in. Praesent rutrum in sem eu consectetur. Phasellus molestie volutpat massa, id ullamcorper enim tincidunt ut.&nbsp;</div>', 'e007c504400b.jpg', '2024-03-18 09:49:32', '2024-03-19 02:14:54'),
(18, 'testttt', '<div>testttt</div>', '046fee12a597da25a2eb005aad0cf05e1edcc22e.jpg', '2024-03-19 02:15:22', '2024-03-19 02:15:22'),
(19, 'eeee', '<div>eeee</div>', '7b0583037cd997a872fb5e363157a1719f88b852.jpg', '2024-03-19 02:17:15', '2024-03-19 02:17:15');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user__id` int DEFAULT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user__id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(16, 8, '6e6c714417ad9940', '65f8c73ba3706', '2024-03-18 22:59:07', '2024-03-18 23:59:07');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `first_name`, `last_name`, `pseudo`) VALUES
(3, 'admin.admin@test.fr', '[\"ROLE_ADMIN\"]', '$2y$13$oLIvIYiQIGTXtoGD3my8J..9IEpOusizhoQZ24XEqTEcm.OjpCY4q', 0, 'admin', 'admin', 'admin'),
(8, 'denis.bekaert@live.fr', '[\"ROLE_ADMIN\"]', '$2y$13$65p8RvLJxgUONSBixhIsgOQFMtIBwWkQ25pH3/JDKpdDWdWMA/dvW', 0, 'Denis', 'bekaert', 'denis');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748A8D57A4BB` (`user__id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748A8D57A4BB` FOREIGN KEY (`user__id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
