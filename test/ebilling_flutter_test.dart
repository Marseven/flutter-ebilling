import 'package:flutter_test/flutter_test.dart';
import 'package:ebilling_flutter/ebilling_flutter.dart';

void main() {
  test('adds one to input values', () async{
    final ebillingPaymentService = EbPaymentService(sharedKey: '', userName: '', env: EbPaymentService.LAB);

    var payment = new Payment(500, 'Test',  'a345789os12', 'kankoe@gmail.com', '+24162649525', '', 'Kankoe');

    var ebp = await ebillingPaymentService.initPay('airtel', payment);

    /*ebillingPaymentService.initPay('airtel', payment).then((ebResponse){
      print('${ebResponse.billingId}');
    }).catchError((onError){
      print('Error ${onError}');
    });*/

  });
}
