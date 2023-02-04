<?php
$theme_path = $this->config->item('theme_locations') . $this->config->item('active_template');
//$data['company_details'] = $this->admin_model->get_company_details();
?>
<!--<table width="100%">
    <tr>
        <td aligen="left" width="10%">
            <img src="<?= $theme_path; ?>/images/logo.png" style="margin-top:5px;" />
        </td>
        <td width="90%" align="right">
            <font size="15px"><b><?php echo $company_details[0]['firm_name']; ?></b></font><br />
            <font size="10px">
<?= $company_details[0]['address'] ?>,
            Pin Code : <?= $company_details[0]['pincode'] ?><
            </font>
        </td>
    </tr>
</table>-->


<div class="print_header">
    <table width="100%">
        <tr>
            <td width="15%" style="vertical-align:middle;">
                <img src="<?php echo $theme_path; ?>/images/logo-login2.png" />
            </td>
            <td width="85%" align="right">
                <!--<div class="print_header_tit" >-->
                <h4> THE TOTAL</h4>
                <font size="10px"> 50 C,D, VANNAKUDI KADAI STREET, </font>
                <font size="10px"> MAIN ROAD,KAYALPATNAM, </font>
                <font size="10px">Pin Code : 628204</font>

                <!--</div>-->
            </td>
        </tr>
    </table>
</div>