import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/feature/cart/item/item.dart';
import 'package:getx_shop_card/feature/cart/view_model/cart_viw_model.dart';

import '../../core/color.dart';
import '../../core/os_padding.dart';
import '../../core/widget/custom_app_bar.dart';
import '../../core/widget/os_text.dart';
import '../../core/widget/scafoald_app.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartVM = Get.put(CartViewModel());

    return ScaffoldApp(
        body: GetBuilder<CartViewModel>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: "Oxford Street"),
          osAddVerticalSpace(h: 20),
          const OsText(
            "Cart",
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          osAddVerticalSpace(h: 20),
          Expanded(
            child: cartVM.state.cartList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.remove_shopping_cart_outlined,
                            size: 100, color: AppColors.orangeColor),
                        OsText(
                          "Cart Is Empty",
                          fontSize: 20,
                          color: AppColors.orangeColor,
                        )
                      ],
                    ),
                  )
                : ListView.separated(
                    itemCount: cartVM.state.cartList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const <Widget>[
                              Icon(
                                Icons.delete,
                                size: 25,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        key: Key(
                            "$index${cartVM.state.cartList.elementAt(index).id}"),
                        child: CartItem(
                          item: cartVM.state.cartList.elementAt(index),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            final bool res = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                        "Are you sure you want to delete ${cartVM.state.cartList[index].productName}?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onPressed: () {
                                          cartVM.removeProduct(index);
                                          Navigator.of(context).pop(true);
                                        },
                                      ),
                                    ],
                                  );
                                });
                            return res;
                          } else {
                            return false;
                          }
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return osAddVerticalSpace(h: 20);
                    },
                  ),
          ),
          cartVM.state.cartList.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const OsText(
                      "Total price",
                      fontSize: 18,
                      color: AppColors.orangeColor,
                    ),
                    OsText(
                      "${cartVM.totalCost.toString()} \$",
                      fontSize: 18,
                      color: AppColors.orangeColor,
                    )
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    ));
  }
}
