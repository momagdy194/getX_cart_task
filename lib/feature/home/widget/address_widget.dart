import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/color.dart';
import '../../../core/os_padding.dart';
import '../../../core/widget/os_text.dart';
 import '../view_model/home_view_model.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    HomeViewModel homeVM = Get.put(HomeViewModel());

    return SizedBox(
      height: osHeightContext(context) * .09,
      child: Center(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: homeVM.state.addressItem.length,
          itemBuilder: (context, index) => Container(
            width: osWidthContext(context) / 1.75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border:
                    Border.all(width: 1, color: AppColors.borderLightColor)),
            padding: osAddSymmetricPaddingSpace(vertical: 5, horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      image: AssetImage("assets/item_image.png"),
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                      color: Color(0xffE2DCD6),
                    )),
                osAddHorizontalSpace(w: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OsText(homeVM.state.addressItem.elementAt(index).title,
                        fontSize: 11, fontWeight: FontWeight.bold),
                    OsText(homeVM.state.addressItem.elementAt(index).address,
                        fontSize: 11, maxLines: 1),
                    OsText(homeVM.state.addressItem.elementAt(index).streets,
                        fontSize: 11, maxLines: 1),
                  ],
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => osAddHorizontalSpace(w: 15),
        ),
      ),
    );
  }
}
