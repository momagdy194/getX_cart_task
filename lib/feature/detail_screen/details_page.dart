import 'package:flutter/material.dart';
import 'package:getx_shop_card/feature/detail_screen/widget/description_widget.dart';
import 'package:getx_shop_card/feature/detail_screen/widget/price_widet.dart';
import 'package:getx_shop_card/feature/detail_screen/widget/slider_image.dart';
import 'package:getx_shop_card/feature/home/model/product_model.dart';

import '../../core/os_padding.dart';
import '../../core/widget/os_text.dart';
import 'widget/cart_and_fav_button.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: const OsText(
          "Product Details",
          fontSize: 20,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SliderImage(product: product),
                  TitleAndPriceWidget(product: product),
                  osAddVerticalSpace(h: 12.0),
                  DescriptionWidget(product: product),
                  osAddVerticalSpace(h: 12.0),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartAndFavButton(
        product: product,
      ),
    );
  }
}
