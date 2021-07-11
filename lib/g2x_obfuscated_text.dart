library g2x_obfuscated_text;

import 'package:flutter/material.dart';

class ObfuscatedText extends StatelessWidget {
  final String text;
  final int startIndex;
  final double opacitySubtraction;
  final Function? onTap;
  const ObfuscatedText({
    Key? key,
    required this.text,
    required this.startIndex,
    required this.opacitySubtraction,
    this.onTap
  }) : super(key: key);
  @override
  Widget build(BuildContext ontext) {
    var opacity = 1.0;
    var richText = RichText(
      text: TextSpan(
        children: List.generate(text.length, (index) {
          opacity = index >= startIndex ? opacity - opacitySubtraction : 1;
          if(opacity <= 0) opacity = 0;
          return TextSpan(text: text[index], style: TextStyle(color: Colors.black.withOpacity(opacity)));
        })
      ),
    );
    return GestureDetector(
      onTap: (){onTap?.call();},
      child: richText,
    );
  }
}