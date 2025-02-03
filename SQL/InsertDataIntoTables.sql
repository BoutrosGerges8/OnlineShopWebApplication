use OnlineShopWebApplication;

INSERT INTO products (product_name, short_description, long_description, price, number_of_orders, image_url_thumbnail, image_url_full)
VALUES (
    'New Green Jacket',
    'Stay stylish and warm with our New Green Jacket. Perfect for outdoor adventures or casual outings.',
    'This New Green Jacket is made from high-quality, water-resistant material, ensuring durability and comfort in all weather conditions. It features a sleek design with multiple pockets, a adjustable hood, and a soft inner lining for extra warmth. Ideal for hiking, camping, or everyday wear.',
    75.00,
    0,
    'https://example.com/images/green-jacket-thumbnail.jpg',
    'https://example.com/images/green-jacket-full.jpg'
);

/*
ALTER TABLE products
ADD image_url_thumbnail VARCHAR(MAX);

ALTER TABLE products
ADD image_url_full VARCHAR(MAX);

delete from products;

ALTER TABLE products
ADD rate DECIMAL(3, 2) DEFAULT 0 CHECK (rate >= 0 AND rate <= 5);

update products
set product_id = 1
*/

select * from products;



select * from users;