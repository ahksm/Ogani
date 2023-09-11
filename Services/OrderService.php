<?php

class OrderService
{
    private $repository;

    public function __construct(OrderRepository $repository)
    {
        $this->repository = $repository;
    }
    
    public function validate(Order $order, $rules)
    {
        $errors = [];

        foreach ($rules as $field => $rule) {
            $result = Validator::validate($field, $order->{$field}, $rule);
            if (!$result['valid']) {
                $errors[$field] = $result['message'];
            }
        }

        return $errors ?: null;
    }

    public function validateOrder(Order $order)
    {
        $rules = [
            'username' => 'required|min:2',
            'firstName' => 'required|min:2',
            'lastName' => 'required|min:2',
            'country' => 'required|min:2',
            'city' => 'required|min:2',
            'streetAddress' => 'required|min:2',
            'apartmentAddress' => 'required',
            'zip' => 'required|min:5|numeric',
            'phone' => 'required|numeric',
            'email' => 'required|email|unique',
            'password' => 'required|min:6',
            'comment' => '',
        ];

        return $this->validate($order, $rules);
    }

    public function create($userId, $userComment)
    {
        return $this->repository->create($userId, $userComment);   
    }
}