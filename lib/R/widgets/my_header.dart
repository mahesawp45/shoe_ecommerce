// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';

class MyHeader extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(
        left: isProfile == true ? R.appMargin.defaultMargin : 0,
        right: isProfile == true ? R.appMargin.defaultMargin : 0,
        top: paddingTop,
      ),
      height: isProfile == true ? 200 : 87,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isProfile == true ? null : R.appColors.bgColor1.withOpacity(0.3),
        gradient: isProfile == true
            ? LinearGradient(
                colors: [
                  R.appColors.primaryColor,
                  R.appColors.priceColor,
                ],
              )
            : null,
      ),
      child: customChild ??
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: R.appMargin.defaultMargin),
            child: Row(
              children: [
                isPop == true
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
                      label ?? '',
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
