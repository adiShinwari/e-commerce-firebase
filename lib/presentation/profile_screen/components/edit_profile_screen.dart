import 'dart:io';

import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controller/profile_controller.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:e_commerce_app/widgets_common/custom_text_field.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : data['imageUrl'] != '' &&
                          controller.profileImagePath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(
                            Get.find<ProfileController>()
                                .profileImagePath
                                .value,
                          ),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(
                  color: redColor,
                  onPress: () {
                    Get.find<ProfileController>().changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(
                  hint: nameHint,
                  title: name,
                  isPass: false,
                  controller: controller.nameController),
              customTextField(
                  hint: passwordHint,
                  title: oldPass,
                  isPass: true,
                  controller: controller.oldPassController),
              10.heightBox,
              customTextField(
                  hint: passwordHint,
                  title: newPassword,
                  isPass: true,
                  controller: controller.newPassController),
              20.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        redColor,
                      ),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: ourButton(
                          color: redColor,
                          onPress: () async {
                            controller.isLoading(true);
                            if (controller.profileImagePath.value.isNotEmpty) {
                              await controller.uploadProfileImage();
                            } else {
                              controller.profileImageLink = data['imageUrl'];
                            }

                            if (data['password'] ==
                                controller.oldPassController.text) {
                              await controller.changeAuthPassword(
                                  email: data['email'],
                                  password: controller.oldPassController.text,
                                  newPass: controller.newPassController.text);
                              await controller.updateProfile(
                                imageUrl: controller.profileImagePath.value,
                                name: controller.nameController.text,
                                password: controller.newPassController.text,
                              );
                              VxToast.show(context, msg: 'Updated');
                            } else {
                              VxToast.show(context, msg: 'wrong old password');

                              controller.isLoading(false);
                            }
                          },
                          textColor: whiteColor,
                          title: "Save"),
                    ),
            ],
          )
              .box
              .white
              .shadowSm
              .rounded
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .make(),
        ),
      ),
    ));
  }
}
