import 'package:flutter/material.dart';

osAddAllPaddingSpace({double value = 20}) {
  return EdgeInsets.all(value);
}

osAddSymmetricPaddingSpace({double vertical = 20, double horizontal = 20}) {
  return EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
}

osAddOnlyPaddingSpace(
    {double left = 20,
    double right = 20,
    double top = 20,
    double bottom = 20}) {
  return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
}

osAddVerticalSpace({double h = 20}) {
  return SizedBox(
    height: h,
  );
}

osAddHorizontalSpace({double w = 20}) {
  return SizedBox(
    width: w,
  );
}

osAddDivider() {
  return const Divider();
}

double osWidthContext(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double osHeightContext(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
