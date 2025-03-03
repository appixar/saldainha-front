<?php
function csrfGenerate()
{
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    echo "<input type='hidden' name='csrf_token' value='{$_SESSION['csrf_token']}'>";
}
function csrfCheck()
{
    $sessionToken = $_SESSION['csrf_token'];
    unset($_SESSION['csrf_token']);
    if (@$_POST['csrf_token'] !== $sessionToken) {
        $_SESSION['cb'][] = [
            'type' => 'danger',
            'text' => 'CSRF token mismatch'
        ];
        back();
    }
}
//--------------------------------------------------
// call back alerts (need bootstrap)
//--------------------------------------------------
// format:
// [cb]
//     [type]   = success, warning, info, danger
//     [ico]    = (font awesome)
//     [text]   = text
//     [target] = cb page position (target id)
//--------------------------------------------------
function cb($target = '')
{
    global $_SESSION;
    // pending cb?
    if (!@$_SESSION['cb'][0]) {
        unset($_SESSION['cb']);
        return;
    }
    // loop cbs
    $cb = (object) $_SESSION['cb'];
    foreach ($cb as $k => $data) {
        // wrong target?
        if ($target and @$data['target'] and ($target !== @$data['target'])) goto jump;
        // default
        $type = @$data['type'];
        if (!$type) $type = "success";
        // icons
        $ico = @$data['ico'];
        if (!$ico) {
            if ($type == "success") $ico = "check";
            if ($type == "warning") $ico = "alert-circle";
            if ($type == "info") $ico = "info";
            if ($type == "danger") $ico = "alert-triangle";
        }
        // text
        $text = $data['text'];
        // print
        echo "<div class='alert alert-$type'><i class='fe fe-$ico'></i> $text</div>";
        // remove current cb
        unset($_SESSION['cb'][$k]);
        jump:
    }
}
