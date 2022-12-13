import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/core/util.dart';
import 'package:getx_shop_card/core/widget/once_future_builder.dart';
import 'package:getx_shop_card/feature/home/view_model/home_view_model.dart';
import 'package:getx_shop_card/feature/home/widget/adds_widget.dart';
import 'package:getx_shop_card/feature/home/widget/category.dart';
import 'package:getx_shop_card/feature/home/widget/deal_of_day.dart';

import '../../core/os_padding.dart';
import '../../core/widget/custom_app_bar.dart';
import '../../core/widget/os_text_form.dart';
import 'widget/address_widget.dart';

class GroScreen extends StatelessWidget {
  const GroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeVM = Get.put(HomeViewModel());

    return Column(
      children: [
        const CustomAppBar(title: "Mustafa St."),
        osAddVerticalSpace(h: 20),
        Expanded(
          child: OnceFutureBuilder(
            future: () async {
              await homeVM.initAllDate();
            },
            builder: (context, snapshot) {
               if (homeVM.state.categoryState == ScreenStatus.loading ||
                  homeVM.state.productStatus == ScreenStatus.loading ||
                  homeVM.state.addressState == ScreenStatus.loading) {
                 return const Center(
                  child: CircularProgressIndicator(),
                );
               }

               if(homeVM.state.categoryState == ScreenStatus.error ||
                   homeVM.state.productStatus == ScreenStatus.error ||
                   homeVM.state.addressState == ScreenStatus.error) {
                 return const Text("error");
               }

              return SingleChildScrollView(
                child: Column(children: [
                  const OsTextFormField(
                    enabled: false,
                    hintText: "Search in thousands of products",
                    prefixIcon: Icon(Icons.search, color: Color(0xff444444)),
                  ),
                  osAddVerticalSpace(h: 20),
                  const AddressWidget(),
                  osAddVerticalSpace(h: 20),
                  const ExploreByCategory(),
                  osAddVerticalSpace(h: 20),
                  const ProductOfTheDay(),
                  osAddVerticalSpace(h: 20),
                  const AddsWidget()
                ]),
              );
            },

          ),
        ),
      ],
    );
  }
}
