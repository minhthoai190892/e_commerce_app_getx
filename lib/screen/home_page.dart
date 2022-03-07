import 'package:ecommerce_getx/screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My eCommerce"),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() =>  ProductScreen());
                },
                child: const Card(
                  child: Center(child: Text("Go to Products")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
