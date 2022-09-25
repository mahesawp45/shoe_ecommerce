// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shamo/R/decorations/decoration_one.dart';
import 'package:shamo/R/r.dart';
import 'package:shamo/R/widgets/user_avatar.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/pages/core/message_page.dart';
import 'package:shamo/pages/core/subpages/cart/cart_page.dart';
import 'package:shamo/pages/core/subpages/profile/profile_page.dart';
import 'package:shamo/pages/core/subpages/sub_page_export.dart';
import 'package:shamo/providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserProvider userProvider;
  late User user;

  final ScrollController _controller = ScrollController();
  final PageController _pageController = PageController();
  final PageController _pageControllerHome = PageController();
  int index = 0;
  int indexHome = 0;

  bool closeTopContainer = false;
  double topContainer = 0;

  whenScroll() {
    _controller.addListener(() {
      double value = _controller.offset / 50;

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
    userProvider = Provider.of<UserProvider>(context, listen: false);
    user = userProvider.user;
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
        indexHome: indexHome,
        pageController: _pageControllerHome,
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageControllerHome,
        children: [
          _buildHomePage(height, category),
          MessagePage(pageController: _pageControllerHome),
          WishListPage(pageController: _pageControllerHome),
          ProfilePage(pageController: _pageControllerHome),
        ],
      ),
    );
  }

  Widget _buildHomePage(double height, List<String> category) {
    return Stack(
      children: [
        DecorationOne(height: height, top: -150, left: 0, right: 0),
        Column(
          children: [
            const SizedBox(height: 30),
            HeaderBar(
              user: user,
            ),
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
    required this.user,
  }) : super(key: key);

  final User user;

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
                  "Hallo, ${user.name ?? '-'} ",
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
                  "@${user.username ?? '-'}",
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

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      onPressed: () {
        Navigator.pushNamed(context, CartPage.route);
      },
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
    required this.pageController,
    required this.indexHome,
  }) : super(key: key);

  final PageController pageController;
  final int indexHome;

  @override
  Widget build(BuildContext context) {
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
              child: StatefulBuilder(builder: (context, setMenu) {
                setMenu(() {
                  indexHome;
                });
                return R.appBottomMenuItem.menuTime(
                  indexHome: indexHome,
                  pageController: pageController,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
