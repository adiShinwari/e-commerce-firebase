import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controller/profile_controller.dart';
import 'package:e_commerce_app/controller/services/firestore_services.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

import '../../consts/lists.dart';
import '../../controller/auth_controller.dart';
import '../auth/login_screen.dart';
import 'components/details_card.dart';
import 'components/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return bgWidget(Scaffold(
      body: StreamBuilder(
        stream: FireStoreServices.getUser(currentUser!.email),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];
            return SafeArea(
              child: Column(
                children: [
                  //edit profile button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.edit,
                        color: whiteColor,
                      ),
                    ).onTap(() {
                      controller.nameController.text = data['name'];

                      Get.to(EditProfileScreen(
                        data: data,
                      ));
                    }),
                  ),
//user detail section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(
                                imgProfile2,
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                                data['imageUrl'],
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}"
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .make(),
                              "${data['email']}".text.white.make()
                            ],
                          ),
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: whiteColor,
                              ),
                            ),
                            onPressed: () async {
                              await Get.put(AuthController().signoutMethod());
                              Get.offAll(() => const LoginScreen());
                            },
                            child: "Log out"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make())
                      ],
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(
                        count: "${data['cart_count']}",
                        title: "in your cart",
                        width: context.screenWidth / 3.4,
                      ),
                      detailsCard(
                        count: "${data['wishlist_count']}",
                        title: "in your wishlist",
                        width: context.screenWidth / 3.4,
                      ),
                      detailsCard(
                        count: "${data['order_count']}",
                        title: "your orders",
                        width: context.screenWidth / 3.4,
                      ),
                    ],
                  ),

                  //Buttons Section

                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: profileButtonList.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black,
                    ),
                    itemBuilder: (context, index) => ListTile(
                      leading: Image.asset(
                        profileButtonIcons[index],
                        width: 22,
                      ),
                      title: profileButtonList[index]
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                    ),
                  )
                      .box
                      .rounded
                      .white
                      .margin(const EdgeInsets.all(12))
                      .padding(
                        const EdgeInsets.symmetric(horizontal: 16),
                      )
                      .shadowSm
                      .make()
                      .box
                      .color(redColor)
                      .make()
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
