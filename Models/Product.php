<?php

class Product
{
    const SHOW_BY_DEFAULT = 6;
    const ORDER_BY_DEFAULT = 'name';
    const ACTIVE = 1;
    const INACTIVE = 1;

    public $id;
    public $name;
    public $weight;
    public $size;
    public $color;
    public $category_id;
    public $department_id;
    public $price;
    public $availability;
    public $brand;
    public $is_sale;
    public $sale_percent;
    public $old_price;
    public $created_at;
    public $updated_at;
    public $status;

    public $short_descr;
    public $long_descr;
    public $info;
    public $review;

    public static function request($data)
    {
        $product = new Product();
        foreach ($data as $key => $value) {
            $product->{$key} = ($value === '') ? null : $value;
        }
        return $product;
    }
}
