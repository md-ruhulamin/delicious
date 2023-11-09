// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:eshop/screen/product/cart_screen.dart';
import 'package:eshop/screen/product/details_page.dart';
import 'package:eshop/screen/product/favorite.dart';
import 'package:eshop/screen/product/homepage.dart';
import 'package:eshop/screen/product/main_food_page.dart';
import 'package:eshop/screen/auth/login_signup_page.dart';
import 'package:eshop/screen/user/user_profile.dart';
import 'package:eshop/screen/product/categorylist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeWithNavBar extends StatefulWidget {
  const HomeWithNavBar({super.key});

  @override
  State<HomeWithNavBar> createState() => _HomePageState();
}

class _HomePageState extends State<HomeWithNavBar> {
  // int _selectedindex = 0;
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[_selectedindex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       selectedItemColor: AppColors.mainColor,
  //       unselectedItemColor: Colors.amber,
  //       showSelectedLabels: false,
  //       selectedFontSize: 0.0,
  //       unselectedFontSize: 0.0,
  //       showUnselectedLabels: false,
  //       currentIndex: _selectedindex,
  //       onTap: onTapNav,
  //       items: const [
  //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
  //         BottomNavigationBarItem(icon: Icon(Icons.archive), label: "history"),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.shopping_cart), label: "cart"),
  //         BottomNavigationBarItem(icon: Icon(Icons.person), label: "me"),
  //       ],
  //     ),
  //   );
  // }
  List<Widget> _buildScreens() {
    return [
      HomePage(),
      ProductListPage(),
          FavoritePage()
,            //  FoodPage(),
    //  DetailScreen(index:2),
      CartPage(),
      UserProfile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
 PersistentBottomNavBarItem(
        icon: Icon(Icons.category),
        title: ("Category"),
           activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart_fill),
        title: ("Favourite"),
           activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Cart"),
          activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("User"),
       activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,

      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style4, // Choose the nav bar style with this property.
    );
  }
}
