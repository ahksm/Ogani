<?php

class FilterController extends BaseController
{

    public function actionProductsFilter($page = 1)
    {
        $db = Db::getConnection();

        isset($_POST['filters']) ? $filters = json_decode($_POST['filters'], true) : $filters = false;

        isset($_POST['price_min']) ? $price_min = $_POST['price_min'] : $price_min = false;
        isset($_POST['price_max']) ? $price_max = $_POST['price_max'] : $price_max = false;
        isset($_POST['order_by']) ? $order_by = $_POST['order_by'] : $order_by = false;
        isset($_POST['category']) ? $category = $_POST['category'] : $category = false;
        isset($_POST['department']) ? $department = $_POST['department'] : $department = false;
        if ($order_by == "0") {
            $order_by = "TRIM(name)";
        } else if ($order_by == "1") {
            $order_by = "price";
        }

        $sql1 = "SELECT * FROM products WHERE price BETWEEN {$price_min} AND {$price_max}";

        if ($filters) {
            foreach ($filters as $filter) {
                if (is_array($filter)) $sql1 .= " AND {$filter['filter']} = '{$filter['value']}'";
            }
        }

        if ($department) {
            $sql1 .= " AND department_id = {$department}";
        } else if ($category) {
            $sql1 .= " AND category_id = {$category}";
        }

        $sql1 .= ' ORDER BY ' . $order_by;

        $stmt1 = $db->prepare($sql1);
        $stmt1->execute();
        $results1 = $stmt1->fetchAll(PDO::FETCH_ASSOC);

        $sql2 = $sql1 . ' LIMIT ' . Product::SHOW_BY_DEFAULT . ' OFFSET ' . ($page - 1) * Product::SHOW_BY_DEFAULT;
        $stmt2 = $db->prepare($sql2);
        $stmt2->execute();
        $results2 = $stmt2->fetchAll(PDO::FETCH_ASSOC);

        $pagination = new Pagination(count($results1), $page, Product::SHOW_BY_DEFAULT, 'page-');
        ob_start();
        require_once(ROOT . '/view/layouts/filtered.php');
        $filtered_html = ob_get_clean();

        $data = [
            'results_length' => count($results1),
            'filtered_html' => $filtered_html,
        ];

        sleep(3);

        echo json_encode($data);
        return true;
    }
}
