// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({
    Key? key,
    required this.child,
    this.isProfile,
  }) : super(key: key);

  final Widget child;
  final bool? isProfile;

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
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
        color: widget.isProfile == true ? null : R.appColors.bgColor3,
        gradient: widget.isProfile == true
            ? LinearGradient(
                colors: [
                  R.appColors.primaryColor,
                  R.appColors.priceColor,
                ],
              )
            : null,
      ),
      child: widget.child,
    );
  }
}
