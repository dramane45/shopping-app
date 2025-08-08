import 'package:get/get.dart';

class Dimensions {
  // Sise height And width 798 390
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.49;
  static double pageViewContainer = screenHeight / 3.62;
  static double pageViewTextContainer = screenHeight / 6.65;

  //dinamic height padding and margin
  static double height10 = screenHeight / 79.8;
  static double height15 = screenHeight / 53.2;
  static double height20 = screenHeight / 39.9;
  static double height25 = screenHeight / 31.92;
  static double height30 = screenHeight / 26.6;
  static double height45 = screenHeight / 17.73;
  static double height80 = screenHeight / 9.975;

  //dinamic width padding and margin
  static double width10 = screenHeight / 79.8;
  static double width15 = screenHeight / 53.2;
  static double width20 = screenHeight / 39.9;
  static double width25 = screenHeight / 31.92;
  static double width30 = screenHeight / 26.6;
  static double width45 = screenHeight / 17.73;

  //dinamic font size
  static double font20 = screenHeight / 39.9;
  static double font16 = screenHeight / 49.87;
  static double font12 = screenHeight / 66.5;
  static double font26 = screenHeight / 32.69;
  static double font30 = screenHeight / 26.6; //height 80

  //dinamic radius size
  static double radius20 = screenHeight / 39.9;
  static double radius30 = screenHeight / 26.6;
  static double radius15 = screenHeight / 53.2;

  //Icon Size
  static double iconSize24 = screenHeight / 33.25;
  static double iconSize15 = screenHeight / 53.2;
  static double iconSize16 = screenHeight / 49.87;
  static double icnSize20 = screenHeight / 39.9;

  //list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double lestViewTextContSize = screenWidth / 3.9;

  // popular food
  static double popularFoodImgSize = screenHeight / 2.28;

  // bottom height
  static double bottomHeightBar = screenHeight / 6.65;

  static double recommendedFoodDetailSize = screenHeight / 2.66;
  static double recommendedFoodDetaiSliverAppBarSize = screenHeight / 11.4;

  // Splash Size
  static double splashImg = screenHeight / 3.20;
}
