// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.hintText,
    this.isPassword,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final String hintText;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: R.appTextStyle.secondaryTextStyle),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: R.appColors.bgColor3,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: R.appColors.primaryColor,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: R.appColors.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(right: 10),
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: R.appTextStyle.darkTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                isPassword != false && isPassword != null
                    ? Icon(
                        Icons.visibility,
                        color: R.appColors.primaryColor,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
