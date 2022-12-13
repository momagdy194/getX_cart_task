import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_shop_card/core/os_padding.dart';

class ScaffoldApp extends StatefulWidget {
  final bool? showSecure;
  final Widget? body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final bool? hasSafeArea;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final EdgeInsetsGeometry ?padding;

  const ScaffoldApp({
    this.showSecure,
    this.padding,
    Key? key,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.hasSafeArea,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  State<ScaffoldApp> createState() => _ScaffoldAppState();
}

class _ScaffoldAppState extends State<ScaffoldApp> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    // //print(widget.hasSafeArea);
    final _theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? true,
      backgroundColor: widget.backgroundColor ?? _theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: widget.padding??osAddSymmetricPaddingSpace(horizontal: 6,vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: widget.body ?? Container(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
