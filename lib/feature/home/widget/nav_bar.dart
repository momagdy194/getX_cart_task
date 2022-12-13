import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/core/color.dart';

import '../../../core/widget/os_text.dart';
import '../view_model/home_view_model.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewModel());
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SafeArea(
        child: SizedBox(
          height: 50,
          child: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomIconNavBar(
                  title: "Grocery",
                  icon: Icons.roofing_sharp,
                  onTap: () {
                    controller.changeSelectIndex(0);
                  },
                  index: 0,
                ),
                CustomIconNavBar(
                  title: "News",
                  icon: Icons.notifications_outlined,
                  onTap: () {
                    controller.changeSelectIndex(1);
                  },
                  index: 1,
                ),
                const Expanded(child: Text('')),
                CustomIconNavBar(
                  title: "Favorites",
                  icon: Icons.favorite_border,
                  onTap: () {
                    controller.changeSelectIndex(3);
                  },
                  index: 3,
                ),
                CustomIconNavBar(
                  title: "Cart",
                  icon: Icons.account_balance_wallet_outlined,
                  onTap: () {
                    controller.changeSelectIndex(4);
                  },
                  index: 4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class CustomIconNavBar extends StatelessWidget {
  HomeViewModel homeVM = Get.put(HomeViewModel());

  String title;
  IconData icon;
  int index;
  GestureTapCallback onTap;

  CustomIconNavBar(
      {Key? key,
      required this.title,
      required this.index,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,
                  color: homeVM.state.selectIndex == index
                      ? AppColors.orangeColor
                      : AppColors.lightGrey,
                  size: 20),
              OsText(
                title,
                color: homeVM.state.selectIndex == index
                    ? AppColors.orangeColor
                    : AppColors.lightGrey,
              )
            ],
          ),
          onTap: onTap),
    );
  }
}
