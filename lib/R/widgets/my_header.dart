// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({
    Key? key,
    this.customChild,
    this.isProfile,
    this.label,
    this.isPop,
  }) : super(key: key);

  final Widget? customChild;
  final bool? isProfile;
  final String? label;
  final bool? isPop;

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Gradient> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    animation = animationController.drive(
      GradientTween(
        begin: SweepGradient(
          colors: [
            R.appColors.priceColor,
            R.appColors.primaryColor,
          ],
          center: Alignment.center,
        ),
        end: SweepGradient(
          colors: [
            R.appColors.primaryColor,
            R.appColors.priceColor,
          ],
          center: Alignment.center,
        ),
      ),
    );

    animationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(
        left: widget.isProfile == true ? R.appMargin.defaultMargin : 0,
        right: widget.isProfile == true ? R.appMargin.defaultMargin : 0,
        top: paddingTop,
      ),
      height: widget.isProfile == true ? 200 : 87,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.isProfile == true
            ? null
            : R.appColors.bgColor1.withOpacity(0.3),
        gradient: widget.isProfile == true ? animation.value : null,
      ),
      child: widget.customChild ??
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: R.appMargin.defaultMargin),
            child: Row(
              children: [
                widget.isPop == true
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: R.appColors.primaryTextColor,
                        ),
                      )
                    : const SizedBox(),
                Expanded(
                  child: Center(
                    child: Text(
                      widget.label ?? '',
                      style: R.appTextStyle.primaryTextStyle
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class GradientTween extends Tween<Gradient> {
  GradientTween({
    required Gradient begin,
    required Gradient end,
  }) : super(begin: begin, end: end);

  @override
  Gradient lerp(double t) => SweepGradient(
        colors: <Color>[
          Color.lerp(begin?.colors[0], end?.colors[0], t) ??
              const Color(0x0ff00000),
          Color.lerp(begin?.colors[1], end?.colors[1], t) ??
              const Color(0x0ff00000),
        ],
        stops: <double>[
          lerpDouble(begin?.stops?[0], end?.stops?[0], t) ?? 0,
          lerpDouble(begin?.stops?[1], end?.stops?[1], t) ?? 0,
        ],
      );
}
