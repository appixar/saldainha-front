<?php
class Database extends Xplend {
    public static function getAllFields()
    {
        $databasePaths = Xplend::findPathsByType("database");
        $fields = [];
        foreach ($databasePaths as $path) {
            if (file_exists($path) and is_dir($path)) {
                $table_files = scandir($path);
                foreach ($table_files as $fn) {
                    $fp = "$path/$fn";
                    if (is_file($fp)) {
                        // new fields
                        $data = @yaml_parse(file_get_contents($fp));
                        // MULTIPLE TABLES ON SINGLE FILE?
                        if (!is_array($data)) continue;
                        foreach ($data as $table_name => $table_cols) {
                            foreach ($table_cols as $table_name => $table_param) {
                                $fields[$table_name] = $table_param;
                            }
                        }
                    }
                }
            }
        }
        return $fields;
    }
}