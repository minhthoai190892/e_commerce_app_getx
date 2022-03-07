import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Order extends Equatable {
  final int id;
  final int customer;
  final List<int> productIds;
  final double deliveryFree;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final DateTime createAt;
  const Order({
    required this.id,
    required this.customer,
    required this.productIds,
    required this.deliveryFree,
    required this.subtotal,
    required this.total,
    required this.isAccepted,
    required this.isDelivered,
    required this.createAt,
  });

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props {
    return [
      id,
      customer,
      productIds,
      deliveryFree,
      subtotal,
      total,
      isAccepted,
      isDelivered,
      createAt,
    ];
  }

  Order copyWith({
    int? id,
    int? customer,
    List<int>? productIds,
    double? deliveryFree,
    double? subtotal,
    double? total,
    bool? isAccepted,
    bool? isDelivered,
    DateTime? createAt,
  }) {
    return Order(
      id: id ?? this.id,
      customer: customer ?? this.customer,
      productIds: productIds ?? this.productIds,
      deliveryFree: deliveryFree ?? this.deliveryFree,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      isAccepted: isAccepted ?? this.isAccepted,
      isDelivered: isDelivered ?? this.isDelivered,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customer': customer,
      'productIds': productIds,
      'deliveryFree': deliveryFree,
      'subtotal': subtotal,
      'total': total,
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'createAt': createAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
      id: snap['id']?.toInt() ?? 0,
      customer: snap['customer']?.toInt() ?? 0,
      productIds: List<int>.from(snap['productIds']),
      deliveryFree: snap['deliveryFree']?.toDouble() ?? 0.0,
      subtotal: snap['subtotal']?.toDouble() ?? 0.0,
      total: snap['total']?.toDouble() ?? 0.0,
      isAccepted: snap['isAccepted'] ?? false,
      isDelivered: snap['isDelivered'] ?? false,
      createAt: DateTime.fromMillisecondsSinceEpoch(snap['createAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromSnapshot(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, customer: $customer, productIds: $productIds, deliveryFree: $deliveryFree, subtotal: $subtotal, total: $total, isAccepted: $isAccepted, isDelivered: $isDelivered, createAt: $createAt)';
  }
  @override
  bool get stringify => true;
  //danh sach tinh
 static List<Order> orders = [
    Order(
      id: 1,
      customer: 235,
      productIds: const [1],
      deliveryFree: 10,
      subtotal: 20,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      createAt: DateTime.now(),
    ),Order(
      id: 2,
      customer: 235,
      productIds: const [1,2,3,4],
      deliveryFree: 20,
      subtotal: 20,
      total: 40,
      isAccepted: false,
      isDelivered: false,
      createAt: DateTime.now(),
    )
  ];
}
