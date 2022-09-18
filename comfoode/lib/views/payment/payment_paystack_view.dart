import 'package:comfoode/data/remote/repository/payment_repo.dart';
import 'package:comfoode/utils/resources/dimension_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPayStack extends StatelessWidget {
  PaymentPayStack({super.key});
  final PaymentRepository _paymentRepository = Get.put(PaymentRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Payment',
          style: TextStyle(
              color: Color(0xffbb342f),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(15), vertical: getHeight(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Text(
                'Deposit',
                style: TextStyle(
                  fontFamily: 'concertOne',
                  fontSize: 60,
                ),
              ),
            ),
            SizedBox(
              width: getWidth(340),
              child: Card(
                shape: StadiumBorder(),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _paymentRepository.depositController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 0.1),
                    ),
                    fillColor: Colors.white,
                    hintText: 'Amount',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getHeight(120),
            ),
            SizedBox(
              width: double.infinity,
              child: Center(
                  child: ElevatedButton(
                onPressed: () async {
                  print('payment tap');
                  await _paymentRepository.checkout(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    maximumSize: Size.infinite),
                child: Text(
                  'Fund',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getHeight(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
