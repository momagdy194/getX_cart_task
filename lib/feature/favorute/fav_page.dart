import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/core/widget/scafoald_app.dart';

import '../../core/color.dart';
import '../../core/os_padding.dart';
import '../../core/widget/custom_app_bar.dart';
import '../../core/widget/os_text.dart';
import 'view_model/favourite_view_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouriteViewModel favVM = Get.put(FavouriteViewModel());
    return ScaffoldApp(
      body:  GetBuilder<FavouriteViewModel>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: "Oxford Street"),
            osAddVerticalSpace(h: 20),
            const OsText(
              "Favourite",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            osAddVerticalSpace(h: 20),
            Expanded(
              child:  favVM.state.favList.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.favorite_border,
                        size: 100, color: AppColors.orangeColor),
                    OsText(
                      "Favourite Is Empty",
                      fontSize: 20,
                      color: AppColors.orangeColor,
                    )
                  ],
                ),
              )
                  :ListView.separated(
                      itemCount: favVM.state.favList.length,
                      itemBuilder: (context, index) => Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image(
                                      image: const AssetImage("assets/item_image.png"),
                                      width: 66,
                                      height: 66,
                                      fit: BoxFit.cover,
                                      color: favVM.state.favList
                                          .elementAt(index)
                                          .productImageColor,
                                    )),
                                osAddHorizontalSpace(),
                                Container(
                                  height: 66,
                                  width: osWidthContext(context) * .30,
                                  padding:
                                      osAddSymmetricPaddingSpace(vertical: 4, horizontal: 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      OsText(favVM.state.favList.elementAt(index).productName,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          maxLines: 1,
                                          minFontSize: 12),
                                      OsText(
                                          "${favVM.state.favList.elementAt(index).remainingQuantity} ${favVM.state.favList.elementAt(index)..productUnit}",
                                          fontSize: 10,
                                          maxLines: 1,
                                          color: AppColors.mediumGrey),
                                      OsText(
                                          "\$ ${favVM.state.favList.elementAt(index).productPrice}",
                                          fontSize: 18,
                                          maxLines: 1,
                                          color: AppColors.mediumRed),
                                    ],
                                  ),
                                ),


                              ]),
                            ),

                            IconButton(onPressed: ()=> favVM.toggleFavourite(favVM.state.favList.elementAt(index)),icon: const Icon(Icons.favorite,size: 25,color: AppColors.mediumRed,))

                          ],
                        ),
                      ]), separatorBuilder: (BuildContext context, int index) { return osAddVerticalSpace(); },
                    ),
            ),
          ],
        ),
          ),
    );
  }
}
