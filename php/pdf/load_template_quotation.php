<!--/**
 * Created by PhpStorm.
 * User: s3359025
 * Date: 4/11/2016
 * Time: 11:42 AM
 */-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            table { border: none; border-collapse: collapse;border-top: 1px solid #000;border-bottom: 1px solid #000;}
            table td { border-left: 1px solid #000; border-right: 1px solid #000;}
            body {font-size: 10px;}
            h6 {font-size: 10px;}
            .table-bordered td,th {text-align: center}
            .table-bordered th {background:#FCF6D0 }
        </style>
        <title>Quotation</title>
    </head>
    <body>
        <?php
        //include the definition of database
        include('../../config.php');

        //get the quotation_id via GET method
//        $quotation_id_array = $_POST['quotation'];
        $quotation_id = 1;

        $stylesheet1 = file_get_contents('../../css/styles.css');
        $stylesheet2 = file_get_contents('../../css/bootstrap.min.css');

        $mpdf->WriteHTML($stylesheet1,1);
        $mpdf->WriteHTML($stylesheet2,1);

        $mpdf->SetHTMLHeader('');
        $mpdf->SetHTMLFooter(' <div style="text-align:center;border:none; font-size: 6pt; font-weight: bold;">WHERE YOU CAN HOLD BELIEF ON</div>');
        ?>
        <div style="width:100%;padding: -25px 0px">
            <p align="center">
            <img width="40%" src="<?php echo IMG_LOCATION;?>quote_header.png"/>
            </p>
        </div>
        <hr>
        <br>
        <h4 style="text-align: center;font-weight: bold"> Quotation List </h4>
        <table width="100%" style="font-weight: bold">
            <tr>
                <td width="50%" align="left">Dear client</td>
                <td width="50%" align="left">From: Viet Phat Joint Stock Company</td>
            </tr>
            <tr>
                <td width="50%" align="left">Address:</td>
                <td width="50%" align="left">Address: 488/4 Cong Hoa, Ward 13, Tan Binh District, HCM</td>
            </tr>
            <tr>
                <td width="50%" align="left">Contact Person:</td>
                <td width="50%" align="left">Sender: Kieu Tuan Anh</td>
            </tr>
            <tr>
                <td width="50%" align="left">Phone:</td>
                <td width="50%" align="left">Phone: 0903329199</td>
            </tr>
            <tr>
                <td width="50%" align="left">Email:</td>
                <td width="50%" align="left">Email: anhtuan@vietphatjsc.vn</td>
            </tr>
        </table>
        <br>
        <h6 style="font-weight: bold">Viet Phat Corporation - Industrial Washer Quotation :</h6>

        <?php
            //load all the quotation by default
            //run sql to select all the quotation
            $sql = "SELECT quotation.quotation_id, quotation.quotation_create_date, quotation.quotation_status, quotation.customer_id, customer.customer_name, quotation_line.quotation_line_id, quotation_line.quotation_line_item_id, item.item_name, quotation_line.quotation_line_item_quantity, quotation_line.quotation_line_estimate_net_price, item.item_manufacturer, item.item_unit_price, item.item_photo, item.item_description, quotation.quotation_net_total, quotation.quotation_tax, quotation.quotation_total FROM quotation
            JOIN customer
            ON quotation.customer_id =customer.customer_id
            JOIN quotation_line
            ON quotation.quotation_id = quotation_line.quotation_id
            JOIN item
            ON quotation_line.quotation_line_item_id = item.item_id
            WHERE quotation.quotation_id = '$quotation_id'";

            //connect to db via $db and execute the sql
            $result = mysqli_query($db, $sql);

            //if the number of results is greater than 0, generate a table and load the data to its rows
            if (mysqli_num_rows($result) > 0) {
        ?>        
        <!--generate a table-->
        <table class='table-bordered' width='100%'>
            <tr>
                <th rowspan='2' width='5%'>ID</th>
                <th rowspan='2' style='text-align:center'>Item Name</th>
                <th rowspan='2' style='text-align:center' width='10px'>Mfr.</th>
                <th width='10px' style='text-align:center' >Qty</th>
                <th width='10px' style='text-align:center' >Price</th>
                <th width='10px' style='text-align:center' >Total Price</th>
                <th rowspan='2' style='text-align:center' >Image</th>
            </tr>
            <tr>
            <!--import unit measurement and currency to these cells-->
                <th>pcs</th>
                <th>VND</th>
                <th>VND</th>
            </tr>

            <?php
                // output data of each row
                while($row = mysqli_fetch_assoc($result)) {
            ?>
            <tr>
                <td><?php echo $row["quotation_id"];?></td>
                <td style="text-align:left">
                    <?php echo $row["item_name"];?><br>
                    <?php echo $row["item_description"];?>
                </td>
                <td><?php echo $row["item_manufacturer"];?></td>
                <td><?php echo $row["quotation_line_item_quantity"];?></td>
                <td><?php echo $row["item_unit_price"];?></td>
                <td><?php echo $row["quotation_total"];?></td>
                <?php if (!empty($row["item_photo"]))
                {
                    $image_src = "src='".IMG_LOCATION . $row["item_photo"]."'";
                    $image_alt = $row["item_photo"];
                }
                else
                {
                    $image_src = "";
                    $image_alt = "N/A";
                }
                ?>
                <td><img style="height: auto; max-width: 132px;padding: 5px" <?php echo $image_src;?> alt="<?php echo $image_alt;?>"/></td>
            </tr>
            <?php 
                } 
                //set sql to load quotation details
                $sql_quotation = "SELECT * FROM quotation WHERE quotation_id = '$quotation_id'";
                //run the sql
                $result_quotation = mysqli_query($db,$sql_quotation);
                //fetch the result
                $row_quotation = mysqli_fetch_assoc($result_quotation);
            ?>
            <tr >
                <th colspan="3" style="color:red;font-size:12px">Net Total</th>
                <th></th>
                <th></th>
                <th style="color:red;"><?php echo $row_quotation["quotation_net_total"];?></th>                           
                <th></th>
            </tr>
            <tr>
                <th colspan="3" style="color:blue;font-size:12px">VAT</th>
                <th></th>
                <th></th>
                <th style="color:blue;"><?php echo $row_quotation["quotation_tax"];?></th>
                <th></th>
                </tr>
            <tr>
                <th colspan="3" style="color:blue;font-size:12px">Total</th>
                <th></th>
                <th></th>
                <th style="color:blue;"><?php echo $row_quotation["quotation_total"];?></th>
                <th></th>
                </tr>

        </table>
            
        <?php }
            else {
                echo "0 results";
            }

            mysqli_close($db); // Closing Connection

            //declare timezone and current date, time
            date_default_timezone_set("Asia/Ho_Chi_Minh");
            $creationDateTime = date("Y-m-d");
    
            //declare the name of the pdf
            $name_of_pdf = "quotation_".$creationDateTime.".pdf";
        ?>

        <h6 style="font-weight: bold; text-decoration: underline">NOTE:</h6>
        <h6>Price table includes 10% VAT and shipping cost</h6>
        <h6>Client should prepare facility, electricity and so on.</h6>
        <h6>Above Cost does not include installation cost.</h6>
        <h6 style="font-weight: bold">Duration of shipping and installation:<span style="font-weight: normal">30 days</span></h6>
        <h6 style="font-weight: bold">Warranty:<span style="font-weight: normal">12 months</span></h6>
        <h6 style="font-weight: bold">Payment</h6>
        <h6> - 50% after contact is signed</h6>
        <h6> - 50% within 15 days after the installation and sign off</h6>

    </body>
</html>
