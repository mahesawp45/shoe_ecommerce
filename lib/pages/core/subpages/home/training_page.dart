// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/shoe_card_mini.dart';
import 'package:shamo/R/widgets/shoe_tag.dart';
import 'package:shamo/data_dummy.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  static const String route = '/training-shoes-page';
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _buildContent(height, width, popsSub),
    );
  }

  Widget _buildContent(
      double height, double width, List<Map<String, dynamic>> pops) {
    return Padding(
      padding: EdgeInsets.only(left: R.appMargin.defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShoeTag(title: 'For You'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: List.generate(pops.length, (index) {
                var data = pops[index];
                return ShoeCardMini(data: data);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
