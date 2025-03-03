<?php
//-------------------------------------
// GENERAL UI HELPERS
//-------------------------------------
// Form options
class FormOptions
{
    public $selectedValue;
    public function __construct($selectedValue)
    {
        $this->selectedValue = $selectedValue;
    }
    public function option($val, $name = false, $appendToTag = '')
    {
        if (!$name) $name = $val;
        $sel = ($val == $this->selectedValue) ? 'selected' : '';
        echo "<option $sel value='$val' $appendToTag>$name</option>";
    }
}

// Back to the last url
function back($modify_url = "")
{
    $url = $_SERVER['HTTP_REFERER'];
    $rule = $modify_url;
    if ($rule) {
        $firstChar = substr($rule, 0, 1);
        $removeFirst = substr($rule, 1);
        if ($rule === '-?') $url = explode("?", $url)[0];
        elseif ($firstChar === '-') $url = str_replace($removeFirst, '', $url);
        elseif ($firstChar === '+') $url .= $removeFirst;
    }
    header("Location: $url");
    exit;
}
// Make custom cb
function makeCb($res = 1, $customMessage = "")
{
    $now = date("Y-m-d H:i:s");
    if ($res === true or $res === 1 or @$res['success']) {
        $type = "success";
        if (!$customMessage) $customMessage = "Alterações efetuadas com sucesso.";
    } else {
        $type = "warning";
        if (!$customMessage) $customMessage = "Por favor, verifique os campos e tente novamente.";
    }
    $_SESSION['cb'][] = [
        "type" => $type,
        "text" => "$customMessage ($now)"
    ];
}
// Make cb from api response
function makeCbRes($res = [], $success_msg = "", $error_msg = "")
{
    $now = date("Y-m-d H:i:s");
    if (@$res['error'] or !$res) {
        $type = "warning";
        $msg = $error_msg;
        if (!$msg) {
            $msg = @$res['message'];
            if (!$msg) $msg = "Por favor, verifique os campos e tente novamente.";
        }
    } elseif (@$res['success']) {
        $type = "success";
        $msg = $success_msg;
        if (!$msg) $msg = "Alterações efetuadas com sucesso.";
    } else {
        $type = "danger";
        $msg = "Retorno desconhecido";
    }
    $_SESSION['cb'][] = [
        "type" => $type,
        "text" => "$msg ($now)"
    ];
}