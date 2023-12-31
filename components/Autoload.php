<?php

/**
 * Automatically connects classes
 */

function myAutoload($class_name)
{
    $array_paths = array(
        '/models/',
        '/components/',
        '/controllers/',
        '/services/',
        '/repositories/',
    );

    foreach ($array_paths as $path) {

        $path = ROOT . $path . $class_name . '.php';

        if (is_file($path)) {
            include_once $path;
        }
    }
}

spl_autoload_register('myAutoload');