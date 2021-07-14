
// Objet Payment pour gérer les données du paiement
class Payment {

  int ebAmount;
  String ebShortDescription;
  String ebReference;
  String ebEmail;
  String ebPhone;
  String ebCallback;
  String ebName;

  static String urlServer;
  static String urlPost;

  Payment (
      this.ebAmount,
      this.ebShortDescription,
      this.ebReference,
      this.ebEmail,
      this.ebPhone,
      this.ebCallback,
      this.ebName);


}
