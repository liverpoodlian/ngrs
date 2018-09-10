<?php
function e($txt)
{
    echo $txt . PHP_EOL;
}

function d(...$txts)
{
    foreach ($txts as $txt) {
        echo $txt . PHP_EOL;
    }
    die();
}

function c()
{
    $handle = fopen("php://stdin", "r");
    $line = fgets($handle);
    $response = trim($line);
    fclose($handle);
    return $response;
}

e('pro100 bitrix git installer');
e('');
e('bitrix core path[../../bitrix]:');
$bitrix = c() ?: realpath('../../bitrix');


if (!is_file($bitrix . '/coupon_activation.php')) {
    d('bitrix core path not found');
}

e('creating symlinks');

$list = glob($bitrix . '/*');
foreach ($list as $item) {
    $target = basename($item);

    IF (file_exists($target)) {
        e($target . ' >> exists');
        continue;
    }
    if (!symlink($item, $target)) {
        e($target . ' >> error');
    }
}

e('configure mysql');
e('host[127.0.0.1]:');
$host = c() ?: '127.0.0.1';

e('database[bitrix]:');
$database = c() ?: 'bitrix';

e('user[bitrix]:');
$user = c() ?: 'bitrix';

e('password[password]');
$password = c() ?: 'password';

$link = mysqli_connect($host, $user, $password, $database);

if (!$link) {
    e("Ошибка: Невозможно установить соединение с MySQL.");
    e("Код ошибки errno: " . mysqli_connect_errno());
    e("Текст ошибки error: " . mysqli_connect_error());
    exit;
} else {
    e('connection success');
}

e('executing sql');
$query = file_get_contents("pro100/bitrix.sql");
/* execute multi query */
if (mysqli_multi_query($link, $query)) {
    e('mysql restore success');

} else {
    e('mysql failed restore');
}

e('writing config files');
$files['.settings.php'] = file_get_contents('pro100/.settings.txt');
$files['dbconn.php'] = file_get_contents('pro100/dbconn.txt');

foreach ($files as $wfile => $content) {
    $temp = str_replace([
        '{host}',
        '{user}',
        '{password}',
        '{database}',
    ], [
        $host,
        $user,
        $password,
        $database
    ], $content);
    file_put_contents($wfile, $temp);
}
e('install done');