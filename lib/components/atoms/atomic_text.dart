import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtomicText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AtomicText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  const AtomicText.heading1(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
  })  : style = null,
        fontSize = 32,
        fontWeight = FontWeight.w700;

  const AtomicText.heading2(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
  })  : style = null,
        fontSize = 24,
        fontWeight = FontWeight.w600;

  const AtomicText.body(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
  })  : style = null,
        fontSize = 16,
        fontWeight = FontWeight.w400;

  const AtomicText.caption(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
  })  : style = null,
        fontSize = 14,
        fontWeight = FontWeight.w400;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? const Color(0xFF332749);
    final effectiveStyle = style ??
        GoogleFonts.leagueSpartan(
          color: effectiveColor,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w400,
        );

    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
