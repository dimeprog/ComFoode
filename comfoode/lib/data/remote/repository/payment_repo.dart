import 'dart:convert';

import 'package:comfoode/data/local/shared_pref.dart';
import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_paystack_payment/flutter_paystack_payment.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

class PaymentRepository extends GetxController {
  final depositController = TextEditingController();
  Sharepref? pref;
  RxInt _wallet = 0.obs;
  int get wallet => _wallet.value;
  // paystack
  final plugin = PaystackPayment();

  @override
  void onInit() async {
    super.onInit();
    pref = Sharepref();
    await pref!.init();
    plugin.initialize(publicKey: AppConstantFile.PAYSTACK_PUBLIC_KEY);
    await fundWallet(0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    depositController.clear();
    depositController.dispose();
  }

  Future init() async {
    await plugin.initialize(publicKey: AppConstantFile.PAYSTACK_PUBLIC_KEY);
  }

// card ui
  PaymentCard _getCardUi() {
    return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
  }

  // Fund account Api
  // using paystack
// Charge charge= Charge()..amount= int.parse( depositController.text.trim())..
  Charge charge() {
    return Charge()
      ..amount = int.parse(depositController.text.trim()) * 100
      ..reference = DateTime.now().microsecondsSinceEpoch.toString()
      ..email = pref!.getEmail()
      ..card = _getCardUi();
  }

  Future<CheckoutResponse> checkout(BuildContext context) async {
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge(),
      fullscreen: false,
      logo: FlutterLogo(
        size: 24,
      ),
    );

    if (response.status == true) {
      await fundWallet(int.parse(depositController.text.trim()));
      Get.snackbar('Transaction',
          'Transaction of ${depositController.text} was success');
    } else {
      Get.snackbar('Transaction',
          'Transaction of ${depositController.text}  failed, try again');
    }
    return response;
  }

  // using api to fund account
  Future fundWallet(int amount) async {
    // final String userId = '62b8c3a6c4129240dad01555';
    final token = pref!.read();
    try {
      final url = Uri.parse(
          AppLinks.BaseUrl + '/user/wallet/62f5a02c9e3395c632a8ab75/recharge');
      final response = await http.put(
        url,
        body: jsonEncode(
          {'amount': amount},
        ),
        headers: {"Authorization": token, "Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        _wallet.value = json['user']['data']['wallet'];
        print(json['user']['data']['wallet']);
        Get.snackbar('Status', 'Sucessfully added deposited to your wallet');
      } else {
        print(response.statusCode);
        final json = jsonDecode(response.body);
        print(json);
        Get.snackbar('Status', 'Failed to updated wallet');
      }
    } catch (err) {
      print(err.toString());
      Get.snackbar('Status', '${err}');
    }
    update();
  }
}
