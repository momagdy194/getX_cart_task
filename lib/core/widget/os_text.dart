import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OsText extends StatelessWidget {
    const OsText(
      this.title, {
        Key? key,
        this.fontSize = 14,
        this.fontWeight = FontWeight.normal,
        this.color ,
        this.align = TextAlign.center,
        this.maxLines = 5,
        this.hasCustomStyle = false,
        this.height,
        this.minFontSize = 10,
         this.textDirection,
        this.textDecoration,
      }) : super(key: key);
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color ?color;
  final TextAlign align;
  final int maxLines;
  final double minFontSize;
  final bool hasCustomStyle;
   final double? height;
  final TextDirection? textDirection;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return AutoSizeText(
      title,
        minFontSize: minFontSize,
        textAlign: align,
        maxLines: maxLines,
        textDirection: textDirection,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
      fontFamily: 'alfont_com',
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: textDecoration,
      color:color??_theme.canvasColor,
      height: height,
    ),



             );
  }
}
