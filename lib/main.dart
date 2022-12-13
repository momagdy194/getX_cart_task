import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/feature/home_page.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: const HomePage(),
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        child = ResponsiveWrapper.builder(
          child,
          maxWidth: 1080,
          minWidth: 360,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(460, name: MOBILE),
            const ResponsiveBreakpoint.resize(460, name: PHONE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5)),
        );
        // child = DevicePreview.appBuilder(context, child);

        return child;
      },
    );
  }
}
