import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/feature/detail_screen/details_page.dart';

import '../../../core/color.dart';
import '../../../core/os_padding.dart';
import '../../../core/widget/os_text.dart';
import '../../favorute/view_model/favourite_view_model.dart';
import '../view_model/home_view_model.dart';
import 'item_title.dart';

class ProductOfTheDay extends StatelessWidget {
  const ProductOfTheDay({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
     final FavouriteViewModel favVM = Get.put(FavouriteViewModel());
    HomeViewModel homeVM = Get.put(HomeViewModel());

    return ItemTitle(
      title: "Deals of the day",
      child: SizedBox(
        height: osHeightContext(context) * .15,
        child: Center(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: homeVM.state.productItem.length,
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(ProductDetailPage(product: homeVM.state.productItem.elementAt(index)));
                   },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          const Image(
                            image: AssetImage("assets/item_image.png"),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            color: Color(0xffFAEDD9),
                          ),
                          Positioned(
                            left: -3,
                            top: -3,
                            child: GetBuilder<FavouriteViewModel>(
                              init: FavouriteViewModel(),
                              builder: (controller) => InkWell(
                                onTap: () {
                                  favVM.toggleFavourite(homeVM.state.productItem.elementAt(index));
                                },
                                child: CircleAvatar(
                                  child: controller
                                          .itemIsExist(homeVM.state.productItem.elementAt(index))
                                      ? const Icon(Icons.favorite,
                                          size: 17, color: AppColors.lightRed)
                                      : const Icon(Icons.favorite_border,
                                          size: 17,
                                          color: AppColors.mediumGrey),
                                  backgroundColor: AppColors.bg,
                                  radius: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                osAddHorizontalSpace(w: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OsText(homeVM.state.productItem.elementAt(index).productName,
                        fontSize: 13, fontWeight: FontWeight.bold),
                    OsText("${homeVM.state.productItem.elementAt(index).remainingQuantity} Pieces",
                        fontSize: 11, maxLines: 1),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on_outlined, size: 12),
                        OsText("${homeVM.state.productItem.elementAt(index).time} Minutes Away",
                            fontSize: 11, maxLines: 1),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OsText(
                            "\$ ${homeVM.state.productItem.elementAt(index).productPrice.toString()}",
                            fontSize: 13,
                            maxLines: 1,
                            color: AppColors.lightRed,
                            fontWeight: FontWeight.bold),
                        osAddHorizontalSpace(),
                        OsText(
                            "  \$ ${homeVM.state.productItem.elementAt(index).oldPrice.toString()}  .",
                            fontSize: 11,
                            maxLines: 1,
                            textDecoration: TextDecoration.lineThrough,
                            color: AppColors.infoTextColor),
                      ],
                    ),
                  ],
                )
              ],
            ),
            separatorBuilder: (context, index) => osAddHorizontalSpace(w: 50),
          ),
        ),
      ),
    );
  }
}
