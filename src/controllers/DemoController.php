<?php

class DemoController extends Controllers
{
    public $pg;
    public function __construct()
    {
        $this->pg = new PgService();
    }
    public function create($data)
    {
        // CREATE ORGANIZATION
        $ins = [
            'org_name' => $data['org_name'],
            'org_email' => $data['org_email'],
            'prov_name' => 'voluti',
            'prov_user' => $data['prov_user'],
            'prov_pass' => $data['prov_pass'],
            'org_status' => 'enabled',
            'org_balance' => 0
        ];
        $org_id = $this->pg->insert('bot_org', $ins);
        $org_uuid = $this->pg->lastInsert['org_uuid'];

        // CREATE USER
        $pass = randomString(16);
        $passHash = password_hash($pass, PASSWORD_DEFAULT);
        $ins = [
            'user_name' => $data['user_name'],
            'user_email' => $data['user_email'],
            'user_pass' => $passHash,
            'user_pass_temp' => 1,
            'user_status' => 'enabled'
        ];
        $user_id = $this->pg->insert('bot_user', $ins);

        // ORG -> USER
        $ins = [
            'org_id' => $org_id,
            'user_id' => $user_id
        ];
        $ou_id = $this->pg->insert('bot_org_user', $ins);

        // RETURN
        $this->res = ['org' => $org_uuid, 'email' => $data['user_email'], 'pass' => $pass];
        return $this->res;
    }
    public function login($email = '', $pass = '')
    {
        if (!$email or !$pass) return ['error' => 'Missing data'];
        $res = @$this->pg->query("SELECT * FROM bot_user WHERE user_email = :email", ['email' => $email])[0];
        if (!$res) return ['error' => 'Invalid email'];
        if ($res['user_status'] !== 'enabled') return ['error' => 'Disabled user'];
        $user = $res;
        if (!password_verify($pass, $user['user_pass'])) return ['error' => 'Invalid password'];
        return $user;
    }
}
