import 'package:e_commerce_app/widgets_comman/custom_text_field.dart';
import 'package:get/route_manager.dart';

import '../../consts/consts.dart';
import '../../widgets_comman/app_logo_widget.dart';
import '../../widgets_comman/bg_widget.dart';
import '../../widgets_comman/our_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
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
            Column(
              children: [
                customTextField(
                  title: name,
                  hint: nameHint,
                ),
                customTextField(
                  title: email,
                  hint: emailHint,
                ),
                customTextField(title: password, hint: passwordHint),
                customTextField(title: reTypePassword, hint: passwordHint),
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
                            style: TextStyle(color: fontGrey)),
                        TextSpan(
                            text: termsAndConditions,
                            style: TextStyle(color: redColor)),
                        TextSpan(
                            text: ' & ', style: TextStyle(color: redColor)),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(color: redColor)),
                      ])),
                    )
                  ],
                ),
                ourButton(
                        color: redColor,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () {})
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
                .make()
          ]),
        ),
      ),
    );
  }
}
