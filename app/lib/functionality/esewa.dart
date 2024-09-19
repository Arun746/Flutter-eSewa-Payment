// ignore_for_file: prefer_const_constructors

import 'package:app/constants/esewaid.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';

class Esewa {
  final Function(String) showSnackbar;

  Esewa({required this.showSnackbar});

  pay() {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kEsewaClientId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "1000",
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult result) {
          debugPrint('SUCCESS');
          showSnackbar('Payment successful!');
          verify(result);
        },
        onPaymentFailure: () {
          debugPrint('FAILURE');
          showSnackbar('Payment failed!');
        },
        onPaymentCancellation: () {
          debugPrint('CANCEL');
          showSnackbar('Payment cancelled!');
        },
      );
    } catch (e) {
      debugPrint('EXCEPTION');
      showSnackbar('An error occurred during payment processing.');
    }
  }

  void verify(EsewaPaymentSuccessResult result) async {}
}
