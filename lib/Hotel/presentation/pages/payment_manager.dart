import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:mylasttravelapp/core/const/stripe_keys.dart';

abstract class PaymentManager {
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);

      await _initializePaymentSheet(clientSecret);
      var afterpay = await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Basel",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secertkey}',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'amount': amount,
        'currency': currency,
      },
    );

    var data = jsonDecode(response.body);

    return data['client_secret'].toString();
  }
}
