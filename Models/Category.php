<?php

class Category
{
    public $id;
    public $name;
    public $sort_order;
    public $status;

    const ACTIVE = 1;
    const INACTIVE = 1;

    public static function request($data)
    {
        $category = new Category();
        foreach ($data as $key => $value) {
            $category->{$key} = $value;
        }
        return $category;
    }
}
