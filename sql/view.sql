CREATE OR REPLACE VIEW v_product_lib AS
SELECT
    p.id_product,
    p.name AS product_name,
    p.description AS product_description,
    p.image AS product_image,
    c.id_category,
    c.name AS category_name
FROM
    product p
JOIN
    category c
ON
    p.id_category = c.id_category;


-- VENTE
CREATE OR REPLACE VIEW v_sales AS
SELECT 
    s.id_stock,
    p.id_product,
    p.name AS product_name,
    s.sale_qtt,
    ph.amount AS sale_price,
    s.sale_qtt * ph.amount AS total_amount, 
    p.description AS product_description,
    p.id_category,
    p.image,
    s.date_inventory
FROM stock s
INNER JOIN product p 
    ON s.id_product = p.id_product
INNER JOIN sale_price_history ph
    ON s.id_product = ph.id_product
    AND ph.date_history = (
        SELECT MAX(ph2.date_history)
        FROM sale_price_history ph2
        WHERE ph2.id_product = s.id_product 
          AND ph2.date_history <= s.date_inventory
    )
WHERE s.sale_qtt > 0;


-- ACHAT
CREATE OR REPLACE VIEW v_purchases AS
SELECT 
    s.id_stock,
    p.id_product,
    p.name AS product_name,
    s.purchase_qtt,
    s.unitary_purchase_amount AS unitary_purchase_price,
    s.unitary_purchase_amount * purchase_qtt AS total_amount,
    p.description AS product_description,
    p.id_category,
    p.image,
    s.date_inventory
FROM stock s
INNER JOIN product p 
    ON s.id_product = p.id_product
WHERE s.purchase_qtt > 0; 


-- CHIFFRE D'AFFAIRE ANNUEL
CREATE OR REPLACE VIEW v_revenue AS
SELECT 
    DATE_PART('year', date_inventory) AS year,
    DATE_PART('month', date_inventory) AS month,
    SUM(COALESCE(sale_qtt, 0) * COALESCE(sale_price, 0)) AS monthly_revenue
FROM v_sales
GROUP BY DATE_PART('year', date_inventory), DATE_PART('month', date_inventory)
ORDER BY year, month;


-- DEPENSE ACHAT (MOIS - ANNEE)
CREATE OR REPLACE VIEW v_expenses AS
SELECT 
    DATE_PART('year', s.date_inventory) AS year,
    DATE_PART('month', s.date_inventory) AS month,
    SUM(COALESCE(s.purchase_qtt, 0) * COALESCE(s.unitary_purchase_amount, 0)) AS monthly_expenses
    -- manque des depenses pour les salaires
FROM stock s
GROUP BY DATE_PART('year', s.date_inventory), DATE_PART('month', s.date_inventory)
ORDER BY year, month;



-- SALAIRE MENSUEL (MOIS - ANNEE)
CREATE OR REPLACE VIEW v_staff_monthly_salaries AS
WITH salary_changes AS (
    -- Sous-requête pour obtenir les changements de salaire et générer les mois de salaire
    SELECT 
        sh.id_staff,
        sh.amount AS salary,
        -- Générer une série de mois entre la date du salaire et la date actuelle
        generate_series(
            date_trunc('month', sh.date_salary),  -- Premier jour du mois de la modification
            CURRENT_DATE,                         -- Jusqu'à aujourd'hui
            interval '1 month'
        ) AS month_date
    FROM salary_history sh
),
staff_salaries AS (
    -- Regrouper les changements de salaire avec un salaire fixe pour chaque période
    SELECT 
        sc.id_staff,
        sc.salary,
        sc.month_date,
        -- Trouver le salaire précédent pour chaque mois
        MAX(sc.salary) OVER (PARTITION BY sc.id_staff ORDER BY sc.month_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS effective_salary
    FROM salary_changes sc
)
-- Sélectionner les résultats sans doublons
SELECT DISTINCT
    s.id_staff,
    s.name AS staff_name,
    ss.month_date,
    ss.effective_salary AS salary
FROM staff_salaries ss
JOIN staff s ON s.id_staff = ss.id_staff
ORDER BY s.id_staff, ss.month_date;

-- BENEFICE (MOIS - ANNEE)
CREATE OR REPLACE VIEW v_profit AS
SELECT 
    r.year,
    r.month,
    SUM(COALESCE(r.monthly_revenue, 0)) - 
    SUM(COALESCE(e.monthly_expenses, 0)) AS monthly_profit
FROM v_revenue r
LEFT JOIN v_expenses e
    ON r.year = e.year
    AND r.month = e.month
GROUP BY r.year, r.month
ORDER BY r.year, r.month;

-- DEPENSE TOTAL ( ACHAT + SALAIRE)
CREATE OR REPLACE VIEW v_total_monthly_salaries AS
WITH salary_changes AS (
    -- Générer les périodes mensuelles pour chaque modification de salaire
    SELECT 
        sh.id_staff,
        sh.amount AS salary,
        generate_series(
            date_trunc('month', sh.date_salary),  -- Premier jour du mois de la modification
            CURRENT_DATE,                         -- Jusqu'à aujourd'hui
            interval '1 month'
        ) AS month_date
    FROM salary_history sh
),
effective_salaries AS (
    -- Identifier le salaire effectif (dernier salaire actif pour chaque mois)
    SELECT DISTINCT ON (sc.id_staff, sc.month_date)
        sc.id_staff,
        sc.month_date,
        FIRST_VALUE(sc.salary) OVER (
            PARTITION BY sc.id_staff, sc.month_date
            ORDER BY sc.month_date DESC
        ) AS effective_salary
    FROM salary_changes sc
)
-- Agréger les salaires effectifs par mois et année
SELECT
    DATE_PART('year', es.month_date) AS year,
    DATE_PART('month', es.month_date) AS month,
    SUM(es.effective_salary) AS total_monthly_salary
FROM effective_salaries es
GROUP BY DATE_PART('year', es.month_date), DATE_PART('month', es.month_date)
ORDER BY year, month;


