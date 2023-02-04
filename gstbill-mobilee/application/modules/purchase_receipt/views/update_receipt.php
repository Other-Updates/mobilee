<?php $theme_path = $this->config->item('theme_locations') . $this->config->item('active_template'); ?>
<script src="<?php echo $theme_path; ?>/js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="<?php echo $theme_path; ?>/js/jquery-ui-my-1.10.3.min.js"></script>
<style>
    .ui-datepicker td.ui-datepicker-today a {
        background:#999999;
    }
</style>
<?php
// echo '<pre>';
//print_r($receipt_details);
?>
<div class="mainpanel">
    <div class="media">
        <h4>Update Payment Receipt</h4>
    </div>

    <?php
    // echo "<pre>";
    //print_r($receipt_details);exit;
    ?>
    <div class="contentpanel panel-body mb-50">
        <table class="table table-striped table-bordered responsive dataTable no-footer dtr-inline">
            <thead>
            <th colspan="9">Payment History</th>

            </thead>
            <thead>
            <th width="1%">S&nbsp;No</th>
            <th>Receipt&nbsp;NO</th>
            <th>Created Date</th>
            <th width="5%">Payment&nbsp;Terms</th>
            <th width="5%">Bank&nbsp;Details</th>
            <th>Received&nbsp;Amount</th>
            <th>Discount&nbsp;(&nbsp;%&nbsp;)</th>
            <th>Remarks</th>
            <th class="hide_class">Action</th>
            </thead>
            <tbody id='receipt_info'>
                <?php
                //if (isset($receipt_details[0]['receipt_history']) && !empty($receipt_details[0]['receipt_history'])) {
                if (isset($receipt_details[0]['receipt_history'])) {
                    $net_amt = $receipt_details[0]['net_total'];
                    $discount = $receipt_details[0]['discount'];
                    $this->load->model('purchase_receipt/receipt_model');
                    $i = 1;
                    $dis = 0;
                    $paid = 0;
                    $over_all_net_total = 0;
                    $get_pr_details = $this->receipt_model->getpr_details_based_on_pr($receipt_details[0]['po_id']);
                    $over_all_net_total = 0;
                    foreach ($get_pr_details as $value) {

                        $deliver_qty = $value['delivery_qty'];
                        $per_cost = $value['per_cost'];
                        $gst = $value['tax'];
                        $cgst = $value['gst'];
                        $net_total = $deliver_qty * $per_cost + (($deliver_qty * $per_cost) * $gst / 100) + (($deliver_qty * $per_cost) * $cgst / 100) - $value['discount'] + $value['transport'];

                        $over_all_net_total += $net_total;
                    }

                    foreach ($receipt_details[0]['receipt_history'] as $val) {
                        $paid = $paid + $val['bill_amount'];
                        $dis = $dis + $val['discount'];
                        ?>
                        <tr>

                            <td><?= $i ?></td>
                            <th><?= $val['receipt_no'] ?></th>
                            <td><?= date('d-M-Y', strtotime($val['created_date'])) ?></td>
                            <td>
                                <?php
                                if ($val['terms'] == 1)
                                    echo "CASH";
                                elseif ($val['terms'] == 2)
                                    echo "DD";
                                elseif ($val['terms'] == 3)
                                    echo "CHEQUE";
                                elseif ($val['terms'] == 4)
                                    echo "NEFT";
                                elseif ($val['terms'] == 5)
                                    echo "RTGS";
                                ?>
                            </td>
                            <td>
                                <?php
                                if ($val['terms'] != 1 && $val['terms'] != 4 && $val['terms'] != 5) {
                                    echo "<b>A/C&nbsp;NO</b>    :<br>" . $val['ac_no'] . '<br>';
                                    echo "<b>Bank</b>    :<br>" . $val['branch'] . '<br>';
                                    echo "<b>DD&nbsp;/&nbsp;Cheque&nbsp;NO</b>:<br>" . $val['dd_no'] . '<br>';
                                } else
                                    echo "-";
                                ?>
                            </td>

                            <td class="text_right"><?= number_format($val['bill_amount'], 2, '.', ',') ?></td>
                            <td class="text_right"><?= number_format($val['discount'], 2, '.', ',') ?> ( <?= $val['discount_per'] ?> %)</td>

                            <td> <?= $val['remarks'] ?></td>
                            <th class="hide_class">
                                <button type="button" rec_id ="<?php echo $val['id'] ?>" class="btn btn-primary download"><span class="glyphicon glyphicon-download"></span></button>
                                <button type="button" rec_id ="<?php echo $val['id'] ?>"class="btn btn-defaultprint6 print"><span class="glyphicon glyphicon-print"></span></button>
                            </th>
                        </tr>
                        <?php
                        $i++;
                    }
                    ?>
                <tfoot>
                <td></td><td></td>
                <td></td>
                <td></td>
                <td></td>
                <td class="text_right"><?= number_format($paid, 2, '.', ',') ?></td>
                <td class="text_right"><?= number_format($dis, 2, '.', ',') ?></td>
                <td></td>
                </tfoot>
                <?php
            } else
                echo "<tr>
                        <td colspan='7'>No Data Found</td>
                    </tr>";
            ?>
            </tbody>
        </table>


        <form method="post">
            <input type="hidden" name="receipt_bill[receipt_id]" value="<?= $receipt_details[0]['id'] ?>">
            <input type="hidden" name="credit_days" value="<?= $receipt_details[0]['credit_days'] ?>">
            <input type="hidden" name="created_date" value="<?= $receipt_details[0]['created_date'] ?>">
            <table class="table table-striped table-bordered responsive dataTable no-footer dtr-inline">
                <thead>
                <th colspan="4">Invoice Details</th>
                </thead>
                <thead>
                <th>S No</th>
                <th>Invoice NO</th>
                <th>Invoice Date</th>
                <th>Amount</th>
                </thead>
                <tbody id='receipt_info'>
                    <tr>

                        <td>1</td>
                        <td><?= $receipt_details[0]['inv_id'] ?></td>
                        <td><?= date('d-M-Y', strtotime($receipt_details[0]['created_date'])) ?></td>
                        <td><?= $over_all_net_total ?></td>
                    </tr>
                <input type="hidden" value="<?= ($over_all_net_total - $dis) - $paid ?>" id="inv_amount" />

                <tr><td colspan="3" style="text-align:right;">Invoice Amount</td><td><?= $over_all_net_total ?></td></tr>
                <tr><td colspan="3" style="text-align:right;">Total Discount</td><td><?= number_format($dis, 2, '.', ',') ?></td></tr>
                <tr><td colspan="3" style="text-align:right;">Total Received Amount</td><td><?= number_format($paid, 2, '.', ',') ?></td></tr>
                <tr>
                    <td colspan="3" style="text-align:right;">Receipt NO</td><td><input name="receipt_bill[receipt_no]" type="text" tabindex="1" id="recp_no"></td>
                </tr>
                <tr style="display: none;">
                    <td colspan="3" style="text-align:right;">Amount Receiver</td>
                    <td>
                        <input type="radio" class="receiver" value="company" checked name="receipt_bill[recevier]">Company
                        <input type="radio" class="receiver" value="agent" name="receipt_bill[recevier]">Field Agent
                        <select class="select_agent" style="display: none;" name="receipt_bill[recevier_id]">
                            <option value="">Select Agent</option>
                            <?php
                            if (isset($all_agent) && !empty($all_agent)) {
                                foreach ($all_agent as $agent) {
                                    ?>
                                    <option value="<?php echo $agent['id'] ?>"><?php echo $agent['name'] ?></option>
                                    <?php
                                }
                            }
                            ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan='3' style='text-align: right;'>Payment Terms</td><td  style='align: right;'>
                        <select class='form-control' id='terms' style="width:170px;" name='receipt_bill[terms]' tabindex="1">
                            <option value='1'>CASH</option>
                            <option value='2'>DD</option>
                            <option value='3'>CHEQUE</option>
                            <option value='4'>NEFT</option>
                            <option value='5'>RTGS</option>
                        </select>
                    </td>
                </tr>

                <tr class='show_tr' style='display:none'>
                    <td colspan='3' style='text-align: right;'>A / C NO</td>
                    <td  style='align: right;'>
                        <input id='ac_no'  class='form-control'  style=' width:100px ;float:left;' type='text'  name='receipt_bill[ac_no]' tabindex="1" />
                        <span id="receiptuperror" style="color:#F00;" ></span>
                    </td>
                </tr>
                <tr class='show_tr' style='display:none'>
                    <td colspan='3' style='text-align: right;'>Bank</td>
                    <td  style='align: right;'>
                        <input id='branch'  class='form-control'  style=' width:100px ;float:left;' type='text'  name='receipt_bill[branch]' tabindex="1" />
                        <span id="receiptuperror1" style="color:#F00;" ></span>
                    </td>
                </tr>
                <tr  class='show_tr' style='display:none'>
                    <td colspan='3' style='text-align: right;'>DD / Cheque NO</td>
                    <td  style='align: right;'>
                        <input id='dd_no'  class='form-control dduplication' style=' width:170px ;float:left;' type='text'  name='receipt_bill[dd_no]' tabindex="1" /><br /><br />
                        <p id="receiptuperror2" style="color:#F00;" ></p><p id="dupperror" style="color:#F00;" ></p></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right;"><span style='  position: relative; top: 10px;'>Discount &nbsp; </span>
                        <input id='discount_per' autocomplete='off'  class='form-control' style=' width:170px;float:right;' type='text'  name='receipt_bill[discount_per]' tabindex="1" />
                    </td>
                    <td>
                        <input id='discount'  class='form-control dot_val' style=' width:170px ;float:left;' type='text'  name='receipt_bill[discount]' tabindex="1"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right;">Paid Amount</td>
                    <td>
                        <input id='paid'  class='form-control dot_val' type='text'  style=' width:170px ;float:left;'  name='receipt_bill[bill_amount]'  tabindex="1"/>
                        <div class="clearfix"></div>
                        <span id="receiptuperror3" style="color:#F00;" ></span> </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right;">Balance</td>
                    <td>
                        <input id='balance'  class='form-control' type='text'  style=' width:170px ;float:left;'  name='balance'   value='<?php echo ($over_all_net_total - $dis) - $paid; ?>'  readonly='readonly' tabindex="1"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right;">Due Date</td>
                    <td>
                        <input type='text'  style=' width:170px ;float:left;'  class="datepicker" name='receipt_bill[due_date]'  tabindex="1"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right;">Created Date</td>
                    <td>
                        <input type='text' id='c_date' style=' width:170px ;float:left;'  class="datepicker" name='receipt_bill[created_date]'  tabindex="1"/>
                        <div class="clearfix"></div>
                        <span id="date_err" style="color:#F00;" ></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right;">Remarks</td>
                    <td>
                        <input type='text'  style=' width:170px ;float:left;'  class="form-control" name='receipt_bill[remarks]'  tabindex="1"/>
                    </td>
                </tr>

                <tr><td class="action-btn-align"  colspan="4"> <input  type="submit" class="btn btn-success" value="Pay" id="pay" tabindex="1"/> </td></tr>

                </tbody>
            </table>
        </form>
    </div><!-- contentpanel -->
</div><!-- mainpanel -->
<script type="text/javascript">

    $('.print').click(function () {
        r_id = '<?php echo $receipt_details[0]['id'] ?>';
        var link = document.createElement('a');
        $rec_id = $(this).attr('rec_id');
        link.href = '<?php echo base_url(); ?>purchase_receipt/print_receipt/' + r_id + '/' + $rec_id;
        link.target = '_blank';
        link.click();
    });

    $('.download').click(function () {
        r_id = '<?php echo $receipt_details[0]['id'] ?>';
        var link = document.createElement('a');
        $rec_id = $(this).attr('rec_id');
        //link.download = file_name;
        link.href = '<?php echo base_url(); ?>purchase_receipt/download_receipt/' + r_id + '/' + $rec_id;
        link.click();
    });

    $(document).ready(function () {
        $('#recp_no').focus();
        jQuery('.datepicker').datepicker();
    });
    $('#terms').live('change', function () {
        if ($(this).val() == 2 || $(this).val() == 3)
            $('.show_tr').show();
        else
            $('.show_tr').hide();
    });
    $('.receiver').live('click', function () {
        if ($(this).val() == 'agent')
            $('.select_agent').css('display', 'block');
        else
            $('.select_agent').css('display', 'none');
    });
    // Date Picker
    $('#add_package').live('click', function () {
        $('.sty_class').each(function () {

            var s_html = $(this).closest('tr').find('.size_val');
            var size_name = $(this).closest('tr').find('.size_name');
            var cort_class = $(this).closest('tr').find('.cort_class').val();
            var sty_class = $(this).closest('tr').find('.sty_class').val();
            var col_class = $(this).closest('tr').find('.col_class').val();

            $(s_html).each(function () {
                $(this).attr('name', 'size[' + sty_class + col_class + cort_class + '][]');
            });
            $(size_name).each(function () {
                $(this).attr('name', 'size_name[' + sty_class + col_class + cort_class + '][]');
            });
        });
    });

    $(document).ready(function () {

        jQuery('#from_date1').datepicker();
    });
    $('#cor_no').live('keyup', function () {
        var select_op = '';
        if (Number($(this).val()))
        {
            select_op = select_op + '<select class="cort_class"  name="corton[]"><option>Select</option>';
            for (i = 1; i <= Number($(this).val()); i++)
            {
                select_op = select_op + '<option value=' + i + '>' + i + '</option>';
            }
            select_op = select_op + '</select>';
            $('.cor_class').html(select_op);
        }
    });
    $('#customer').live('change', function () {
        for_loading();
        $.ajax({
            url: BASE_URL + "sales_receipt/get_all_pending_invoice",
            type: 'GET',
            data: {
                c_id: $(this).val()
            },
            success: function (result) {
                $('#s_div').html(result);
            }
        });
        $.ajax({
            url: BASE_URL + "sales_receipt/get_invoice_view",
            type: 'GET',
            data: {
                c_id: $(this).val()
            },
            success: function (result) {
                for_response();
                $('#receipt_info').html(result);
            }
        });

    });
    $('.so_id').live('click', function () {
        var s_arr = [];
        var i = 0;
        $('.so_id').each(function () {
            if ($(this).attr('checked') == 'checked')
            {
                s_arr[i] = $(this).val();
                i++;
            }
        });
        for_loading();
        $.ajax({
            url: BASE_URL + "sales_receipt/get_inv",
            type: 'GET',
            data: {
                inv_id: s_arr,
                c_id: $('#customer').val()
            },
            success: function (result) {
                for_response();
                $('#receipt_info').html(result);
            }
        });
    });
    $('#discount').live('keyup', function () {
        total = 0;
        total = (Number($('#inv_amount').val()) - Number($(this).val())) - Number($('#paid').val());
        $('#balance').val(total.toFixed(2));

        var tt = ($(this).val() / $('#inv_amount').val()) * 100;
        $('#discount_per').val(tt.toFixed(2));
    });
    $('#paid').live('keyup', function () {
        total = 0;
        total = (Number($('#inv_amount').val()) - Number($('#discount').val())) - Number($(this).val());
        $('#balance').val(total.toFixed(2));
    });
    $('#discount_per').live('keyup', function () {
        var tt = $('#inv_amount').val() * ($(this).val() / 100);
        $('#discount').val(tt.toFixed(2));

        total = 0;
        total = (Number($('#inv_amount').val()) - Number($('#discount').val())) - Number($('#paid').val());
        $('#balance').val(total.toFixed(2));
    });
</script>
<script type="text/javascript">


    $("#paid").live('blur', function ()
    {
        var paid = $('#paid').val();
        var bal = $('#balance').val();
        if (paid == "")
        {
            $("#receiptuperror3").html("Required Field");

        } else if (bal < 0)
        {
            $("#receiptuperror3").html("This Field Less then the Balance Amount");
        } else
        {
            $("#receiptuperror3").html("");
        }
    });
    $("#ac_no").live('blur', function ()
    {
        var ac_no = $("#ac_no").val();
        if (ac_no == "" || ac_no == null || ac_no.trim().length == 0)
        {
            $("#receiptuperror").html("Required Field");
        } else
        {
            $("#receiptuperror").html("");
        }
    });
    $("#branch").live('blur', function ()
    {
        var branch = $("#branch").val();
        if (branch == "" || branch == null || branch.trim().length == 0)
        {
            $("#receiptuperror1").html("Required Field");
        } else
        {
            $("#receiptuperror1").html("");
        }
    });
    $("#dd_no").live('blur', function ()
    {
        var dd_no = $("#dd_no").val();
        if (dd_no == "" || dd_no == null || dd_no.trim().length == 0)
        {
            $("#receiptuperror2").html("Required Field");
        } else
        {
            $("#receiptuperror2").html("");
        }
    });
    $('#pay').live('click', function ()
    {
        i = 0;
        var paid = $('#paid').val();
        var bal = $('#balance').val();
        var date = $('#c_date').val();
        if (date == "")
        {
            $("#date_err").html("Required Field");
            i = 1;

        } else
        {
            $("#date_err").html("");
        }
        if (paid == "")
        {
            $("#receiptuperror3").html("Required Field");
            i = 1;

        } else if (bal < 0)
        {
            $("#receiptuperror3").html("This Field Less then the Balance Amount");
            i = 1;
        } else
        {
            $("#receiptuperror3").html("");
        }
        var terms = $("#terms").val();
        if (terms == 1 || terms == 4 || terms == 5)
        {
        } else
        {
            var ac_no = $("#ac_no").val();
            if (ac_no == "" || ac_no == null || ac_no.trim().length == 0)
            {
                $("#receiptuperror").html("Required Field");
                i = 1;
            } else
            {
                $("#receiptuperror").html("");
            }
            var branch = $("#branch").val();
            if (branch == "" || branch == null || branch.trim().length == 0)
            {
                $("#receiptuperror1").html("Required Field");
                i = 1;
            } else
            {
                $("#receiptuperror1").html("");
            }
            var dd_no = $("#dd_no").val();
            if (dd_no == "" || dd_no == null || dd_no.trim().length == 0)
            {
                $("#receiptuperror2").html("Required Field");
                i = 1;
            } else
            {
                $("#receiptuperror2").html("");
            }
            var m = $('#dupperror').html();
            if ((m.trim()).length > 0)
            {
                i = 1;
            }
        }
        if (i == 1)
        {
            return false;
        } else
        {
            return true;
        }
    });
</script>