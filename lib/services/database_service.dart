import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_getx/models/product_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getProduct() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Future<void> addProduct(Product product) {
    return _firebaseFirestore.collection('products').add(product.toMap());
  }
  Future<void> updateField(Product product,String field, dynamic newValue){
    return _firebaseFirestore.collection('products').where('id',isEqualTo: product.id).get().then((querySnapshot) => {
      querySnapshot.docs.first.reference.update({field:newValue})
    });
  }
  
}
