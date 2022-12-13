import 'dart:math';

import 'package:flutter/material.dart';

class ProductModel {
  String productName, productUnit, productImage, shortDescription;
  bool isFavorite;
  double oldPrice, productPrice, remainingQuantity, time;
  int id;
  Color? productImageColor =
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  ProductModel(
      {required this.productName,
      required this.productImage,
      this.productImageColor,
      required this.productUnit,
      required this.shortDescription,
      required this.time,
      required this.remainingQuantity,
      required this.oldPrice,
      required this.productPrice,
      required this.id,
      this.isFavorite = false});

  ProductModel.fromJson(Map<dynamic, dynamic> data)
      : id = data['id'],
        productName = data['productName'],
        productImageColor = data['productImageColor'],
        productImage = data['productImage'],
        productPrice = data['productPrice'],
        productUnit = data['productUnit'],
        shortDescription = data['shortDescription'],
        time = data['time'],
        remainingQuantity = data['remainingQuantity'],
        oldPrice = data['oldPrice'],
        isFavorite = false;

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productImage': productImage,
      'productImageColor': productImageColor,
      'shortDescription': shortDescription,
      'time': time,
      'remainingQuantity': remainingQuantity,
      'productUnit': productUnit,
      'oldPrice': oldPrice,
      'productPrice': productPrice,
      'id': id,
      'isFavorite': isFavorite,
    };
  }
}
