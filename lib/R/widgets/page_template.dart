import 'package:flutter/cupertino.dart';
import 'package:shamo/R/r.dart';

class PageTemplate extends StatelessWidget {
  const PageTemplate({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: R.appMargin.defaultMargin,
          vertical: R.appMargin.defaultMargin - 10,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return child;
        },
      ),
    );
  }
}
