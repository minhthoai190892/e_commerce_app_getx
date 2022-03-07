import 'package:ecommerce_getx/controllers/product_controller.dart';
import 'package:ecommerce_getx/models/product_model.dart';
import 'package:ecommerce_getx/screen/products_screen.dart';
import 'package:ecommerce_getx/services/database_service.dart';
import 'package:ecommerce_getx/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.find();
  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a Product"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.black,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            ImagePicker _picker = ImagePicker();
                            final XFile? _image = await _picker.pickImage(
                                source: ImageSource
                                    .gallery); //lay hinh anh tu gallery
                            if (_image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("No Image selected")));
                            }
                            if (_image != null) {
                              await storage.uploadImage(_image);
                              var imageUrl =
                                  await storage.getDownloadUrl(_image.name);
                              productController.newProduct.update(
                                  'imageUrl', (_) => imageUrl,
                                  ifAbsent: () => imageUrl);
                              // print(productController.newProduct['imageUrl']);
                            }
                          },
                          icon: const Icon(Icons.add_circle),
                          color: Colors.white,
                        ),
                        const Text(
                          "Add an Image",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Product Information",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _buildTextFormField("Product Id", 'id', productController),
                _buildTextFormField("Product Name", 'name', productController),
                _buildTextFormField(
                    "Description", 'description', productController),
                _buildTextFormField("Category", 'category', productController),
                const SizedBox(
                  height: 20,
                ),
                _buildSliderPrice("Price", "price", productController,
                    productController.price),
                _buildSliderQuantity("Quantity", "quantity", productController,
                    productController.quantity),
                const SizedBox(
                  height: 20,
                ),
                _buildCheckBox("Recommended", "isRecommended",
                    productController, productController.isRecommended),
                _buildCheckBox("Popular", "isPopular", productController,
                    productController.isPopular),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // // ignore: avoid_print
                      // print(productController.newProduct);
                      database.addProduct(
                        Product(
                          id: int.parse(productController.newProduct['id']),
                          name: productController.newProduct['name'],
                          category: productController.newProduct['category'],
                          description:
                              productController.newProduct['description'],
                          isRecommended:
                              productController.newProduct['isRecommended'],
                          isPopular: productController.newProduct['isPopular'],
                          price: productController.newProduct['price'],
                          quantity:
                              productController.newProduct['quantity'].toInt(),
                          imageUrl: productController.newProduct['imageUrl'],
                        ),
                      );
                      Get.to(() => ProductScreen());
                    },
                    child: const Text("Save"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Row _buildCheckBox(
    String title,
    String name, //cua productcontrller.price/quantity
    ProductController productController,
    bool? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Checkbox(
            value: (controllerValue == null) ? false : controllerValue,
            checkColor: Colors.black,
            activeColor: Colors.black12,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            }),
      ],
    );
  }

  Row _buildSliderPrice(
    String title,
    String name, //cua productcontrller.price/quantity
    ProductController productController,
    double? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Slider(
              value: (controllerValue == null) ? 0 : controllerValue,
              min: 0,
              max: 25,
              divisions: 10,
              activeColor: Colors.black,
              inactiveColor: Colors.black12,
              onChanged: (value) {
                productController.newProduct.update(
                  name,
                  (_) => value,
                  ifAbsent: () => value,
                );
              }),
        ),
        Text(
          "\$${productController.price}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row _buildSliderQuantity(
    String title,
    String name, //cua productcontrller.price/quantity
    ProductController productController,
    double? controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Slider(
              value: (controllerValue == null) ? 0 : controllerValue,
              min: 0,
              max: 25,
              divisions: 10,
              activeColor: Colors.black,
              inactiveColor: Colors.black12,
              onChanged: (value) {
                productController.newProduct.update(
                  name,
                  (_) => value,
                  ifAbsent: () => value,
                );
              }),
        ),
        Text(
          "${productController.quantity}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String hintText,
    String name,
    ProductController productController,
  ) =>
      TextFormField(
        decoration: InputDecoration(hintText: hintText),
        onChanged: (value) {
          productController.newProduct.update(
            name,
            (_) => value,
            ifAbsent: () => value,
          );
        },
      );
}
