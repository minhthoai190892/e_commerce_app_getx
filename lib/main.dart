import 'package:ecommerce_getx/screen/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  //khởi tạo và kết nối
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //khởi tạo và kết nối

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My ecommerce Backend",
      theme: ThemeData(primaryColor: Colors.green[300]),
      home: const HomePage(),
      getPages: [
        GetPage(
          name: '/products',
          page: () => ProductScreen(),
        ),
        GetPage(
          name: '/products/new',
          page: () => NewProductScreen(),
        ),
      ],
    );
  }
}
