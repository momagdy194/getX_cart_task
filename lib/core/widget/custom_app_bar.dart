 import 'package:flutter/material.dart';

import '../color.dart';
import 'os_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

    const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Image.asset(
              "assets/clip_par.png",
        width: 133,
            height: 44),
            Positioned(
              bottom: 8,
              left: 8,
              right: 0,
              top: 0,
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                      color: AppColors.white, size: 25),
                  OsText(
                    title,
                    color: AppColors.white,
                    fontSize: 11,
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.borderColor, width: 2)),
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
          radius: 18),
        )
      ],
    );
  }
}
