<?php

class ProductRepository
{
    private static function executeQuery($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        $result->setFetchMode(PDO::FETCH_ASSOC);
        $result->execute($params);
        return $result->fetchAll();
    }

    private static function executeIntQuery($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        foreach ($params as $key => $value) {
            $result->bindValue($key, $value, is_int($value) ? PDO::PARAM_INT : PDO::PARAM_STR);
        }
        $result->execute();
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }

    private static function executeDelete($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        return $result->execute($params);
    }

    private static function executeUpdate($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        return $result->execute($params);
    }

    private static function executeInsert($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        if ($result->execute($params)) {
            return $db->lastInsertId();
        }
        return 0;
    }

    public static function getProducts($admin = false)
    {
        $sql = "
            SELECT p.*, pt.* 
            FROM products p
            INNER JOIN product_texts pt ON p.id = pt.id
        ";

        $params = !$admin ? [':status' => Product::ACTIVE] : [];

        return self::executeQuery($sql, $params);
    }

    public static function getRandomProduct()
    {
        $sql = "
            SELECT id, name, price, is_sale 
            FROM products
            WHERE status = :status 
            ORDER BY rand() 
            LIMIT 1
        ";

        $results = self::executeQuery($sql, [':status' => Product::ACTIVE]);
        return !empty($results) ? $results[0] : null;
    }

    public static function getSaleProducts($count = Product::SHOW_BY_DEFAULT, $categoryId = null, $departmentId = null)
    {
        $sql = "
        SELECT id, department_id, name, price, old_price, sale_percent 
        FROM products
        WHERE status = :status 
        AND is_sale = 1 
    ";

        $params = [':status' => Product::ACTIVE];

        if ($categoryId !== null) {
            $sql .= "AND category_id = :category_id ";
            $params[':category_id'] = (int)$categoryId;
        }

        if ($departmentId !== null) {
            $sql .= "AND department_id = :department_id ";
            $params[':department_id'] = (int)$departmentId;
        }

        return self::executeIntQuery($sql . "ORDER BY id DESC LIMIT :count", $params + [':count' => (int)$count]);
    }

    public static function getProductById($id)
    {
        $sql = "
        SELECT p.*, pt.* 
        FROM products p
        INNER JOIN product_texts pt ON p.id = pt.id 
        WHERE p.id = :id
    ";

        $results = self::executeQuery($sql, [':id' => (int) $id]);
        return !empty($results) ? $results[0] : null;
    }

    public static function getProductsByIds($idsArray)
    {
        $idsString = implode(',', array_map('intval', $idsArray));
        $sql = "
            SELECT p.*, pt.* 
            FROM products p
            INNER JOIN product_texts pt ON p.id = pt.id 
            WHERE p.id IN ($idsString)
        ";

        return self::executeQuery($sql);
    }

    public static function getProductsList($page = 1, $categoryId = null, $departmentId = null)
    {
        $page = (int) preg_replace('/[^0-9]/', '', $page);
        $limit = Product::SHOW_BY_DEFAULT;
        $offset = ($page - 1) * $limit;

        $sql = "
            SELECT id, name, price, is_sale, old_price, department_id 
            FROM products 
            WHERE status = :status 
        ";

        $params = [':status' => Product::ACTIVE];

        if ($categoryId !== null) {
            $sql .= "AND category_id = :category_id ";
            $params[':category_id'] = (int) $categoryId;
        }

        if ($departmentId !== null) {
            $sql .= "AND department_id = :department_id ";
            $params[':department_id'] = (int) $departmentId;
        }

        $sql .= "ORDER BY name LIMIT :limit OFFSET :offset";

        return self::executeIntQuery($sql, array_merge($params, [':limit' => (int) $limit, ':offset' => (int) $offset]));
    }

    public static function getProductsByCat($productId)
    {
        $product = self::getProductById($productId);
        $categoryId = $product['category_id'];

        $sql = "
            SELECT id, name, price, is_sale, old_price, department_id 
            FROM products 
            WHERE status = :status 
            AND category_id = :category_id 
            ORDER BY rand() 
            LIMIT 4
        ";

        return self::executeQuery($sql, [':status' => Product::ACTIVE, ':category_id' => (int)$categoryId]);
    }

    public static function getTotalProducts($categoryId = null, $departmentId = null)
    {
        $sql = "
            SELECT COUNT(id) AS count 
            FROM products 
            WHERE status = :status 
        ";

        $params = [':status' => Product::ACTIVE];

        if ($categoryId !== null) {
            $sql .= "AND category_id = :category_id ";
            $params[':category_id'] = (int) $categoryId;
        }

        if ($departmentId !== null) {
            $sql .= "AND department_id = :department_id ";
            $params[':department_id'] = (int) $departmentId;
        }

        $results = self::executeQuery($sql, $params);
        return !empty($results) && isset($results[0]['count']) ? (int) $results[0]['count'] : 0;
    }

    public static function delete($id)
    {
        $sql = "
            DELETE p, pt
            FROM products p
            INNER JOIN product_texts pt ON p.id = pt.id 
            WHERE p.id = :id
        ";

        return self::executeDelete($sql, [':id' => (int)$id]);
    }

    public static function update($id, $product)
    {
        $sql = "
            UPDATE products p
            INNER JOIN product_texts pt ON p.id = pt.id
            SET
                p.name = :name,
                p.weight = :weight,
                p.department_id = :department_id,
                p.category_id = :category_id,
                p.price = :price,
                p.availability = :availability,
                p.brand = :brand,
                p.is_sale = :is_sale,
                p.sale_percent = :sale_percent,
                p.old_price = :old_price,
                p.updated_at = NOW(),
                p.status = :status,
                pt.short_descr = :short_descr,
                pt.long_descr = :long_descr,
                pt.info = :info,
                pt.review = :review
            WHERE p.id = :id
        ";

        $params = [
            ':id' => (int)$id,
            ':name' => $product->name,
            ':weight' => $product->weight,
            ':department_id' => $product->department_id,
            ':category_id' => $product->category_id,
            ':price' => $product->price,
            ':availability' => $product->availability,
            ':brand' => $product->brand,
            ':is_sale' => $product->is_sale,
            ':sale_percent' => $product->sale_percent,
            ':old_price' => $product->old_price,
            ':status' => $product->status,
            ':short_descr' => $product->short_descr,
            ':long_descr' => $product->long_descr,
            ':info' => $product->info,
            ':review' => $product->review,
        ];

        return self::executeUpdate($sql, $params);
    }

    public static function create($product)
    {
        $sql = "
            INSERT INTO products (name, weight, department_id, category_id, price, availability, brand, color, size, is_sale, sale_percent, old_price, status)
            VALUES (:name, :weight, :department_id, :category_id, :price, :availability, :brand, :color, :size, :is_sale, :sale_percent, :old_price, :status);
            
            INSERT INTO product_texts (short_descr, long_descr, info, review)
            VALUES (:short_descr, :long_descr, :info, :review)
        ";

        $params = [
            ':name' => $product->name,
            ':weight' => $product->weight,
            ':department_id' => $product->department_id,
            ':category_id' => $product->category_id,
            ':price' => $product->price,
            ':availability' => $product->availability,
            ':brand' => $product->brand,
            ':color' => $product->color,
            ':size' => $product->size,
            ':is_sale' => $product->is_sale,
            ':sale_percent' => $product->sale_percent,
            ':old_price' => $product->old_price,
            ':status' => $product->status,
            ':short_descr' => $product->short_descr,
            ':long_descr' => $product->long_descr,
            ':info' => $product->info,
            ':review' => $product->review,
        ];

        return self::executeInsert($sql, $params);
    }
}
