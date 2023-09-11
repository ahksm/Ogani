<?php

class Department
{
    public $id;
    public $name;
    public $category_id;
    public $sort_order;
    public $status;

    const ACTIVE = 1;
    const INACTIVE = 1;

    public static function request($data)
    {
        $department = new Department();
        foreach ($data as $key => $value) {
            $department->{$key} = $value;
        }
        return $department;
    }
}
