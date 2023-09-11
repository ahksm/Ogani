<?php

class ProductService
{
    private $repository;

    public function __construct(ProductRepository $repository)
    {
        $this->repository = $repository;
    }

    public function validate(Product $product, $rules)
    {
        $errors = [];

        foreach ($rules as $field => $rule) {
            $result = Validator::validate($field, $product->{$field}, $rule);
            if (!$result['valid']) {
                $errors[$field] = $result['message'];
            }
        }

        return $errors ?: null;
    }

    public function validateProduct(Product $product)
    {
        $rules = [
            'name' => 'required|min:2',
            'weight' => 'required|numeric',
            'size' => 'required',
            'color' => 'required',
            'department_id' => 'required|numeric',
            'category_id' => 'required|numeric',
            'price' => 'required|numeric',
            'availability' => 'required',
            'brand' => 'required',
            'is_sale' => 'required',
            'sale_percent' => 'nullable',
            'old_price' => 'nullable',
            'status' => 'required',
            'short_descr' => 'required',
            'long_descr' => 'required',
            'info' => 'required',
            'review' => 'required',
        ];

        return $this->validate($product, $rules);
    }

    public function create(Product $product)
    {
        return $this->repository->create($product);        
    }

    public function update($id, Product $product)
    {
        return $this->repository->update($id, $product);        
    }

    public static function getAvailabilityText($availability)
    {
        switch ($availability) {
            case '1':
                return 'In Stock';
                break;
            case '0':
                return 'On Order';
                break;
        }
    }

    public static function getImage($id)
    {
        $noImage = 'no-image.jpg';

        $path = '/upload/img/products/';

        $pathToProductImage = $path . $id . '.jpg';

        if (file_exists($_SERVER['DOCUMENT_ROOT'] . $pathToProductImage)) {
            return $pathToProductImage;
        }

        return $path . $noImage;
    }
}