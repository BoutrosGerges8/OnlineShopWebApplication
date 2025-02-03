use OnlineShopWebApplication;


CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    short_description VARCHAR(MAX),
    long_description VARCHAR(MAX),
    price DECIMAL(10, 2) NOT NULL,
    number_of_orders INT DEFAULT 0,
    image_url_thumbnail VARCHAR(MAX), -- Column for the thumbnail image URL
    image_url_full VARCHAR(MAX),      -- Column for the full-size image URL
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    rate DECIMAL(3, 2) DEFAULT 0 CHECK (rate >= 0 AND rate <= 5) -- Added rate column with default value 0
);