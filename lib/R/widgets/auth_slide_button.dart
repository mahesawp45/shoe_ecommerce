// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r_export.dart';

class AuthSlideButton extends StatelessWidget {
  const AuthSlideButton({
    Key? key,
    required this.width,
    required this.update,
    required this.isLoading,
    required this.endDrag,
    required this.updateDrag,
    required this.label,
  }) : super(key: key);

  final double width;
  final double update;
  final bool isLoading;
  final void Function(DragEndDetails) endDrag;
  final void Function(DragUpdateDetails) updateDrag;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 60,
        maxWidth: width,
      ),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.03),
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              const CenterArrowSlide(),
              Transform.translate(
                offset: Offset(update, 0),
                child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    endDrag(details);
                  },
                  onHorizontalDragUpdate: (details) {
                    updateDrag(details);
                  },
                  child: AuthButton(
                    isLoading: isLoading,
                    title: label,
                    size: 60,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class CenterArrowSlide extends StatelessWidget {
  const CenterArrowSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => Icon(Icons.arrow_forward_ios,
              color: Colors.grey.shade900, size: 15),
        ),
      ),
    );
  }
}
