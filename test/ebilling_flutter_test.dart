import 'package:flutter_test/flutter_test.dart';
import 'package:ebilling_flutter/ebilling_flutter.dart';

void main() {
  test('adds one to input values', () async{
    final ebillingPaymentService = EbPaymentService(sharedKey: '0513f7b4-3d2f-4688-b52c-04cfb45ab373', userName: 'yoboresto', env: EbPaymentService.LAB);

    var payment = new Payment(500, 'Test',  'a345789os12', 'kankoe@gmail.com', '+24162649525', '', 'Kankoe');

    var ebp = await ebillingPaymentService.initPay('airtel', payment);

    /*ebillingPaymentService.initPay('airtel', payment).then((ebResponse){
      print('${ebResponse.billingId}');
    }).catchError((onError){
      print('Error ${onError}');
    });*/

  });
}
