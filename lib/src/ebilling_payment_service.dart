
import 'package:ebilling_flutter/src/payment.dart';

class EbPaymentService {

  String _userName;
  String _sharedKey;

  static String urlServer;
  static String urlPost;

  EbPaymentService(
      this._userName,
      this._sharedKey,
      );

  void initPay(String operator, Payment payment){
      // Envoie les éléments à E-Billing et reçoi le numero facture
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

  String get sharedKey => _sharedKey;

  String get userName => _userName;

  set sharedKey(String value) {
    _sharedKey = value;
  }

  set userName(String value) {
    _userName = value;
  }



}
