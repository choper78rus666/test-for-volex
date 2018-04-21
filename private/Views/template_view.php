<!DOCTYPE>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <title>Test_for_volex - <? echo $title; ?></title>
        <link rel="stylesheet" href="/static/css/style.css">
        <meta name="viewport"
              content="width=device-width,
                       initial-scale=1.0
                       maximum-initial=2,
                       minimum-initial=1">
    </head>
    <body>
        <div>
            <? include 'header.php'; ?>
    <!-- Основной контент -->
            
            <? require_once $view; ?>
            
            <br><br>
            <br><br>
    <!-- Футер -->
            <? include 'footer.php'; ?>
        </div>
    </body>
</html>