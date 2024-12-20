<?php
session_start(); // Ensure session is started

require_once ("../db_connect/index.php");
include ("../send.php");

use PHPMailer\PHPMailer\PHPMailer;

$email = '';
$code = '';
$_SESSION['code_verified'] = false;
$errors = [];
$page_title = "Forget Password";
$template = "forgetpass";

if (isset($_POST['send'])) {
    $email = $_POST['email'];
    if (empty($email)) {
        $errors['email'] = 'Email required';
    } else {
        $test = $pdo->prepare("select * from users where email=:email");
        $test->execute([
            "email" => $email
        ]);
        $stmt = $test->fetch();
        if ($stmt) {
            if($stmt['verified']){

                $token = mt_rand(1000, 9999);
                $res = $pdo->prepare("UPDATE `users` SET `code_password` = :token WHERE `email` = :email");
                $res->execute([
                    "token" => $token,
                    "email" => $email
                ]);
                sendmail("LibraryTeam", $email, "CODE DE VERIFICATION", "Voici votre code de vérification '$token'");
                $_SESSION['reset_email'] = $email;
                $page_title = "Reset Password";
                $template = "resetpass";
            }else{
                $errors['email']='Email Not verified';
            }
        } else {
            $errors['email'] = 'User Does Not Exist';
        }
    }
}

if (isset($_POST['verify'])) {
    $email = $_SESSION['reset_email'] ?? '';
    $code = $_POST['code'];
    $newPassword = $_POST['new_password'];
    $confirmPassword = $_POST['confirm_password'];
    $_SESSION['code_verified'] = false;
    if (empty($email)) {
        $errors['email'] = 'Email required';
    }

    if (empty($code)) {
        $errors['code'] = 'Code required';
    }
    if(strlen($code)!=4){
        $errors['code']='Should Be 4 Numbers';
    }
    if (empty($errors)) {
        $stmt = $pdo->prepare("SELECT code_password FROM users WHERE email = :email");
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch();

        if ($user && $user['code_password'] == $code) {
            $_SESSION['code_verified'] = true;
            if (!empty($newPassword) && !empty($confirmPassword)) {
                if ($newPassword == $confirmPassword) {
                    $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
                    $stmt = $pdo->prepare("UPDATE users SET password = :password WHERE email = :email");
                    $stmt->execute(['password' => $hashedPassword, 'email' => $email]);


                    header("Location: ../index.php");
                    exit;

                } else {
                    $errors['password'] = 'Passwords do not match';
                }
            } else {
                $errors['password'] = 'Both password fields are required';
            }
        } else {
            $errors['code'] = 'Invalid verification code';
        }
    }
    $page_title = "Reset Password";
    $template = "resetpass";
}
if (isset($_POST['resend'])) {
    $page_title = "Forget Password";
    $template = "forgetpass";
}

include "../layout.phtml";

