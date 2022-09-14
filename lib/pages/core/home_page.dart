// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/pages/core/message_page.dart';
import 'package:shamo/pages/core/subpages/sub_page_export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  final PageController _pageController = PageController();
  final PageController _pageControllerHome = PageController();
  int index = 0;
  int indexHome = 0;

  bool closeTopContainer = false;
  double topContainer = 0;

  whenScroll() {
    _controller.addListener(() {
      double value = _controller.offset / 100;

      // ukuran untuk card book
      setState(() {
        topContainer = value;

        // nyari value scroll
        closeTopContainer = _controller.offset > 50 ? true : false;
      });
    });
  }

  @override
  void initState() {
    whenScroll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<String> category = ['All Shoes', 'Running', 'Training', 'Basketball'];

    return Scaffold(
      extendBody: true,
      floatingActionButton: const CartFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomAppBar(
          indexHome: indexHome, pageController: _pageControllerHome),
      body: PageView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageControllerHome,
        children: [
          _buildHomePage(height, category),
          MessagePage(pageController: _pageControllerHome),
        ],
      ),
    );
  }

  Stack _buildHomePage(double height, List<String> category) {
    return Stack(
      children: [
        DecorationOne(height: height, top: -150, left: 0, right: 0),
        Column(
          children: [
            const SizedBox(height: 30),
            const HeaderBar(),
            Expanded(
              child: Column(
                children: [
                  _buildCategoryIndicator(category, _pageController),
                  Expanded(
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        AllShoesPage(scrollController: _controller),
                        RunningPage(scrollController: _controller),
                        TrainingPage(scrollController: _controller),
                        BasketPage(scrollController: _controller),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryIndicator(
      List<String> category, PageController pageController) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      // padding: const EdgeInsets.only(bottom: 5),
      height: closeTopContainer ? 0 : 110,
      child: ListView(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          category.length,
          (ind) => GestureDetector(
            onTap: () {
              index = ind;
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {});
            },
            child: Transform.translate(
              offset: Offset(0, index == ind ? -15 : 0),
              child: AnimatedContainer(
                width: closeTopContainer ? 0 : 70,
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,

                  // vertical: 10,
                ),
                margin: EdgeInsets.only(
                    left: index == 0 ? 30 : 15, right: 15, bottom: 10),
                decoration: BoxDecoration(
                  color: index == ind
                      ? R.appColors.primaryColor
                      : Colors.transparent,
                  border: index == ind
                      ? null
                      : Border.all(
                          color: R.appColors.darkTextColor,
                        ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    index != ind
                        ? const BoxShadow()
                        : BoxShadow(
                            blurRadius: 20,
                            spreadRadius: 5,
                            color: R.appColors.primaryColor.withOpacity(0.7),
                            offset: const Offset(0, 0),
                          ),
                  ],
                ),
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                child: Column(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: closeTopContainer ? 0 : 35,
                        decoration: BoxDecoration(
                          color: index != ind
                              ? Colors.purple.withOpacity(0.15)
                              : Colors.purple.shade900,
                          borderRadius: BorderRadius.circular(500),
                          boxShadow: [
                            index != ind
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
                        child: index != ind
                            ? null
                            : Icon(
                                category[ind] == 'All Shoes'
                                    ? Icons.radio_button_checked_sharp
                                    : category[ind] == 'Running'
                                        ? Icons.run_circle
                                        : category[ind] == 'Training'
                                            ? Icons.sports_gymnastics
                                            : Icons.sports_basketball,
                                color: Colors.white.withOpacity(0.7),
                                size: closeTopContainer ? 0 : 24,
                              ),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(category[ind],
                            style: index != ind
                                ? R.appTextStyle.darkTextStyle
                                : R.appTextStyle.primaryTextStyle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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

class MyBottomAppBar extends StatefulWidget {
  MyBottomAppBar({
    Key? key,
    required this.pageController,
    required this.indexHome,
  }) : super(key: key);

  final PageController pageController;
  int indexHome;

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<Widget> menuItems = [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: widget.indexHome == 0
            ? BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              )
            : null,
        child: Image.asset(
          R.appAssets.home,
          width: 21,
          color: widget.indexHome == 0 ? R.appColors.primaryColor : null,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        decoration: widget.indexHome == 1
            ? BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              )
            : null,
        child: Image.asset(
          R.appAssets.chat,
          width: 21,
          color: widget.indexHome == 1 ? R.appColors.primaryColor : null,
        ),
      ),
      SizedBox(width: width * 0.1),
      Container(
        padding: const EdgeInsets.all(8),
        decoration: widget.indexHome == 2
            ? BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              )
            : null,
        child: Image.asset(
          R.appAssets.favorite,
          width: 21,
          color: widget.indexHome == 2 ? R.appColors.primaryColor : null,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        decoration: widget.indexHome == 3
            ? BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              )
            : null,
        child: Image.asset(R.appAssets.profile,
            width: 21,
            color: widget.indexHome == 3 ? R.appColors.primaryColor : null),
      ),
    ];

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        color: R.appColors.bgColor3.withOpacity(0.55),
        // color: Colors.white.withOpacity(0.05),
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 15,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(menuItems.length, (index) {
                  return GestureDetector(
                    child: Container(
                      child: menuItems[index],
                    ),
                    onTap: () {
                      widget.indexHome = index;

                      widget.pageController.animateToPage(
                        widget.indexHome,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                      );
                      setState(() {});
                    },
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
