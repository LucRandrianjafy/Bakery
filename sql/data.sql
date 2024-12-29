INSERT INTO admin (id_admin, name, email, password) VALUES 
(1, 'admin', 'admin@gmail.com', 'password');

INSERT INTO category (id_category, name) VALUES 
(1, 'Pain'),
(2, 'Boissons'),
(3, 'Pâtisseries'),
(4, 'Viennoiseries'),
(5, 'Matiere premiere');

INSERT INTO staff (id_staff, name) VALUES 
(1, 'Marie Dupont'),
(2, 'Jean Martin'),
(3, 'Sophie Lefèvre'),
(4, 'Paul Durand');

INSERT INTO salary_history (id_sh, amount, date_salary, id_staff) VALUES 
(1, 1500.00, '2023-01-01', 1),
(2, 1550.00, '2023-02-01', 2),
(3, 1600.00, '2023-03-01', 3),
(4, 1600.00, '2024-03-01', 3),
(5, 1650.00, '2023-04-01', 4);

INSERT INTO product (id_product, name, id_category, description, image) VALUES 
(1, 'Baguette Tradition', 1, 'Une baguette traditionnelle française', 'baguette.jpg'),
(2, 'Pain Complet', 1, 'Pain fait avec de la farine complète', 'pain_complet.jpg'),
(3, 'Croissant au Beurre', 4, 'Croissant frais au beurre', 'croissant.jpg'),
(4, 'Pain au Chocolat', 4, 'Pain au chocolat délicieux et fondant', 'pain_chocolat.jpg'),
(5, 'Tarte aux Pommes', 3, 'Tarte sucrée aux pommes', 'tarte.jpg'),
(6, 'Éclair au Chocolat', 3, 'Éclair au chocolat avec une crème fondante', 'eclair.jpg'),
(7, 'Café', 2, 'Café fort et savoureux', 'cafe.jpg'),
(8, 'Jus Orange', 2, 'Jus d orange frais et naturel', 'jus_orange.jpg'),
(9, 'Farine Bio', 5, 'Farine biologique de haute qualité', 'farine.jpg'),
(10, 'Chocolat en Poudre', 5, 'Chocolat en poudre pour pâtisserie', 'chocolat.jpg');


INSERT INTO stock (id_stock, purchase_qtt, sale_qtt, date_inventory, id_product) VALUES 
(1, 100, 80, '2024-01-01', 1), -- Baguette Tradition
(2, 50, 30, '2024-01-02', 2),  -- Pain Complet
(3, 200, 150, '2024-01-03', 3), -- Croissant au Beurre
(4, 150, 120, '2024-01-04', 4), -- Pain au Chocolat
(5, 60, 40, '2024-01-05', 5),  -- Tarte aux Pommes
(6, 50, 30, '2024-01-06', 6),  -- Éclair au Chocolat
(7, 100, 70, '2024-01-07', 7), -- Café
(8, 80, 50, '2024-01-08', 8),  -- Jus d'Orange
(9, 300, 200, '2024-01-09', 9), -- Farine Bio
(10, 200, 180, '2024-01-10', 10); -- Chocolat en Poudre

INSERT INTO price_history (id_price_history, amount, date_history, id_product) VALUES 
(1, 1.00, '2024-01-01', 1), -- Baguette Tradition
(2, 1.50, '2024-01-01', 2), -- Pain Complet
(3, 0.90, '2024-01-01', 3), -- Croissant au Beurre
(4, 1.00, '2024-01-01', 4), -- Pain au Chocolat
(5, 2.50, '2024-01-01', 5), -- Tarte aux Pommes
(6, 2.00, '2024-01-01', 6), -- Éclair au Chocolat
(7, 1.20, '2024-01-01', 7), -- Café
(8, 1.50, '2024-01-01', 8), -- Jus d'Orange
(9, 0.50, '2024-01-01', 9), -- Farine Bio
(10, 0.80, '2024-01-01', 10); -- Chocolat en Poudre

INSERT INTO recipe (id_recipe, id_product, id_product_ingredient) VALUES 
(1, 1, 9),  -- Baguette Tradition nécessite de la Farine Bio
(2, 1, 10), -- Baguette Tradition nécessite du Chocolat en Poudre (par exemple pour une variante)
(3, 3, 9),  -- Croissant au Beurre nécessite de la Farine Bio
(4, 3, 10), -- Croissant au Beurre nécessite du Chocolat en Poudre
(5, 5, 9),  -- Tarte aux Pommes nécessite de la Farine Bio
(6, 5, 10), -- Tarte aux Pommes nécessite du Chocolat en Poudre
(7, 4, 9),  -- Pain au Chocolat nécessite de la Farine Bio
(8, 4, 10); -- Pain au Chocolat nécessite du Chocolat en Poudre
