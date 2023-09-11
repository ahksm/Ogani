<?php

class Order
{
    public $id;
    public $user_id;
    public $user_comment;
    public $status;

    public $order_id;
    public $product_id;
    public $quantity;
    public $price;
    public $total_price;
    
    const ACTIVE = 1;
    const INACTIVE = 1;

    public static function request($data)
    {
        $order = new Order();
        foreach ($data as $key => $value) {
            $order->{$key} = ($value === '') ? null : $value;
        }
        return $order;
    }
}
