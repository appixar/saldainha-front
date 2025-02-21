<?php

class DemoController extends Controllers
{
    public function create($body)
    {
        global $_AUTH;
        if (!$_AUTH) return false;
        $my = new my();
        $now = date("Y-m-d H:i:s");

        // DATA
        $data = [
            'msg_data' => json_encode($body),
            'msg_name' => @$body['senderName'],
            'msg_phone_to' => @$body['connectedPhone'],
            'msg_phone_from' => @$body['phone'],
            'msg_text' => @$body['text']['message'],
            'msg_status' => 1,
            'msg_date_insert' => $now
        ];
        $msg_id = $my->insert('bs_msg', $data);

        // RETURN
        $this->return = $msg_id;
        return $this->return;
    }
}
