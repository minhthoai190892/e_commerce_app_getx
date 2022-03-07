import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;
  // //genarate data class
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
     this.price=0,
     this.quantity=0,
  });

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap['id']?.toInt() ?? 0,
      name: snap['name'] ?? '',
      category: snap['category'] ?? '',
      description: snap['description'] ?? '',
      imageUrl: snap['imageUrl'] ?? '',
      isRecommended: snap['isRecommended'] ?? false,
      isPopular: snap['isPopular'] ?? false,
      price: snap['price']?.toDouble() ?? 0.0,
      quantity: snap['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());
  @override
  String toString() {
    return 'Product(id: $id, name: $name, category: $category, description: $description, imageUrl: $imageUrl, isRecommended: $isRecommended, isPopular: $isPopular, price: $price, quantity: $quantity)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  @override
  // ignore: todo
  // TODO: implement stringify
  bool get stringify => true;
  static List<Product> products = [
    Product(
      id: 1,
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      description: ' lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.',
      imageUrl:
          'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZHJpbmt8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      isRecommended: true,
      isPopular: true,
      price: 4.99,
      quantity: 10,
    ),
    Product(
      id: 2,
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      description: ' lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.',
      imageUrl:
          'https://images.unsplash.com/photo-1437418747212-8d9709afab22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZHJpbmt8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      isRecommended: false,
      isPopular: false,
      price: 3.99,
      quantity: 5,
    ),
    
    Product(
      id: 3,
      name: 'Smoothie #1',
      category: 'Smoothies',
      description: ' lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.',
      imageUrl:
          'https://images.unsplash.com/photo-1632423671350-3ed8e6e60d0d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c21vb3RoaWVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      isRecommended: true,
      isPopular: true,
      price: 3.99,
      quantity: 5,
    ),
    Product(
      id: 4,
      name: 'Smoothie #2',
      category: 'Smoothies',
      description: ' lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.',
      imageUrl:
          'https://images.unsplash.com/photo-1494315153767-9c231f2dfe79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c21vb3RoaWVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      isRecommended: true,
      isPopular: true,
      price: 4.99,
      quantity: 20,
    ),
    
    Product(
      id: 5,
      name: 'Water #1',
      category: 'Waters',
      description: ' lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.',
      imageUrl:
          'https://media.istockphoto.com/photos/healthy-rainbow-colored-fruits-and-vegetables-smoothies-isolated-on-picture-id1304936721?b=1&k=20&m=1304936721&s=170667a&w=0&h=DiGoVD2R75gCK-jJayc89NFxd3HHiKLba46Bmr5Ud_Y=',
      isRecommended: true,
      isPopular: true,
      price: 2.99,
      quantity: 20,
    ),
    Product(
      id: 6,
      name: 'Water #2',
      category: 'Waters',
      description:' lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.',
      imageUrl:
          'https://media.istockphoto.com/photos/fruit-juice-picture-id155376375?b=1&k=20&m=155376375&s=170667a&w=0&h=KL3cT2jGl9IR6pe9ONF2jgp4ra1E02U3avVm8NIpNm4=',
      isRecommended: true,
      isPopular: true,
      price: 2.99,
      quantity: 20,
    ),
    
  ];
}
