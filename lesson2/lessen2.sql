-- Создание Таблица Категории
--CREATE TABLE название таблицы(
--название_столбца ТИП АТРИБУТА
--)
CREATE TABLE categories(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL
);
CREATE TABLE products(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	description TEXT,
	rating REAL DEFAULT 0,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	is_active BLOB DEFAULT 1,
	category_id INTEGER NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(id)
);
--Иземенение таблицы(Добавление столбца)
--ALTER TABLE название таблицы ADD COLUMN название столбца ТИП АТРИБУТА
ALTER TABLE products ADD COLUMN category_id INTEGER

--Удаление Таблицы
--DROP TABLE название таблицы
DROP TABLE categories;
DROP TABLE products;

--Добавление данных(строки)
--INSERT INTO название_таблицы
INSERT INTO categories(name) VALUES(
	'Хоз-товары'
);
INSERT INTO categories(name) VALUES(
	'Электроника'
);
INSERT INTO categories(name) VALUES(
	'Хлебобулочное'
);
SELECT * FROM categories;
SELECT * FROM products;

INSERT INTO products(name, description, price, rating, category_id)
VALUES ('Веник', 'Веник обвкновенний', 999.99, 10, 1);
INSERT INTO products(name, description, price, rating, category_id)
VALUES ('Телефон', 'Редми', 230.50, 10, 2);
INSERT INTO products(name, description, price, rating, category_id)
VALUES ('Ноутбук', 'Acer', 379.50, 8, 2);
INSERT INTO products(name, description, price, rating, category_id)
VALUES ('Видео-карта', 'RTX 4050', 690.50, 9, 2);
INSERT INTO products(name, description, price, rating, category_id)
VALUES ('Телефон', 'Самсунг', 230.50, 10, 2);
INSERT INTO products(name, description, price, rating, category_id)
VALUES ('Буханка', 'Ржанной хлеб', 7.99, 8, 3);
INSERT INTO products(name, description, price, rating, category_id)
VALUES ('Буханка', 'Ржанной хлеб с семечками', 10.69, 10, 3);
INSERT INTO products(name, description, price, rating, category_id)
VALUES ('Пончик', 'С глазурью', 12.59, 9, 3);

DELETE FROM products;
--SELECT * FROM products --WHERE category_id = 2
--INNER JOIN categories c ON categories.id == products.category_id;
SELECT
	p.name AS 'Название продукта',
	c.name AS 'Название категорий'
FROM products p
INNER JOIN categories c ON c.id == p.category_id
WHERE 	p.category_id == 2;



