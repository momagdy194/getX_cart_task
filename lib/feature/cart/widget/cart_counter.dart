
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/os_padding.dart';
import '../../../core/widget/os_text.dart';
import '../model/cart_model.dart';
import '../view_model/cart_viw_model.dart';

//ignore: must_be_immutable
class CartCounter extends StatelessWidget {
  CartModel item;

  CartCounter({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartViewModel cartVM = Get.put(CartViewModel());

    return GetBuilder<CartViewModel>(
      builder: (DisposableInterface controller)=>
      Row(
        children: [
          InkWell(
            onTap: () {
              int index = cartVM.state.cartList.indexOf(item);
              cartVM.addToQuantity(index);
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: const Color(0xffb0eafd),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.add,
                  color: Color(0xff48b6da),
                )),
          ),
          Padding(
            padding: osAddSymmetricPaddingSpace(horizontal: 15),
            child:  OsText(item.quantity.toString(),
                  fontSize: 18, fontWeight: FontWeight.bold),

          ),
          InkWell(
            onTap: () {
              int index = cartVM.state.cartList.indexOf(item);
              cartVM.removeFromQuantity(index);
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: const Color(0xffb0eafd),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.remove,
                  color: Color(0xff48b6da),
                )),
          ),
        ],
      ),
    );
  }
}
