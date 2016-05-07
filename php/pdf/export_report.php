<?php
/**
 * Created by PhpStorm.
 * User: s3359025
 * Date: 4/11/2016
 * Time: 11:43 AM
 */

include('../../lib/mpdf/mpdf.php');

$mpdf=new mPDF('win-1252','Letter','','',15,10,16,10,10,10);//A4 page in portrait for landscape add -L.
$mpdf->showImageErrors = true;
$mpdf->SetHeader('|<span style="padding-left:200px">VIET PHAT JOINT STOCK COMPANY<br></span>');// PDF Header
$mpdf->setFooter('{PAGENO}');// Giving page number to your footer.
$mpdf->useOnlyCoreFonts = true;    // false is default
$mpdf->SetDisplayMode('fullpage');
// Buffer the following html with PHP so we can store it to a variable later
ob_start();
?>
<?php include "./load_template_quotation.php";
 //This is your php page ?>
<?php
$html = ob_get_contents();
ob_end_clean();
// send the captured HTML from the output buffer to the mPDF class for processing
$mpdf->WriteHTML($html);
$mpdf->debug = true;
//$mpdf->SetProtection(array(), 'user', 'password'); uncomment to protect your pdf page with password.
$mpdf->Output($name_of_pdf,'D');
exit;

?>