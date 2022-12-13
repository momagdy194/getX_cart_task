import 'dart:math';

import 'package:flutter/material.dart';

class CartModel {
  late final int? id;
  int quantity;
  final String? productName, productUnit,productImage;
  final double  productPrice, remainingQuantity;
  final String? image;
  Color? productImageColor=Color((Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
  CartModel(
      {required this.id,
      required this.productName,
      required this.productPrice,
      required this.productUnit,
      required this.remainingQuantity,
      required this.quantity,
      required this.productImageColor,
      required this.productImage,
      required this.image});

  CartModel.fromJson(Map<dynamic, dynamic> data)
      : id = data['id'],
        productName = data['productName'],
        productImageColor = data['productImageColor'],
        productImage = data['productImage'],
        productPrice = data['productPrice'],
        productUnit = data['productUnit'],
        remainingQuantity = data['remainingQuantity'],
        quantity = data['quantity'] ?? 1,
        image = data['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'productPrice': productPrice,
      'productImageColor': productImageColor,
      'productImage': productImage,
      'productUnit': productUnit,
      'remainingQuantity': remainingQuantity,
      'quantity': quantity,
      'image': image,
    };
  }
}
