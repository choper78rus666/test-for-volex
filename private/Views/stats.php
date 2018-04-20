<div>
    <? for($i = 0; $i < count($stats); $i++):
        if(isset($stats[$i]) && $stats[$i]['questions_id'] !== $last_id): ?>
            <br>
            <strong>Вопрос: </strong>
            <? $last_id = $stats[$i]['questions_id']; echo $stats[$i]['quest']; ?>
            <br>
        <? endif;?>
            <? echo $stats[$i]['answer']; echo $stats[$i]['correct'] === 'true' ? " + ":" - "; echo "Выбран: ".$stats[$i]['history']." раз.";?>
            <br>
    <? endfor; ?>
</div>