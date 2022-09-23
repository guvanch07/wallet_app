// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wallet_app/presentation/core/theme/theme_colors.dart';

class GlowingActionButton extends StatelessWidget {
  const GlowingActionButton({
    Key? key,
    required this.assetName,
    this.size = 54,
    required this.onPressed,
  }) : super(key: key);

  final String assetName;
  final double size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.3),
            spreadRadius: 8,
            blurRadius: 24,
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          color: AppColors.accent,
          child: InkWell(
            splashColor: AppColors.accent,
            onTap: onPressed,
            child: SizedBox(
              width: size,
              height: size,
              child: SvgPicture.asset(assetName, fit: BoxFit.scaleDown),
            ),
          ),
        ),
      ),
    );
  }
}
