import 'package:e_commerce_app/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make()
    ],
  )
      .box
      .white
      .rounded
      .height(80)
      .white
      .width(width)
      .padding(
        const EdgeInsets.all(4),
      )
      .make();
}
