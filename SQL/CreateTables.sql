use OnlineShopWebApplication;


CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    short_description VARCHAR(MAX),
    long_description VARCHAR(MAX),
    price DECIMAL(10, 2) NOT NULL,
    number_of_orders INT DEFAULT 0,
    image_url_thumbnail VARCHAR(MAX),
    image_url_full VARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    rate DECIMAL(3, 2) DEFAULT 0 CHECK (rate >= 0 AND rate <= 5),
    -- category VARCHAR(50) CHECK (category IN ('men''s', 'women''s', 'kid''s'))
	category VARCHAR(50) NULL
);


CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    isAdmin BIT DEFAULT 0
);

CREATE TABLE purchases (
    purchase_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    purchase_date DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);


CREATE TABLE ordered (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    order_date DATETIME2 DEFAULT GETDATE(),
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    status VARCHAR(50) DEFAULT 'Pending',  -- Status could be 'Pending', 'Shipped', 'Delivered', etc.
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);


/* drop table purchases */
/*drop table products*/