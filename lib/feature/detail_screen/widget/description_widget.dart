import 'package:flutter/material.dart';
import 'package:getx_shop_card/core/os_padding.dart';
import 'package:getx_shop_card/feature/home/model/product_model.dart';

class DescriptionWidget extends StatelessWidget {
final  ProductModel product;

  const DescriptionWidget({required this.product,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: Text(
            "Description",
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
        ),
osAddDivider(),
    Padding(
    padding: const EdgeInsets.only(
    left: 12.0,
    ),
    child: Text(
    product.shortDescription,
    style: TextStyle(
    color: Colors.grey[600],
    ),
    ),
    )

      ],
    );
  }
}
