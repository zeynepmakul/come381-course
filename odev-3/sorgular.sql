-- Q1: 50 TL üzerindeki ürünler
-- Ne işe yarar: Fiyatı yüksek ürünleri en pahalıdan başlayarak gösterir.
SELECT p.name, p.price
FROM product AS p
WHERE p.price > 50
ORDER BY p.price DESC;

-- Q2: YBS müşterileri
-- Ne işe yarar: YBS bölümündeki müşterilerin adlarını alfabetik listeler.
SELECT c.full_name
FROM customer AS c
WHERE c.department = 'YBS'
ORDER BY c.full_name ASC;

-- Q3: Sipariş ve müşteri bilgileri
-- Ne işe yarar: Siparişin tarihini ve hangi müşteriye ait olduğunu gösterir.
SELECT o.order_id, o.order_date, c.full_name
FROM orders AS o
INNER JOIN customer AS c
ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- Q4: Sipariş kalemleri
-- Ne işe yarar: Sipariş numarasına göre ürün adını ve miktarını gösterir.
SELECT i.order_id, p.name, i.quantity
FROM order_item AS i
INNER JOIN product AS p
ON i.product_id = p.product_id
ORDER BY i.order_id, i.product_id;

-- Q5: Müşterilerin sipariş sayısı
-- Ne işe yarar: Sipariş vermeyen müşterileri de sıfır olarak gösterir.
SELECT c.full_name, COUNT(o.order_id) AS siparis_adedi
FROM customer AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY c.customer_id;

-- Q6: Kategoriye göre ortalama fiyat
-- Ne işe yarar: Her kategorinin fiyat ortalamasını hesaplar.
SELECT p.category, AVG(p.price) AS ortalama
FROM product AS p
GROUP BY p.category
ORDER BY p.category;
