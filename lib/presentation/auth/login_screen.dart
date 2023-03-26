import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/presentation/auth/signup_screen.dart';
import 'package:e_commerce_app/widgets_comman/app_logo_widget.dart';
import 'package:e_commerce_app/widgets_comman/bg_widget.dart';
import 'package:e_commerce_app/widgets_comman/custom_text_field.dart';
import 'package:e_commerce_app/widgets_comman/our_button.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            "Log in to $appname".text.white.fontFamily(bold).size(18).make(),
            15.heightBox,
            Column(
              children: [
                customTextField(
                  title: email,
                  hint: emailHint,
                ),
                customTextField(title: password, hint: passwordHint),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: forgetPass.text.make(),
                  ),
                ),
                5.heightBox,
                ourButton(
                        color: redColor,
                        title: login,
                        textColor: whiteColor,
                        onPress: () {})
                    .box
                    .width(
                      context.screenWidth - 50,
                    )
                    .make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                ourButton(
                    color: lightGolden,
                    title: signup,
                    textColor: redColor,
                    onPress: () {
                      Get.to(const SignUpScreen());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(
                                  socialIconList[index],
                                  width: 30,
                                ),
                              ),
                            ))),
              ],
            )
                .box
                .rounded
                .padding(
                  const EdgeInsets.all(16),
                )
                .width(
                  context.screenWidth - 70,
                )
                .shadowSm
                .white
                .make()
          ]),
        ),
      ),
    );
  }
}
