import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';

class GlassMorphism extends StatelessWidget {
  final Widget child;
  final double? padding;
  final double? margin;

  const GlassMorphism({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          margin: EdgeInsets.only(
              left: margin ?? 20, right: margin ?? 20, bottom: margin ?? 20),
          padding: EdgeInsets.all(padding ?? 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 85, 85, 86).withOpacity(0.6),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class GlassMorphismHollScr extends StatelessWidget {
  final Widget child;
  final double? padding;
  final double? margin;

  const GlassMorphismHollScr({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.mainbgc.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: child,
        ),
      ),
    );
  }
}
