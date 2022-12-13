import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/core/widget/os_text.dart';

import '../../../core/color.dart';
import '../../cart/view_model/cart_viw_model.dart';
import '../../favorute/view_model/favourite_view_model.dart';
import '../../home/model/product_model.dart';

class CartAndFavButton extends StatelessWidget {
  final ProductModel product;

  const CartAndFavButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartVM = Get.put(CartViewModel());
    final FavouriteViewModel favVM = Get.put(FavouriteViewModel());

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            onPressed: () {
              favVM.toggleFavourite(product);
            },
            icon: GetBuilder<FavouriteViewModel>(
              builder: (controller) => SizedBox(
                width: 60,
                child:controller
                    .itemIsExist(product)
                    ? const Icon(Icons.favorite, size: 30, color: AppColors.lightRed)
                    : const Icon(Icons.favorite_border,
                        size: 30, color: AppColors.mediumGrey),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
style: ElevatedButton.styleFrom(
primary:AppColors.orangeColor,
     textStyle: const TextStyle(
     fontWeight: FontWeight.bold)),
              onPressed: () {
                cartVM.addProduct(product);
              },
              // color: Colors.greenAccent,
              child: const OsText("Add To bag",fontSize: 18,),
            ),
          ),
        ],
      ),
    );
  }
}
