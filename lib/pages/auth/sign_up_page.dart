import 'package:delivery/base/custom_loader.dart';
import 'package:delivery/base/show_custom_snack_bar.dart';
import 'package:delivery/controllers/auth_controller.dart';
import 'package:delivery/models/signup_body_model.dart';
import 'package:delivery/pages/auth/sign_in_page.dart';
import 'package:delivery/pages/auth/sign_in_page.dart';
import 'package:delivery/pages/auth/sign_in_page.dart';
import 'package:delivery/utils/app_color.dart';
import 'package:delivery/utils/demensions.dart';
import 'package:delivery/widgets/app_text_field.dart';
import 'package:delivery/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var signUpImages = ["f.png", "x.png", "g.png"];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name ", title: "Name");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address ",
            title: "valid email");
      } else if (phone.isEmpty) {
        showCustomSnackBar("type in your phone number", title: "Phone number");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in a your phone password ", title: "password");
      } else if (password.length < 6) {
        showCustomSnackBar("password can not be less tan six characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name, email: email, password: password, phone: phone);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
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
                            radius: 80,
                            backgroundImage:
                                AssetImage("assets/image/logoapp.png"),
                          ),
                        ),
                      ),
                      //name
                      AppTextField(
                          textController: nameController,
                          hintText: "Name",
                          icon: Icons.perm_identity_outlined),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      // email
                      AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email_outlined),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      // phone
                      AppTextField(
                          textController: phoneController,
                          hintText: "Phone",
                          icon: Icons.phone_outlined),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //password
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        icon: Icons.password_outlined,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      // sign up bottoms
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColor.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: "Sign up",
                              size: Dimensions.font30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      // text line
                      RichText(
                          text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => const SignInPage(),
                              transition: Transition.fade),
                        text: "Have an account already?",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20),
                      )),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //sign up option
                      RichText(
                          text: TextSpan(
                        text: "Sign up using one of the following methods",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16),
                      )),
                      Wrap(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: Dimensions.radius30,
                                    backgroundImage: AssetImage(
                                        "assets/image/${signUpImages[index]}"),
                                  ),
                                )),
                      )
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
