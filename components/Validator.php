<?php

class Validator
{
    public static function validate($field, $value, $rules)
    {
        $rules = explode('|', $rules);

        foreach ($rules as $rule) {
            $parts = explode(':', $rule);
            $ruleName = $parts[0];
            $ruleValue = isset($parts[1]) ? $parts[1] : null;

            switch ($ruleName) {
                case 'nullable':
                    break;
                case 'required':
                    if (!isset($value)) {
                        return [
                            'valid' => false,
                            'message' => ucfirst($field) . ' is required.'
                        ];
                    }
                    break;

                case 'min':
                    if (strlen($value) < $ruleValue) {
                        return [
                            'valid' => false,
                            'message' => ucfirst($field) . ' must be at least ' . $ruleValue . ' characters long.'
                        ];
                    }
                    break;

                case 'max':
                    if (strlen($value) > $ruleValue) {
                        return [
                            'valid' => false,
                            'message' => ucfirst($field) . ' must not exceed ' . $ruleValue . ' characters.'
                        ];
                    }
                    break;

                case 'email':
                    if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                        return [
                            'valid' => false,
                            'message' => 'Invalid email format for ' . ucfirst($field) . '.'
                        ];
                    }
                    break;

                case 'numeric':
                    if (!is_numeric($value)) {
                        return [
                            'valid' => false,
                            'message' => ucfirst($field) . ' must be numeric.'
                        ];
                    }
                    break;

                case 'unique':
                    $db = Db::getConnection();

                    $sql = 'SELECT COUNT(*) FROM users WHERE email = :email';

                    $result = $db->prepare($sql);
                    $result->bindParam(':email', $value, PDO::PARAM_STR);
                    $result->execute();

                    if ($result->fetchColumn()) {
                        return [
                            'valid' => false,
                            'message' => ucfirst($field) . ' is already in use.'
                        ];
                    }
                    break;

                case 'same':
                    $fieldToMatch = $ruleValue;
                    if ($value !== $_POST[$fieldToMatch]) {
                        return [
                            'valid' => false,
                            'message' => ucfirst($field) . ' does not match ' . ucfirst($fieldToMatch) . '.'
                        ];
                    }
                    break;

                case 'unique_email_password':
                    $email = $_POST['email'] ?? '';
                    $password = $_POST['password'] ?? '';

                    if (!empty($email) && !empty($password)) {
                        $db = Db::getConnection();

                        $sql = 'SELECT * FROM users WHERE email = :email';

                        $result = $db->prepare($sql);
                        $result->bindParam(':email', $email, PDO::PARAM_STR);
                        $result->execute();

                        $user = $result->fetch();

                        if ($user !== false && password_verify($password, $user['password'])) {
                            return [
                                'valid' => true,
                                'message' => ''
                            ];
                        } else {
                            return [
                                'valid' => false,
                                'message' => 'Invalid email or password.'
                            ];
                        }
                    } else {
                        return [
                            'valid' => false,
                            'message' => 'Both email and password are required.'
                        ];
                    }
                    break;

                default:
                    break;
            }
        }

        return [
            'valid' => true,
            'message' => ''
        ];
    }
}
