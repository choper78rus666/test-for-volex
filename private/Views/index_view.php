<!-- Основной контент -->
<div>
    <form action="/add" method="post">
        <? for($i = 0; $i < count($stats); $i++):
            if(isset($stats[$i]) && $stats[$i]['questions_id'] !== $last_id): ?>
                <br>
                <strong><legend><? $last_id = $stats[$i]['questions_id']; echo $stats[$i]['quest']; ?></legend></strong>
            <? endif;?>
            <? if($stats[$i]['type'] === 'text'): ?>
                <label><? echo $stats[$i]['answer']; ?></label>
                <? if(!isset($stats[$i+1]) || $stats[$i+1]['questions_id'] !== $last_id): ?>
                    <br>
                    <input name="<? echo $stats[$i]['questions_id'];?>" type="text">
                <? endif; ?>
            <? else: ?>
                <label><input name="<? echo $stats[$i]['questions_id'];?>" type="<? echo $stats[$i]['type']; ?>" value="<? echo $stats[$i]['answer_id']; ?>"> <? echo $stats[$i]['answer']; ?></label>
            <? endif; ?>
                <br>
        <? endfor; ?>
        <br>
        <input type="submit" name="submit" value="Завершить тест">
    </form>
</div>