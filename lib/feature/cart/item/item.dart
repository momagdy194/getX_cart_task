import 'package:flutter/cupertino.dart';

import '../../../core/color.dart';
import '../../../core/os_padding.dart';
import '../../../core/widget/os_text.dart';
import '../model/cart_model.dart';
import '../widget/cart_counter.dart';

//ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartModel item;

  CartItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image(
                image: const AssetImage("assets/item_image.png"),
                width: 66,
                height: 66,
                fit: BoxFit.cover,
                color: item.productImageColor,
              )),
          osAddHorizontalSpace(),
          Container(
            height: 66,
            width: osWidthContext(context) * .30,
            padding: osAddSymmetricPaddingSpace(vertical: 4, horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OsText(item.productName ?? "",
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    maxLines: 1,
                    minFontSize: 12),
                OsText("${item.remainingQuantity} ${item.productUnit}",
                    fontSize: 10, maxLines: 1, color: AppColors.mediumGrey),
                OsText("\$ ${item.productPrice}",
                    fontSize: 18, maxLines: 1, color: AppColors.mediumRed),
              ],
            ),
          ),
        ]),
        CartCounter(
          item: item,
        )
      ],
    );
  }
}
