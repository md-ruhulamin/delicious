// ignore_for_file: prefer_const_constructors

import 'package:eshop/home_with_navbar.dart';

import 'package:eshop/screen/product/main_food_page.dart';
import 'package:eshop/screen/firebase/services/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashScreen = "/splash-screen";
  static const String mainFoodPage = "/mai_food-page";
  static const String foodDetail = "/popular-food-detai";

  static String getInitial() => '$initial';
  static String getSplashScreen() => '$splashScreen';
  static String getmainFoodPage() => '$mainFoodPage';
  static String getFoodDetail(int pageId, String page) => '$foodDetail';

  static List<GetPage> routes = [

GetPage(name: initial ,page: ()=> HomeWithNavBar()),
GetPage (name:  splashScreen ,page: () => SplashScreen(),),
GetPage(name: mainFoodPage,page: ()=> FoodPage()),
//GetPage(name: foodDetail ,page: ()=> DetailScreen()),


  ];

}
