import 'package:flutter/material.dart';
import 'package:getx_shop_card/core/os_padding.dart';

import '../../home/model/product_model.dart';

class SliderImage extends StatelessWidget {
  final ProductModel product;

  const SliderImage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Center(
        child: Image.asset(
          product.productImage,
          width: osWidthContext(context),
          fit: BoxFit.cover,
      color: product.productImageColor,  ),
      ),
    );
  }
}
