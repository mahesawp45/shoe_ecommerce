import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class MessageHeader extends StatelessWidget {
  const MessageHeader({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      width: double.infinity,
      color: R.appColors.bgColor3,
      child: child,
    );
  }
}
