-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 30 nov. 2024 à 17:34
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `library`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherants`
--

CREATE TABLE `adherants` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(25) NOT NULL,
  `md5_pass` varchar(32) NOT NULL,
  `type_adherent` enum('Etudiant','Professeur','Chercheur','Autre') NOT NULL,
  `date_naiss` varchar(11) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `verified` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adherants`
--

INSERT INTO `adherants` (`id`, `nom`, `prenom`, `email`, `password`, `md5_pass`, `type_adherent`, `date_naiss`, `genre`, `verified`) VALUES
(4, 'kachour', 'fifi', 'feriel@gmail.com', 'feriel123', '', 'Autre', '12-08-2018', '', 0),
(7, 'ghofrane', 'ghofrane', 'ghofrane@gmail.com', '$2y$10$gDJmlGUiN0h4sqh57y', '', 'Etudiant', '', '', 0),
(8, 'Salhi', 'Soumaya', 'ayalamouchi6@gmail.com', '$2y$10$6qe9BIhgVQslzmO4sk', '', 'Etudiant', '', '', 0),
(9, 'hajjeji', 'tasnim', 'tas@gmail.com', '$2y$10$oR12dSMDYaLsh9RsAy', '', 'Etudiant', '', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `id` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `auteur` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `resume` text NOT NULL,
  `disponibilite` enum('Emprunté','Disponible') NOT NULL DEFAULT 'Disponible',
  `nombre_exemplaires` int(11) NOT NULL,
  `langue` varchar(2) NOT NULL,
  `image_couverture` varchar(255) NOT NULL,
  `nombre_pages` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`id`, `titre`, `auteur`, `genre`, `resume`, `disponibilite`, `nombre_exemplaires`, `langue`, `image_couverture`, `nombre_pages`, `image`) VALUES
(1, 'The Lord Of the Ring', 'J.R.R. Tolkien', 'Fantastic', 'A hobbit named Frodo inherits an evil ring and must take it to Mordor to destroy it.', 'Disponible', 3, 'EN', '', 535, 'assets\\images\\livres\\lord_ring.jpg'),
(2, '1984	', 'George Orwell	', 'Dystopia', 'In a totalitarian world, Winston Smith struggles against the Party that watches and controls everything, even thoughts.', 'Disponible', 5, 'En', '', 328, 'assets\\images\\livres\\YEUX.jpg'),
(3, 'Sapiens', 'Yuval Noah Harari', 'History', 'Fascinating exploration of human evolution and its impact on the world.', 'Disponible', 4, 'EN', '', 512, 'assets\\images\\livres\\SAPIEN.jpg'),
(4, 'Les Fleurs du Mal	', 'Charles Baudelaire	', 'Poetry', 'Recueil de poèmes où Baudelaire explore le beau, le mal, et l’amour dans un style sombre et élégant.	', 'Disponible', 1, 'Fr', '', 148, 'assets\\images\\livres\\les-fleurs-du-mal.jpg'),
(5, 'Pride and Prejudce', 'Jane Austen	', 'Romance	', 'Elizabeth Bennet, a lively and intelligent young woman, confronts prejudice and pride in a love story with Mr. Darcy.	', 'Disponible', 2, 'Fr', '', 352, 'assets\\images\\livres\\PRIDEr.jpg'),
(6, 'To Kill a Mockingbird', 'Harper Lee', 'Novel, Social Fiction', 'A novel that explores racism and injustice in the southern United States through the eyes of a young girl, Scout Finch.', 'Disponible', 1, 'EN', '', 281, 'assets\\images\\livres\\TOKILL_.jpg'),
(7, 'Moby-Dick', 'Herman Melville', 'Adventure', 'The story of Captain Ahab’s obsessive pursuit of Moby Dick, the great white whale, blending adventure with profound existential themes.', 'Disponible', 4, 'EN', '', 635, 'assets\\images\\livres\\DICK.jpg'),
(8, ' One Hundred Years of Solitude', 'Gabriel García Márquez', 'Magical Realism, Historical Fiction', 'The magical realist story of the Buendía family across generations in the mythical town of Macondo', 'Disponible', 3, 'Sp', '', 417, 'assets\\images\\livres\\SOLITUDE.jpg'),
(9, 'The Alchemist', 'Paulo Coelho', 'Adventure', 'The story of Santiago, a shepherd who embarks on a journey to discover his personal legend and true purpose in life.', 'Disponible', 4, 'Po', '', 208, 'assets\\images\\livres\\ALCHIMIST.jpg'),
(10, 'Les Misérables', 'Victor Hugo', ' Historical Fiction, Drama', 'A sweeping tale of love, redemption, and social injustice set against the backdrop of 19th-century France.', 'Disponible', 4, 'Fr', '', 1200, 'assets\\images\\livres\\MISERABLE.jpg'),
(11, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Fiction, Social Critique', 'A critique of the American Dream, centered on the mysterious Jay Gatsby and his love for Daisy Buchanan.', 'Disponible', 3, 'En', '', 180, 'assets\\images\\livres\\GRAET.jpg'),
(12, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction, Psychological', 'The story of Holden Caulfield, an alienated teenager navigating the challenges of adulthood and society.', 'Disponible', 3, 'En', '', 234, 'assets\\images\\livres\\CATCHER.jpg'),
(13, 'War and Peace', 'Leo Tolstoy', 'Historical Fiction', 'A monumental novel intertwining personal and historical narratives during the Napoleonic Wars', 'Disponible', 5, 'Ru', '', 1200, 'assets\\images\\livres\\PEACE.jpg'),
(14, 'The Little Prince', 'Antoine de Saint-Exupéry', ' Philosophical Fiction, Children’s Literature', 'A poetic and philosophical tale about a prince traveling between planets, reflecting on life, love, and humanity', 'Disponible', 2, 'Fr', '', 96, 'assets\\images\\livres\\little.jpg'),
(15, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Psychological Fiction, Drama', ' A psychological exploration of guilt and morality, following a man who commits murder and wrestles with his conscience.', 'Disponible', 6, 'Ru', '', 671, 'assets\\images\\livres\\CRIM.jpg'),
(16, 'The Notebook', 'Nicholas Sparks', 'Romantic', 'A heartwarming love story that spans decades, The Notebook follows Noah and Allie, whose youthful romance is tested by time, distance, and societal expectations. Their bond endures through trials, culminating in an emotional ending that speaks to the power of enduring love.', 'Disponible', 5, 'EN', '', 214, 'assets\\images\\livres\\TheNotebook.jpg'),
(17, 'Jane Eyre', 'Charlotte Brontë', 'Romantic', 'This Gothic romance follows Jane Eyre, an orphaned governess with a strong sense of independence and morality. She falls in love with her enigmatic employer, Mr. Rochester, only to discover a dark secret that challenges their relationship. A tale of passion, resilience, and redemption.', 'Disponible', 4, 'EN', '', 532, 'assets\\images\\livres\\jane.jpg'),
(18, 'Anna Karenina', 'Leo Tolstoy', 'Romantic', 'A Russian masterpiece, Anna Karenina explores the passionate and ultimately tragic affair between Anna and Count Vronsky. Set against a backdrop of societal judgment, the novel delves into themes of love, fidelity, and the human condition.', 'Disponible', 5, 'EN', '', 864, 'assets\\images\\livres\\anna-karenina.jpg'),
(19, 'Love in the Time of Cholera', 'Gabriel García Márquez', 'Romantic', 'This lyrical tale chronicles the lifelong devotion of Florentino Ariza for Fermina Daza. Despite decades of separation and various relationships, Florentino’s love never wavers. The novel weaves love, obsession, and the passage of time in a magical realist style.', 'Disponible', 3, 'EN', '', 368, 'assets\\images\\livres\\love.jpg'),
(20, 'Treasure Island', 'Robert Louis Stevenson', 'Adventure', 'This classic adventure novel follows young Jim Hawkins as he embarks on a thrilling quest for hidden pirate treasure. Packed with action, danger, and unforgettable characters like Long John Silver, it’s a timeless tale of adventure on the high seas.', 'Emprunté', 4, 'EN', '', 240, 'assets\\images\\livres\\island.jpg'),
(21, 'The Call of the Wild', 'Jack London', 'Adventure', 'Set in the harsh Yukon during the Klondike Gold Rush, this novel tells the story of Buck, a domesticated dog thrust into the wild, where he must adapt to survive. It’s a gripping tale of resilience, primal instincts, and the bond between humans and animals.', 'Disponible', 3, 'EN', '', 232, 'assets\\images\\livres\\wild.jpg'),
(22, 'Little woman', 'Louisa May Alcott', ' Classic Fiction', 'In picturesque nineteenth-century New England, tomboyish Jo, beautiful Meg, fragile Beth, and romantic Amy are responsible for keeping a home while their father is off to war. At the same time, they must come to terms with their individual personalities—and make the transition from girlhood to womanhood.', 'Disponible', 5, 'EN', '', 452, 'assets\\images\\livres\\little-women.jpg'),
(24, '', '', '', '', 'Emprunté', 1, '', '', 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_creation_email` date NOT NULL,
  `code_password` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `password`, `verified`, `token`, `date_creation_email`, `code_password`) VALUES
(2, 'lamouchi', 'ghofrane', 'ghofrane@gmail.com', '$2y$10$JAbdJby8hyC2x6YZ.XzNPei0fz6Ck3p6GgJrIvl4KNSMYy4yuuIIG', 0, 'd41d8cd98f00b204e9800998ecf8427e50532', '2024-11-21', 0),
(3, 'aa', 'aa', 'aa@gmail.com', '$2y$10$kjM9KWM.5n0JhdqsjYTBc.IGyZXA9TjoI6K4suJkn/ZiqTt0h1dDO', 0, 'd41d8cd98f00b204e9800998ecf8427e45348', '2024-11-21', 0),
(5, 'aya', 'aya', 'ayalamouchi20@gmail.com', '$2y$10$dna9d.cfd.Jbs/VsgAHb4uUmiUAywmgZ5leESnM/2eILF28JGN.L.', 1, '', '2024-11-21', 0),
(6, 'fatma', 'fatma', 'ayalamouchi44@gmail.com', '$2y$10$Ee5A8xp0tXYq/kodb1Qjo.1aNk2dI/395QHaK6Lz.0eSdhKXsZjxG', 1, '', '2024-11-21', 0),
(10, 'nahawand', 'nahawand', 'ayalamouchi@ieee.org', '$2y$10$whTI4QvTwjXUSrtfem.hCe4isJZHkRdYJvgUmAXciFlMciYIqGl0C', 1, '', '2024-11-27', 0),
(12, 'bejaoui', 'mariem', 'mariem@gmail.com', '$2y$10$V2kbijxrzHNPo0nPsmw34eZVK0R8Ldg8eGHGU5IUcxfQ2G/H8flEK', 0, '', '0000-00-00', 0),
(13, 'admin', 'admin', 'admin@gmail.com', '$2y$10$Xq3a7l51el39RwN5lODZy.RNBQCSJetyhwQlv/x1T2np9f50uv1oC', 0, '', '0000-00-00', 0),
(16, 'aya', 'aya', 'ayalamouchi6@gmail.com', '$2y$10$apLsg71BTsqjkBeVNOedUu81FP83L20wziucTkVpduTtWdzTusd0K', 1, '', '2024-11-30', 2546);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherants`
--
ALTER TABLE `adherants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adherants`
--
ALTER TABLE `adherants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
