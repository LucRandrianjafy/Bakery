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
(4, 2000.00, '2024-03-01', 3),
(5, 1650.00, '2023-04-01', 4);

INSERT INTO product ( name, id_category, description, image) VALUES 
( 'Baguette Tradition', 1, 'Une baguette traditionnelle française', 'baguette.jpg'),
( 'Pain Complet', 1, 'Pain fait avec de la farine complète', 'pain_complet.jpg'),
( 'Croissant au Beurre', 4, 'Croissant frais au beurre', 'croissant.jpg'),
( 'Pain au Chocolat', 4, 'Pain au chocolat délicieux et fondant', 'pain_chocolat.jpg'),
( 'Tarte aux Pommes', 3, 'Tarte sucrée aux pommes', 'tarte.jpg'),
( 'Éclair au Chocolat', 3, 'Éclair au chocolat avec une crème fondante', 'eclair.jpg'),
( 'Café', 2, 'Café fort et savoureux', 'cafe.jpg'),
( 'Jus Orange', 2, 'Jus d orange frais et naturel', 'jus_orange.jpg'),
( 'Farine Bio', 5, 'Farine biologique de haute qualité', 'farine.jpg'),
( 'Chocolat en Poudre', 5, 'Chocolat en poudre pour pâtisserie', 'chocolat.jpg');


INSERT INTO stock (id_stock, purchase_qtt, sale_qtt, date_inventory, id_product, unitary_purchase_amount) VALUES
(1, 300, 0, '2024-01-09', 9, 50), -- Farine Bio
(2, 200, 0, '2024-01-10', 10, 75); -- Chocolat en Poudre

INSERT INTO stock (id_stock, purchase_qtt, sale_qtt, date_inventory, id_product, unitary_purchase_amount) VALUES
(3, 0, 300, '2024-01-09', 1, 0), -- Baguette Tradition
(4, 0, 300, '2024-01-10', 2, 0); -- Pain Complet

INSERT INTO sale_price_history (id_price_history, amount, date_history, id_product) VALUES 
(1, 1.00, '2024-01-03', 1), -- Baguette Tradition
(2, 1.50, '2024-01-01', 2), -- Pain Complet
(3, 0.90, '2024-01-01', 3), -- Croissant au Beurre
(4, 1.00, '2024-01-01', 4), -- Pain au Chocolat
(5, 2.50, '2024-01-01', 5), -- Tarte aux Pommes
(6, 2.00, '2024-01-01', 6), -- Éclair au Chocolat
(7, 1.20, '2024-01-01', 7), -- Café
(8, 1.50, '2024-01-01', 8), -- Jus d'Orange
(9, 0.50, '2024-01-01', 9), -- Farine Bio
(10, 0.80, '2024-01-01', 10); -- Chocolat en Poudre

INSERT INTO recipe (id_recipe, id_product, id_product_ingredient, qtt_ingredient) VALUES 
(1, 1, 9, 10),  -- Baguette Tradition nécessite de la Farine Bio
(2, 1, 10, 10), -- Baguette Tradition nécessite du Chocolat en Poudre (par exemple pour une variante)
(3, 3, 9, 10),  -- Croissant au Beurre nécessite de la Farine Bio
(4, 3, 10, 10), -- Croissant au Beurre nécessite du Chocolat en Poudre
(5, 5, 9, 10),  -- Tarte aux Pommes nécessite de la Farine Bio
(6, 5, 10, 10), -- Tarte aux Pommes nécessite du Chocolat en Poudre
(7, 4, 9, 10),  -- Pain au Chocolat nécessite de la Farine Bio
(8, 4, 10, 5); -- Pain au Chocolat nécessite du Chocolat en Poudre


/*
    30.000 achat
    750 vente
    750 CA

*/