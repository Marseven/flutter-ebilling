import 'dart:convert';
import 'dart:io';
import 'package:ebilling_flutter/src/ebilling_response.dart';
import 'package:ebilling_flutter/src/payment.dart';
import 'package:ebilling_flutter/src/utils.dart';


class EbPaymentService {

  String userName;
  String sharedKey;
  String env;

  static const urlLabServer = "https://lab.billing-easy.net/api/v1/merchant/e_bills";
  static const urlLabPost = "https://labpayment.billing-easy.net";

  static const urlProdServer = "https://www.billing-easy.com/api/v1/merchant/e_bills";
  static const urlProdPost = "https://simu.billing-easy.net";

  static const PROD = "PROD";
  static const LAB = "LAB";

  EbPaymentService({
    this.userName,
    this.sharedKey,
    this.env
  });

   Future<EbResponse> initPay(String operator, Payment payment){
      // Envoie les éléments à E-Billing et reçoi le numero facture

     HttpClient client = new HttpClient();
     var postData = {
       'email' : false.toString(),
       'sms' : false.toString(),
       'payer_email' :payment.ebEmail.toString(),
       'payer_msisdn' :payment.ebPhone.toString(),
       'amount' : payment.ebAmount.toString(),
       'short_description' : payment.ebShortDescription.toString(),
       'external_reference' : payment.ebReference.toString(),
       'payer_name' : payment.ebName.toString(),
       'expiry_period' : 60.toString()
     };

     return client.postUrl(Uri.parse(this._getServerUrl()+'?'+mapToQuery(postData))).then((HttpClientRequest request) {

       request.headers.add('Content-type', 'application/json');
       request.headers.add('Authorization', 'Basic ${base64.encode(utf8.encode('${this.userName}:${this.sharedKey}'))}');

       print('${base64.encode(utf8.encode('${this.userName}:${this.sharedKey}'))}');

       return request.close();
     }).then((HttpClientResponse response) {
       //Faudra gerer toutes les exeptions  possibles
       print('${response.reasonPhrase}');
       print('${response.statusCode}');

       if(response.statusCode!=200 && response.statusCode!=200) {
         //throw ArgumentError("Erreur specifique");
       }else{
         if(response.reasonPhrase!=null){
           var data = jsonDecode(response.reasonPhrase);
           return EbResponse(billingId: data['e_bill']['e_bill']);
         }
         //throw ArgumentError("Erreur spe")

       }
     }).catchError((error){
       print('$error');
       //throw ArgumentError("$error")
     });

  }

  void pay(){
      // redirigige sur la plateforme E-Billing pour le paiement avec WebView
  }

  void checkPayment(){
      // permet de vérifier le statut du paiement dans la base de données
  }

  void paymentResult(){
      // Affiche la page de résultat de paiement sur l'application
  }



  String _getServerUrl(){
    return this.env==PROD? urlProdServer : urlLabServer;
  }



}
