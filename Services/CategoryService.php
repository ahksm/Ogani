<?php

class CategoryService
{
    private $repository;

    public function __construct(CategoryRepository $repository)
    {
        $this->repository = $repository;
    }

    public function validate($object, $rules)
    {
        $errors = [];

        foreach ($rules as $field => $rule) {
            $value = $object->{$field};
            $result = Validator::validate($field, $value, $rule);
            if (!$result['valid']) {
                $errors[$field] = $result['message'];
            }
        }

        return $errors ?: null;
    }

    public function validateCategory(Category $category)
    {
        $rules = [
            'name' => 'required|min:2',
            'sort_order' => 'required|numeric',
            'status' => 'required',
        ];

        return $this->validate($category, $rules);
    }

    public function validateDepartment(Department $department)
    {
        $rules = [
            'name' => 'required|min:2',
            'category_id' => 'required|numeric',
            'sort_order' => 'required|numeric',
            'status' => 'required',
        ];

        return $this->validate($department, $rules);
    }

    public function createCat(Category $category)
    {
        return $this->repository->createCat($category);        
    }

    public function updateCat($id, Category $category)
    {
        return $this->repository->updateCat($id, $category);        
    }

    public function createDept(Department $department)
    {
        return $this->repository->createDept($department);        
    }

    public function updateDept($id, Department $department)
    {
        return $this->repository->updateDept($id, $department);        
    }

    public static function getImage($id)
    {
        $noImage = 'no-image.jpg';

        $path = '/upload/img/categories/';

        $pathToCategoryImage = $path . 'cat-' . $id . '.jpg';

        if (file_exists($_SERVER['DOCUMENT_ROOT'] . $pathToCategoryImage)) {
            return $pathToCategoryImage;
        }

        return $path . $noImage;
    }
}
