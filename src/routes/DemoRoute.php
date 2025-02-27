<?php
class DemoRoute extends Routes
{
    public function get()
    {
        $this->required("ticker");
        $lastDate = @$this->body['last_date'];

        // SERVICE
        $pg = new PgService();

        // GET RECENT TREND 
        if (!$lastDate) {
            $date = new DateTime();
            $date->modify('-30 minutes');
            $lastDate = $date->format('Y-m-d H:i:s');
        }
        $res = @$pg->query("SELECT * FROM bot_trend WHERE ticker = :ticker AND trend_date_update > '$lastDate'", $this->body)[0];
        if (!$res) return $this->res([]);
        $return = [];
        $json = @$res['trend_json'];
        if ($json) {
            $trends = json_decode($json, true);
            foreach ($trends as $k => $v) {
                $return[$k] = $v['trend'];
            }
            $return['trend_date_update'] = $res['trend_date_update'];
            unset($res['trend_json']);
            unset($res['trend_id']);
        }
        return $this->res($return);
    }
}