import 'package:flutter/material.dart';
import 'package:shamo/R/r.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomAppBar(),
      body: Center(
        child: Text(
          'Home Page Ready',
          style: R.appTextStyle.secondaryTextStyle,
        ),
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
        color: R.appColors.bgColor3,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 20,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: BottomNavigationBar(
            backgroundColor: R.appColors.bgColor3,
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
    );
  }
}
