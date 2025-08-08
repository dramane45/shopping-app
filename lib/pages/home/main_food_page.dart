import 'package:delivery/pages/home/food_page_body.dart';
import 'package:delivery/utils/demensions.dart';
import 'package:flutter/material.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_food_controller.dart';
import '../../utils/app_color.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            //showing the header
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    right: Dimensions.width20,
                    left: Dimensions.width20,
                    top: Dimensions.height10 / 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Country",
                          color: AppColor.mainColor,
                        ),
                        Row(children: [
                          SmallText(
                            text: "City",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ])
                      ],
                    ),
                    Center(
                      child: Container(
                        height: Dimensions.height45,
                        width: Dimensions.width45,
                        decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15)),
                        child: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //showing the body
            const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
          ],
        ),
        onRefresh: _loadResource);
  }
}
