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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  iniTab() {
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void initState() {
    iniTab();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                    Container(
                      // margin: const EdgeInsets.only(top: 10),
                      padding:
                          const EdgeInsets.only(bottom: 20, right: 5, left: 30),

                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: TabBar(
                        physics: const BouncingScrollPhysics(),
                        onTap: (value) {},
                        unselectedLabelStyle:
                            R.appTextStyle.secondaryTextStyle.copyWith(),
                        unselectedLabelColor: R.appColors.darkTextColor,
                        indicatorWeight: 0,
                        labelStyle: R.appTextStyle.primaryTextStyle,
                        controller: _tabController,
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: R.appColors.primaryColor,
                        ),
                        labelColor: R.appColors.primaryTextColor,
                        tabs: List.generate(
                          5,
                          (index) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: R.appColors.darkTextColor),
                            ),
                            child: Tab(
                              text: 'Shoes ${index + 1}',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.only(left: R.appMargin.defaultMargin),
                        child: TabBarView(
                          controller: _tabController,
                          children: List.generate(
                            5,
                            (index) => Column(
                              children: [
                                Container(
                                  height: height * 0.3,
                                  color: Colors.amber,
                                  width: double.infinity,
                                  child: Text('$index'),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 30, bottom: 20),
                                        child: Text(
                                          'New Arrivals',
                                          style: R.appTextStyle.primaryTextStyle
                                              .copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.separated(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(height: 20);
                                          },
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              height: 50,
                                              color: Colors.amber,
                                              child: Text('$index'),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
              color: R.appColors.secondaryColor.withOpacity(0.4),
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
