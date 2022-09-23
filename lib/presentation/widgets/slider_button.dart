import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';

class AnimatedSwipeToConfirm extends StatefulWidget {
  const AnimatedSwipeToConfirm({
    Key? key,
    this.height = 56,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  final double? height;

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  State<AnimatedSwipeToConfirm> createState() => _AnimatedSwipeToConfirmState();
}

class _AnimatedSwipeToConfirmState extends State<AnimatedSwipeToConfirm> {
  late double _maxWidth;
  late double _handleSize;
  double _dragValue = 0;
  double _dragWidth = 0;
  bool _confirmed = false;
  final double _padding = 4;
  @override
  Widget build(BuildContext context) {
    _handleSize = (widget.height! - (_padding * 2));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: LayoutBuilder(builder: (context, constraint) {
        _maxWidth = constraint.maxWidth;
        return AnimatedContainer(
          padding: EdgeInsets.all(_padding),
          duration: const Duration(milliseconds: 100),
          height: widget.height,
          decoration: BoxDecoration(
            gradient: _confirmed
                ? AppColors.confirmedGradient
                : AppColors.colorGradientBlue,
            borderRadius: BorderRadius.circular(29),
          ),
          child: Center(
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(),
                      Shimmer.fromColors(
                        baseColor: Colors.white30,
                        highlightColor: Colors.white,
                        child: Text(
                          _confirmed ? "" : "slide to buy",
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'HeliosExtC',
                            fontWeight: FontWeight.w400,
                            //height: 16.76 / 14
                          ),
                        ),
                      ),
                      SvgPicture.asset(AppIcon.iosArrow),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _dragWidth <= _handleSize ? _handleSize : _dragWidth,
                  child: Row(
                    children: [
                      const Expanded(child: SizedBox.shrink()),
                      GestureDetector(
                        onVerticalDragUpdate: _onDragUpdate,
                        onVerticalDragEnd: _onDragEnd,
                        child: Container(
                          width: _handleSize,
                          height: _handleSize,
                          decoration: BoxDecoration(
                            color: _confirmed
                                ? const Color(0xff161617)
                                : const Color(0xff957AF7),
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: SvgPicture.asset(AppIcon.sliderToggle,
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragValue = (details.globalPosition.dx) / _maxWidth;
      _dragWidth = _maxWidth * _dragValue;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dragValue > .9) {
      _dragValue = 1;
    } else {
      _dragValue = 0;
    }

    setState(() {
      _dragWidth = _maxWidth * _dragValue;
      _confirmed = _dragValue == 1;
    });

    if (_dragValue == 1) {
      widget.onConfirm();
    } else {
      widget.onCancel();
    }
  }
}
