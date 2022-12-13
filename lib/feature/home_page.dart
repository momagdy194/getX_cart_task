import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/core/widget/scafoald_app.dart';
import 'package:getx_shop_card/feature/home/widget/nav_bar.dart';

import '../core/color.dart';
import '../core/widget/os_text.dart';
import 'cart/view_model/cart_viw_model.dart';
import 'home/view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeVM = Get.put(HomeViewModel());
    final CartViewModel cartVM = Get.put(CartViewModel());

    return GetBuilder<HomeViewModel>(
        builder: (controller) => ScaffoldApp(
              body: homeVM.state.screen[homeVM.state.selectIndex],
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.orangeColor,
                onPressed: () {
                  homeVM.changeSelectIndex(2);
                },
                tooltip: 'Increment',
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Positioned(
                      left: -0,
                      top: -0,
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.shopping_cart,
                        size: 20,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: GetBuilder<CartViewModel>(
                        builder: (controller) => cartVM.totalCost.toInt() == 0
                            ? const SizedBox()
                            : OsText(
                                "${cartVM.totalCost.toInt()}\$",
                                fontSize: 18,
                                color: AppColors.white,
                              ),
                      ),
                    ),
                  ],
                ),
                elevation: 4.0,
              ),
              bottomNavigationBar: const CustomBottomNavBar(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ));
  }
}
