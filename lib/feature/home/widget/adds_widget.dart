import 'package:flutter/material.dart';
import 'package:getx_shop_card/core/os_padding.dart';
import 'package:getx_shop_card/core/widget/os_text.dart';

import '../../../core/color.dart';

class AddsWidget extends StatelessWidget {
  const AddsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: osWidthContext(context),
      height: osHeightContext(context) * .25,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image(
                width: osWidthContext(context),
                height: osHeightContext(context) * .25,
                image: const AssetImage("assets/item_image.png"),
                fit: BoxFit.cover,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(""),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const OsText("Mega", fontSize: 11, color: AppColors.mediumRed),
                      Row(
                        children: const [
                          OsText("WHOPP",
                              fontSize: 31,
                              maxLines: 1,
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.bold),
                          OsText("E",
                              fontSize: 31,
                              maxLines: 1,
                              color: AppColors.lightRed,
                              fontWeight: FontWeight.bold),
                          OsText("R",
                              fontSize: 31,
                              maxLines: 1,
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const OsText("\$ 17",
                          fontSize: 18,
                          maxLines: 1,
                          color: AppColors.lightRed,
                          fontWeight: FontWeight.bold),
                      osAddHorizontalSpace(),
                      const OsText(
                        "  \$ 32  .",
                        fontSize: 18,
                        maxLines: 1,
                        textDecoration: TextDecoration.lineThrough,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const OsText("* Available until 24 December 2020",
                      fontSize: 11, color: AppColors.white),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
