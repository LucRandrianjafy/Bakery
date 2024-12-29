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
