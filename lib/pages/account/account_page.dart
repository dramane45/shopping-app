import 'package:delivery/utils/app_color.dart';
import 'package:delivery/utils/demensions.dart';
import 'package:delivery/widgets/acconut_widget.dart';
import 'package:delivery/widgets/app_icon.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Center(
          child: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile
            AppIcon(
              icon: Icons.person,
              backgroudColor: AppColor.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                      bigText: BigText(
                        text: "Name",
                      ),
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroudColor: AppColor.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize15 * 2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    //phone
                    AccountWidget(
                      bigText: BigText(
                        text: "0606077485",
                      ),
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroudColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize15 * 2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    // enail
                    AccountWidget(
                      bigText: BigText(
                        text: "skp.info@gmail.com",
                      ),
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroudColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize15 * 2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    //address
                    AccountWidget(
                      bigText: BigText(
                        text: "Fill in your address",
                      ),
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroudColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize15 * 2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    //message
                    AccountWidget(
                      bigText: BigText(
                        text: "Message",
                      ),
                      appIcon: AppIcon(
                        icon: Icons.message,
                        backgroudColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize15 * 2,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
