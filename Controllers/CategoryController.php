<?php

class CategoryController extends AdminBase
{
    private $categoryService;

    public function __construct()
    {
        $this->categoryService = new CategoryService(new CategoryRepository);
    }

    public function actionCategory()
    {
        $categories = CategoryRepository::getCatList(true);

        require_once(ROOT . '/view/admin_category/index.php');
        return true;
    }

    public function actionCreateCat()
    {
        if (isset($_POST['submit'])) {
            $category = Category::request($_POST);
            $errors = $this->categoryService->validateCategory($category);
            $categoryId = !$errors ? $this->categoryService->createCat($category) : false;

            if ($categoryId) {
                if (is_uploaded_file($_FILES["image"]["tmp_name"])) {
                    move_uploaded_file($_FILES["image"]["tmp_name"], $_SERVER['DOCUMENT_ROOT'] . "/upload/img/categories/{$categoryId}.jpg");
                }
                header("Location: /admin/categories");
            };
        }

        require_once(ROOT . '/view/admin_category/create.php');
        return true;
    }

    public function actionUpdateCat($id)
    {
        $category = CategoryRepository::getCategoryById($id);

        if (isset($_POST['submit'])) {
            $category = Category::request($_POST);
            $errors = $this->categoryService->validateCategory($category);
            $categoryId = !$errors ? $this->categoryService->updateCat($id, $category) : false;

            if ($categoryId) {
                if (is_uploaded_file($_FILES["image"]["tmp_name"])) {
                    move_uploaded_file($_FILES["image"]["tmp_name"], $_SERVER['DOCUMENT_ROOT'] . "/upload/img/categories/{$categoryId}.jpg");
                }
                header("Location: /admin/categories");
            };
        }

        require_once(ROOT . '/view/admin_category/update.php');
        return true;
    }

    public function actionDeleteCat($id)
    {
        CategoryRepository::deleteCat($id);

        header("Location: /admin/categories");

        return true;
    }

    public function actionDepartment()
    {
        $departments = CategoryRepository::getDeptList(true);

        require_once(ROOT . '/view/admin_department/index.php');
        return true;
    }

    public function actionCreateDept()
    {
        $categories = CategoryRepository::getCatList(true);

        if (isset($_POST['submit'])) {
            $department = Department::request($_POST);
            $errors = $this->categoryService->validateDepartment($department);
            $departmentId = !$errors ? $this->categoryService->createDept($department) : false;

            if ($departmentId) {
                header("Location: /admin/department");
            };
        }

        require_once(ROOT . '/view/admin_department/create.php');
        return true;
    }

    public function actionUpdateDept($id)
    {
        $categories = CategoryRepository::getCatList(true);
        $department = CategoryRepository::getDepartmentById($id);

        if (isset($_POST['submit'])) {
            $department = Department::request($_POST);
            $errors = $this->categoryService->validateDepartment($department);
            $departmentId = !$errors ? $this->categoryService->updateDept($id, $department) : false;

            if ($departmentId) {
                header("Location: /admin/department");
            };
        }

        require_once(ROOT . '/view/admin_department/update.php');
        return true;
    }

    public function actionDeleteDept($id)
    {
        CategoryRepository::deleteDept($id);

        header("Location: /admin/department");

        return true;
    }
}
