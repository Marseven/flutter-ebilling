
class EbPaymentService {

  String _userName;
  String _sharedKey;

  int ebAmount;
  String ebShortDescription;
  String ebReference;
  String ebEmail;
  String ebPhone;
  String ebCallback;
  String ebName;

  static String urlServer;
  static String urlPost;

  EbPaymentService(
      this._userName,
      this._sharedKey,
      this.ebAmount,
      this.ebShortDescription,
      this.ebReference,
      this.ebEmail,
      this.ebPhone,
      this.ebCallback,
      this.ebName);

  void initPay(String operator, double amount){
      // Reupere le numero facture
  }

  void pay(){

  }

  void checkPayment(){

  }

  void paymentResult(){

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
