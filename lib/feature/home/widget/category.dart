import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:getx_shop_card/core/os_padding.dart';

import '../../../core/color.dart';
import '../../../core/widget/os_text.dart';
import '../view_model/home_view_model.dart';
import 'item_title.dart';

class ExploreByCategory extends StatelessWidget {
  const ExploreByCategory({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    HomeViewModel homeVM = Get.put(HomeViewModel());

    return ItemTitle(
      title: 'Explore by Category',
      child: SizedBox(
        height: osHeightContext(context) * .14,
        child: ListView.separated(
          separatorBuilder: (context, index) => osAddHorizontalSpace(w: 20),
          itemCount: homeVM.state.categoryItem.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image(
                        image: AssetImage(homeVM.state.categoryItem.elementAt(index).image),
                        width: 66,
                        height: 66,
                        fit: BoxFit.cover,
                        color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  OsText(
                    homeVM.state.categoryItem.elementAt(index).title,
                    color: AppColors.fontTitle,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
