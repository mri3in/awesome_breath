<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 4/12/2016
 * Time: 2:09 PM
 */

// the link to get XML of currency rate
$url = "http://www.vietcombank.com.vn/exchangerates/ExrateXML.aspx";

// link to view table
$view_url = "http://www.vietcombank.com.vn/exchangerates/default.aspx?lang=en";

// declare timezone and current date, time
date_default_timezone_set("Asia/Ho_Chi_Minh");
$creationDate = date("Y-m-d");

// if file not exists, save the xml file to server
if (!file_exists("../php/xml_reader/currency_exchange_$creationDate.xml")) {
    $save_xml_file = file_put_contents("../php/xml_reader/currency_exchange_$creationDate.xml", fopen($url, "r"));
}

// read the XML file
$read_xml = simplexml_load_file($url);

/*// display into tree format
echo "<pre>";

// dump the xml to view
var_dump($read_xml);

// loop to extract the currency rate
for ($i=0;$i<count($read_xml->Exrate,1);$i++) {

    echo $read_xml->Exrate[$i]['CurrencyCode']."<br>";
    echo $read_xml->Exrate[$i]['CurrencyName']."<br>";
    echo $read_xml->Exrate[$i]['Buy']."<br>";
    echo $read_xml->Exrate[$i]['Transfer']."<br>";
    echo $read_xml->Exrate[$i]['Sell']."<br>";

}*/
?>

<!DOCTYPE html>
<html>
    <body>
        <table id="dataTableCurrencyExchange" class="table">
            <tr>
                <th style="text-align: center; width: 20%;" >
                    <label>Currency Code</label>
                </th>
                <th style="text-align: center; width: 20%;">
                    <label>Currency Name</label>
                </th>
                <th style="text-align: center; width: 20%;">
                    <label>Buy</label>
                </th>
                <th style="text-align: center; width: 20%;">
                    <label>Transfer</label>
                </th>
                <th style="text-align: center; width: 20%;">
                    <label>Sell</label>
                </th>
            </tr>
            <?php
                // loop to extract the currency rate
                for ($i=0;$i<count($read_xml->Exrate,1);$i++) {
                    ?>
                    <tr>
                        <td style="text-align: center">
                            <?php echo $read_xml->Exrate[$i]['CurrencyCode']; ?>
                        </td>
                        <td style="text-align: center">
                            <?php echo $read_xml->Exrate[$i]['CurrencyName']; ?>
                        </td>
                        <td style="text-align: center">
                            <?php echo $read_xml->Exrate[$i]['Buy']; ?>
                        </td>
                        <td style="text-align: center">
                            <?php echo $read_xml->Exrate[$i]['Transfer']; ?>
                        </td>
                        <td style="text-align: center">
                            <?php echo $read_xml->Exrate[$i]['Sell']; ?>
                        </td>
                    </tr>
                    <?php
                }
            ?>
        </table>
        <?php
            // display the date + time of XML file
            echo "Rates updated at ".$read_xml->DateTime ." for reference only". "<br>";

            // display source
            echo "<b>Source: </b><a href=".$view_url.">".$read_xml->Source."</a>". "<br>". "<br>";
        ?>
    </body>
</html>
