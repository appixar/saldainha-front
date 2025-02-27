<div id="dep-page">
    <h5 class="gray"><i class="fa-solid fa-layer-group"></i> server dependencies</h5>
    <table id="vm" style="width:100%">
        <thead>
            <tr class="gray">
                <td style="width:20%">resource</td>
                <td style="width:10%">status</td>
                <td style="width:10%">priority</td>
                <td style="width:20%">notes</td>
                <td style="width:40%">ubuntu command</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>php 8+</td>
                <td><?= (PHP_VERSION >= 8) ? "<span class='green'>enabled</span>" : "<span class='red'>disabled</span>" ?></td>
                <td><span class=''>high</span></td>
                <td>current: <?= PHP_VERSION ?></td>
                <td>-</td>
            </tr>
            <?php
            foreach ($dependencies as $key => $data) {
                $priority = "<span class='gray'>low</span>";
                if ($data['priority'] == 1) $priority = "<span class='gray'>medium</span>";
                if ($data['priority'] == 2) $priority = "<span class=''>high</span>";
            ?>
                <tr>
                    <td><?= $key ?></td>
                    <td><?= ($data['status']) ? "<span class='green'>enabled</span>" : "<span class='red'>disabled</span>" ?></td>
                    <td><?= $priority ?></td>
                    <td><?= @$data['notes'] ?></td>
                    <td><input readonly type='text' class="gray" value='<?= @$data['cmd'] ?>' style='width:100%' /></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</div>