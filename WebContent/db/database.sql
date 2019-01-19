DROP DATABASE IF EXISTS db_store;
CREATE DATABASE db_store;

USE db_store;

-- Crea la tabla tb_products
DROP TABLE IF EXISTS tb_products;
CREATE TABLE tb_products (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock > 0),
    register_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    image VARCHAR(255) NOT NULL,
    is_enable TINYINT NOT NULL DEFAULT 1
);


-- Procedimiento almacenado para registrar productos
DROP PROCEDURE IF EXISTS sp_register_products;
DELIMITER $$
CREATE PROCEDURE sp_register_products(
	v_description VARCHAR(255),
    v_price DECIMAL(10,2),
    v_stock INT,
    v_image VARCHAR(255)
)
BEGIN
	INSERT INTO tb_products (description,price,stock,image) VALUES (v_description,v_price,v_stock,v_image);
END $$
DELIMITER ;

CALL sp_register_products('USB 3.0 32GB',24, 180, 'ASMDL');

-- Procedimiento almacenado para obtener por estado
DROP PROCEDURE IF EXISTS sp_products_by_status:
DELIMITER $$
CREATE PROCEDURE sp_products_by_status(
	v_is_enable TINYINT
)
BEGIN
	SELECT id, description,price,stock,register_date,update_date,image,is_enable FROM tb_products
    WHERE is_enable = v_is_enable;
END $$
DELIMITER ;

CALL sp_products_by_status(1);

-- Procedimiento almacenado para obtener producto por id
DROP PROCEDURE IF EXISTS sp_products_by_id:
DELIMITER $$
CREATE PROCEDURE sp_products_by_id(
	v_id INT
)
BEGIN
	SELECT id, description,price,stock,register_date,update_date,image,is_enable FROM tb_products
    WHERE id = v_id;
END $$
DELIMITER ;

CALL sp_products_by_id(1);

-- Procedimiento almacenado para actualizar producto
DROP PROCEDURE IF EXISTS sp_update_product:
DELIMITER $$
CREATE PROCEDURE sp_update_product(
	v_id INT,
	v_description VARCHAR(255),
    v_price DECIMAL(10,2),
    v_stock INT,
    v_image VARCHAR(255)
)
BEGIN
	UPDATE tb_products
    SET description = v_description, price = v_price, stock = v_stock, image = v_image , update_date = CURRENT_TIMESTAMP
	WHERE id = v_id;
END $$
DELIMITER ;

CALL sp_update_product(1, 'USB 3.0 64GB',48, 501, 'LOL');

-- Procedimiento almacenado para habilitar o deshabilitar un producto
DROP PROCEDURE IF EXISTS sp_change_status_product:
DELIMITER $$
CREATE PROCEDURE sp_change_status_product(
	v_id INT,
    v_is_enable TINYINT
)
BEGIN
	UPDATE tb_products
    SET is_enable = v_is_enable 
	WHERE id = v_id;
END $$
DELIMITER ;

CALL sp_change_status_product(1, 0);
