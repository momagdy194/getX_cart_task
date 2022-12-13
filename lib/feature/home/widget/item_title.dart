import 'package:flutter/cupertino.dart';

import '../../../core/color.dart';
import '../../../core/os_padding.dart';
import '../../../core/widget/os_text.dart';

//ignore: must_be_immutable
class ItemTitle extends StatelessWidget {
  String title;
  Widget child;

  ItemTitle({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsText(
          title,
          color: AppColors.fontTitle,
          fontWeight: FontWeight.bold,
        ),
        osAddVerticalSpace(h: 13),
        child
      ],
    );
  }
}
