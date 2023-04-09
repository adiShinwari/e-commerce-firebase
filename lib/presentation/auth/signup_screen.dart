import 'package:e_commerce_app/controller/auth_controller.dart';
import 'package:e_commerce_app/presentation/home_screen/home.dart';
import 'package:e_commerce_app/widgets_common/custom_text_field.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../widgets_common/app_logo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/our_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;

  var controller = Get.put(AuthController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Join the $appname".text.white.fontFamily(bold).size(18).make(),
            15.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                      title: name,
                      hint: nameHint,
                      controller: nameController,
                      isPass: false),
                  customTextField(
                      title: email,
                      hint: emailHint,
                      controller: emailController,
                      isPass: false),
                  customTextField(
                      title: password,
                      hint: passwordHint,
                      controller: passwordController,
                      isPass: true),
                  customTextField(
                      title: reTypePassword,
                      hint: passwordHint,
                      controller: passwordRetypeController,
                      isPass: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPass.text.make(),
                    ),
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        value: isCheck,
                        onChanged: (newValue) {
                          isCheck = newValue;
                          setState(() {});
                        },
                        activeColor: redColor,
                        checkColor: whiteColor,
                      ),
                      10.widthBox,
                      Flexible(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                color: fontGrey,
                                fontFamily: regular,
                              )),
                          TextSpan(
                              text: termsAndConditions,
                              style: TextStyle(
                                color: redColor,
                                fontFamily: regular,
                              )),
                          TextSpan(
                              text: ' & ',
                              style: TextStyle(
                                color: redColor,
                                fontFamily: regular,
                              )),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                color: redColor,
                                fontFamily: regular,
                              )),
                        ])),
                      )
                    ],
                  ),
                  controller.isLoading.value == true
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : ourButton(
                              color: isCheck == false ? lightGrey : redColor,
                              title: signup,
                              textColor: whiteColor,
                              onPress: isCheck == false
                                  ? null
                                  : () {
                                      if (passwordController.text ==
                                          passwordRetypeController.text) {
                                        try {
                                          controller.isLoading(true);
                                          controller
                                              .signupMethod(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  context: context)
                                              .then((value) {
                                            controller.storeUserData(
                                                name: nameController.text,
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                          }).then((value) {
                                            VxToast.show(context,
                                                msg: loggedin);
                                            Get.offAll(() => const Home());
                                          });
                                        } catch (e) {
                                          controller.isLoading(false);
                                          auth.signOut();
                                          VxToast.show(context,
                                              msg: e.toString());
                                        }
                                      } else {
                                        VxToast.show(context,
                                            msg: 'Password not match');
                                      }
                                    })
                          .box
                          .width(
                            context.screenWidth - 50,
                          )
                          .make(),
                  10.heightBox,
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: alreadyAcount,
                        style: TextStyle(color: fontGrey, fontFamily: bold)),
                    TextSpan(
                        text: login,
                        style: TextStyle(color: redColor, fontFamily: bold))
                  ])).onTap(() {
                    Get.back();
                  })
                ],
              )
                  .box
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .white
                  .make(),
            )
          ]),
        ),
      ),
    );
  }
}
