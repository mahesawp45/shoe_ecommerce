import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/user_avatar.dart';
import 'package:shamo/models/user_model.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(R.appMargin.defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hallo, ${user?.name ?? ""} ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "@${user?.username ?? ""}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: R.appTextStyle.darkTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          UserProfileAvatar(
            img: R.appAssets.profile,
            isUser: true,
          ),
        ],
      ),
    );
  }
}
