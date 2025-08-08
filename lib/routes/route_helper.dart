import 'package:delivery/pages/food/popular_food_detail.dart';
import 'package:delivery/pages/food/recommended_food_detail.dart';
import 'package:delivery/pages/home/main_food_page.dart';
import 'package:delivery/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import '../pages/cart/cart_page.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splashPage";
  static const String initial = "/";
  //PopularFoodDetail
  static const String popularFood = "/popular-food";
  //RecommendedFoodDetail
  static const String recommendedFood = "/recommended-food";
  //CartPage
  static const String cartPage = "/cart_page";
  //Cart History Page

  //Splash
  static String getSplashPage() => '$splashPage';
  //initial
  static String getInitial() => '$initial';

  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),

    //PopularFoodDetail
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),

    //RecommendedFoodDetail
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return RecommenededFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),

    //CartPage
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),

    //Cart History Page
  ];
}
