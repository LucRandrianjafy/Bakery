CREATE OR REPLACE FUNCTION check_recipe_availability()
RETURNS TRIGGER AS $$
DECLARE
    required_quantity NUMERIC(15, 2); -- Quantité totale nécessaire pour un ingrédient
    available_quantity NUMERIC(15, 2); -- Quantité disponible dans le stock
    ingredient RECORD; -- Itération sur les ingrédients nécessaires
BEGIN
    -- Vérifier si NEW.purchase_qtt > 0 (modification ici)
    IF NEW.purchase_qtt > 0 THEN
        -- Parcourir tous les ingrédients nécessaires pour le produit
        FOR ingredient IN
            SELECT id_product_ingredient, qtt_ingredient
            FROM recipe
            WHERE id_product = NEW.id_product
        LOOP
            -- Calculer la quantité totale nécessaire pour cet ingrédient
            required_quantity := ingredient.qtt_ingredient * NEW.purchase_qtt; -- On utilise purchase_qtt ici

            -- Calculer la quantité disponible dans le stock pour cet ingrédient
            SELECT COALESCE(SUM(purchase_qtt - sale_qtt), 0)
            INTO available_quantity
            FROM stock
            WHERE id_product = ingredient.id_product_ingredient;

            -- Si la quantité disponible est insuffisante, lever une exception
            IF available_quantity < required_quantity THEN
                RAISE EXCEPTION 'Insufficient stock for ingredient % (required: %, available: %) ',
                                ingredient.id_product_ingredient, required_quantity, available_quantity;
            END IF;

            -- Insertion dans le stock (si la quantité est suffisante)
            INSERT INTO stock (purchase_qtt, sale_qtt, date_inventory, id_product, unitary_purchase_amount)
            VALUES (0, required_quantity, CURRENT_TIMESTAMP, ingredient.id_product_ingredient, 0);
        END LOOP;
    END IF;

    -- Si tout va bien, permettre l'insertion
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Déclencheur pour exécuter la fonction avant l'insertion dans la table stock
CREATE TRIGGER before_stock_insert
BEFORE INSERT ON stock
FOR EACH ROW
EXECUTE FUNCTION check_recipe_availability();

