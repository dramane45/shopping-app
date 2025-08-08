import 'package:delivery/pages/auth/sign_up_page.dart';
import 'package:delivery/routes/route_helper.dart';
import 'package:delivery/utils/app_color.dart';
import 'package:delivery/utils/demensions.dart';
import 'package:delivery/widgets/app_text_field.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/show_custom_snack_bar.dart';
import '../../controllers/auth_controller.dart';
import '../../models/signup_body_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("type in your phone number", title: "Phone number");
      } else if (GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address ",
            title: "valid email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in a your phone password ", title: "password");
      } else if (password.length < 6) {
        showCustomSnackBar("password can not be less tan six characters",
            title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.screenHeight * 0.05,
                ),
                Container(
                  height: Dimensions.screenHeight * 0.25,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: Dimensions.radius20 * 4,
                      backgroundImage: AssetImage("assets/image/logoapp.png"),
                    ),
                  ),
                ),
                //welcome
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: Dimensions.font30 + Dimensions.font12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Center(
                        child: Text(
                          "Sign into your account",
                          style: TextStyle(
                            fontSize: Dimensions.font12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                    ],
                  ),
                ),
                // phone
                AppTextField(
                    textController: emailController,
                    hintText: "Email",
                    icon: Icons.email_outlined),
                SizedBox(
                  height: Dimensions.height20,
                ),
                //password
                AppTextField(
                    textController: passwordController,
                    hintText: "Password",
                    icon: Icons.password_outlined,
                    isObscure: false),
                SizedBox(
                  height: Dimensions.height20,
                ),

                SizedBox(
                  height: Dimensions.height10,
                ),
                // text line
                Row(
                  children: [
                    Expanded(child: Container()),
                    RichText(
                        text: TextSpan(
                      text: "Sign into your account",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: Dimensions.font20),
                    )),
                    SizedBox(
                      width: Dimensions.width20,
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.05,
                ),
                // sign ip bottoms
                GestureDetector(
                  onTap: () {
                    _login(authController);
                  },
                  child: Container(
                    width: Dimensions.screenWidth / 2,
                    height: Dimensions.screenHeight / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColor.mainColor,
                    ),
                    child: Center(
                      child: BigText(
                        text: "Sign in",
                        size: Dimensions.font30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.05,
                ),
                //sign up option
                RichText(
                    text: TextSpan(
                        text: "Don\'t an account?  ",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20),
                        children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpPage(),
                              transition: Transition.fade),
                        text: "Create",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.mainBlackColor,
                            fontSize: Dimensions.font20),
                      )
                    ])),
              ],
            ),
          );
        }));
  }
}
