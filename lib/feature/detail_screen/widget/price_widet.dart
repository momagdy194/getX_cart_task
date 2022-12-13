import 'package:flutter/material.dart';
import 'package:getx_shop_card/core/os_padding.dart';

import '../../../core/widget/os_text.dart';
import '../../home/model/product_model.dart';

class TitleAndPriceWidget extends StatelessWidget {
  final ProductModel product;

  const TitleAndPriceWidget({required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Center(
            child: OsText(
              //name,
              product.productName,
              fontSize: 16.0,
             ),
          ),
        ),
        osAddVerticalSpace(h: 10),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
             OsText(
                  "\$${product.productPrice}",
                  fontSize: 16.0,

                ),
                const SizedBox(
                  width: 8.0,
                ),
                OsText(
                  "\$${product.oldPrice}",
                  fontSize: 12.0,
                  color: Colors.grey,
                  textDecoration: TextDecoration.lineThrough,


                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  "${(product.productPrice / 100) * product.oldPrice}% Off",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.blue[700],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
