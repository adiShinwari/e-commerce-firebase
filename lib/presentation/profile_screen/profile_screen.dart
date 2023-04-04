import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/presentation/profile_screen/components/details_card.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: SafeArea(
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
              ).onTap(() {}),
            ),
//user detail section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.white.fontFamily(semibold).make(),
                        "dummy@example.com".text.white.make()
                      ],
                    ),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: whiteColor,
                        ),
                      ),
                      onPressed: () {},
                      child: "Log out".text.fontFamily(semibold).white.make())
                ],
              ),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(
                  count: "0.00",
                  title: "in your cart",
                  width: context.screenWidth / 3.4,
                ),
                detailsCard(
                  count: "32",
                  title: "in your wishlist",
                  width: context.screenWidth / 3.4,
                ),
                detailsCard(
                  count: "0.00",
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
      ),
    ));
  }
}
