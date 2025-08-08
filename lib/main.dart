import 'package:delivery/controllers/cart_controller.dart';
import 'package:delivery/controllers/popular_product_controller.dart';
import 'package:delivery/controllers/recommended_food_controller.dart';
import 'package:delivery/pages/auth/sign_in_page.dart';
import 'package:delivery/pages/auth/sign_up_page.dart';
import 'package:delivery/pages/cart/cart_page.dart';
import 'package:delivery/pages/food/popular_food_detail.dart';
import 'package:delivery/pages/food/recommended_food_detail.dart';
import 'package:delivery/pages/home/main_food_page.dart';
import 'package:delivery/pages/splash/splash_page.dart';
import 'package:delivery/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helper/dependencies.dart' as dep;
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: SignInPage(),
            //SplashScreen(),
            // initialRoute: RouteHelper.getSplashPage(),
            // getPages: RouteHelper.routes,
          );
        });
      },
    );
  }
}
