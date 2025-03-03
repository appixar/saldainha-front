<?php
class ZapiService extends Services
{
    public $token;
    public $instance;
    public $link;

    public function __construct()
    {
        $this->instance = "3C11E38274CB2013135D5E1F1E10E177";
        $this->token = "4A3BF36259168C0629E8B236";
        $this->link = "https://api.z-api.io/instances/{$this->instance}/token/{$this->token}";
    }
    public function test()
    {
        echo "{$this->link}/aaa";
        exit;
    }
    public function curl($endpoint, $method, $array_data = [])
    {
        $curl = curl_init("{$this->link}/$endpoint");
        curl_setopt_array($curl, array(
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => $method,
            CURLOPT_POSTFIELDS => @json_encode($array_data),
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
                // inclua outros headers necessários aqui
            ),
        ));

        // Check the answer and if there was an error
        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        // Report if there was an error or processes data obtained
        if ($err) return "cURL Error #:" . $err;
        else return json_decode($response, true);
    }

    public function send($phone, $message)
    {
        return $this->curl('send-text', 'POST', ['phone' => $phone, 'message' => $message]);
    }
    public function chats()
    {
        return $this->curl('chats', 'GET');
    }
    public function messages($phone)
    {
        return $this->curl("chat-messages/$phone", 'GET');
    }
}
