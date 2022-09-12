import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  bool isScroll = false;

  @override
  void initState() {
    _controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<String> category = ['All Shoes', 'Running', 'Training', 'Basketball'];

    return Scaffold(
      extendBody: true,
      floatingActionButton: const CartFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomAppBar(),
      body: Stack(
        children: [
          DecorationOne(height: height, top: -150, left: 0, right: 0),
          Column(
            children: [
              const SizedBox(height: 30),
              const HeaderBar(),
              Expanded(
                child: Column(
                  children: [
                    _buildCategoryIndicator(category),
                    _buildContent(height, width)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox _buildCategoryIndicator(List<String> category) {
    return SizedBox(
      height: 100,
      child: ListView(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          category.length,
          (index) => Container(
            width: 70,
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,

              // vertical: 10,
            ),
            margin: EdgeInsets.only(left: index == 0 ? 30 : 15, right: 15),
            decoration: BoxDecoration(
              color: index == 0 ? R.appColors.primaryColor : Colors.transparent,
              border: index == 0
                  ? null
                  : Border.all(
                      color: R.appColors.darkTextColor,
                    ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                index != 0
                    ? const BoxShadow()
                    : BoxShadow(
                        blurRadius: 25,
                        spreadRadius: 5,
                        color: R.appColors.primaryColor.withOpacity(0.7),
                        offset: const Offset(0, 0),
                      ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: index != 0
                        ? Colors.purple.withOpacity(0.15)
                        : Colors.purple.shade900,
                    borderRadius: BorderRadius.circular(500),
                    boxShadow: [
                      index != 0
                          ? const BoxShadow()
                          : BoxShadow(
                              blurStyle: BlurStyle.inner,
                              blurRadius: 30,
                              spreadRadius: 6,
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 0),
                            ),
                    ],
                  ),
                  child: index != 0
                      ? null
                      : Icon(
                          Icons.radio_button_checked_sharp,
                          color: Colors.white.withOpacity(0.7),
                        ),
                ),
                Expanded(
                  child: FittedBox(
                    child: Text(
                      category[index],
                      style: index == 0
                          ? R.appTextStyle.primaryTextStyle
                          : R.appTextStyle.darkTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(double height, double width) {
    List<Map<String, dynamic>> pops = [
      {
        'title': 'Court Vision 2.0',
        'category': 'Hiking',
        'price': '\$58,67',
        'img': R.appAssets.pop1,
      },
      {
        'title': 'Terrex Urban Low',
        'category': 'Hiking',
        'price': '\$143,98',
        'img': R.appAssets.pop2,
      },
      {
        'title': 'SL 20 Shoes',
        'category': 'Running',
        'price': '\$123,82',
        'img': R.appAssets.pop3,
      },
    ];

    return Expanded(
      child: ListView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildPopularProduct(height, pops, width),
          _buildNewArrivals(pops),
        ],
      ),
    );
  }

  Widget _buildNewArrivals(List<Map<String, dynamic>> pops) {
    return Padding(
      padding: EdgeInsets.only(
        left: R.appMargin.defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 10),
            child: Text(
              'New Arrivals',
              style: R.appTextStyle.primaryTextStyle
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: List.generate(pops.length, (index) {
              var data = pops[index];

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 120,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: R.appColors.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        data['img'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['category'],
                            style: R.appTextStyle.secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            data['title'],
                            style: R.appTextStyle.primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            data['price'],
                            style: R.appTextStyle.priceTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  SizedBox _buildPopularProduct(
      double height, List<Map<String, dynamic>> pops, double width) {
    return SizedBox(
      height: height * 0.36,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: R.appMargin.defaultMargin,
            ),
            child: Text(
              'Popular Product',
              style: R.appTextStyle.primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 30);
            },
            scrollDirection: Axis.horizontal,
            itemCount: pops.length,
            itemBuilder: (context, index) {
              var data = pops[index];

              return Padding(
                padding: EdgeInsets.only(left: index > 0 ? 0 : 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: width * 0.50,
                    decoration: BoxDecoration(
                      color: R.appColors.cardColor,
                      // color: Colors.amber,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              data['img'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 20,
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data['category'],
                                  style: R.appTextStyle.secondaryTextStyle
                                      .copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  data['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  data['price'],
                                  style: R.appTextStyle.priceTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(R.appMargin.defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hallo, Alex',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '@alex',
                style: R.appTextStyle.darkTextStyle,
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 54,
              width: 54,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    R.appColors.secondaryColor,
                    Colors.cyan.shade900,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  R.appAssets.profile,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      onPressed: () {},
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            colors: [
              R.appColors.secondaryColor,
              Colors.cyan.shade900,
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              spreadRadius: 10,
              color: R.appColors.secondaryColor.withOpacity(0.7),
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(child: Image.asset(R.appAssets.cart, width: 21)),
      ),
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        color: R.appColors.bgColor3.withOpacity(0.55),
        // color: Colors.white.withOpacity(0.05),
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 20,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 8),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(R.appAssets.home, width: 21),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(R.appAssets.chat, width: 21),
                ),
                const BottomNavigationBarItem(label: '', icon: SizedBox()),
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(R.appAssets.favorite, width: 21),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(R.appAssets.profile, width: 21),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
