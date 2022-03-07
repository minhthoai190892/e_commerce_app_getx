import 'package:ecommerce_getx/models/product_model.dart';
import 'package:ecommerce_getx/services/database_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final DatabaseService database = DatabaseService();
  var products = <Product>[].obs;
  @override
  void onInit() {
    products.bindStream(database.getProduct());

    super.onInit();
  }

  // List<Product> products = Product.products.obs;
  void updateProductPrice(int index, Product product, double value) {
    product.price = value;
    products[index] = product;
  }

  void saveNewProductPrice(Product product, String field, double value) {
    database.updateField(product, field, value);
  }

  void updateProductQuantity(int index, Product product, int value) {
    product.quantity = value;
    products[index] = product;
  }
  void saveNewProductQuantity(Product product, String field, int value) {
    database.updateField(product, field, value);
  }
  //new product

  var newProduct = {}.obs;
  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  //checkbox
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];
}
